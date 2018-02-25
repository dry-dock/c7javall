FROM drydock/c7all:master

ADD . /c7javall

RUN /c7javall/install.sh
