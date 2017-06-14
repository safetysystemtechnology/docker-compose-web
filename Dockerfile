# A simple Dockerfile for a RoR application
FROM ruby:2.3.1

# Install depedencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs libmagickwand-dev imagemagick

# set root to you application rails
ENV APP_ROOT /app

# create directory of your application
RUN mkdir $APP_ROOT

# set work dir
WORKDIR $APP_ROOT

# config to cache install new dependencies in gemfile
ADD Gemfile $APP_ROOT/Gemfile
ADD Gemfile.lock $APP_ROOT/Gemfile.lock

RUN bundle install

RUN gem install docker-api

ADD . $APP_ROOT
