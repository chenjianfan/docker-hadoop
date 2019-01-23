FROM centos:7
MAINTAINER chenjianfan（316031139@qq.com）
#安装wget并下载最新的源Centos-7.repo
RUN yum -y install wget
RUN rm -rf /etc/yum.repos.d/*
RUN wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
RUN yum clean all
#安装openssh-server以及rsync
RUN yum install -y openssh-server
RUN yum install -y openssh-clients
RUN yum install -y openssh
RUN yum install -y rsync
#ssh配置修改
RUN sed -i "s/#UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config
RUN sed -i "s/#PermitRootLogin.*/PermitRootLogin yes/g"            /etc/ssh/sshd_config
RUN sed -i "s/#PubkeyAuthentication.*/PubkeyAuthentication yes/g"  /etc/ssh/sshd_config
RUN sed -i "s/#AuthorizedKeysFile.*/AuthorizedKeysFile yes/g"      /etc/ssh/sshd_config
#生成公钥和私钥
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key
#修改root密码
RUN echo "root:123456" | chpasswd
# 启动sshd服务并且暴露22端口
RUN mkdir /var/run/sshd
EXPOSE 22
#启动sshd服务
CMD ["/usr/sbin/sshd", "-D"]