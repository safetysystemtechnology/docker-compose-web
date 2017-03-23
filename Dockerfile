FROM ruby:2.3.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /your_app_rails
WORKDIR /your_app_rails
ADD Gemfile /your_app_rails/Gemfile
ADD Gemfile.lock /your_app_rails/Gemfile.lock
RUN bundle install
ADD . /your_app_rails
