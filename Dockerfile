FROM ruby:2.6.5

RUN apt-get update -qq && \
    apt-get install -y build-esssential \
                       libpq-dev \
                       nodejs \
                       vim

RUN mkdir /pewbook-app

WORKDIR /pewbook-app

ADD Gemfile /pewbook-app/Gemfile
ADD Gemfile.lock /pewbook-app/Gemfile.lock

RUN gem install bundler
RUN bundle install

ADD . /pewbook-app

RUN mkdir -p tmp/sockets
RUN mkdir -p tmp/pids