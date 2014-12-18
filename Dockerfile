FROM wannabe/ubuntu

MAINTAINER Yury Borunov <yury@borunov.com>

# Install Nginx
RUN add-apt-repository -y ppa:nginx/stable 

# Install Node.js and NPM
RUN curl -sL https://deb.nodesource.com/setup | sudo bash -

RUN \
   	sudo apt-get install -y nodejs nginx supervisor && \
	rm -rf /var/lib/apt/lists/*

RUN npm install -g grunt-cli 

ADD supervisord.conf /etc/supervisor/conf.d/
ADD nginx.conf /etc/nginx/nginx.conf
ADD websocket /etc/nginx/

RUN mkdir /app

VOLUME /app

EXPOSE 80 443

WORKDIR /app