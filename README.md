# Todo list API only app built with Ruby on Rails

## Requirements

- [VirtualBox](https://www.virtualbox.org/)
- [Docker for Mac](https://www.docker.com/docker-mac) - Unfortunately, Docker now requires signing up for an account before allowing downloads.

## Initial Setup
Do this only once. This may take a little while.

1. Fork this repo to your own Git gateway account.
2. Clone your forked repo to your development machine.
3. `cd` to the `todo_app` folder.
4. Run `docker-compose up --build`.
5. In another terminal, run `docker-compose run web rails db:create`.
6. In the same terminal as #5, run `docker-compose down` to cleanly stop the Docker containers.

## Development Workflow
Here is the usual development flow.

1. Open two terminals.
2. In the first terminal:
    1. `cd` to the `todo_app` folder.
    2. Run `docker-compose up`.
    3. Leave this open for viewing logs.
3. In the second terminal:
    1. Use this for running commands (e.g., CLI commands, git commands).
    2. To cleanly stop the Docker containers, run `docker-compose down` here. Don't `CTRL+C` the first terminal.
4. To submit your changes, push them on your own repo and make a pull request (PR) against the `develop` branch of the main repo.

## Running Rails Commands
From time to time, there is a need to run Rails commands. For example, to apply changes to the database or to generate new controllers. Replace `bin/rails` with `docker-compose run web rails` just like in the following example:

* Instead of `bin/rails db:migrate`, do `docker-compose run web rails db:migrate`.

## Rebuilding The Application
If one or more of `docker-compose.yml`, `Dockerfile`, `Gemfile`, `Gemfile.lock` are modified, there is a need to rebuild the Docker image.

1. Run `docker-compose run web bundle install` just in case `Gemfile` and `Gemfile.lock` are not synced.
2. Run `docker-compose up --build` instead of `docker-compose up`.
