#!/bin/bash

pushd /home/khlee/work/source/4ten/ias/4ten-ias/sshaws
ssh -i "cougar.pem" ubuntu@ec2-54-180-113-209.ap-northeast-2.compute.amazonaws.com \
	'pushd ~/work/4ten/ias/ias-server; ./tail-log.sh; popd'
popd
