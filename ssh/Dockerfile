FROM centos:7
MAINTAINER chenjianfan（316031139@qq.com）
RUN echo 'root:123456' | chpasswd \
&& yum install -y openssh-server \
&& yum install -y openssh-clients \
&& yum install -y openssh \
&& yum install -y rsync \
&& yum install -y vim \
&& yum clean headers  \
&& yum clean packages  \
&& yum clean metadata  \
&& sed -i "s/#UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config \
&& sed -i "s/#PermitRootLogin.*/PermitRootLogin yes/g"            /etc/ssh/sshd_config \
&& sed -i "s/#PubkeyAuthentication.*/PubkeyAuthentication yes/g"  /etc/ssh/sshd_config \
&& sed -i "s/#AuthorizedKeysFile.*/AuthorizedKeysFile yes/g"      /etc/ssh/sshd_config \
&& ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key  \
&& ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key  \
&& ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key  \
&& ssh-keygen -t dsa -f /etc/ssh/ssh_host_ed25519_key  \
&& mkdir /var/run/sshd \
EXPOSE 22
#启动sshd服务
CMD ["/usr/sbin/sshd", "-D"]









