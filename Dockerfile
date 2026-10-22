# MochiAI full-stack app: Express backend + static frontend + SQLite
FROM node:20-bookworm-slim

# better-sqlite3 may need native compilation on platforms without a prebuilt binary.
RUN apt-get update \
    && apt-get install -y --no-install-recommends python3 make g++ \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Install dependencies separately to improve Docker layer caching.
COPY package*.json ./
RUN npm install --omit=dev

COPY server.js ./server.js
COPY public ./public

# Store SQLite data in a mounted volume so it can persist across container recreation.
ENV NODE_ENV=production \
    PORT=3000 \
    DB_PATH=/data/data.sqlite
RUN mkdir -p /data && chown -R node:node /app /data
USER node

VOLUME ["/data"]
EXPOSE 3000

CMD ["npm", "start"]
