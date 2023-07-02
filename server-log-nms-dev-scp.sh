#!/bin/bash

MY_DIR=${PWD}
pushd /work/source/dayou/nms/dayou-nms/sshaws
chmod 400 *.pem
scp -i "cougar.pem" ubuntu@ec2-3-35-24-144.ap-northeast-2.compute.amazonaws.com:/home/ubuntu/work/dayou/nms/nms-server/log/server.log \
    ${MY_DIR}/nms-dev-server.log
popd
