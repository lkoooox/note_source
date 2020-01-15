#!/bin/bash
for node in node2 node3 node4
do
  ssh $node "source /etc/profile; zkServer.sh start"
done

start-dfs.sh

ssh node3 "source /etc/profile; start-yarn.sh"
ssh node4 "source /etc/profile; yarn-daemon.sh start resourcemanager"

echo "------------------node1-jps-----------------"
jps

for node in node2 node3 node4
do
  echo "------------------node1-jps-----------------"
  ssh $node "source /etc/profile; jps"
done
