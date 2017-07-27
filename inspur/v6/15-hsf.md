# hsf诞生来源
- http://www.chinacloud.cn/show.aspx?id=20549&cid=22

# 标准Service方式的RPC
## service定义：基于OSGI的service定义方式
## TCP/IP通信：
- IO方式：nio,采用mina框架
- 连接方式：长连接
- 服务器端有限定大小的连接池
- WebService方式
## 序列化：hessian序列化机制

# 软件负载体系
- 采用软件实现负载均衡，支持随机、轮询、权重、按应用路由等方式。软件负载均衡没有中间点，通过配置中心统一管理。配置中心收集服务提供者和消费者的注册信息，以推送的方式发送到服务消费者直接使用，不经过中间点；注册中心可以感应服务器的状态，出现failover时，实现注册信息重新推送。

# 模块化、动态化

# 服务治理
- 服务治理利用注册中心实现服务信息管理（服务提供者、调用者信息查询）、服务依赖关系分析、服务运行状况感知、服务可用性保障，如：路由调整、流量分配、服务端降级、调用端降级等

# 高速服务相关数据表
- select tabname from syscat.TABLES where tabname like 'HSF%SERVICE%'
- select * from HSF_DEPLOY_SERVICES
