FROM python:3.7.3 AS base
ADD requirements.txt requirements.txt
RUN apt-get update -y && apt-get install -y mysql-client default-libmysqlclient-dev && \
pip install -r requirements.txt && mkdir -p /code  && \
echo "Asia/Bangkok" > /etc/timezone && rm /etc/localtime && dpkg-reconfigure -f noninteractive tzdata

FROM base
ADD . /code
WORKDIR /code
ENTRYPOINT ['/code/docker-entrypoint.sh']
CMD python manage.py runserver