#!/bin/bash

pushd /work/source/mediaizent/mcasttv/mcasttv/sshaws
chmod 400 *.pem
ssh -i "medi.pem" ubuntu@ec2-15-165-6-65.ap-northeast-2.compute.amazonaws.com \
    '~/work/medieye/mcasttv/mcasttv-server2/tail-log.sh'
popd
