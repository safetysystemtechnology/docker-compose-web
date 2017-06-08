# A simple Dockerfile for a RoR application

FROM ruby:2.3.1

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs libmagickwand-dev imagemagick
RUN mkdir /your-applicatioin

WORKDIR /your-application

ADD Gemfile /your-application/Gemfile
ADD Gemfile.lock /your-application/Gemfile.lock

RUN bundle install
ADD . /your-application
