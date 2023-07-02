#!/bin/bash

MY_DIR=${PWD}
pushd /work/source/dayou/nia/dayou-nia/sshaws
chmod 400 *.pem
scp -i "cougar.pem" ubuntu@ec2-3-38-99-149.ap-northeast-2.compute.amazonaws.com:/home/ubuntu/work/dayou/nia/nia-server/log/server.log \
    ${MY_DIR}/nia-dev-server.log
popd
