#!/bin/bash

MY_DIR=${PWD}
pushd /home/khlee/work/source/geoheim/mjvcc/geoheim-mjvcc/sshaws
scp -i "cougar.pem" ubuntu@ec2-13-124-178-92.ap-northeast-2.compute.amazonaws.com:/home/ubuntu/work/geoheim/mjvcc/mjv-server/log/server.log ${MY_DIR}/mjvcc-dev-server.log
popd
