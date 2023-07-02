#!/bin/bash

MY_DIR=${PWD}
pushd /work/source/dayou/nia/dayou-niaprod-aws/sshaws
chmod 400 *.pem
scp -i "nms.pem" ubuntu@ec2-3-38-185-213.ap-northeast-2.compute.amazonaws.com:/home/ubuntu/work/dayou/nia/nia-server/log/server.log \
    ${MY_DIR}/nia-dev-server.log
popd
