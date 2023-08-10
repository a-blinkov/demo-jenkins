# main part
FROM python:3.11.4-bullseye

# Installing of Python packages
WORKDIR /code

ENV PYTHONPATH=/code/src:/code
ENV PYTHONUNBUFFERED=1

RUN python3.11 -m venv /venv
COPY requirements.txt .
RUN --mount=type=cache,target=/root/.cache/pip \
    /venv/bin/python -m pip install --cache-dir "/root/.cache/pip" -r requirements.txt
