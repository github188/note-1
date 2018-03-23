# https://www.openssl.org/source/ 下载地址

# https://slproweb.com/download/Win64OpenSSL-1_0_2n.exe 也许应该用这个

# http://www.9958.pw/post/apache_https_ssl 过程

- openssl genrsa 1024>server.key
- openssl req -new -key server.key > server.csr
- openssl req -x509 -days 365 -key server.key -in server.csr > server.crt

SSLCertificateFile /apache/conf/server.crt

SSLCertificateKeyFile /apache/conf/server.key 


### 日了他的狗啊，升级到Apache24 直接自带的

### [Mon Mar 12 22:23:17.273000 2018] [mpm_winnt:warn] [pid 4936:tid 1040] (OS 64)指定的网络名不再可用。  : AH00341: winnt_accept: Asynchronous AcceptEx failed.

### 环境为Apache2.2 防火墙已关闭 本地可访问，外部网络访问则如下
- 本地发出的请求状态是 SYN_SENT
- 服务器连接状态为 SYN_RECEIVED
- 服务器Apache无log error日志
- 服务器另有3000端口应用，外网可以访问