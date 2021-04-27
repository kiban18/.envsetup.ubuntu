#!/bin/bash

pushd /home/khlee/work/source/mediaizent/mcast/medi-mcast-server-b/sshaws
ssh -i "medi.pem" ubuntu@ec2-52-78-164-240.ap-northeast-2.compute.amazonaws.com '~/work/mcast/medi-mcast-server-b/nurse-server/tail-log.sh'
popd
