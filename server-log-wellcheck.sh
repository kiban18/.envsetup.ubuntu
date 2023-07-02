#!/bin/bash

pushd /work/source/mcircle/server/mcircle-dcare/sshaws
chmod 400 *.pem
ssh -i "cougar.pem" ubuntu@ec2-3-34-125-118.ap-northeast-2.compute.amazonaws.com \
    '~/work/mcircle/dcare-dev/dcare-server/tail-log.sh'
popd
