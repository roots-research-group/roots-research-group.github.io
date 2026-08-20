FROM registry.git.nrw/rwth-mbd/containers/quarto:latest

SHELL ["/bin/bash", "-c"]

ARG PYTHON_VERSION=3.14 #do not change
ENV PYTHON_VERSION=${PYTHON_VERSION}

USER ${MAMBA_USER}

COPY environment.yml /tmp/environment.yml

RUN sed "s/\$PYTHON_VERSION/${PYTHON_VERSION}/g" /tmp/environment.yml > /tmp/environment_resolved.yml && \
    micromamba env update -n "${ENV_NAME}" -f /tmp/environment_resolved.yml && \
    micromamba clean --all --yes