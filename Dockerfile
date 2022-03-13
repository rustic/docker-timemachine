FROM alpine:latest
RUN apk update \
    && apk upgrade

RUN apk add --no-cache \
    avahi \
    nss-mdns \
    samba \
    supervisor \
    && sed -i 's/#enable-dbus=yes/enable-dbus=no/g' /etc/avahi/avahi-daemon.conf \
    && rm -rf /var/cache/apk/* \
    && rm /etc/avahi/services/*

COPY samba/samba.service samba/template_quota /etc/avahi/services/
COPY samba/smb.conf /etc/samba/smb.conf
COPY samba/supervisord.conf /etc/supervisord.conf
COPY setup.sh template_quota /tmp/

VOLUME ["/timemachine"]

EXPOSE 445

ENTRYPOINT ["/tmp/setup.sh"]

HEALTHCHECK --interval=5m --timeout=3s \
  CMD (avahi-daemon -c && \
        smbclient -L '\\localhost' -U '%' -m SMB3 &>/dev/null) || exit 1

CMD ["supervisord", "--nodaemon", "--configuration", "/etc/supervisord.conf"]