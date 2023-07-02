#!/bin/bash

pushd /work/source/mediaizent/mcast/medi-mcast-server-b/sshaws
chmod 400 *.pem
ssh -i "medi.pem" ubuntu@ec2-52-78-164-240.ap-northeast-2.compute.amazonaws.com \
    '~/work/mcast/medi-mcast-server-b/nurse-server/tail-log.sh'
popd
