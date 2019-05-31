#!/bin/bash

VAR=`aws ec2 describe-instances  --filters '[{"Name": "instance-state-name","Values": ["running"]}]' --query 'Reservations[*].Instances[*].InstanceId'`

aws ec2 terminate-instances --instance-ids $VAR

aws ec2 wait instance-terminated --instance-ids $VAR

echo "terminated"

declare -a Varray=(${VAR})

for ((i=1; i<${#Varray[@]}+1; i++));
do

VOL=`aws ec2 describe-volumes --filters '[{"Name":"status","Values":["available"]}]' --query "Volumes[*].VolumeId"`

aws ec2 delete-volume --volume-id $VOL

done

echo "Volumes Deleted"

aws elb delete-load-balancer --load-balancer-name itmo444-elb

aws s3api delete-object --bucket elc-imagenes --key IIT-Logo.png

aws s3api delete-bucket --bucket elc-imagenes --region us-west-2
