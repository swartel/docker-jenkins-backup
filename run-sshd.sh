#!/bin/bash -e

/add-jenkins-user.sh
exec /usr/sbin/sshd -D
