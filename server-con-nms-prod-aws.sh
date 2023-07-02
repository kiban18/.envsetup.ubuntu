#!/bin/bash

pushd /work/source/4ten/ias/4ten-ias/sshaws
chmod 400 *.pem
ssh -i "cougar.pem" ubuntu@ec2-54-180-113-209.ap-northeast-2.compute.amazonaws.com
popd
