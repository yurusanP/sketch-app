FROM maven:latest AS base

WORKDIR /app

COPY sketch-backend sketch-backend
COPY sketch-frontend sketch-frontend

RUN apt-get update && apt-get install -y \
  build-essential \
  autoconf automake libtool \
  flex bison \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app/sketch-backend
RUN ./autogen.sh && ./configure && make -j $(($(nproc)+1))

WORKDIR /app/sketch-frontend
RUN make system-install DESTDIR=/usr/bin -j $(($(nproc)+1))

CMD [ "bash" ]
