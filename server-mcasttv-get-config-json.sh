#!/bin/bash

MY_DIR=${PWD}
pushd /work/source/mediaizent/mcasttv/mcasttv/sshaws
chmod 400 *.pem
scp -i "medi.pem" ubuntu@ec2-15-165-6-65.ap-northeast-2.compute.amazonaws.com:/home/ubuntu/work/medieye/mcasttv/mcasttv-server2/config/env/config.json \
    ${MY_DIR}/mcasttv-server2-config.json
popd
vi mcasttv-server2-config.json
