FROM octupole/alpine-opentrj as base-opentrj
FROM alpine:latest

COPY --from=base-opentrj /usr/local /usr/local
COPY --from=base-opentrj /usr/lib /usr/lib
ENV CPU=1

RUN apk add openssh && mkdir -p /app/bin && echo "#!/bin/sh" > /app/bin/mpirun.sh \
    && echo "mpirun --allow-run-as-root -mca btl_base_warn_component_unused 0 -np \${CPU} \$@ " >> /app/bin/mpirun.sh \
    && chmod 755 /app/bin/mpirun.sh && cat /app/bin/mpirun.sh

VOLUME /work
WORKDIR /work
ENTRYPOINT ["/app/bin/mpirun.sh"]


