#!/bin/bash

echo "Creating user jenkins"
useradd jenkins \
  && passwd -d  jenkins \
  && mkdir -p /home/jenkins/.ssh \
  && mkdir -p /home/jenkins/backups \
  && chown -R jenkins:jenkins /home/jenkins \
  && adduser jenkins sudo

if [ -z "${SSH_KEY}" ]; then
	echo "Please define your public key in the SSH_KEY docker environment variable"
	exit 1
fi

echo "Adding your ssh public key to user jenkins"
echo "${SSH_KEY}" > /home/jenkins/.ssh/authorized_keys \
  && chmod go-rw /home/jenkins/.ssh/authorized_keys

echo "You can now connect to your container using user jenkins"
