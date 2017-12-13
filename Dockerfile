FROM ruby:2.3.3

RUN \
  apt-get update && \
  apt-get install -yqq apt-transport-https && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update && \
  apt-get install -yqq locales yarn && \
  apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN \
  echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
  locale-gen && \
  export LC_ALL=en_US.UTF-8

RUN \
  gem install bundler --no-ri --no-rdoc && \
  gem install dpl --no-ri --no-rdoc
