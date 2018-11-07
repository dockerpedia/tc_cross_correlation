FROM continuumio/miniconda
MAINTAINER Maximiliano Osorio <mosorio@inf.utfsm.cl>

ARG BUILD_DATE
ARG VCS_REF
LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="Seismic Noise Cross-Correlation" \
      org.label-schema.description="The Seismic Ambient Noise Cross-Correlation workflow (also referred as xcorr) (Fil- guiera et al., 2014) was developed as part of the VERCE project96 for processing and cross-correlating time series (traces) from seismic stations." \
      org.label-schema.url="http://www.verce.eu/" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/dockerpedia/tc_cross_correlation" \
      org.label-schema.vendor="DockerPedia" \
      org.label-schema.version="1.0" \
      org.label-schema.schema-version="1.0"

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