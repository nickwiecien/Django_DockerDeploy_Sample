FROM python:3.8-slim-buster

EXPOSE 8000

RUN apt-get update

RUN apt-get install 'apt-utils' -y

RUN apt-get install 'unixodbc-dev' 'g++' 'musl-dev' -y

ADD . /django_app

WORKDIR /django_app

RUN pip install -r requirements.txt

RUN python django_app/manage.py makemigrations

RUN python django_app/manage.py migrate

CMD [ "python", "django_app/manage.py", "runserver", "0.0.0.0:8000" ]