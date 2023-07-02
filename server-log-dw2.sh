#!/bin/bash

pushd /work/source/4ten/dw2/server/dwatcher2/sshaws
chmod 400 *.pem
ssh -i "dwatcher2.pem" ubuntu@ec2-13-124-159-201.ap-northeast-2.compute.amazonaws.com \
    '~/work/4ten/dwatcher2/dw2-server/tail-log.sh'
popd
