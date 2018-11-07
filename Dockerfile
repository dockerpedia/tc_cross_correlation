FROM continuumio/miniconda
MAINTAINER Maximiliano Osorio <mosorio@inf.utfsm.cl>

LABEL vcs-url = "https://github.com/dockerpedia/tc_cross_correlation" \
      vcs-ref = "7dbcd5c15afc5bf3249611c8c1dfebc1376d9366" \
      vendor  = "dockerpedia" \
      schema-version = "1.0"

RUN apt-get update \
    && apt-get install -y wget \
        curl \
        python-setuptools \
        git

ADD internal.yaml /tmp/internal_extinction.yaml
RUN conda env update -f /tmp/internal_extinction.yaml

ENV PATH /opt/conda/envs/tc_cross/bin:$PATH
ENV PYTHONPATH /root/dispel4py_workflows/tc_cross_correlation:$PYTHONPATH

WORKDIR /root/
RUN echo "source activate tc_cross" > ~/.bashrc \
    && git clone https://github.com/rosafilgueira/dispel4py_workflows.git \
    && mkdir -p dispel4py_workflows/tc_cross_correlation/OUTPUT/DATA \
    && mkdir -p dispel4py_workflows/tc_cross_correlation/OUTPUT/XCORR

ADD realtime_xcorr_input.jsn dispel4py_workflows/tc_cross_correlation/realtime_xcorr_input.jsn