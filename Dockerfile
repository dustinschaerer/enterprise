FROM ruby:2.3.1
RUN apt-get update -qy && apt-get install -y build-essential \
libpq-dev nodejs patch tree \
openssl libreadline6 libreadline6-dev zlib1g zlib1g-dev vim \
libssl-dev libyaml-dev libpq-dev postgresql-client lsof \
libxml2-dev libxslt-dev libc6-dev \
libssl-dev libxrender-dev gdebi && apt-get clean
RUN apt-get install -y lsof postgresql-client wget netcat git curl wget tree rsync \
    && gem install dpl
RUN useradd www -m -s /bin/bash -d /home/www && mkdir -p /home/www/app
ADD Gemfile* /home/www/app/
COPY web_docker/scripts/bash_profile /home/www/.bash_profile
COPY web_docker/scripts/gemrc /home/www/.gemrc
RUN /usr/bin/find /home/www -uid 0 -exec /bin/chown www:www {} \;
USER www
WORKDIR /home/www/app/
RUN bundle install --path /home/www/vendor --jobs 4
RUN cp /home/www/.bash_profile /home/www/.profile
ENTRYPOINT /bin/bash
