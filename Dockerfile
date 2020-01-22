ARG PYTHON_VERSION=3.7

FROM python:${PYTHON_VERSION}

RUN apt-get update \
    && apt-get -y install openmpi-bin libopenmpi-dev \
    && pip install -U 'pip<20' \
    && pip install pytest mock flake8 autopep8 mypy \
    && pip install optuna
