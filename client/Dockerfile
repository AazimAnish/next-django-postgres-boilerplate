FROM node:24-slim

# Install Rust for lightningcss
RUN apt-get update && apt-get install -y curl build-essential \
  && curl https://sh.rustup.rs -sSf | sh -s -- -y \
  && . "$HOME/.cargo/env"

WORKDIR /app

COPY package.json package-lock.json* ./
RUN npm install --legacy-peer-deps --include=optional

COPY . .

# Make entrypoint executable
RUN chmod +x docker-entrypoint.sh

EXPOSE 3000

ENV NODE_ENV=development
