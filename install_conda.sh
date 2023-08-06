#!/bin/bash

cd /tmp/
curl -LO https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh -b -u

source ~/miniconda3/bin/activate
conda init bash
conda init zsh
conda config --set changeps1 False