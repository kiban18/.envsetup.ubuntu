#!/bin/bash

pushd /work/source/marklink/unicus/marklink-unicus/sshaws
ssh -i "cougar.pem" ubuntu@ec2-13-125-100-67.ap-northeast-2.compute.amazonaws.com \
	'pushd ~/kay-lint/marklink-unicus/; git pull; popd;
	pushd ~/kay-lint/marklink-unicus/unicus-server; /home/ubuntu/.nvm/versions/node/v16.10.0/bin/npm run lint; popd;
	pushd ~/kay-lint/marklink-unicus/unicus-admin; /home/ubuntu/.nvm/versions/node/v16.10.0/bin/npm run lint; popd;
	pushd ~/kay-lint/marklink-unicus/unicus-client; /home/ubuntu/.nvm/versions/node/v16.10.0/bin/npm run lint; popd;
    '
popd
