FROM ruby:2.3.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN apt-get install redis-server -y
RUN mkdir /example-sidekiq-app
WORKDIR /example-sidekiq-app
ADD Gemfile /example-sidekiq-app/Gemfile
ADD Gemfile.lock /example-sidekiq-app/Gemfile.lock
RUN bundle install
ADD . /example-sidekiq-app
ENV APP_ENV production
CMD cd /example-sidekiq-app && bundle exec sidekiq -r ./sidekiq.rb
