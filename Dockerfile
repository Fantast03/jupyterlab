# -- Base image --
FROM jupyter/minimal-notebook:python-3.10.9 as base

LABEL org.opencontainers.image.authors="https://github.com/Fantast03"
LABEL org.opencontainers.image.source="https://github.com/Fantast03/jupyterlab"
LABEL org.opencontainers.image.licenses="BSD3-Clause"

ARG CTX=base

# Copy preference settings
COPY $CTX/user-settings $HOME/.jupyter/lab/user-settings/

# Copy and install jupyter extensions
COPY $CTX/requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt && rm requirements.txt

RUN jupyter lab build

# -- Machine learning image --
FROM base as machine-learning

ARG CTX=machine-learning

COPY $CTX/requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt && rm requirements.txt
