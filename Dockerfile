FROM ubuntu:16.10
MAINTAINER mrbolae <michael.burkard@gmx.ch>

# install base tools
RUN apt-get update
RUN apt-get install -y git aptitude vim build-essential

# install basic toolchain
RUN apt-get install -y cmake ninja-build clang
# install optional toolchain
RUN apt-get install -y doxygen gcovr graphviz cppcheck

# install qt
RUN apt-get install -y qt5-default qtdeclarative5-dev qml-module-qtquick-controls qtdeclarative5-test-plugin

# create user and mark as sudo user
RUN apt-get -y install sudo
RUN useradd -ms /bin/bash developer
RUN echo 'developer:developer' | chpasswd
RUN usermod -aG sudo developer

USER developer

CMD /bin/bash

