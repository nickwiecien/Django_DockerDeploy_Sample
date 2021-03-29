FROM python:3.8-alpine

EXPOSE 8000

RUN apk add --no-cache gcc python3-dev musl-dev unixodbc-dev g++

ADD . /django_app

WORKDIR /django_app

RUN pip install -r requirements.txt

RUN python django_app/manage.py makemigrations

RUN python django_app/manage.py migrate

CMD [ "python", "django_app/manage.py", "runserver", "0.0.0.0:8000" ]