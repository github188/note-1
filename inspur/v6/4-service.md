# service --》 服务层，对cmd提供服务，进行事务控制

## v6代码级生成的service代码继承了BaseServiceImpl类

## 有返回值的调用domain
	Object rlt = getTransactionTemplate().execute(new TransactionCallback() {
				public Object doInTransaction(TransactionStatus arg0) {
					return getComDomain().insertCom(beanMap);
				}
			});
			
## 无返回值的调用domain
	getTransactionTemplate().execute(new TransactionCallbackWithoutResult() {
		protected void doInTransactionWithoutResult(TransactionStatus arg0) {
			getComDomain().insertCom(beanMap);
		}
	});
	
## 引用的事务模板定义是在
	/opt/apps/app.ear/app.war/WEB-INF/conf/commonServiceSupport.xml
	
	<bean id="jdbcTransactionManager" class="org.loushang.commons.jdbc.datasource.DataSourceTransactionManager">
		<property name="dataSource"><ref bean="dataSource"/></property>
	</bean>

	<bean id="jdbcTransactionTemplate" class="org.springframework.transaction.support.TransactionTemplate">
		<property name="isolationLevel"><value>2</value></property>
		<property name="readOnly"><value>false</value></property>
		<property name="transactionManager"><ref bean="jdbcTransactionManager"/></property>
	</bean>