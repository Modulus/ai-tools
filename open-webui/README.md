# Run it

docker-compose --profile ui up -d
docker-compose --profile ui logs -f

*** This will also work because of default profiles ****
docker-compose up -d 



## Run all the things
docker-compose up -d
docker-compose logs -f

docker-compose --profile ui --profile search up -d

docker-compose --profile all up -d