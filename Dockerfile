FROM debian:bullseye-slim

EXPOSE 22

COPY ./id_rsa.pub /root/.ssh/authorized_keys
COPY ./connect.sh /

RUN apt-get update
RUN apt-get install -y openssh-server
RUN apt-get install -y openconnect
RUN chmod +x /connect.sh
RUN chmod 600 ~/.ssh/authorized_keys

ENTRYPOINT ["/connect.sh"]
