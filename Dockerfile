FROM continuumio/miniconda
MAINTAINER Maximiliano Osorio <mosorio@inf.utfsm.cl>

RUN apt-get update \
    && apt-get install -y wget \
        curl \
        python-setuptools \
        git

ADD internal.yaml /tmp/internal_extinction.yaml
RUN conda env update -f /tmp/internal_extinction.yaml
RUN git clone https://github.com/rosafilgueira/dispel4py_workflows.git