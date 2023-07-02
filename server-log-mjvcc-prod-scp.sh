#!/bin/bash

MY_DIR=${PWD}
pushd /work/source/geoheim/mjvcc/geoheim-mjvccprod/sshaws
chmod 400 *.pem
scp -i "mjv.pem" ubuntu@ec2-3-34-0-226.ap-northeast-2.compute.amazonaws.com:/home/ubuntu/work/geoheim/mjvcc/mjv-server/log/server.log \
    ${MY_DIR}/mjvcc-prod-server.log
popd
