FROM centos:7
LABEL maintainer='Naoki Akazawa'
ENV TZ=Asia/Tokyo
ENV LC_ALL=C
RUN yum install -y vim openssh-server openssh-clients sudo sshpass && \
    sed -i -e 's/# %wheel\tALL=(ALL)\tNOPASSWD: ALL/%wheel\tALL=(ALL)\tNOPASSWD: ALL/' /etc/sudoers && \
    sed -i -e 's/%wheel\tALL=(ALL)\tALL/# %wheel\tALL=(ALL)\tALL/' /etc/sudoers && \
    visudo -c && \
    echo "root:password" | chpasswd
WORKDIR /dat
#COPY 
CMD ["/usr/bin/ssh","-D", "FOREGROUND"]