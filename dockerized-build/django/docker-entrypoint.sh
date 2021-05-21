#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo "Error: illegal number of argument"
    echo "Usage: docker-entrypoint.sh <path_to_django_manage_py>"
fi

# Apply database migrations
echo "Apply database migrations ..."
python $1/manage.py migrate

# Start server
echo "Starting server ..."
python $1/manage.py runserver 8080
