FROM ruby:3.1.2
RUN apt-get clean
RUN apt-get update --allow-releaseinfo-change
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs apt-utils
RUN apt list --upgradable
RUN mkdir /app
WORKDIR /app

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN gem install bundler:2.3.22
RUN bundle install

COPY . .

RUN apt update -qq && apt install -y vim nano