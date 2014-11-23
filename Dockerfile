FROM ubuntu:14.04

RUN apt-get update
RUN apt-get install -y ca-certificates wget
RUN apt-get install -y sudo pkg-config build-essential m4 software-properties-common
RUN apt-get install -y libelf-dev
RUN apt-get install -y -qq ocaml ocaml-native-compilers camlp4-extra

RUN wget https://raw.githubusercontent.com/ocaml/opam/master/shell/opam_installer.sh
RUN sh ./opam_installer.sh /usr/local/bin system

RUN adduser --disabled-password --gecos "" opam
RUN passwd -l opam
USER opam
ENV HOME /home/opam
ENV USER opam
ENV OPAMVERBOSE 1
ENV OPAMYES 1

RUN opam init -y --comp=4.01.0
RUN opam install -y flowtype
RUN eval `opam config env`

ENV PATH /home/opam/.opam/4.01.0/bin/:$PATH

VOLUME /app
WORKDIR /app

CMD ["flow", "check"]
