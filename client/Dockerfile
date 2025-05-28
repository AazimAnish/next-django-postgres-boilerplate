FROM node:20-bookworm-slim

# Install system dependencies
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

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 3000
ENV NODE_ENV=development

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["npm", "run", "dev"]