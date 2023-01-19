#!/bin/bash

pushd /work/source/geoheim/mjvcc/geoheim-mjvccprod/sshaws
ssh -i "mjv.pem" ubuntu@ec2-3-34-0-226.ap-northeast-2.compute.amazonaws.com \
	'sudo reboot'
popd
