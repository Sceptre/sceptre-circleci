FROM cimg/python:3.12.0-node

RUN pyenv install 3.8.16 \
    && pyenv install 3.9.16 \
    && pyenv install 3.10.9 \
    && pyenv install 3.11.1 \
    && pyenv global system 3.8.16 3.9.16 3.10.9 3.11.1

CMD ["/bin/sh"]
