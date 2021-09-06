# docker-compose-personal-services
A few personal services I run using docker compose

Start all services with `sudo docker-compose --env-file environment.prod.env -f dev.yml -f mc-server.yml -f samba.yml -f pihole.yml up`.