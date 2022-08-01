#!/bin/bash

pushd /home/khlee/work/source/dayou/nms/dayou-nms/sshaws
ssh -i "cougar.pem" ubuntu@ec2-3-35-24-144.ap-northeast-2.compute.amazonaws.com \
	'pushd ~/work/dayou/nms/nms-server; ./tail-log.sh; popd'
popd
