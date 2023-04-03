FROM alpine
RUN apk add --no-cache bash fio
ENTRYPOINT [ "/usr/bin/fio" ]