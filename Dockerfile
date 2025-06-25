FROM python:3.14.0a2-slim
LABEL maintainer="xiaolz@ous-hf.no"
# install dependencies
COPY requirements.txt /
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential=12.9 \
        libjpeg-dev=1:2.1.5-2 \
        libxml2=2.9.14+dfsg-1.3~deb12u1 \
        libxslt1-dev=1.1.35-1+deb12u1 \
        poppler-utils=22.12.0-2+b1 \
        zlib1g-dev=1:1.2.13.dfsg-1 \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean \
    && pip install --no-cache-dir -r requirements.txt \
    && rm /requirements.txt
# copy over config, template and script
COPY Config /pronto_unn/Config
COPY In /pronto_unn/In
COPY Script /pronto_unn/Script
