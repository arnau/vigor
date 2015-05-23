FROM debian:sid
MAINTAINER Arnau Siches <asiches@gmail.com>

RUN apt-get update -qq \
  && apt-get install -qqy \
    git \
    locales \
    build-essential \
    vim-nox \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

ENV LANG en_US.UTF-8
ENV TERM screen-256color

COPY . /root/.vim/
WORKDIR /root/.vim
RUN ./vigor install \
  && find . -name .git | xargs rm -rf

CMD ["vim"]
