FROM redis:alpine

COPY Shanghai /etc/localtime
COPY redis.conf /conf/redis.conf
COPY startup.sh /startup.sh
RUN chmod +x /startup.sh
ENTRYPOINT ["sh","/startup.sh"]
CMD [""]
