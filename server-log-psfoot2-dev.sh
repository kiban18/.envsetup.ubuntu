#!/bin/bash

pushd /home/khlee/work/source/4ten/psfoot/4ten-psfoot2/sshaws
ssh -i "psfoot.pem" ubuntu@ec2-3-35-233-48.ap-northeast-2.compute.amazonaws.com '~/work/4ten/psfoot2-dev/psfoot2-server/tail-log.sh'
popd
