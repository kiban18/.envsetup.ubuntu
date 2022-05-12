#!/bin/bash

pushd /work/source/markt/clova/markt-be/sshaws
ssh -i "cougar.pem" ubuntu@ec2-13-125-100-67.ap-northeast-2.compute.amazonaws.com '/home/ubuntu/work/markt/markt-be/mclova-server/download_config.sh'
popd
