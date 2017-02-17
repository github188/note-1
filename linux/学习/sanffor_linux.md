# Linux 安装 Java 虚拟机

## 下载 Linux 的 Java虚拟机安装文件jre-for-linux.bin 如果操作系统是64位的可以在http://www.java.com/zh_CN/download/manual.jsp下载对应版本的安装文件。

##[root@localhost Downloads]# chmod u+x jre-for-linux.bin <给予执行权限> 
##[root@localhost Downloads]# ./jre-for-linux.bin（那个安装包就执行哪个）

##Linux 浏览器关联 Java 虚拟机
###设置浏览器配置，启用 Java
- 如果是firefox浏览器，请在命令行下执行以下操作
- ln -s /usr/java/jreXXX/lib/i386/libnpjp2.so /usr/lib/mozilla/plugins/libnpjp2.so （ 这一步是错误的，实际执行cp才可以 ）
###重启浏览器，配置生效
在URL地址栏输入 "about:plugins"，看到 "Java(TM) Plug-in 1.x.0_XX" 插件项，说明浏览器已关联上 Java 虚拟机。
###在火狐浏览器把SSL地址加入到信任列表
- 编辑-首选项-安全-第一行添加例外-加入SSL设备地址即可。