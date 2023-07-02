#!/bin/bash

sshpass -p '$$zmfpdlwl##' ssh crazyupinc@211.115.79.35 \
	'pushd ~/work/dayou/nia/nia-server/; ./tail-log.sh; popd'
