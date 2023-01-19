#!/bin/bash

pushd /work/source/geoheim/mjvcc/geoheim-mjvccpre/sshaws
ssh -i "cougar.pem" ubuntu@ec2-13-209-99-31.ap-northeast-2.compute.amazonaws.com \
	'sudo reboot'
popd
