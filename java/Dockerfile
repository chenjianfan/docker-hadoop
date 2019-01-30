FROM woshicheng93632/centos7ssh
MAINTAINER chenjianfan（316031139@qq.com）
#把java 加入容器中  
Add  jre-8u201-linux-x64.tar.gz    /usr/local/
#配置java 环境变量  
ENV JAVA_HOME /usr/local/jre1.8.0_201
ENV JRE_HOME  /usr/local/jre1.8.0_201  
ENV CLASSPATH .:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:${JAVA_HOME}/lib:${JRE_HOME}/lib  
ENV PATH $PATH:$JAVA_HOME/bin:

