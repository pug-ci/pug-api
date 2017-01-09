FROM ruby:2.3.1

MAINTAINER Pug CI Team

WORKDIR /apps/pug-api

ADD Gemfile* /apps/pug-api/
ENV RAILS_ENV production

RUN gem install bundler
RUN bundle install --without development test

EXPOSE 3000

ADD . /apps/pug-api

CMD bundle exec foreman start -f Procfile
