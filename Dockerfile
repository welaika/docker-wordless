FROM welaika/wordmove:php7

LABEL maintainer 'Alessandro Fazzi <alessandro.fazzi@welaika.com>'

ENV PATH="/root/.yarn/bin:/root/.config/yarn/global/node_modules/.bin:${PATH}"
ENV NVM_DIR="/root/.nvm"

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - \
    && apt-get install -y nodejs git

RUN curl -o- -L https://yarnpkg.com/install.sh | bash
