FROM centos:7
LABEL maintainer='Naoki Akazawa'
ENV TZ=Asia/Tokyo
ENV LC_ALL=C
RUN yum install -y vim openssh-server openssh-clients sudo sshpass && \
    sed -i -e 's/# %wheel\tALL=(ALL)\tNOPASSWD: ALL/%wheel\tALL=(ALL)\tNOPASSWD: ALL/' /etc/sudoers && \
    sed -i -e 's/%wheel\tALL=(ALL)\tALL/# %wheel\tALL=(ALL)\tALL/' /etc/sudoers && \
    visudo -c && \
    echo "root:password" | chpasswd && \
    yum install -y https://centos7.iuscommunity.org/ius-release.rpm
#Install Python3.6
RUN yum search python36 && \
    yum install -y \ 
        python36u \
        python36u-libs \
        python36u-devel \
        python36u-pip \
        rsync
#Install packages using pip3.6
RUN pip3.6 install \
        paramiko \
        scp \
        ecdsa \
        base58
WORKDIR /home
CMD ["/usr/bin/ssh","-D", "FOREGROUND"]