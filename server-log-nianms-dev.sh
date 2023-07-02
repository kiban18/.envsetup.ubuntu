#!/bin/bash

pushd /work/source/dayou/nia/dayou-nia/sshaws
chmod 400 *.pem
ssh -i "cougar.pem" ubuntu@ec2-3-38-99-149.ap-northeast-2.compute.amazonaws.com \
	'pushd ~/work/dayou/nia/nia-server/; ./tail-log.sh; popd'
popd
