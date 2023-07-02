#!/bin/bash

mongosh 211.115.79.31:27017 --eval "rs.add('nia.primary.db:27017')"
