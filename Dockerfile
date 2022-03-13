FROM alpine:latest
RUN apk update \
    && apk upgrade

RUN apk add --no-cache \
    avahi \
    samba \
    supervisor \
    && sed -i 's/#enable-dbus=yes/enable-dbus=no/g' /etc/avahi/avahi-daemon.conf \
    && rm -rf /var/cache/apk/* \
    && rm /etc/avahi/services/*

COPY samba/samba.service /etc/avahi/services/samba.service
COPY samba/smb.conf /etc/samba/smb.conf
COPY samba/supervisord.conf /etc/supervisord.conf
COPY setup.sh samba/template_quota /tmp/

VOLUME ["/timemachine"]

EXPOSE 445

RUN ["chmod", "+x", "/tmp/setup.sh"]
ENTRYPOINT ["/tmp/setup.sh"]

HEALTHCHECK --interval=5m --timeout=3s \
  CMD (avahi-daemon -c && \
        smbclient -L '\\localhost' -U '%' -m SMB3 &>/dev/null) || exit 1

CMD ["supervisord", "--nodaemon", "--configuration", "/etc/supervisord.conf"]