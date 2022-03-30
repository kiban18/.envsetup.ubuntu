#!/bin/bash

pushd /work/source/markt/clova/markt-be/sshaws
ssh -i "cougar.pem" ubuntu@ec2-13-125-100-67.ap-northeast-2.compute.amazonaws.com \
	'pushd ~/work/markt/markt-be/mcext-server; ./tail-log.sh; popd'
popd
