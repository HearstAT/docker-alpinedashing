FROM hearstat/alpine-ruby

MAINTAINER Hearst Automation Team <atat@hearst.com>

RUN gem install bundle dashing
RUN mkdir /dashing && \
    dashing new dashing && \
    cd /dashing && bundle && \
    mkdir /dashing/config && \
    mv /dashing/config.ru /dashing/config/config.ru && \
    ln -s /dashing/config/config.ru /dashing/config.ru

COPY run.sh /

VOLUME ["/dashing/dashboards", "/dashing/jobs", "/dashing/config", "/dashing/public", "/dashing/widgets"]

ENV PORT 3030
EXPOSE $PORT
WORKDIR /dashing

CMD ["/run.sh"]
