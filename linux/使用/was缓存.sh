find /opt/IBM/WebSphere/AppServer/profiles -type d -path *server-ica* -name jsp

rm -rf /opt/IBM/WebSphere/AppServer/profiles/Custom01/temp/v6demoNode01/server-ica/ica/ica.war/jsp

rm -rf /opt/IBM/WebSphere/AppServer/profiles/Custom01/temp/v6demoNode01/server-imr/imr/imr.war/jsp

# 清理was html缓存
rm -rf /opt/IBM/WebSphere/AppServer/profiles/Custom01/wstemp
