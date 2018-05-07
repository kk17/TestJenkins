FROM jenkins/jenkins:lts
# COPY executors.groovy /usr/share/jenkins/ref/init.groovy.d/executors.groovy
# if we want to install via apt
USER root
RUN apt-get update
RUN apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
RUN apt-get update
RUN apt-get install -y docker-ce
# drop back to the regular jenkins user - good practice
USER jenkins
