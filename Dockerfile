FROM debian:jessie
#
MAINTAINER "Stephane Wartel" <devops@wartel.fr>

# Package installation
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install \
openssh-server \
sudo

ADD add-jenkins-user.sh /add-jenkins-user.sh
ADD run-sshd.sh /run-sshd.sh
RUN chmod +x /*.sh \
  && mkdir -p /var/run/sshd \
  && chmod 0755 /var/run/sshd \
  && true

EXPOSE 22
CMD ["/run-sshd.sh"] 
