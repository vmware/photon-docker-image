FROM photon
MAINTAINER Fabio Rapposelli <fabio@vmware.com>

# Create temporary chroot environment
ENV TEMP_CHROOT /temp_chroot

RUN mkdir /data &&\
    mkdir $TEMP_CHROOT &&\
    mkdir -p $TEMP_CHROOT/var/lib/rpm &&\
    rpm --root $TEMP_CHROOT/ --initdb &&\
    rpm --root $TEMP_CHROOT --import /etc/pki/rpm-gpg/VMWARE-RPM-GPG-KEY

# Add RC pkg source to tdnf/yum
COPY photon-rc.repo /etc/yum.repos.d/photon.repo

RUN tdnf upgrade -y tdnf &&\
    tdnf install -y tar xz

RUN tdnf --installroot $TEMP_CHROOT/ install -y \
                                          bash-4.3.30-2.ph1 \
                                          coreutils-8.24-1.ph1 \
                                          filesystem-1.0-2.ph1 \
                                          findutils-4.4.2-1.ph1 \
                                          photon-release-1.0-4.ph1 \
                                          photon-repos-1.0-2.ph1 \
                                          tdnf-1.0.8-2.ph1 \
                                          util-linux-2.27.1-1.ph1 \
                                          vim-7.4-4.ph1 \
                                          which-2.21-1.ph1

RUN cp /etc/resolv.conf $TEMP_CHROOT/etc/

# Cleanup
RUN cd $TEMP_CHROOT && rm -rf usr/src/ && rm -rf home/* && rm -rf var/log/*

# Build rootfs
RUN cd $TEMP_CHROOT && cp -pr etc/skel/. root/.
RUN cd $TEMP_CHROOT && tar cpJf /data/rootfs.tar.xz .

RUN echo $'FROM scratch\n\
MAINTAINER Fabio Rapposelli <fabio@vmware.com>\n\
ADD rootfs.tar.xz /\n\
\n\
CMD ["/bin/bash"]' >> /data/Dockerfile

VOLUME /data

CMD [ "/usr/bin/tar", "-cf", "-", "-C", "/data", "." ]
