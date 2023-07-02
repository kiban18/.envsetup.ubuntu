#!/bin/bash

pushd /home/khlee/work/source/infomark/onm/server/rms/sshaws
chmod 400 *.pem
ssh -i "cougar.pem" ubuntu@ec2-15-164-162-155.ap-northeast-2.compute.amazonaws.com \
	'pushd ~/work/ubi/onm/onm-server; ./tail-log.sh; popd'
popd
