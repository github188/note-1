# http://www.xitongzhijia.net/xtjc/20141208/32106.html

- sudo dd if=ubuntu-13.10-desktop-amd64.iso of=/dev/sdb #/dev/sdb 为 USB 盘符

##使用启动 USB 进入 Ubuntu 试用环境

##查看硬盘分区状况，获取 Linux 系统安装分区编号

代码如下：

sudo fdisk -l

查看输出结果，然后根据文件类型和分区大小来判定 Linux 系统安装在哪块硬盘和安装的分区。我的电脑是在 /dev/sda3 安装了 Fedora。

或者，打开 Gparted 图形化工具来查看分区信息也可以。

挂载 Fedora 安装分区

##已知 Fedora 安装在了 /dev/sda3 上，所以我们可以用下面命令来挂载 Fedora 安装分区。你需要将 /dev/sda3 换成自己的 Linux 安装分区。

代码如下：

sudo mount /dev/sda3 /mnt

##挂载其他所需的目录（使用 --bind）

代码如下：

sudo mount --bind /dev /mnt/dev

sudo mount --bind /proc /mnt/proc

sudo mount --bind /sys /mnt/sys

##Chroot 到硬盘上的 Linux 系统

代码如下：

sudo chroot /mnt

##安装&更新 Grub

代码如下：

grub2-install /dev/sda

grub2-mkconfig -o /boot/grub2/grub.cfg

##Grub 已经修复成功，我们还需要退出 chroot 环境、卸载已经挂载的设备与目录：

代码如下：

exit #退出 chroot 环境

sudo umount /mnt/dev

sudo umount /mnt/proc

sudo umount /mnt/sys

sudo umount /mnt

##重启！