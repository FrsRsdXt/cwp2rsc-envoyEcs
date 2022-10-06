FROM envoyproxy/envoy:v1.23-latest

COPY ./envoy.yaml /etc/envoy.yaml
COPY ./cds.yaml /etc/envoy/cds.yaml
COPY ./lds.yaml /etc/envoy/lds.yaml

RUN chmod go+rx /etc/envoy.yaml
RUN chmod go+rx /etc/envoy/cds.yaml /etc/envoy/lds.yaml

EXPOSE 9000/tcp
CMD ["/usr/local/bin/envoy", "-c /etc/envoy.yaml", "-l debug"]