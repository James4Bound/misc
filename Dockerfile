FROM alpine:3.5

COPY configure.sh /configure.sh

RUN apk add --no-cache ca-certificates curl unzip \
 && chmod +x /configure.sh

CMD /configure.sh
