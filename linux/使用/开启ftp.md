在安装好Redhat以后，需要设置Ftp和Telnet服务文件，才能启动Ftp和Telnet服务，可以通过远程控制进行开启。

1.1、用root用户登录，进入终端命令模式；
1.2、开启ftp服务。
cd /etc/xinetd.d，编辑ftp服务的配置文件gssftp的设置：

vi gssftp ，将 修改两项内容：
（1）server_args = -l –a 去掉-a 改为server_args = -l
（2）disable=yes改为disable=no
（3）保存退出。
