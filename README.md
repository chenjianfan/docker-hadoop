
使用docker搭建的hadoop分布式集群


###创建 Hadoop Cluster 集群



##### 拉取镜像

```
docker pull woshicheng93632/hadoop:2
```

#####下载hadoop dockerfile库，以及sh命令

```
git clone https://github.com/chenjianfan/docker-hadoop.git
```

##### 启动Hadoop Cluster 集群

```
cd docker-hadoop
start-hadoopContainer
```

输出

```
Starting namenodes on [master]
Last login: Mon Feb  4 10:10:19 UTC 2019 from 120.37.246.118 on pts/0
Starting datanodes
Last login: Tue Feb  5 15:32:00 UTC 2019 on pts/0
Starting secondary namenodes [master]
Last login: Tue Feb  5 15:32:02 UTC 2019 on pts/0
Starting resourcemanager
Last login: Tue Feb  5 15:32:05 UTC 2019 on pts/0
Starting nodemanagers
Last login: Tue Feb  5 15:32:10 UTC 2019 on pts/0
[root@master /]# 
```

##### 启动容器成功后，默认进入master容器，

格式化
```
hadoop namenode -format
```

启动hadoop

```
start-all.sh
```

##### 验证jps
```
[root@master /]# jps
1171 NodeManager
1604 Jps
231 NameNode
663 SecondaryNameNode
1004 ResourceManager
[root@master /]# 
```
##### 进入ssh slave2,slave1,slave3 验证是否启动NodeManager
[slave2 jps]()


##### 自定义slave容器数量，但是docker容器默认是分配3个，修改在/usr/local/hadoop-3.1.1/etc/hadoop/workers
[root@localhost docker-hadoop]# start-hadoopContainer.sh  5
创建docker 网桥网络 hadoopnet
启动hadoop master 容器
开启 slave1 容器
开启 slave2 容器
开启 slave3 容器
开启 slave4 容器
开启 slave5 容器

