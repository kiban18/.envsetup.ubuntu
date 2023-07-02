#!/bin/bash

pushd /work/source/geoheim/mjvcc/geoheim-mjvcc/sshaws
chmod 400 *.pem
ssh -i "cougar.pem" ubuntu@ec2-13-124-178-92.ap-northeast-2.compute.amazonaws.com \
	'sudo reboot'
popd
