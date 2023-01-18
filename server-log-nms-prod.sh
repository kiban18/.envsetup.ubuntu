#!/bin/bash

pushd /work/source/dayou/nms/dayou-nmsprod/sshaws
ssh -i "nms.pem" ubuntu@ec2-3-38-135-149.ap-northeast-2.compute.amazonaws.com \
	'pushd ~/work/dayou/nms/nms-server; ./tail-log.sh; popd'
popd
