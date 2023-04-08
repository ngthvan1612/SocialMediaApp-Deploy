echo "Preparing for deployment process - @ngthvan1612"

rm -rf SocialMediaBackend
git clone https://github.com/ngthvan1612/SocialMediaBackend
rm -rf SocialMediaBackend/.git
cd SocialMediaBackend

echo "Building WAR"
touch ./src/main/resources/database.mysql.development.properties
touch ./src/main/resources/jwt.development.properties
touch ./src/main/resources/storage.development.properties
mvn clean install -DskipTests
cd ..

echo "Package"
mkdir -p server
cp ./SocialMediaBackend/target/SocialMediaBackend-0.0.1-SNAPSHOT.war ./server/SocialMediaBackend.war
