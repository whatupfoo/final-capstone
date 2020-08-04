# Creating Cluster using eksctl: Managed nodes - Linux

eksctl create cluster \
--name capstone \
--version 1.17 \
--region us-west-2 \
--nodegroup-name linux-nodes \
--node-type t2.small \
--nodes 2 \
--nodes-min 1 \
--nodes-max 4 \
--ssh-access \
--ssh-public-key jenkins-eksctl.pub \
--managed