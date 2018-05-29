FROM python:2.7-stretch
ENTRYPOINT /bin/bash
ENV DOCKER_JUMPER_EXAMPLES=1
RUN pip install jumper
RUN apt-get update
RUN apt-get install -y --no-install-recommends git cmake ninja-build gperf \
  ccache doxygen dfu-util device-tree-compiler python3-dev \
  python3-ply python3-pip python3-setuptools python3-wheel xz-utils file \
  make gcc-multilib autoconf automake libtool gcc-arm-none-eabi
RUN mkdir $HOME/cmake && cd $HOME/cmake && wget https://cmake.org/files/v3.8/cmake-3.8.2-Linux-x86_64.sh && \
  yes | sh cmake-3.8.2-Linux-x86_64.sh | cat && \
  echo "export PATH=$PWD/cmake-3.8.2-Linux-x86_64/bin:\$PATH" >> $HOME/.zephyrrc
ENV ZEPHYR_TOOLCHAIN_VARIANT=gccarmemb
ENV GCCARMEMB_TOOLCHAIN_PATH=/usr
