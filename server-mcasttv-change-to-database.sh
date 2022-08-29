#!/bin/bash

pushd /home/khlee/work/source/mediaizent/mcasttv/mcasttv/sshaws
chmod 400 *.pem
ssh -i "medi.pem" ubuntu@ec2-15-165-6-65.ap-northeast-2.compute.amazonaws.com \
    'pushd ./work/medieye/mcasttv/mcasttv-server2; chmod +x ./change-to-database.sh; ./change-to-database.sh; popd' \
    #2>/dev/null
popd
echo "change to database and restart service"
echo ""
