#!/bin/bash

pushd /home/khlee/work/source/unet/server/connfarm/sshaws
ssh -i "cougar.pem" ubuntu@ec2-3-36-75-86.ap-northeast-2.compute.amazonaws.com '~/work/crazyupinc/cougar/blog-server/tail-log.sh'
popd
