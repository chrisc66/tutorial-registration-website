FROM python:3.9-buster

# Setting up premission
RUN mkdir -p /usr/app
RUN adduser --disabled-password --gecos '' django \ 
  && chown -R django /usr/app
USER django

# Downloading application
WORKDIR /usr/app
RUN wget https://github.com/chrisc66/django-rest-api-mongodb/archive/refs/heads/master.zip \
  && unzip master.zip \
  && rm -f master.zip

# Django environment and dependency
WORKDIR /usr/app/django-rest-api-mongodb-master/
ENV PATH="/home/django/.local/bin:$PATH"
RUN pip install djongo djangorestframework django-cors-headers
COPY --chown=django docker-entrypoint.sh /home/django/.local/bin/docker-entrypoint.sh

# Replacing Django settings.py
RUN rm -f /usr/app/django-rest-api-mongodb-master/DjangoRestApiMongoDB/DjangoRestApiMongoDB/settings.py
COPY --chown=django settings.py /usr/app/django-rest-api-mongodb-master/DjangoRestApiMongoDB/DjangoRestApiMongoDB/settings.py

# Starting application
EXPOSE 8000
CMD [ "docker-entrypoint.sh", "/usr/app/django-rest-api-mongodb-master/DjangoRestApiMongoDB" ]
