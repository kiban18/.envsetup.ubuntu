#!/bin/bash

pushd /work/source/dayou/nia/dayou-niaprod-aws/sshaws
chmod 400 *.pem
ssh -i "nms.pem" ubuntu@ec2-3-38-185-213.ap-northeast-2.compute.amazonaws.com \
	'pushd ~/work/dayou/nia/nia-server/; ./tail-log.sh; popd'
popd
