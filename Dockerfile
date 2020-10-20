FROM ubuntu:18.04

MAINTAINER "Roman Harutyunyan"
RUN apt-get update
# Installing mysql database
RUN dbDeps='mysql-client libmysqlclient-dev git python-pip' && apt-get install -y $dbDeps
RUN git clone https://github.com/komarserjio/notejam.git /opt/django
# Installing virtualenv
RUN pip install virtualenv

RUN pip list

RUN virtualenv /opt/django-env

RUN /opt/django-env/bin/pip install -r /opt/django/django/requirements.txt

CMD . /opt/django-env/bin/activate 
CMD exec /opt/django-env/bin/python2.7 /opt/django/django/notejam/manage.py syncdb --noinput  
CMD exec /opt/django-env/bin/python2.7 /opt/django/django/notejam/manage.py migrate 
CMD exec /opt/django-env/bin/python2.7 /opt/django/django/notejam/manage.py runserver 0.0.0.0:8000

