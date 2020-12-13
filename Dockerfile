# Install CFSSL from official cfssl.org binaries
FROM cfssl/cfssl:1.5.0 as cfssl

# Install remaining packages
FROM alpine:3.12
ENV INSTALL_PATH=/packages/bin
ENV PATH=${INSTALL_PATH}:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
RUN mkdir -p ${INSTALL_PATH}

# # Use TLS for alpine default repos
# RUN sed -i 's|http://dl-cdn.alpinelinux.org|https://alpine.global.ssl.fastly.net|g' /etc/apk/repositories && \
#     echo "@community https://alpine.global.ssl.fastly.net/alpine/v3.12/community" >> /etc/apk/repositories && \
#     echo "@testing https://alpine.global.ssl.fastly.net/alpine/edge/testing" >> /etc/apk/repositories

# copy apk packages manifest
COPY packages.txt /etc/apk/packages.txt

# install apk packages from manifest
RUN apk update && \
    apk add --no-cache $(grep -v '^#' /etc/apk/packages.txt) && \
    rm -f /tmp/* /etc/apk/cache/*

COPY --from=cfssl /go/bin/ ${INSTALL_PATH}/

COPY bin/ /usr/local/bin/

COPY . /packages
RUN mkdir -p /packages/tmp
RUN make -C /packages/install/ all
WORKDIR /packages
