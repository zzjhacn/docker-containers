FROM hub.c.163.com/library/ruby:alpine

RUN gem install redis

#RUN wget http://download.redis.io/redis-stable/src/redis-trib.rb && \
#    mv redis-trib.rb /usr/bin/redis-trib && \
#    chmod 777 /usr/bin/redis-trib

COPY redis-trib.rb /usr/bin/redis-trib

RUN chmod 777 /usr/bin/redis-trib

ENTRYPOINT ["/usr/bin/redis-trib"]
