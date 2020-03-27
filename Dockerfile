FROM welaika/wordmove:php7

LABEL maintainer 'Alessandro Fazzi <alessandro.fazzi@welaika.com>'

ENV BASE_DIR /usr/local
ENV NVM_INSTALLER_URL https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh
ENV NVM_DIR $BASE_DIR/nvm
ENV NODE_VERSION 12.13.1

# Install Node from upstream
RUN mkdir -p /usr/local/nvm \
    && curl -o - $NVM_INSTALLER_URL | bash \
    && . $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default \
    && nvm --version
 
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt update && apt install -y --no-install-recommends yarn
