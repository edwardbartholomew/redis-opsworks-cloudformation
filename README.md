redis.cf.json - CloudFormation template that creates an OpsWorks Stack to deploy a 4 node Redis cluster. This OpsWorks cluster creates a master layer consisting of 1 master instance and a slave layer consisting of 3 instances.

The resulting OpsWorks stack references a github repo containing a Chef cookbook that configures redis-server and redis-sentinel 

aws cloudformation create-stack --stack-name redis-stack --template-body file://redis.cf.json --parameters ParameterKey=VPCId,ParameterValue=vpc-f74bbc92 --capabilities CAPABILITY_IAM

ToDo:
More parameters: Subnets (rather than AZ)?

Testing:
Verify if master or slave: redis-cli -h <host> -p 6379 info |grep role
Determine master node: redis-cli -h <host> -p 16379 sentinel get-master-addr-by-name redis-cluster
