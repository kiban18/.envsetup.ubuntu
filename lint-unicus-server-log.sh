#!/bin/bash

LINT_LOG=lint-unicus-server.log

time (lint-unicus-server.sh | tee $LINT_LOG)

echo
echo "server, admin, client problems: "
grep -nwrIi problems $LINT_LOG
