#!/bin/bash

#TOPDIR=`dirname $0`
TOPDIR=`pwd`
SUBDIRS=`find ${TOPDIR} -mindepth 1 -maxdepth 1 -type d | sort`
CONTINUE="yes"

echo SUBDIRS:${SUBDIRS}

for dir in ${SUBDIRS}
do
	pushd ${dir} > /dev/null
	if [[ ! -z $(git status -s) ]]; then
		echo "----------"
		git st
		echo ""
		CONTINUE="no"
	fi
	popd > /dev/null
done

if [[ "${CONTINUE}" == "no" ]]; then
	exit 1
fi

for dir in ${SUBDIRS}
do
	pushd ${dir} > /dev/null
	git pull
	popd > /dev/null
done

exit 0
