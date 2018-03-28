# 改完一个组件之后，快速改造其它组件

- imr 改用druid
	\cp -f /opt/tomcat7-ica-18099/webapps/ica/WEB-INF/conf/jdbcSupport.xml  /opt/tomcat7-imr-18101/webapps/imr/WEB-INF/conf/
	\cp -f /opt/tomcat7-ica-18099/webapps/ica/WEB-INF/lib/druid-1.0.25.jar  /opt/tomcat7-imr-18101/webapps/imr/WEB-INF/lib/
	\cp -f /opt/tomcat7-ica-18099/webapps/ica/WEB-INF/web.xml  /opt/tomcat7-imr-18101/webapps/imr/WEB-INF/
	ps -ef | grep tomcat7-imr|awk '{print $2}'|xargs kill -9
	sh /opt/tomcat7-imr-18101/bin/startup.sh

- dtp 改用druid
	\cp -f /opt/tomcat7-ica-18099/webapps/ica/WEB-INF/conf/jdbcSupport.xml  /opt/tomcat7-dtp-18100/webapps/dtp/WEB-INF/conf/
	\cp /opt/tomcat7-ica-18099/webapps/ica/WEB-INF/lib/druid-1.0.25.jar  /opt/tomcat7-dtp-18100/webapps/dtp/WEB-INF/lib/
	\cp -f /opt/tomcat7-ica-18099/webapps/ica/WEB-INF/web.xml  /opt/tomcat7-dtp-18100/webapps/dtp/WEB-INF/
	ps -ef | grep tomcat7-dtp|awk '{print $2}'|xargs kill -9
	sh /opt/tomcat7-dtp-18100/bin/startup.sh


- base portal
	\cp /opt/tomcat7-ica-18099/webapps/ica/WEB-INF/conf/jdbcSupport.xml  /opt/tomcat7-pub-18082/webapps/base/WEB-INF/conf/
	\cp /opt/tomcat7-ica-18099/webapps/ica/WEB-INF/conf/jdbcSupport.xml  /opt/tomcat7-pub-18082/webapps/portal/WEB-INF/conf/
	\cp /opt/tomcat7-ica-18099/webapps/ica/WEB-INF/lib/druid-1.0.25.jar  /opt/tomcat7-pub-18082/webapps/base/WEB-INF/lib/
	\cp /opt/tomcat7-ica-18099/webapps/ica/WEB-INF/lib/druid-1.0.25.jar  /opt/tomcat7-pub-18082/webapps/portal/WEB-INF/lib/
	\cp -f /opt/tomcat7-ica-18099/webapps/ica/WEB-INF/web.xml  /opt/tomcat7-pub-18082/webapps/base/WEB-INF/
	\cp -f /opt/tomcat7-ica-18099/webapps/ica/WEB-INF/web.xml  /opt/tomcat7-pub-18082/webapps/portal/WEB-INF/
	ps -ef | grep tomcat7-pub|awk '{print $2}'|xargs kill -9
	sh /opt/tomcat7-pub-18082/bin/startup.sh

cp /opt/tomcat7-ica-18099/webapps/ica/WEB-INF/lib/druid-1.0.25.jar  /opt/tomcat7-bsp-18081/webapps/bsp/WEB-INF/lib/
cp /opt/tomcat7-ica-18099/webapps/ica/WEB-INF/lib/druid-1.0.25.jar  /opt/tomcat7-srr-18080/webapps/srr/WEB-INF/lib/