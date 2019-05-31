aws ec2 run-instances --image-id ami-023ed0ab14ac1ee0c --count 3 --instance-type t2.micro --placement AvailabilityZone=us-west-2a --key-name yoga-444 --security-groups secure444 --user-data file://create-app.sh

VAR=`aws ec2 describe-instances --filters '[{"Name": "instance-state-name","Values": ["pending"]}]' --query 'Reservations[0].Instances[*].InstanceId'`

aws ec2 wait instance-running --instance-ids $VAR

declare -a Varr=(${VAR})

for ((i=1; i<${#Varr[@]}+1; i++));
do

aws ec2 create-volume --size 10 --availability-zone us-west-2a

VOL=`aws ec2 describe-volumes --filters '[{"Name":"status","Values":["creating"]}]' --query "Volumes[*].VolumeId"`

aws ec2 wait volume-available --volume-ids $VOL

echo $VOL

echo "Complete"

aws ec2 attach-volume --volume-id ${VOL:0} --instance-id ${Varr[$i-1]} --device /dev/sdf

done

aws elb create-load-balancer --load-balancer-name itmo444-elb --listeners "Protocol=HTTP,LoadBalancerPort=80,InstanceProtocol=HTTP,InstancePort=80" --availability-zones us-west-2a

aws elb create-lb-cookie-stickiness-policy --load-balancer-name itmo444-elb --policy-name stickycookie

aws elb register-instances-with-load-balancer --load-balancer-name itmo444-elb --instances $VAR

aws s3api create-bucket --bucket elc-imagenes --region us-east-1

aws s3api put-bucket-acl --bucket elc-imagenes --acl public-read

git clone https://github.com/ecabrera796/IITimage

aws s3api put-object --bucket elc-imagenes --key IIT-Logo.png --body ./IITimage/IIT-Logo.png

rm -rf IITimage
