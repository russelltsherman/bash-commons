FROM ubuntu:16.04

# Install basic dependencies
RUN DEBIAN_FRONTEND=noninteractive apt-get update \
  && apt-get install -y \
  curl \
  jq \
  python-pip \
  software-properties-common \
  sudo \
  vim \
  && apt-get autoremove \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install Bats
RUN add-apt-repository ppa:duggan/bats \
  && DEBIAN_FRONTEND=noninteractive apt-get update \
  && apt-get install -y bats \
  && apt-get autoremove \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install AWS CLI
RUN pip install awscli --upgrade --user

# Install moto: https://github.com/spulec/moto
RUN pip install flask moto moto[server]

# Install tools we'll need to create a mock EC2 metadata server
RUN DEBIAN_FRONTEND=noninteractive apt-get update \
  && apt-get install -y net-tools iptables \
  && apt-get autoremove \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Copy mock AWS CLI into the PATH
COPY ./aws-local.sh /usr/local/bin/aws
