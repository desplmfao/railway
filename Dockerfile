FROM frolvlad/alpine-glibc:glibc-2.30

WORKDIR /bun
RUN apk --no-cache add curl bash libstdc++ ca-certificates && \
    curl -fsSL -o "/bun/bun.zip" "https://github.com/oven-sh/bun/releases/download/canary/bun-linux-x64.zip" && \
    unzip -d /bun -q -o "/bun/bun.zip" && \
    mv /bun/bun-linux-x64/bun /usr/local/bin/bun && \
    chmod 777 /usr/local/bin/bun && \
    rm "/bun/bun.zip" && \
    apk del curl bash

WORKDIR /app

COPY ./package.json ./src/ ./index.js ./

RUN bun install

ENTRYPOINT bun run start
