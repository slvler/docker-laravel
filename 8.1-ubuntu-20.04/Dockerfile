FROM ubuntu:20.04

RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install curl -y
RUN apt-get install software-properties-common -y

RUN add-apt-repository ppa:ondrej/php
RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install php8.1 -y

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
