#!/bin/bash
echo $(date) >> log.txt
echo $1 >> log.txt
cd ../aws_res/
sed -i "s/ipwichyouwhanttofind/$1/" ./user_data.sh
terraform apply -auto-approve 
sleep 60
terraform destroy -auto-approve && python3 ../main_serv/finish.py
sed -i "s/$1/ipwichyouwhanttofind/" ./user_data.sh
