FROM ubuntu:trusty

MAINTAINER srz_zumix <https://github.com/srz-zumix>

ARG BRANCH_OR_TAG=release-1.0.0
RUN env
RUN apt-get update && \
  apt-get install -y -q git cmake make g++-4.6 > /dev/null && \
  apt-get install -y -q automake autoconf libtool python > /dev/null
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.6 20 && \
    update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.6 20 

RUN git clone -b $BRANCH_OR_TAG -q https://github.com/google/googletest.git /gtest
#COPY gtest-filepath.patch /gtest/src/
#RUN cd /gtest/src && patch -u < gtest-filepath.patch
RUN mkdir -p /gtest/build
RUN cd /gtest && autoreconf -fvi && ./configure && make && make install

RUN rm -rf /gtest
#RUN apt-get purge automake autoconf libtool python
RUN apt-get clean
