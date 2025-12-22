# Copyright Gammadata GmbH. All Rights Reserved.
# SPDX-License-Identifier: APACHE-2.0
FROM odoo:17.0-20250710
# FROM odoo:17.0-latest
USER root
ARG ADDON_PATH="/mnt/extra-addons"

RUN apt-get update -y
RUN apt-get install -y build-essential && \
    apt-get install -y  libcairo2-dev && \
    apt-get install -y  pkg-config && \
    apt-get install -y  python3-dev

# install additional python requirements
COPY additional-requirements.txt /tmp/additional-requirements.txt
RUN pip install --upgrade pip && \
    echo "------------- python module lib before install --------------" && \
    pip3 list
RUN apt-get remove python3-pypdf2
RUN pip3 install -r /tmp/additional-requirements.txt && \
    echo "------------- python module lib after install --------------" && \
    pip3 list && \
    which pip3

USER odoo