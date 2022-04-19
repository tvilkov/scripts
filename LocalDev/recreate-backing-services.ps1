docker-compose -f images/docker-compose.yml down --volumes
docker-compose -f images/docker-compose.yml build --no-cache
docker-compose -f images/docker-compose.yml up --force-recreate -d