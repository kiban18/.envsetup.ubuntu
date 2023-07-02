#!/bin/bash

pushd /work/source/geoheim/mjvcc/geoheim-mjvccpre/sshaws
chmod 400 *.pem
ssh -i "cougar.pem" ubuntu@ec2-15-164-214-222.ap-northeast-2.compute.amazonaws.com \
	'pushd ~/work/geoheim/mjvcc/mjv-server; ./tail-log.sh; popd'
popd
