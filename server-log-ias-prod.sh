#!/bin/bash

pushd /work/source/4ten/ias/4ten-ias.prod/sshaws
chmod 400 *.pem
ssh -i "iasp.pem" ubuntu@ec2-15-165-203-148.ap-northeast-2.compute.amazonaws.com \
	'~/work/4ten/ias/ias-server/tail-log.sh'
popd
