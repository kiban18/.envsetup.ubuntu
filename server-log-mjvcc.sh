#!/bin/bash

pushd /home/khlee/work/source/geoheim/mjvcc/geoheim-mjvcc/sshaws
ssh -i "cougar.pem" ubuntu@ec2-13-209-99-31.ap-northeast-2.compute.amazonaws.com \
	'pushd ~/work/geoheim/mjvcc/mjv-server; ./tail-log.sh; popd'
popd
