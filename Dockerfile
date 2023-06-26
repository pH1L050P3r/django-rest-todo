FROM python:3.9-slim

RUN apt update -qq -y && apt-get install -qq -y libpq-dev unzip libaio1 build-essential

ENV DockerHome=/app

RUN mkdir -p ${DockerHome}

WORKDIR ${DockerHome}

COPY ./requirements ./requirements

RUN pip install -r requirements/dev.txt

COPY . ${DockerHome}

EXPOSE 8000

ENTRYPOINT [ "/bin/bash", "-c"]
