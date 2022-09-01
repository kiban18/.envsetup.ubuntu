#!/bin/bash

pushd /home/khlee/work/source/4ten/psfoot/4ten-psfoot/sshaws
chmod 400 *.pem
ssh -i "psfoot.pem" ubuntu@ec2-13-124-140-163.ap-northeast-2.compute.amazonaws.com \
    'pushd ~/work/4ten/psfoot/psfoot-server; ./tail-log.sh; popd'
popd
