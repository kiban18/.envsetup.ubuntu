#!/bin/bash

pushd /home/khlee/work/source/4ten/ias/4ten-ias.prod/sshaws
ssh -i "iasp.pem" ubuntu@ec2-15-165-203-148.ap-northeast-2.compute.amazonaws.com \
	'pushd ~/work/4ten/ias/ias-server; ./tail-log.sh; popd'
popd
