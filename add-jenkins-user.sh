#!/bin/bash

echo "Creating user jenkins"
useradd jenkins \
  && passwd -d  jenkins \
  && mkdir -p /home/jenkins/backups \
  && adduser jenkins sudo

if [ -z "${SSH_KEY}" ]; then
	echo "Please define your public key in the SSH_KEY docker environment variable"
	exit 1
fi

echo "Adding your ssh public key to user jenkins"
mkdir -p /home/jenkins/.ssh && \
  && chmod go-rwx /home/jenkins/.ssh
echo "${SSH_KEY}" > /home/jenkins/.ssh/authorized_keys \
  && chmod go-rw /home/jenkins/.ssh/authorized_keys
chown -R jenkins:jenkins /home/jenkins

echo "You can now connect to your container using user jenkins"
