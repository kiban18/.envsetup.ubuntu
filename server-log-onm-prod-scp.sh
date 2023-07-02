#!/bin/bash

MY_DIR=${PWD}
pushd /home/khlee/work/source/infomark/onm/server/onm/sshaws
chmod 400 *.pem
scp -i "onm.pem" ubuntu@ec2-54-180-112-155.ap-northeast-2.compute.amazonaws.com:/var/crazy/log/onm/onm-server-logger.log \
    ${MY_DIR}/onm-prod-server.log
popd
