#!/bin/bash
set -xe

cd /root

if [ -d "Integration" ]; then
  echo "Repo already exists. Pulling latest changes..."
  cd Integration && git pull
else
  echo "Cloning repo..."
  git clone https://github.com/ABGS-IDP/Integration.git
  cd Integration
fi

echo "--- Checking Docker Compose version ---"
docker compose version

echo "--- Pulling latest images ---"
docker compose pull

echo "--- Deploying stack ---"
docker compose up -d

echo "--- Active containers ---"
docker ps

echo "--- Logs (short tail) ---"
docker compose logs --tail=20

