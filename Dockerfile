FROM ruby:2.6.6

RUN apt-get update -qq && \
    apt-get install -y locales

ENV BUNDLER_VERSION 1.17.2

RUN gem install bundler -v $BUNDLER_VERSION

RUN mkdir -p /app
WORKDIR /app

RUN locale-gen ja_JP.UTF-8
# timezoneをJSTに変更
RUN apt-get install -y tzdata \
  && rm /etc/localtime \
  && ln -s /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
  && dpkg-reconfigure -f noninteractive tzdata
# キャッシュ削除
RUN rm -rf /var/lib/apt/lists/*
