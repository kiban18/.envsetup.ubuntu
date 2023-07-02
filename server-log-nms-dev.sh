#!/bin/bash

pushd /work/source/dayou/nms/dayou-nms/sshaws
chmod 400 *.pem
ssh -i "cougar.pem" ubuntu@ec2-3-35-24-144.ap-northeast-2.compute.amazonaws.com \
	'pushd ~/work/dayou/nms/nms-server/; ./tail-log.sh; popd'
popd
