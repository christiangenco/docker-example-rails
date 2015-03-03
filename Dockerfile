FROM ruby:2.2.0
MAINTAINER Seigo Uchida <spesnova@gmail.com> (@spesnova)

WORKDIR /app

RUN apt-get update && \
    apt-get install -y \
      nodejs=0.10.29~dfsg-1.1 && \
    rm -rf /var/lib/apt/lists/*

COPY Gemfile      /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install -j4

COPY . /app
RUN bundle exec rake assets:precompile RAILS_ENV=development

EXPOSE 3000

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
