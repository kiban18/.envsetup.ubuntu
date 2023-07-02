#!/bin/bash

pushd /work/source/dayou/nms/dayou-nmsprod/sshaws
chmod 400 *.pem
ssh -i "nms.pem" ubuntu@ec2-3-38-135-149.ap-northeast-2.compute.amazonaws.com \
	'~/work/dayou/nms/nms-server/tail-log.sh'
popd
