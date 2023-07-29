// copy from https://github.com/SafiePublic/doxygen-actions/blob/main/workflow.yml

FROM ubuntu:22.04

# Define workdir
WORKDIR /work

# Install apt packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    graphviz wget git make \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install Doxygen 1.9.3
RUN wget -q --no-check-certificate \
    https://github.com/doxygen/doxygen/releases/download/Release_1_9_3/doxygen-1.9.3.linux.bin.tar.gz \
    && tar -zxvf doxygen-1.9.3.linux.bin.tar.gz \
    && cd doxygen-1.9.3 && make install && cd .. \
    && rm -r doxygen-1.9.3.linux.bin.tar.gz doxygen-1.9.3

# Fetch CSS for Doxygen
RUN git config --global http.sslVerify false \
    && git clone https://github.com/jothepro/doxygen-awesome-css.git
