# <mvc:annotation-driven />到底帮我们做了啥
一句 <mvc:annotation-driven />实际做了以下工作：（不包括添加自己定义的拦截器）

我们了解这些之后，对Spring3 MVC的控制力就更强大了，想改哪就改哪里。

spring 3.0.x是下面的配置

复制代码
	<!-- 注解请求映射  -->
	<bean class="org.springframework.web.servlet.mvc.annotation.DefaultAnnotationHandlerMapping">        
		<property name="interceptors">
			<list>
				<ref bean="logNDCInteceptor"/>   <!-- 日志拦截器，这是你自定义的拦截器 -->
			</list>
		</property>
	</bean>
	<bean class="org.springframework.web.servlet.mvc.annotation.AnnotationMethodHandlerAdapter">
		<property name="messageConverters">
			<list>
				<ref bean="byteArray_hmc" />  
				<ref bean="string_hmc" />  
				<ref bean="resource_hmc" />  
				<ref bean="source_hmc" />  
				<ref bean="xmlAwareForm_hmc" />  
				<ref bean="jaxb2RootElement_hmc" />  
				<ref bean="jackson_hmc" />  
			</list>
		</property>
	</bean>  
	<bean id="byteArray_hmc" class="org.springframework.http.converter.ByteArrayHttpMessageConverter" /><!-- 处理.. -->
	<bean id="string_hmc" class="org.springframework.http.converter.StringHttpMessageConverter" /><!-- 处理.. -->
	<bean id="resource_hmc" class="org.springframework.http.converter.ResourceHttpMessageConverter" /><!-- 处理.. -->
	<bean id="source_hmc" class="org.springframework.http.converter.xml.SourceHttpMessageConverter" /><!-- 处理.. -->
	<bean id="xmlAwareForm_hmc" class="org.springframework.http.converter.xml.XmlAwareFormHttpMessageConverter" /><!-- 处理.. -->
	<bean id="jaxb2RootElement_hmc" class="org.springframework.http.converter.xml.Jaxb2RootElementHttpMessageConverter" /><!-- 处理.. -->
	<bean id="jackson_hmc" class="org.springframework.http.converter.json.MappingJacksonHttpMessageConverter" /><!-- 处理json-->
复制代码
转载:http://elf8848.iteye.com/blog/875830

spring 3.1 later：

Spring 3.0.x中使用了annotation-driven后，缺省使用DefaultAnnotationHandlerMapping 来注册handler method和request的mapping关系。 

AnnotationMethodHandlerAdapter来在实际调用handlermethod前对其参数进行处理。 

并在dispatcherServlet中，当用户未注册自定义的ExceptionResolver时，注册AnnotationMethodHandlerExceptionResolver来对使用@ExceptionHandler标注的异常处理函数进行解析处理(这也导致当用户注册了自定义的exeptionResolver时将可能导致无法处理@ExceptionHandler)。 

在spring mvc 3.1中，对应变更为 
DefaultAnnotationHandlerMapping -> org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping 
AnnotationMethodHandlerAdapter -> org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter 
AnnotationMethodHandlerExceptionResolver -> ExceptionHandlerExceptionResolver 

以上都在使用了annotation-driven后自动注册。 
  而且对应分别提供了AbstractHandlerMethodMapping , AbstractHandlerMethodAdapter和 AbstractHandlerMethodExceptionResolver以便于让用户更方便的实现自定义的实现类

 

<mvc:annotation-driven />的可选配置
复制代码
<mvc:annotation-driven  message-codes-resolver ="bean ref" validator="" conversion-service="">
   
	<mvc:return-value-handlers>
		<bean></bean>
	</mvc:return-value-handlers>
	
	<mvc:argument-resolvers>
	</mvc:argument-resolvers>
	
	<mvc:message-converters>
	</mvc:message-converters>
</mvc:annotation-driven>

#<context:component-scan base-package="org.eking">
<!-- 扫描注册类，并过滤掉所有带@Service注解的类，避免service Bean提前实例化，Spring的事务没法进行控制 -->
<context:component-scan base-package="org.eking">
	<context:exclude-filter type="annotation" expression="org.springframework.stereotype.Service" />
</context:component-scan>

#拦截器进行认证校验与日志记录
<!-- 拦截器 -->
<mvc:interceptors>
	<bean class="org.eking.framework.web.system.interceptor.PermissionInterceptor"></bean>
	<bean class="org.eking.framework.web.system.interceptor.OpeLogInterceptor"></bean>
</mvc:interceptors>