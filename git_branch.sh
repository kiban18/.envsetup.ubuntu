#!/bin/bash

#TOPDIR=`dirname $0`
TOPDIR=`pwd`
SUBDIRS=`find ${TOPDIR} -mindepth 1 -maxdepth 1 -type d | sort`
CONTINUE="yes"

echo SUBDIRS:${SUBDIRS}

for dir in ${SUBDIRS}
do
	pushd ${dir} > /dev/null
	pwd
	git branch
	popd > /dev/null
done

exit 0
