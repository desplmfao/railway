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
RUN addgroup --gid 101 --system appuser && adduser --uid 101 --system appuser && chown -R 101:101 /app && chmod -R g+w /app
RUN chmod 777 ./start.sh
USER appuser
COPY . ./

CMD ["start.sh"]