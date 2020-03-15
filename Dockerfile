FROM ruby:2.7.0

ARG INSTALL_DEPENDENCIES
RUN apt-get update -qq \
  && apt-get install -y --no-install-recommends ${INSTALL_DEPENDENCIES} \
    build-essential libpq-dev \
    nodejs git npm neovim zsh \
  && apt-get clean autoclean \
  && apt-get autoremove -y \
  && curl -o- -L https://yarnpkg.com/install.sh | bash \
  && rm -rf \
    /var/lib/apt \
    /var/lib/dpkg \
    /var/lib/cache \
    /var/lib/log

RUN mkdir /app
WORKDIR /app
COPY Gemfile* /app/
ARG BUNDLE_INSTALL_ARGS
RUN gem install bundler && bundle install ${BUNDLE_INSTALL_ARGS} \
  && rm -rf /usr/local/bundle/cache/* \
  && find /usr/local/bundle/gems/ -name "*.c" -delete \
  && find /usr/local/bundle/gems/ -name "*.o" -delete
COPY . /app/
COPY package.json yarn.lock ./
RUN npm install -g yarn
RUN yarn install --check-files
ARG RAILS_ENV=development
CMD bundle rake db:migrate
CMD bundle rake db:seed
RUN if [ "$RAILS_ENV" = "production" ]; then SECRET_KEY_BASE=$(rake secret) bundle exec rake assets:precompile; fi
