FROM cimg/python:3.11.1-node

RUN pyenv install 3.8.16 \
    && pyenv install 3.9.16 \
    && pyenv install 3.10.10 \
    && pyenv install 3.11.2 \
    && pyenv global system 3.8.16 3.9.16 3.10.10 3.11.2

CMD ["/bin/sh"]
