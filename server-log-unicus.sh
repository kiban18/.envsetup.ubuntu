#!/bin/bash

pushd /work/source/marklink/unicus/marklink-unicus/sshaws
ssh -i "cougar.pem" ubuntu@ec2-13-125-30-169.ap-northeast-2.compute.amazonaws.com \
	'pushd ~/work/marklink/unicus/unicus-server; ./tail-log.sh; popd'
popd
