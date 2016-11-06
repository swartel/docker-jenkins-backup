FROM debian:jessie
#
MAINTAINER "Stephane Wartel" <devops@wartel.fr>

# Package installation
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install \
openssh-server \
sudo

ADD add-jenkins-user.sh /add-jenkins-user.sh
ADD run-sshd.sh /run-sshd.sh
RUN chmod +x /add-jenkins-user.sh /run-sshd.sh

EXPOSE 22
CMD ["run-sshd.sh"] 
