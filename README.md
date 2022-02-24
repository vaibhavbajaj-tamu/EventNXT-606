# Event-Guest-List-Automation

## Setup

Install [docker](https://docs.docker.com/engine/install/) and [docker-compose](https://docs.docker.com/compose/install/) for your distribution.

In a terminal, run

`docker-compose up -d --build`

_(Subsequent use may omit the_ `-d` _and_ `--build` _flag.)_

Verify the containers are `up` by running `docker-compose up`. Then, set up the database by running

`docker-compose run rails bash -c 'rake db:create && rake db:migrate'`

_(Must be done if the_ `--build` _flag is used.)_

Stop the containers using

`docker-compose down`

_(Use_ `Ctrl-C` _to stop the containers if the_ `-d` _flag was omitted.)_

## Current Work

🚧🚧🚧
