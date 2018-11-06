FROM continuumio/miniconda
MAINTAINER Maximiliano Osorio <mosorio@inf.utfsm.cl>

RUN apt-get update \
    && apt-get install -y wget \
        curl \
        python-setuptools \
        git

ADD internal.yaml /tmp/internal_extinction.yaml
RUN conda env update -f /tmp/internal_extinction.yaml

RUN echo "source activate tc_cross" > ~/.bashrc
ENV PATH /opt/conda/envs/tc_cross/bin:$PATH
ENV PYTHONPATH /root/dispel4py_workflows/tc_cross_correlation:$PYTHONPATH

WORKDIR /root/
RUN git clone https://github.com/rosafilgueira/dispel4py_workflows.git \
    && mkdir -p dispel4py_workflows/tc_cross_correlation/OUTPUT/DATA \
    && mkdir -p dispel4py_workflows/tc_cross_correlation/OUTPUT/XCORR

ADD realtime_xcorr_input.jsn dispel4py_workflows/tc_cross_correlation/realtime_xcorr_input.jsn