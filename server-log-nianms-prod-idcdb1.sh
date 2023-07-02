#!/bin/bash

sshpass -p '$$zmfpdlwl##' ssh crazyupinc@211.115.79.31 \
	'pushd /var/log/mongodb/; tail -f mongodb.log; popd'
