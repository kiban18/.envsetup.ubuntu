#!/bin/bash

MY_DIR=${PWD}
pushd /work/source/4ten/psfoot/4ten-psfoot2/sshaws
chmod 400 *.pem
scp -i "psfoot.pem" ubuntu@ec2-3-35-233-48.ap-northeast-2.compute.amazonaws.com:/home/ubuntu/work/4ten/psfoot2-dev/psfoot2-server/log/server.log \
    ${MY_DIR}/psfoot2-dev-server.log
popd
