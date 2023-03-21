
FROM ubuntu:18.04

RUN apt update && \
    apt upgrade -y && \
    apt install -y gcc g++ binutils patch bzip2 flex make && \
    apt install -y gettext pkg-config unzip zlib1g-dev libc6-dev subversion && \
    apt install -y libncurses5-dev gawk sharutils curl libxml-parser-perl python-yaml && \
    apt install -y ocaml-nox ocaml ocaml-findlib libssl-dev libfdt-dev && \
    apt install -y device-tree-compiler u-boot-tools && \
    apt install -y libssl1.0-dev && \
    apt install -y libc6-i386 rsync && \
    rm --force --recursive /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN dpkg --add-architecture i386 && \
    apt update && \
    apt install -y libgl1-mesa-dri:i386 && \
    apt install wget curl git -y && \
    rm --force --recursive /var/lib/apt/lists/* /tmp/* /var/tmp/*

ARG DEV_USER
ENV DEV_USER=${DEV_USER}
RUN useradd -ms /bin/bash ${DEV_USER}

ARG GIT_LFS=https://github.com/git-lfs/git-lfs/releases/download/v3.3.0/git-lfs-linux-amd64-v3.3.0.tar.gz
ARG GIT_LFS_DIR=git-lfs-3.3.0
RUN wget -O gitlfs.tar.gz ${GIT_LFS} && \
    tar -xzvf gitlfs.tar.gz && \
    ./${GIT_LFS_DIR}/install.sh && \
    rm gitlfs.tar.gz && \
    rm -rf ${GIT_LFS_DIR}

ARG GIT_USER=sw-dev
ARG GIT_EMAIL=sw.dev@gmail.com
USER ${DEV_USER}
RUN git config --global user.name "${GIT_USER}" && \
    git config --global user.email ${GIT_EMAIL} && \
    git lfs install >/dev/null
WORKDIR /home/${DEV_USER}/work
CMD ["/bin/bash"]
#################

