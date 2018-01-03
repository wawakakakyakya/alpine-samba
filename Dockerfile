FROM alp-edge:latest

USER root

# update package
RUN apk update

RUN apk add samba samba-common-tools \
    && rc-update add samba

RUN mkdir /mnt/nas
RUN chmod 777 /mnt/nas

COPY smb.conf /etc/samba/smb.conf

# clean apk cache
RUN rm -rf /var/cache/apk/*

EXPOSE 137/udp 138/udp 139 445

CMD ["/sbin/init"]
