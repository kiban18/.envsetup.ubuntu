#!/bin/bash

pushd /work/source/geoheim/mjvcc/geoheim-mjvcc/sshaws
chmod 400 *.pem
ssh -i "cougar.pem" ubuntu@ec2-15-165-76-229.ap-northeast-2.compute.amazonaws.com \
	'pushd ~/work/geoheim/mjvcc/mjv-server; ./tail-log.sh; popd'
popd
