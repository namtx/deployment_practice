FROM ruby:2.4.1

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /noteapp
WORKDIR /noteapp

COPY Gemfile /noteapp/Gemfile
COPY Gemfile.lock /noteapp/Gemfile.lock
RUN bundle install
COPY . /noteapp
