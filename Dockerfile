# Copyright Gammadata GmbH. All Rights Reserved.
# SPDX-License-Identifier: APACHE-2.0
FROM odoo:17.0-20251208
# FROM odoo:17.0-latest
USER root
ARG ADDON_PATH="/mnt/extra-addons"

RUN apt-get update -y
RUN apt-get install -y build-essential && \
    apt-get install -y  libcairo2-dev && \
    apt-get install -y  pkg-config && \
    apt-get install -y  python3-dev

RUN cat /etc/passwd && \
    cat /etc/group


RUN pip install --upgrade pip && \
    echo "------------- python module lib before install --------------" && \
    which pip3 && \
    pip3 list

# install additional-requirements in user space to avoid conflicts with deb packages
USER odoo
# install additional python requirements
COPY additional-requirements.txt /tmp/additional-requirements.txt
RUN pip3 install --user -r /tmp/additional-requirements.txt && \
    echo "------------- python module lib after install --------------" && \
    pip3 list

