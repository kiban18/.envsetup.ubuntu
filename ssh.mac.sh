#!/usr/bin/expect -f
spawn ssh kihwanlee@192.168.0.4
expect "Password:"
send "**rlskaqhrghks1829\r"
interact
