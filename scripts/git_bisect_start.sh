#!/bin/bash

GOOD_COMMIT_HASH=$1

if [[ "$GOOD_COMMIT_HASH" == "" ]]; then
    echo "Usage : $0 <GOOD_COMMIT_HASH>"
    echo "Run 'git lds' and use one of the existing commit hashs..."
    echo ""
    exit 1
fi

echo "bisect start"
git bisect start
git bisect bad
git bisect good $GOOD_COMMIT_HASH
