FROM ruby:2.3.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
ENV REDIS_SIDEKIQ_URL redis://redis:6379/0
RUN mkdir /new-safety-emergency-web
WORKDIR /new-safety-emergency-web
ADD Gemfile /new-safety-emergency-web/Gemfile
ADD Gemfile.lock /new-safety-emergency-web/Gemfile.lock
RUN bundle install
ADD . /new-safety-emergency-web
