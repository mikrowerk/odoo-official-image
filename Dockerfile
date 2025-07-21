# Copyright Gammadata GmbH. All Rights Reserved.
# SPDX-License-Identifier: APACHE-2.0
FROM odoo:17.0-20250710
USER root
ARG ADDON_PATH="/mnt/extra-addons"



# install additional python requirements
# COPY additional-requirements.txt ${ADDON_PATH}/additional-requirements.txt
RUN apt-get update -y
RUN apt-get install -y build-essential
RUN apt-get install -y  libcairo2-dev
RUN apt-get install -y  pkg-config
RUN apt-get install -y  python3-dev
#RUN pip3 install --upgrade pip && \
#    echo "------------- python module lib before install --------------" &&\
#    pip3 list && \
#    pip3 install -r ${ADDON_PATH}/additional-requirements.txt && \
#    echo "------------- python module lib after install --------------" &&\
#    pip3 list

USER odoo