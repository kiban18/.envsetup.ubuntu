#!/bin/bash

MY_DIR=${PWD}
pushd /work/source/geoheim/mjvcc/geoheim-mjvcc/sshaws
chmod 400 *.pem
scp -i "cougar.pem" ubuntu@ec2-15-165-76-229.ap-northeast-2.compute.amazonaws.com:/home/ubuntu/work/geoheim/mjvcc/mjv-server/log/server.log \
    ${MY_DIR}/mjvcc-dev-server.log
popd
