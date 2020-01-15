#!/bin/bash
ssh node3 "source /etc/profile; stop-yarn.sh"
ssh node4 "source /etc/profile; yarn-daemon.sh stop resourcemanager"

stop-dfs.sh

for node in node2 node3 node4
do
  ssh $node "source /etc/profile; zkServer.sh stop"
done

echo "------------------node1-jps-----------------"
jps

for node in node2 node3 node4
do
  echo "------------------node1-jps-----------------"
  ssh $node "source /etc/profile; jps"
done
