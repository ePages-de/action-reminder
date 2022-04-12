FROM ubuntu:20.04

COPY lib /lib
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
