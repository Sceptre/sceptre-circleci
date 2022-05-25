FROM alpine:3.16

RUN apk add --update --no-cache \
    patch \
    git \
    openssh \
    ca-certificates \
    build-base \
    curl \
    bzip2-dev \
    bash \
    py3-pip \
    python3 \
    python3-dev \
    libffi-dev \
    ruby \
    ruby-dev \
    ruby-bundler \
    ruby-json \
    readline-dev \
    openssl-dev \
    sqlite-dev \
    zlib-dev \
    rust \
    cargo

RUN pip3 install --no-cache-dir virtualenv \
    && pip3 install --no-cache-dir tox \
    && addgroup -g 3434 circleci \
    && adduser -D -u 3434 -G circleci -s /bin/bash circleci

USER circleci

WORKDIR /home/circleci

ARG PYENV_HOME=/home/circleci/.pyenv

ENV LANG=C.UTF-8 \
    HOME=/home/circleci \
    PATH=$PYENV_HOME/shims:$PYENV_HOME/bin:/home/circleci/.poetry/bin:$PATH

RUN git clone --depth 1 https://github.com/pyenv/pyenv.git $PYENV_HOME \
    && rm -rfv $PYENV_HOME/.git \
    && pyenv install 3.6.13 \
    && pyenv install 3.7.10 \
    && pyenv install 3.8.9 \
    && pyenv install 3.9.4 \
    && pyenv global system 3.6.13 3.7.10 3.8.9 3.9.4

# Install the latest Poetry
RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -

CMD ["/bin/sh"]
