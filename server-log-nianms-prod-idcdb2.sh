#!/bin/bash

sshpass -p '$$zmfpdlwl##' ssh crazyupinc@211.115.79.32 \
	'pushd /var/log/mongodb/; tail -f mongodb.log; popd'
