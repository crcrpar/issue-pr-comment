ARG PYTHON_VERSION=3.7

FROM python:${PYTHON_VERSION}

ADD https://github.com/optuna/optuna/archive/master.zip /opt/optuna.zip

WORKDIR /opt

RUN ls -g \
    && unzip optuna.zip
RUN cd optuna-master \
    && pip install -U 'pip<20' \
    && pip install --progress-bar off -U setuptools \
    && python setup.py sdist \
    && pip install --progress-bar off $(ls dist/*tar.gz) \
    && pip install --progress-bar off $(ls dist/*tar.gz)[testing] \
    && pip install --progress-bar off .[document,checking,doctest]
