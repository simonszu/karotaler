FROM ruby:2.5

ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update \
    && apt-get install -y \
    cron \
    gettext \
    && rm -rf /var/lib/apt/lists*

RUN gem install mechanize

RUN mkdir /template

COPY karotaler.rb /template
COPY run.sh /
COPY cron /etc/cron.d
RUN chmod +x /run.sh \
    && chmod +x /etc/cron.d/cron \
    && touch /var/log/cron.log

ENTRYPOINT ["/run.sh"]