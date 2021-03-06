# mybatis --》 J2EE持久层框架，被V6所采用，配置灵活，扩展方便

## mybatis的顶级配置文件为 configuration.xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE configuration PUBLIC "-//mybatis.org//DTD Config 3.0//EN"
"http://mybatis.org/dtd/mybatis-3-config.dtd">
<configuration>
	<plugins> //v6的分页扩展
		<plugin interceptor="com.lc.v6.jdbc.mybatis.PageInterceptorPlugin">
			<property name="dialect" value="db2" />
		</plugin>
	</plugins>
	<mappers>  //映射
		<mapper resource="com/v6/base"/> //工程依赖的公共组件sql
		
	 	<mapper resource="com/v6/ica"/>  //工程自身的sql
	</mappers>
	
</configuration>

## 应用的sql文件命名为xxSqlMap.xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
"http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="ComDomain"> //命名空间应用中唯一，且不与应用引用的公共sql的namesapce冲突，否则会导致报错或难以预料的其它问题
	<select id="checkRepeat" parameterType="map" resultType="map"> //id应该在命名空间中唯一
		SELECT
			IDREPEATE,
			NAMEREPEATE
		FROM
		(
			SELECT
				COUNT(1) IDREPEATE
			FROM
				ICA_COM
			WHERE
				COM_ID=#{comId}
				AND ICOM_ID=#{ICOM_ID}
		)A LEFT JOIN (
			SELECT
				COUNT(1) NAMEREPEATE
			FROM
				ICA_COM
			WHERE
				COM_NAME=#{comName}
				AND ICOM_ID=#{ICOM_ID}
		)B ON 1=1
	</select>
</mapper>

## V6中事务控制没有使用mybatis提供的事务控制，而是采用了spring提供的事务控制。
	spring事务模板 org.springframework.transaction.support.TransactionTemplate

## #{} 与 ${}的区别是前者会在解析后的参数加上引号，后者不会

## 注意<>转义为&lt;&gt; 也可以使用<![CDATA[ <> ]]>，特殊符号就可以正常编译了

## 判断传入的查询条件是否为空
<if test="com_nameSearch != null  and com_nameSearch != '' ">

## 如果传入的参数是单个字符，应该按以下方式校验
<if test='param_nameSearch != null  and param_nameSearch.equals( "1" ) '>

## 动态拼接IN范围查询条件
<if test="statusArr != null and statusArr.length>0">
	AND STATUS IN
	<foreach collection="statusArr" open="(" separator="," close=")" item="status">
		#{status}
	</foreach>
</if>

## 一次线程（即一次请求）对应一次数据库连接的获取与释放，数据库连接池由WebSphere提供

## 一次数据库会话（SqlSession）可以执行多个sql，数据库会话被spring管理生命周期
	V6SqlSessionUtil.getSqlSession()

## 线程 sqlsession 事务之间的关系
- 对每一个线程，SqlSessionUtils获取的sqlSession只有一个，即与线程绑定的SqlSessionTemplate的实例(DefaultSqlSession?)；
	SqlSessionUtils.getSqlSession方法 session = sessionFactory.openSession(executorType);
