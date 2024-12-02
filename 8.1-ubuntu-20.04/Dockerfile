FROM ubuntu:20.04

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install software-properties-common -y

RUN apt-get install curl -y
RUN apt-get install git -y
RUN apt-get install zip -y
RUN apt-get install unzip -y

RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

RUN add-apt-repository ppa:ondrej/php
RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install php8.1 -y
RUN apt-get install -y php8.1-mysql \
    php8.1-mbstring \
    php8.1-xml \
    php8.1-bcmath \
    php8.1-curl \
    php8.1-zip

RUN apt-get install  -y

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
