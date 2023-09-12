FROM mambaorg/micromamba:1.5.1

COPY --chown=$MAMBA_USER:$MAMBA_USER env.yaml /tmp/env.yaml
RUN micromamba install -y -f /tmp/env.yaml && \
    micromamba clean --all --yes

ADD ./opt/app/
WORKDIR /opt/app

CMD panel serve --address="0.0.0.0" --port=$PORT sample6_cmec.ipynb --allow-websocket-origin=pcmdi-dong12-test.herokuapp.com