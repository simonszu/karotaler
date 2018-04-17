FROM ruby:2.5

ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update \
    && apt-get install -y cron \
    && rm -rf /var/lib/apt/lists*

RUN gem install mechanize

RUN mkdir -p /app/config \
    && mkdir /template

COPY karotaler.rb /app
COPY config.yaml.example /template
COPY run.sh /
COPY karotaler-cron /etc/cron.d
RUN chmod +x /run.sh

ENTRYPOINT ["/run.sh"]