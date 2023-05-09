# fetch
git reset --hard
git fetch
git pull

# frontend
cp -rf ./fe/* /www/instagram-fe/

# docker
docker-compose down
docker-compose up -d