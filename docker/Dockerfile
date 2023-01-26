# syntax=docker/dockerfile:1

# BUILD
FROM alpine:3 as builder

RUN apk add nomad #consul vault

# RUNTIME
FROM alpine:3 as runtime

COPY --from=builder /usr/sbin/nomad  /usr/sbin/nomad 
COPY --from=builder /usr/libexec/cni /usr/libexec/cni

EXPOSE 4646 4647 4648 4648/udp

VOLUME [ "/data" ]

ENTRYPOINT [ "/usr/sbin/nomad" ]

CMD [ "agent", "-dev", "-bind=0.0.0.0", "-data-dir=/data" ]
