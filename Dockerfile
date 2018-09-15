FROM ubuntu:trusty
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y gcc git wget make libncurses-dev flex bison gperf python python-pip python-setuptools python-serial
RUN mkdir /work /esp
WORKDIR /tmp
RUN wget https://dl.espressif.com/dl/xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz
WORKDIR /esp
RUN tar -zxf /tmp/xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz
ENV PATH "/esp/xtensa-esp32-elf/bin:${PATH}"
WORKDIR /esp
RUN git clone -b v3.1 --recursive https://github.com/espressif/esp-idf.git
ENV IDF_PATH /esp/esp-idf
WORKDIR /work



