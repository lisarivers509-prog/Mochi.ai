
# MochiAI full-stack app
FROM node:20-bookworm-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends python3 make g++ \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY package*.json ./
RUN npm install --omit=dev

# Copy the project files instead of requiring a public folder.
COPY . .

ENV NODE_ENV=production \
    PORT=3000 \
    DB_PATH=/data/data.sqlite

RUN mkdir -p /data && chown -R node:node /app /data

USER node

VOLUME ["/data"]
EXPOSE 3000

CMD ["npm", "start"]
