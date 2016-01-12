FROM vmware/photon
MAINTAINER Fabio Rapposelli <fabio@vmware.com>

# Create temporary chroot environment
ENV TEMP_CHROOT /temp_chroot

RUN mkdir /data &&\
    mkdir $TEMP_CHROOT &&\
    mkdir -p $TEMP_CHROOT/var/lib/rpm &&\
    rpm --root $TEMP_CHROOT/ --initdb

RUN tdnf install -y yum && tdnf install -y tar && tdnf install -y xz

# Add RC pkg source to tdnf/yum
COPY photon-rc.repo /etc/yum.repos.d/photon.repo

RUN yum --installroot=$TEMP_CHROOT install -y bash-4.3-4.ph1rc \
                                              coreutils-8.22-1.ph1rc \
                                              filesystem-7.5-11.ph1rc \
                                              findutils-4.4.2-1.ph1rc \
                                              photon-release-1.3-1.ph1rc \
                                              tdnf-1.0.5-1.ph1rc \
                                              util-linux-2.24.1-3.ph1rc \
                                              vim-7.4-4.ph1rc \
                                              which-2.20-1.ph1rc
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
