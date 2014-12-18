FROM wannabe/ubuntu

MAINTAINER Yury Borunov <yury@borunov.com>


# Install Nginx

RUN curl -sL https://deb.nodesource.com/setup | sudo bash -

RUN \
   	sudo apt-get install -y nodejs supervisor && \
	rm -rf /var/lib/apt/lists/*

RUN npm install -g grunt-cli 

ADD supervisord.conf /etc/supervisor/conf.d/

RUN mkdir /app

VOLUME /app

WORKDIR /app