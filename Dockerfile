FROM qa.stratio.com/stratio/prometheus-dcos:0.7.1-c214770

EXPOSE 9093
EXPOSE 9090

ADD prometheus.yml /etc/prometheus/prometheus.yml
ADD /tmp/external_dns_nodes.json.tmp /tmp/

USER root

RUN chmod +x /startup
RUN apk add gettext

WORKDIR /prometheus

ENTRYPOINT [ "/bin/dumb-init", "--" ]
CMD ["/bin/bash", "/startup"]