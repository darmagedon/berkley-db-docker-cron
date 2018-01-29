FROM ubuntu:16.04
RUN apt -y update
RUN apt install -y db5.3-util cron && rm -rf /var/cache/apt/*
RUN mkdir -p /var/log/cron && mkdir -m 0644 -p /var/spool/cron/crontabs && touch /var/log/cron/cron.log && mkdir -m 0644 -p /etc/cron.d
RUN mkdir /code
ADD cron-mantainance.sh /code/
WORKDIR /code
CMD ["/bin/bash" , "cron-mantainance.sh" ]
