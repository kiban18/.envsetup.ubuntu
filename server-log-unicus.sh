#!/bin/bash

pushd /work/source/marklink/unicus/marklink-unicus/sshaws
chmod 400 *.pem
ssh -i "cougar.pem" ubuntu@ec2-13-125-30-169.ap-northeast-2.compute.amazonaws.com \
	'~/work/marklink/unicus/unicus-server/tail-log.sh'
popd
