FROM ubuntu:20.04

RUN DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install software-properties-common -y

RUN apt-get install curl -y
RUN apt-get install git -y
RUN apt-get install zip -y
RUN apt-get install unzip -y

RUN apt-get install gnupg2 -y
RUN apt-get install ca-certificates -y
RUN apt-get install lsb-release -y
RUN apt-get install libicu-dev -y

RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

RUN add-apt-repository ppa:ondrej/php
RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install -y \
    php8.1 \
    php8.1-fpm \
    php8.1-pdo \
    php8.1-mysql \
    php8.1-common \
    php8.1-cli \
    php8.1-mbstring \
    php8.1-xml \
    php8.1-bcmath \
    php8.1-curl \
    php8.1-zip

RUN mkdir -p /var/run/php/
RUN touch /var/run/php/php8.1-fpm.sock;
RUN chown www-data /run/php/


RUN mkdir -p /var/www/html
WORKDIR /var/www/html
COPY /src .

COPY ./config/php/www.conf /etc/php/8.1/fpm/pool.d/www.conf


RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

CMD [ "/usr/sbin/php-fpm8.1", "-F" ]
