#!/bin/bash

#send email with TITLE and MESSAGE
function send_email() {
    YEAR_MONTH_DATE=`date +%Y%m%d`
    Y=`date +%Y`
    M=`date +%m`
    D=`date +%d`
    FROM_EMAIL="${FROM}"
    TO_EMAIL="${TO}"
    TITLE="[cd-4ten-ias-app-ext failed] ${ERROR_KIND}"
    SERVER="smtp.gmail.com:587"
    O_TLS="tls=yes"
    XU_USERNAME="khlee@crazyupinc.com"
    XP_PASSWORD="**rlskaqhrghks1829"

    sendemail \
        -o ${O_TLS} \
        -f ${FROM_EMAIL} \
        -t ${TO_EMAIL} \
        -u ${TITLE} \
        -m ${MESSAGE} \
        -s ${SERVER} \
        -xu ${XU_USERNAME} \
        -xp ${XP_PASSWORD}
}


DATE=`date`
FROM="khlee@crazyupinc.com"
TO="khlee@crazyupinc.com"


TIME=`date +%Y%m%d_%H%M%S`
DIR=${TIME}-4ten-ias-app-ext

git clone -b develop git@github.com:crazyupinc/4ten-ias-app-ext.git ${DIR}
RESULT=$?
if [ "$RESULT" != "0" ]
then
    TITLE="git clone failed"
    MESSAGE=${TITLE}
    send_email
    exit 1
fi

pushd ${DIR}

./build_apk.sh
RESULT=$?
if [ "$RESULT" != "0" ]
then
    TITLE="build apk failed"
    MESSAGE=${TITLE}
    send_email
    exit 2
fi

./deploy_apk.sh
RESULT=$?
if [ "$RESULT" != "0" ]
then
    TITLE="deploy apk failed"
    MESSAGE=${TITLE}
    send_email
    exit 3
fi

popd

rm -rf ${DIR}
