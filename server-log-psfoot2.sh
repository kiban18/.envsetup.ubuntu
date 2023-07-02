#!/bin/bash

pushd /work/source/4ten/psfoot/4ten-psfoot2/sshaws
chmod 400 *.pem
ssh -i "psfoot.pem" ubuntu@ec2-52-79-235-183.ap-northeast-2.compute.amazonaws.com \
    '~/work/4ten/psfoot2/psfoot2-server/tail-log.sh'
popd
