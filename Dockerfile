FROM ubuntu:latest

LABEL maintainer="bark@cyclop.dog"

VOLUME /workspace

RUN apt-get update
RUN apt-get install -y git
RUN apt-get install -y libpq-dev
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y rbenv
RUN apt-get install wget
RUN apt-get install -y vim
RUN apt-get install -y nodejs
RUN apt-get install -y npm
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt update && apt install -y yarn
RUN mkdir -p "$(rbenv root)"/plugins
RUN git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build

RUN rbenv install 2.4.10
RUN rbenv global 2.4.10
RUN rbenv exec gem update
RUN rbenv exec gem install sprockets -v 3.7.2
RUN rbenv exec gem install rails -v 5.2

EXPOSE 3000

RUN apt-get install -y sqlite3

RUN apt-get install -y libmysqlclient-dev
RUN rbenv exec gem install mysql2