#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo "Error: illegal number of argument"
    echo "Usage: docker-entrypoint.sh <path_to_django_manage_py>"
fi

cd $1

# Apply database migrations
echo "Applying migrations ..."
python manage.py makemigrations
python manage.py migrate

# Start server on default port 8000
echo "Starting server ..."
python manage.py runserver --noreload 0.0.0.0:8000
