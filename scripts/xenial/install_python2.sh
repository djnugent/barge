#!/bin/bash

# Install
apt-get install -y \
        curl \
        python-dev \
        python-wstool \
        python-numpy

# Install pip
curl https://bootstrap.pypa.io/get-pip.py -o /tmp/get-pip.py
python /tmp/get-pip.py
