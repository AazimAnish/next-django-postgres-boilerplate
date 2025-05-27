FROM node:23-alpine

# Install build dependencies for Alpine and Rust
RUN apk update && apk add --no-cache \
    curl \
    build-base \
    musl-dev \
  && curl https://sh.rustup.rs -sSf | sh -s -- -y --profile minimal \
  && . "$HOME/.cargo/env" \
  && rm -rf /var/cache/apk/* /tmp/* /var/tmp/*

WORKDIR /app

COPY package.json package-lock.json* ./
RUN npm install --legacy-peer-deps --include=optional

COPY . .

# Make entrypoint executable
RUN chmod +x docker-entrypoint.sh

EXPOSE 3000

ENV NODE_ENV=development
