sudo docker run --rm -d -p 27017:27017 --name mongo-inscription mongo:5.0.3-focal
sudo docker run --rm -d -p 5432:5432 --name pg-inscription -v $ZABUD_HOME/data/pg-inscription:/var/lib/postgresql -e POSTGRES_USER=postgre -e POSTGRES_DB=zabud-inscription -e POSTGRES_PASSWORD=root postgres:12.9-alpine
sudo docker run --rm -d -p 5433:5432 --name pg-core -v $ZABUD_HOME/data/pg-inscription:/var/lib/postgresql -e POSTGRES_USER=postgre -e POSTGRES_DB=zabud-core -e POSTGRES_PASSWORD=root postgres:12.9-alpine
sudo docker run --rm -d -p 5434:5432 --name pg-notification -v $ZABUD_HOME/data/pg-notification:/var/lib/postgresql -e POSTGRES_USER=postgre -e POSTGRES_DB=zabud-notification -e POSTGRES_PASSWORD=root postgres:12.9-alpine

if [ ! -d $GITHUB_HOME/JsierraB3991/Docker ]; then
    if [ ! - $GITHUB/JSierraB3991 ]; then
        mkdir $GITHUB/JsierraB3991
    if
    cd $GITHUB_HOME/JSierraB3991
    git clone https://github.com/jSierraB3991/Docker.git
    cd -   
fi

cd $GITHUB_HOME/JSierraB3991/Docker
sudo docker-compose -f kafka-compose.yml up -d
cd -

cd $ZABUD_HOME/zabud-discovery-ms
sudo sudo docker build -t zabud-discovery:1.0 .
sudo docker run --rm -d -p 8761:8761 --name zabud-discovery zabud-discovery:1.0
cd -
