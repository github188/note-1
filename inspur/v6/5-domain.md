# domain -- 》 业务层，进行业务逻辑处理，每一个处理都在一个事务里面，如果有异常发生，所有的操作都会回滚

## 代码机生成的domain继承BaseDomainImpl类
## 关键业务要打关键日志，方便调试
## 业务层与数据库交互使用的框架是mybatis，使用方式
	V6SqlSessionUtil.getSqlSession().delete("ComDomain.deleteComWhse", beanMap );
	第一个参数指定要使用的sql，第二个参数是传递的参数
## 在domain层谨慎使用try catch，如果异常被处理调，就会破坏框架的事务控制机制，导致事务控制的失败