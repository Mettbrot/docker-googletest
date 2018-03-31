FROM ubuntu:xenial

MAINTAINER srz_zumix <https://github.com/srz-zumix>

ARG BRANCH_OR_TAG=release-1.8.0
RUN env
RUN apt-get update && \
  apt-get install -q -y git cmake make g++

RUN git clone -b $BRANCH_OR_TAG -q https://github.com/google/googletest.git /googletest
RUN mkdir -p /googletest/build
RUN cd /googletest/build \
  && cmake .. && make && make install

RUN rm -rf /googletest
RUN apt-get clean
