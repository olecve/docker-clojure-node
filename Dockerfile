FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install curl -y

# Install node, yarn, and their dependencies
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash && \
  apt-get install -y nodejs gcc g++ make && \
  curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update && apt-get install yarn

# Install latest google chrome
RUN curl -LO https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt-get install -y ./google-chrome-stable_current_amd64.deb
RUN rm google-chrome-stable_current_amd64.deb

# Install jdk and lein
RUN apt-get install openjdk-11-jre-headless leiningen -y

RUN ln -fs /usr/share/zoneinfo/Europe/Tallinn /etc/localtime

WORKDIR /usr/src/app
