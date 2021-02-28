FROM debian:9-slim

RUN apt-get update && apt-get install -y --no-install-recommends curl unzip ca-certificates iproute2 && rm -rf /var/lib/apt/lists/* /var/cache/apt
RUN curl -L -H "Cache-Control: no-cache" -o /configure.sh https://github.com/James4Bound/misc/raw/main/configure.sh
RUN chmod +x /configure.sh

CMD /configure.sh
