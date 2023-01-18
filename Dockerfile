FROM ruby:3.2.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /dockerzin
WORKDIR /dockerzin

COPY Gemfile /dockerzin/Gemfile
COPY Gemfile.lock /dockerzin/Gemfile.lock

RUN bundle install

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
EXPOSE 3000

ENTRYPOINT ["entrypoint.sh"]
