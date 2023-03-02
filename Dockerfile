
FROM ubuntu:18.04

RUN apt update && \
    apt install -y gcc g++ binutils patch bzip2 flex make && \
    apt install -y gettext pkg-config unzip zlib1g-dev libc6-dev subversion && \
    apt install -y libncurses5-dev gawk sharutils curl libxml-parser-perl python-yaml && \
    apt install -y ocaml-nox ocaml ocaml-findlib libssl-dev libfdt-dev && \
    apt install -y device-tree-compiler u-boot-tools && \
    apt install -y libssl1.0-dev && \
    apt install -y libc6-i386 rsync

RUN dpkg --add-architecture i386 && \
    apt update && \
    apt install -y libgl1-mesa-dri:i386

ARG DEV_USER
ENV DEV_USER=${DEV_USER}
RUN useradd -ms /bin/bash ${DEV_USER}
USER ${DEV_USER}
WORKDIR /home/${DEV_USER}
CMD ["/bin/bash"]
#################

