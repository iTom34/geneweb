FROM ubuntu:20.04

MAINTAINER Thomas Gaime <thomasgaime@gmail.com>

WORKDIR /geneweb

RUN \
  apt-get update && \
  apt-get -y install --no-install-recommends wget tzdata unzip supervisor && \
  rm -fr /var/lib/apt/lists/*

RUN wget --no-check-certificate https://github.com/geneweb/geneweb/releases/download/v7.0.0/geneweb-linux-88536ed4.zip

# Default language to be English
ENV LANGUAGE en

# Default access to gwsetup is from docker host
ENV HOST_IP 172.17.0.1

# Expose the geneweb and gwsetup ports to the docker host
EXPOSE 2317
EXPOSE 2316

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN unzip geneweb-linux-88536ed4.zip

WORKDIR /geneweb/distribution

COPY only.txt /geneweb/distribution/gw/only.txt

RUN pwd
RUN ls

CMD ["/usr/bin/supervisord"]
