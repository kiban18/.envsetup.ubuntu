#!/bin/bash

pushd /home/khlee/work/source/infomark/onm/server/onm/sshaws
chmod 400 *.pem
ssh -i "onm.pem" ubuntu@ec2-54-180-112-155.ap-northeast-2.compute.amazonaws.com \
	'pushd ~/work/infomark/onm/onm-server; ./tail-log.sh; popd'
popd
