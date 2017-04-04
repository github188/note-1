#简介
##cmd 进入oracle命令
##sqlplus /nolog
##conn jrw/jrw@orcl
##create用户
###sql 代码SQL> create user visiontv identified by visiontv default tablespace visiontv quota 10m on users;
###//创建空间  create tablespace test  datafile 'c:oracleoradataorcl9test.dbf' size 50M  default storage (initial 500K   Next 500K  minextents 1  maxextents unlimited  pctincrease 0);

###//Oracle创建用户权限//创建用户  create user lxg identified by lxg default tablespace test;  

###//授权　  grant resource,connect,dba to test;

###//删除表空间   drop tablespace "空间名" including contents and datafiles
	
###删除用户 drop user "lxg" cascade

###增加表空间 alter tablespace chinawater add datafile 'c:oracleoradataorcl9ADDCHINAWATER.dbf' size 200M

###创建用户 create user userName identified by password;

###创建用户 userName,密码为 password


　　grant dba to lxg;--授予DBA权限  

	grant unlimited tablespace to lxg;--授予不限制的表空间  

	grant select any table to lxg;--授予查询任何表  

	grant select any dictionary to lxg;--授予 查询 任何字典

	grant dba to lxg;  

	grant unlimited tablespace to lxg;  

	grant select any table to lxg;  

	grant select any dictionary to lxg;


###oracle 正在连接的用户不能删除，确实要删除的话
- 1、select sid,serial#,username from v$session where user='USERNAME';
- 2、alter system kill session 'sid,serial#';
- 3、drop user username cascade;

###3.查看用户所拥有的表  select table_name from user_tables; 或  select *from tab;
###4.查看用户所拥有的视图 select view_name from user_views;
###5.查看用户所拥有的触发器  select trigger_name from user_triggers;
###6.查看用户拥有的序列  select sequence_name from user_sequence;
###7.查看用户拥有的索引  select index_name from user_indexs;
###8.显示当前用户 show user;
###9.切换用户  conn scott/tiger;
###10.将用户赋予某种角色登录  conn scott/tiger as sysdba;
###11.查看所有用户  conn system/unis;  select username from dba_users;
###12.查看用户所拥有的权限 select *from session_privs;
###13.给用户加锁  alter user scott account lock;
###14.给用户解锁  alter user scott account unlock;
###15.修改用户密码  alter user zzg identified by zzg123
###16.新建用户   create user zzg identified by zzg123;
###17.删除用户及相关对象  drop user zzg cascade;
###18.给用户赋权(多个采用逗号间隔)  grant create session,create table to zzg;
###19.分配表空间给用户  alter user zzg default tablespace ts_zzg;
 ================ORACLE创建实例====================
  create user local_twsms identified by local_twsms;
  grant dba to local_twsms;--授予DBA权限  
   grant unlimited tablespace to local_twsms;--授予不限制的表空间  
   grant select any table to local_twsms;--授予查询任何表  
   grant select any dictionary to local_twsms;--授予 查询 任何字典
  grant dba to local_twsms;  
   grant unlimited tablespace to local_twsms;  
   grant select any table to local_twsms;  
   grant select any dictionary to local_twsms;
   grant create session,create table to local_twsms;
 ==================================================





创建表空间 表空间的管理分文件系统和自动存储管理（ASM）

1.文件系统
先查看一下数据文件的目录：
select tablespace_name,file_id,file_name,autoextensible,
 round(bytes/1024/1024/1024,3) "used(G)",round(maxbytes/1024/1024/1024,3) "size(G)" 
 from dba_data_files order by tablespace_name;
在操作系统上查看可用存储的大小：df -h
创建表空间
create tablespace  tbs_name datafile '/dba/oradata/ORADEV/datafile/tbs_name01.dbf' size 100m autoextend on next 100m;
表空间不足，添加数据文件（需检测可用存储，以防撑爆空间）
alter tablespace  tbs_name add datafile '/dba/oradata/ORADEV/datafile/tbs_name01.dbf' size 100m autoextend on next 100m;

注：默认虚拟机环境不使用这种管理方式，下面操作过程只做知识扩展使用
2.自动存储管理，数据文件的路径是以+DATA_DG开头的
查看存储的可用空间（即free_GB的大小）：
select name,total_mb/1024 total_GB,free_mb/1024 free_GB,to_char(round((total_mb-free_mb)/total_mb*100,2),'99.99')||'%' usage from v$asm_diskgroup;
创建表空间：
create tablespace tbs_name datafile '+data_dg' size 100m autoextend on next 100m;
表空间不足，添加数据文件（需检测可用存储，以防撑爆空间）
alter tablespace tbs_name add datafile '+data_dg' size 100m autoextend on next 100m; 

数据导出：

1 将数据库TEST完全导出,用户名system 密码manager 导出到D:daochu.dmp中  exp system/manager@TEST file=d:daochu.dmp full=y

2 将数据库中system用户与sys用户的表导出    exp system/manager@TEST file=d:daochu.dmp owner=(system,sys)

3 将数据库中的表inner_notify、notify_staff_relat导出     exp aichannel/aichannel@TESTDB2 file= d:datanewsmgnt.dmp tables=(inner_notify,notify_staff_relat)

4 将数据库中的表table1中的字段filed1以"00"打头的数据导出exp system/manager@TEST file=d:daochu.dmp tables=(table1) query=" where filed1 like '00%'"  上面是常用的导出，对于压缩，既用winzip把dmp文件可以很好的压缩。 也可以在上面命令后面 加上 compress=y 来实现。

数据的导入：

1 将D:daochu.dmp 中的数据导入 TEST数据库中。 imp system/manager@TEST file=d:daochu.dmp   imp aichannel/aichannel@HUST full=y file=d:datanewsmgnt.dmp ignore=y上面可能有点问题，因为有的表已经存在，然后它就报错，对该表就不进行导入。 在后面加上 ignore=y 就可以了