FROM vmware/photon
MAINTAINER Fabio Rapposelli <fabio@vmware.com>

# Create temporary chroot environment
ENV TEMP_CHROOT /temp_chroot

RUN mkdir /data &&\
    mkdir $TEMP_CHROOT &&\
    mkdir -p $TEMP_CHROOT/var/lib/rpm &&\
    rpm --root $TEMP_CHROOT/ --initdb

RUN tdnf install -y yum && tdnf install -y tar && tdnf install -y xz

RUN yum --installroot=$TEMP_CHROOT install -y bash-4.3-4.ph1tp2 \
                                              coreutils-8.22-1.ph1tp2 \
                                              filesystem-7.5-8.ph1tp2 \
                                              findutils-4.4.2-1.ph1tp2 \
                                              photon-release-1.2-1.ph1tp2 \
                                              tdnf-1.0.4-1.ph1tp2 \
                                              util-linux-2.24.1-2.ph1tp2 \
                                              vim-7.4-4.ph1tp2 \
                                              which-2.20-1.ph1tp2
RUN yum --installroot=$TEMP_CHROOT clean all

RUN cp /etc/resolv.conf $TEMP_CHROOT/etc/

RUN cd $TEMP_CHROOT && rm -rf usr/src/ && rm -rf home/* && rm -rf var/log/*
RUN cd $TEMP_CHROOT && cp -pr etc/skel/. root/.
RUN cd $TEMP_CHROOT && tar cpJf /data/rootfs.tar.xz .

RUN echo $'FROM scratch\n\
MAINTAINER Fabio Rapposelli <fabio@vmware.com>\n\
ADD rootfs.tar.xz /\n\
\n\
CMD ["/bin/bash"]' >> /data/Dockerfile

VOLUME /data

CMD [ "/usr/bin/tar", "-cf", "-", "-C", "/data", "." ]
