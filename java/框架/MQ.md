--------------------------------------------------------------------------------------------------------
#角色：
##Producer 生产者。发送消息的客户端角色。发送消息的时候需要指定Topic。
##Consumer 消费者。消费消息的客户端角色。通常是后台处理异步消费的系统。 RocketMQ中Consumer有两种实现：PushConsumer和PullConsumer。
##PushConsumer 推送模式（虽然RocketMQ使用的是长轮询）的消费者。消息的能及时被消费。使用非常简单，内部已处理如线程池消费、流控、负载均衡、异常处理等等的各种场景。
##PullConsumer 拉取模式的消费者。应用主动控制拉取的时机，怎么拉取，怎么消费等。主动权更高。但要自己处理各种场景。

------------------------------------------------------------------------------------------------------------
#概念术语
##Producer Group
- 标识发送同一类消息的Producer，通常发送逻辑一致。发送普通消息的时候，仅标识使用，并无特别用处。若事务消息，如果某条发送某条消息的producer-A宕机，使得事务消息一直处于PREPARED状态并超时，则broker会回查同一个group的其 他producer，确认这条消息应该commit还是rollback。但开源版本并不完全支持事务消息（阉割了事务回查的代码）。
##Consumer Group
- 标识一类Consumer的集合名称，这类Consumer通常消费一类消息，且消费逻辑一致。同一个Consumer Group下的各个实例将共同消费topic的消息，起到负载均衡的作用。
- 消费进度以Consumer Group为粒度管理，不同Consumer Group之间消费进度彼此不受影响，即消息A被Consumer Group1消费过，也会再给Consumer Group2消费。
注： RocketMQ要求同一个Consumer Group的消费者必须要拥有相同的注册信息，即必须要听一样的topic(并且tag也一样)。
##Topic
- 标识一类消息的逻辑名字，消息的逻辑管理单位。无论消息生产还是消费，都需要指定Topic。
##Tag
- RocketMQ支持给在发送的时候给topic打tag，同一个topic的消息虽然逻辑管理是一样的。但是消费topic1的时候，如果你订阅的时候指定的是tagA，那么tagB的消息将不会投递。
##Message Queue
- 简称Queue或Q。消息物理管理单位。一个Topic将有若干个Q。若Topic同时创建在不同的Broker，则不同的broker上都有若干Q，消息将物理地存储落在不同Broker结点上，具有水平扩展的能力。
无论生产者还是消费者，实际的生产和消费都是针对Q级别。例如Producer发送消息的时候，会预先选择（默认轮询）好该Topic下面的某一条Q地发送；Consumer消费的时候也会负载均衡地分配若干个Q，只拉取对应Q的消息。
每一条message queue均对应一个文件，这个文件存储了实际消息的索引信息。并且即使文件被删除，也能通过实际纯粹的消息文件（commit log）恢复回来。
##Offset
- RocketMQ中，有很多offset的概念。但通常我们只关心暴露到客户端的offset。一般我们不特指的话，就是指逻辑Message Queue下面的offset。

可以认为一条逻辑的message queue是无限长的数组。一条消息进来下标就会涨1。下标就是offset。

一条message queue中的max offset表示消息的最大offset。注：这里从源码上看，max_offset并不是最新的那条消息的offset，而是表示最新消息的offset+1。

而min offset则标识现存在的最小offset。

由于消息存储一段时间后，消费会被物理地从磁盘删除，message queue的min offset也就对应增长。这意味着比min offset要小的那些消息已经不在broker上了，无法被消费。
##Consumer Offset
- 用于标记Consumer Group在一条逻辑Message Queue上，消息消费到哪里了。注：从源码上看，这个数值是最新消费的那条消息的offset+1，所以实际上这个值存储的是【下次拉取的话，从哪里开始拉取的offset】。

消费者拉取消息的时候需要指定offset，broker不主动推送消息，而是接受到请求的时候把存储的对应offset的消息返回给客户端。这个offset在成功消费后会更新到内存，并定时持久化。在集群消费模式下，会同步持久化到broker。在广播模式下，会持久化到本地文件。

实例重启的时候会获取持久化的consumer offset，用以决定从哪里开始消费。
##集群消费
消费者的一种消费模式。一个Consumer Group中的各个Consumer实例分摊去消费消息，即一条消息只会投递到一个Consumer Group下面的一个实例。
实际上，每个Consumer是平均分摊Message Queue的去做拉取消费。例如某个Topic有3条Q，其中一个Consumer Group 有 3 个实例（可能是 3 个进程，或者 3 台机器），那么每个实例只消费其中的1条Q。
而由Producer发送消息的时候是轮询所有的Q,所以消息会平均散落在不同的Q上，可以认为Q上的消息是平均的。那么实例也就平均地消费消息了。
这种模式下，消费进度的存储会持久化到Broker。
##广播消费
消费者的一种消费模式。消息将对一个Consumer Group下的各个Consumer实例都投递一遍。即即使这些 Consumer 属于同一个Consumer Group，消息也会被Consumer Group 中的每个Consumer都消费一次。
实际上，是一个消费组下的每个消费者实例都获取到了topic下面的每个Message Queue去拉取消费。所以消息会投递到每个消费者实例。
这种模式下，消费进度会存储持久化到实例本地。
##顺序消息
消费消息的顺序要同发送消息的顺序一致。由于Consumer消费消息的时候是针对Message Queue顺序拉取并开始消费，且一条Message Queue只会给一个消费者（集群模式下），所以能够保证同一个消费者实例对于Q上消息的消费是顺序地开始消费（不一定顺序消费完成，因为消费可能并行）。
在RocketMQ中，顺序消费主要指的是都是Queue级别的局部顺序。这一类消息为满足顺序性，必须Producer单线程顺序发送，且发送到同一个队列，这样Consumer就可以按照Producer发送的顺序去消费消息。
生产者发送的时候可以用MessageQueueSelector为某一批消息（通常是有相同的唯一标示id）选择同一个Queue，则这一批消息的消费将是顺序消息（并由同一个consumer完成消息）。或者Message Queue的数量只有1，但这样消费的实例只能有一个，多出来的实例都会空跑。
##普通顺序消息
顺序消息的一种，正常情况下可以保证完全的顺序消息，但是一旦发生异常，Broker宕机或重启，由于队列总数发生发化，消费者会触发负载均衡，而默认地负载均衡算法采取哈希取模平均，这样负载均衡分配到定位的队列会发化，使得队列可能分配到别的实例上，则会短暂地出现消息顺序不一致。
如果业务能容忍在集群异常情况（如某个 Broker 宕机或者重启）下，消息短暂的乱序，使用普通顺序方式比较合适。
##严格顺序消息
顺序消息的一种，无论正常异常情况都能保证顺序，但是牺牲了分布式 Failover 特性，即 Broker集群中只要有一台机器不可用，则整个集群都不可用，服务可用性大大降低。
如果服务器部署为同步双写模式，此缺陷可通过备机自动切换为主避免，不过仍然会存在几分钟的服务不可用。（依赖同步双写，主备自动切换，自动切换功能目前并未实现）

rocketmq的主要部分是由4种集群构成的：namesrv集群、broker集群、producer集群和consumer集群。
	namesrv集群：也就是注册中心，rocketmq在注册中心这块没有使用第三方的中间件，而是自己写的代码来实现的，代码行数才1000行，
	producer、broker和consumer在启动时都需要向namesrv进行注册，namesrv服务之间不通讯。

	broker集群：broker提供关于消息的管理、存储、分发等功能，是消息队列的核心组件。rocket关于broker的集群提供了主要两种方案，一种是主从同步方案，
	消息同时写到master和slave服务器视为消息发送成功；另一种是异步方案，slave的异步服务负责读取master的数据，本人在选择时更倾向于异步方案。

	producer集群：消息的生产者，每个producer都需要属于一个group，producer的group概念除了在事务消息时起到一些作用，但是其它时候，
	更多的还只是一个虚拟的概念。

	consumer集群：消息的消费者，有两个主要的consumer:DefaultMQPullConsumer和DefaultMQPushConsumer，深入代码后可以发现，
	rocket的consumer都是采用的pull模式来处理消息的。在集群消息的配置下，集群内各个服务平均分配消息，当其中一台consumer宕机，
	分配给它的消息会继续分配给其它的consumer。

核心特性
	1.读队列数量和写队列数量可以不一致：当我们使用updateTopic命令创建topic时，会发现新建的topic下会有默认的8个写对列和8个读对列(依赖于配置)，并且读队列的数量和写队列的数量还可以不一致，这是为什么呢？难道在底层读写队列是在物理上分离的吗？抱着这个问题，我分析了相关的源代码，发现底层代码对于读写队列指的都是同一个队列，其中写队列的数量是针对的producer，读队列的数量针对的是consumer：

		a.假设写队列有8个、读队列有4个，那么producer产生的消息会按轮训的方式写入到8个队列中，但是consumer却只能消费前4个队列，
		只有把读队列重新设置为8后，consumer可以继续消费后4个队列的历史消息；

		b.假设写队列有4个、读队列有8个，那么producer产生的消息会按轮训的方式写入到4个队列中，但是consumer却能消费8个队列，
		只是后4个队列没有消息可以消费罢了。

	2.存储为文件存储方式，支持同步落盘和异步刷盘两种方式，我倾向于选择异步刷盘的方式，毕竟broker挂掉的概率比较小，大部分的业务场景下在极端情况下丢失及其少量消息是可以忍受的；

	3.支持消息回溯，支持定期删除历史消息；

	4.集群方案比activemq要优秀很多，支持多主多从方案，例如在2主2从异步架构下，a,b为master,as,bs为slaver，当a机宕机后，producer会将消息全部发往b机，consumer会消费as，b和bs上的消息，理论上只会丢失毫秒级别的消息，不会影响业务的正常使用。可以说rocketmq的集群方案完爆activemq的集群方案，很多时候，我们对于异步队列的性能要求不高，但是集群的可用性要求一定是很高的。下面是activemq的三种集群方案：

		   a.磁盘阵列类，成本较高，也是一种通用的方案；

		   b.利用jdbc来实现统一存储消息，不但性能成问题，而且也只是把问题丢给了数据库罢了，没有解决集群的单机问题；

		   c.利用zookeeper的注册中心的选主功能，在各个服务之间同步数据，在实际的使用过程中发现主机自动漂移，同步数据不完全造成的数据错乱且服务启动不了，反而不如单机来的稳定；

	5.队列数量单机支持10000个以上；

	6.consumer支持集群功能，可以平均消费消息，当有一台consumer宕机后，其它consumer继续均分；

	7.consumer是靠pull的方式来消费消息的，性能不低于push的方式，这也是broker的并行能力强的一个原因，将主动权下放给了consumer，降低了broker的运算量和线程切换成本；

	8.支持顺序消息，可以在发送消息时，利用selector机制的hash方式取模来实现消息落到哪个broker的哪个queue上，当某个broker宕机后，由于取模值也发生变化，会自动切换队列；

	9.producer发送消息时支持同步返回、异步返回和oneway三种方式；

	10.broker保证每条消息至少投递到consumer一次，因此consumer的业务需要支持幂等；

	11.消息堆积能力惊人，消息队列的一个作用便是防止洪峰直接冲垮后端业务；

	12.支持按照消息id和消息key来查询消息，本人很喜欢按照key来查询消息这个功能，例如在下单业务中，可以使用订单id作为key，便于分析异常订单在系统中的处理过程；

	13.支持消息过滤；
	
mq_client_conf.properies

1、工业发送到商业需要按comid分组吗
	分tag 可以按照这种方案传

2、高速服务发送失败补偿


批量发
	topic：主题
	tags：标签
	key：发送消息 主键
	queryId：分队列用
	datas：发送的数据
	
	addMsgs(String topic,String tags,String key,String queryId,List<Map<?,?>> datas)
	startSendMsg()
单条发
	sendMsg()

接收端

	IBatchConsumerDeal 批量消费
	
	单条消费
	

DTP_UPLOAD_LOG

DTP_UPLOAD_LOG_ITEM

##消费组
###每个消费组对应一个集群，MQ为每一个消费组订阅的数据发送一份数据，由消费组的成员随机消费；
###重启消费端要重启server，如果只重启应用会导致资源释放不完整导致MQ监测到消费组有多于实际数量的消费者；


1、 Q:RocketMQ是否有开放API文档？ A:暂时不提供API文档，接口使用可参考源码中的实例代码。 
2、 Q:RocketMQ只能部署在linux上面吗？ A:RocketMQ使用JAVA语言编写，可以在任意安装了JRE环境的平台上运行。 
3、 Q:RocketMQ一定要运行在JDK64位环境吗？ A:是的，必须运行在安装JRE64位的操作系统上。 
4、 Q:nameserver在RocketMQ中的作用是什么？ A:nameserver不是用来存储数据的，它用来提供服务发现功能，类似于JNDI。 
5、 Q:broker支持分布式部署吗？ A:RocketMQ所有节点都支持分部署部署，broker分布部署只需要在不同的机器上分别启动broker即可。 
6、 Q:RocketMQ-3.0.2支持broker的master-slave部署吗？ A:暂时不支持，开发小组正在测试该功能。 
7、 Q:MetaQ和RocketMQ什么关系？ A:MetaQ3.0后改名RocketMQ。 
8、 Q:RocketMQ支持标准的JMS吗？ A: 支持JMS客户端API，参考：https://github.com/RocketMQ-Community/rocketmq-jmsclie nt。 
9、 Q:启动broker的时候，报如下错误Exception in thread "main" java.lang.NoClassDefFoundError: com/alibaba/rocketmq/broker/BrokerStartup？ A: 源码目录的bin下是不能启动的。 
10、Q: tools里面有admin之类的东西，这里面是监控mq状态的程序吗？ A：是的，里面包含管理mq的监控接口。 
11、Q: 网站上推荐的推荐配置太高了，可以降低硬件配置吗？ A:可以，网页上面的数据时根据淘宝的业务推荐的，普通的配置可以运行。 
12、Q: Caused by: com.alibaba.rocketmq.client.exception.MQBrokerException: CODE: SERVICE_NOT_AVAILABLE DESC: service not available now.是什么错误？ A：服务器磁盘满了。 
13、Q: RocketMQ支持Consumer从指定时间开始重新消费消息吗？ A: 支持按照时间回溯，精度毫秒，见MQHelper类。3.0.4版本 
14、Q:如何设置namerserver地址？ A:可以通过java –D设置系统属性或设置环境变量，其中设置系统属性优先级高于设置环境变量。 
15、Q:搭建web服务器指定nameserver地址有好处？ A: name server可以热升级，可以在web服务器就放一个静态文件， 里面是name server地址。 
16、Q:RocketMQ什么情况下msgId会出现重复？ A:不会重复，除非把服务器的数据全部清除，然后重启。offset从0开始计数msgId ＝ 服务器IP端口号 + CommitLogOffset。 
17、offset保存位置？ A: 集群消费时，offset保存在broker, 广播消费时，offset是consumer自己保存在本地。 
18、Q:namesrv和broker启动后无法关闭？ A: mqshutdown broker。 
19、Q: RocketMQ不同版本之间的数据可以共用吗？ A:可以。 
20、Q: RocketMQ下载地址 A: https://github.com/alibaba/RocketMQ或http://git.oschina.net/vintagewang/RocketMQ 
21、Q：如何删除消息？ A:使用delete topic工具，只能删除topic,消息不会真正被删除，消息过期后（超过消息保存时间并且数据量超过1G）会自动删除，实现查看ConsumeFromWhere方法。 
22、Q: roucer 发送消息到broker,由于broker刷盘失败或是broker的commit文件正在切换引起的失败，rocketmq是不会重试发送或是重新写入? A: 返回给客户端, 由应用来决定, 参考sendresult。
