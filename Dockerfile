FROM cimg/python:3.11.1-node

RUN pyenv install 3.7.10 \
    && pyenv install 3.8.9 \
    && pyenv install 3.9.4 \
    && pyenv install 3.10.4 \
    && pyenv global system 3.7.10 3.8.9 3.9.4 3.10.4

CMD ["/bin/sh"]
