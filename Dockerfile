FROM cimg/python:3.12.0-node

RUN pyenv install $(pyenv latest --known 3.8)
RUN pyenv install $(pyenv latest --known 3.9)
RUN pyenv install $(pyenv latest --known 3.10)
RUN pyenv install $(pyenv latest --known 3.11)
RUN pyenv global system $(pyenv versions --bare)

CMD ["/bin/sh"]
