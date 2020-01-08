FROM qa.stratio.com/stratio/prometheus-dcos:0.7.1-c214770

EXPOSE 9093
EXPOSE 9090

ADD prometheus.yml /etc/prometheus/prometheus.yml

USER root

WORKDIR /prometheus

ENTRYPOINT [ "/bin/dumb-init", "--" ]
CMD ["/bin/bash", "/startup"]