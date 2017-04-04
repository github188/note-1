#今天撸代码的时候遇到个问题，用SQLSession获取的数据库连接在使用之后是否应该手工关闭
- SqlSession session = V6SqlSessionUtil.getSqlSession();
- Connection conn = session.getConnection();
- conn.setAutoCommit( true );

##那么问题主要是在：
##1、SQLSession的生存周期如何；
##2、获取的数据库连接对象是否在SQLSession关闭的时候关闭；
##3、如果是的话，那就不用手工关闭，如果不是的话，那手工关闭连接应该在什么时候执行，关闭连接之后
##SQLSession对象是否不能进行数据库操作

### 查看源码V6SqlSessionUtil.getSqlSession
  public static SqlSessionTemplate getSqlSession( String factoryBeanId )
  {
    long begin = Calendar.getInstance().getTimeInMillis();
    //sqlSessionFactory 负责创建SQLSession对象
    SqlSessionFactory sqlSessionFactory = getSqlSessionFactory(factoryBeanId);

    if (sqlSessionFactory == null) {
      log.error("V6SqlSessionUtil.getSqlSession.sqlSessionFactory is null!");

      return null;
    }
    if ((sqlSessionFactory.getConfiguration() == null) && 
      (sqlSessionFactory == null)) {
      log.error("V6SqlSessionUtil.getSqlSession.sqlSessionFactory.Configuration is null!");

      return null;
    }

    SqlSessionTemplate sqlSessionTemplate = new SqlSessionTemplate(sqlSessionFactory);
    String databaseId = sqlSessionTemplate.getConfiguration().getDatabaseId();

    long end = Calendar.getInstance().getTimeInMillis();
    long differ = (end - begin) / 1000L;
    log.debug("V6SqlSessionUtil.getSqlSession time " + differ + "s");
    return sqlSessionTemplate;
  }

#事务管理 DataSource SQLSession
## Spring的事务管理器 管理事务的生存周期
## TransactionTemplate 是一个事务模板，其构造需要一个事务管理器
## TransactionTemplate执行时，打开一个事务是事务管理器处理，其又依赖DataSource

## SQLSession 是 SqlSessionFactory创建的，其创建又牵涉到DataSource
  private SqlSession openSessionFromDataSource(ExecutorType execType, TransactionIsolationLevel level, boolean autoCommit) {
    Transaction tx = null;
    try {
      final Environment environment = configuration.getEnvironment();
      final TransactionFactory transactionFactory = getTransactionFactoryFromEnvironment(environment);
      tx = transactionFactory.newTransaction(environment.getDataSource(), level, autoCommit);
      final Executor executor = configuration.newExecutor(tx, execType);
      return new DefaultSqlSession(configuration, executor, autoCommit);
    } catch (Exception e) {
      closeTransaction(tx); // may have fetched a connection so lets call close()
      throw ExceptionFactory.wrapException("Error opening session.  Cause: " + e, e);
    } finally {
      ErrorContext.instance().reset();
    }
  }

##那么这两个用到DataSource的地方应该用的是同一个数据库连接对象，据推测应该是保存到线程相关的资源中，无则新建否则直接取用，代码应该在哪里呢？
  ###DriverManagerDataSource
	@Override
	protected Connection getConnectionFromDriver(Properties props) throws SQLException {
		String url = getUrl();
		if (logger.isDebugEnabled()) {
			logger.debug("Creating new JDBC DriverManager Connection to [" + url + "]");
		}
		return getConnectionFromDriverManager(url, props);
	}
  显然这里没有控制，每次调用都会新建一个数据库连接