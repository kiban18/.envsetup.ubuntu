#!/bin/bash

DATE=`date +%Y%m%d_%H%M%S`
LINT_LOG=lint-unicus-fota-${DATE}.log

time (lint-unicus-fota.sh | tee ${LINT_LOG})

echo
echo "server, admin, client problems: "
grep -nwrIi problems ${LINT_LOG}
