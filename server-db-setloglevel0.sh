#!/bin/bash

mongosh 211.115.79.31:27017 --eval "db.setLogLevel(0, 'query')"
mongosh 211.115.79.32:27017 --eval "db.setLogLevel(0, 'query')"
mongosh 211.115.79.33:27017 --eval "db.setLogLevel(0, 'query')"
