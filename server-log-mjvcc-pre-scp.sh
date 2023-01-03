#!/bin/bash

MY_DIR=${PWD}
pushd /home/khlee/work/source/geoheim/mjvcc/geoheim-mjvcc/sshaws
scp -i "cougar.pem" ubuntu@ec2-13-209-99-31.ap-northeast-2.compute.amazonaws.com:/home/ubuntu/work/geoheim/mjvcc/mjv-server/log/server.log ${MY_DIR}/mjvcc-pre-server.log
popd
