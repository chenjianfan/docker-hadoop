#!/bin/bash
#创建hadoop master容器以及默认三个slave1，2，3容器
##########################################
#如果num没有赋值，默认3
num=${1:-3}
# 创建docker 网桥网络
echo "创建docker 网桥网络hadoopnet"
docker network create hadoopnet

echo "启动hadoop master 容器"

docker run -d  --name master \
  -p 9418:22  \
  -p 9417:9870  \
  -p 9423:8088  \
  -p 9425:50070  \
  --network hadoopnet \
  --network-alias master \
  --hostname master \
   woshicheng93632/hadoop:1

# 启动slave容器


i=1
for (( i=1 ; i <= $num ; i = $i + 1 )) ; do
    echo "开启 slave$i 容器"
    docker run -d --name slave$i \
	  -p 9419:22 \
	  --network hadoopnet  \
	  --network-alias slave$i  \
	  --hostname slave$i  \
	  woshicheng93632/hadoop:1
done
docker exec -it master bin/bash