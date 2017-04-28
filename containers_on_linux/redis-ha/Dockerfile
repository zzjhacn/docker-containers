FROM redis:alpine

COPY Shanghai /etc/localtime
COPY redis.conf /conf/redis.conf
COPY sentinel.conf /conf/sentinel.conf
COPY startup.sh /startup.sh
RUN chmod +x /startup.sh
#RUN chown redis:redis /data/*
ENTRYPOINT ["sh","/startup.sh"]
#CMD ["master"]
