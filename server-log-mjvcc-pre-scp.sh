#!/bin/bash

MY_DIR=${PWD}
pushd /work/source/geoheim/mjvcc/geoheim-mjvccpre/sshaws
chmod 400 *.pem
scp -i "cougar.pem" ubuntu@ec2-15-164-214-222.ap-northeast-2.compute.amazonaws.com:/home/ubuntu/work/geoheim/mjvcc/mjv-server/log/server.log \
    ${MY_DIR}/mjvcc-pre-server.log
popd
