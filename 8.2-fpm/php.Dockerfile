FROM php:8.2-fpm

WORKDIR /var/www/html
COPY ./src .

RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install curl -y
RUN apt-get install git -y
RUN apt-get install zip -y
RUN apt-get install unzip -y
RUN apt-get install make -y
RUN apt-get install ca-certificates -y

RUN apt-get clean && rm -rf /var/lib/apt/lists/*


RUN docker-php-ext-install pdo pdo_mysql
RUN docker-php-ext-enable pdo pdo_mysql

EXPOSE 9000

CMD [ "php-fpm" ]

#RUN docker-php-ext-install bcmath bz2 ftp gmp intl mysqli opcache pcntl pdo_mysql pdo_pgsql pgsql soap sockets zip
#RUN docker-php-ext-enable bcmath bz2 ftp gmp intl mysqli opcache pcntl pdo_mysql pdo_pgsql pgsql soap sockets zip
