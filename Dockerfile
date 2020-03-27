FROM welaika/wordmove:php7

LABEL maintainer 'Alessandro Fazzi <alessandro.fazzi@welaika.com>'

ENV NVM_DIR="$HOME/.nvm"

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - \
    && apt update && apt-get install -y nodejs git

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt update && apt install -y --no-install-recommends yarn
