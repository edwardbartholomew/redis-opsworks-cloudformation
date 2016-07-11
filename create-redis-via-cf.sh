#!/bin/bash
aws cloudformation create-stack --stack-name redis-stack --template-body file://redis.cf.json --parameters ParameterKey=VPCId,ParameterValue=vpc-f74bbc92 --capabilities CAPABILITY_IAM
