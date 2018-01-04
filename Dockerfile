FROM alp-edge:latest

USER root

# update package
RUN apk update \
    && apk --no-cache add samba samba-common-tools \
    && rc-update add samba \
    && rm -rf /var/cache/apk/*

#RUN apk add samba samba-common-tools \
#    && rc-update add samba

RUN mkdir /mnt/nas \
    && chmod 777 /mnt/nas
# RUN chmod 777 /mnt/nas

COPY smb.conf /etc/samba/smb.conf

# clean apk cache
# RUN rm -rf /var/cache/apk/*

VOLUME /mnt/nas

EXPOSE 137/udp 138/udp 139 445

CMD ["/sbin/init"]
