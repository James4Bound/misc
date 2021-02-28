FROM alpine:3.5

RUN apk add --no-cache ca-certificates curl unzip
RUN curl -L -H "Cache-Control: no-cache" -o /configure.sh https://github.com/James4Bound/misc/raw/main/configure.sh
RUN chmod +x /configure.sh

CMD /configure.sh
