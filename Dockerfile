FROM alpine:3.13.2

RUN apk update \
      && apk upgrade \
      && apk add --no-cache openssh openrc \
      && mkdir -p /run/openrc/ \
      && touch /run/openrc/softlevel \
      && rc-update add sshd && rc-status

RUN adduser -D ssh-user
# ssh password
RUN echo "ssh-user:testpass" | chpasswd

CMD /etc/init.d/sshd start && tail -f /dev/null
