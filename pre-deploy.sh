echo "Preparing for deployment process - @ngthvan1612"

rm -rf SocialMediaBackend
git clone https://github.com/ngthvan1612/SocialMediaBackend
rm -rf SocialMediaBackend/.git
cd SocialMediaBackend

echo "Building WAR"

touch ./src/main/resources/database.mysql.development.properties
touch ./src/main/resources/jwt.development.properties
touch ./src/main/resources/storage.development.properties

# #FIX database url
printf "spring.datasource.url=jdbc:mysql://db:3306/testspring04\n" > ./src/main/resources/database.mysql.production.properties
printf "spring.datasource.username=root\n" >> ./src/main/resources/database.mysql.production.properties
printf "spring.datasource.password=1234\n" >> ./src/main/resources/database.mysql.production.properties
printf "spring.datasource.driver-class-name=com.mysql.jdbc.Driver\n" >> ./src/main/resources/database.mysql.production.properties

printf "jwt.configuration.secret=29ea854235669c54dc173919663a6f2d332a9019baf976b0330b1a3a45e14672\n" > ./src/main/resources/jwt.production.properties
printf "jwt.configuration.issuer=https://nhom-02-tkpm:8080\n" >> ./src/main/resources/jwt.production.properties
printf "jwt.configuration.audience=https://nhom-02-tkppm:8080\n" >> ./src/main/resources/jwt.production.properties
printf "jwt.configuration.expired=604800000\n" >> ./src/main/resources/jwt.production.properties

printf "aws.minio.end-point=http://minio:9000\n" > ./src/main/resources/storage.production.properties
printf "aws.minio.access-key=t2cImhFAwJAV9MR6\n" >> ./src/main/resources/storage.production.properties
printf "aws.minio.secret-key=IBuaxm9F97eHk40Mq28pPPrC0rE5Q7jt\n" >> ./src/main/resources/storage.production.properties
printf "aws.minio.default-bucket=test-spring-04-store\n" >> ./src/main/resources/storage.production.properties
printf "aws.minio.default-image-upload=uploads\n" >> ./src/main/resources/storage.production.properties
printf "aws.minio.default-upload-avatar=avatars\n" >> ./src/main/resources/storage.production.properties

mvn install -DskipTests
cd ..

echo "Package"
mkdir -p server
cp ./SocialMediaBackend/target/SocialMediaBackend-0.0.1-SNAPSHOT.war ./server/SocialMediaBackend.war
