FROM python:3.7.3 AS base
ADD requirements.txt requirements.txt
RUN apt-get update -y && pip install -r requirements.txt && mkdir -p /code

FROM base
ADD . /code
WORKDIR /code
ENTRYPOINT ['/code/docker-entrypoint.sh']
CMD python manage.py runserver