FROM debian:wheezy
MAINTAINER Arnau Siches <asiches@gmail.com>

RUN apt-get update -qq \
    && apt-get install -qqy \
      git \
      locales \
      ruby \
      ruby-dev \
      vim-nox \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

ENV LANG en_US.UTF-8

COPY . /root/.vim/
WORKDIR /root/.vim
RUN ./vigor install

CMD ["vim"]
