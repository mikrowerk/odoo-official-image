# Copyright Gammadata GmbH. All Rights Reserved.
# SPDX-License-Identifier: APACHE-2.0
FROM odoo:17

ARG ADDON_PATH="/mnt/extra-addons"

# install additional python requirements
COPY additional-requirements.txt ${ADDON_PATH}/additional-requirements.txt
RUN sudo apt update
RUN sudo apt install -y build-essential
RUN sudo apt install -y  libcairo2-dev 
RUN sudo apt install -y  pkg-config
RUN sudo apt install -y  python3-dev
RUN pip3 install --upgrade pip && \
    echo "------------- python module lib before install --------------" &&\
    pip3 list && \
    pip3 install -r ${ADDON_PATH}/additional-requirements.txt && \
    echo "------------- python module lib after install --------------" &&\
    pip3 list
