#!/bin/bash

pushd /home/khlee/work/source/4ten/smartorder/4ten-psfoot2/sshaws
ssh -i "psfoot.pem" ubuntu@ec2-52-79-235-183.ap-northeast-2.compute.amazonaws.com '~/work/4ten/psfoot2/psfoot2-server/tail-log.sh'
popd
