#!/bin/bash
set -e

echo "Waiting for database..."
python manage.py wait_for_db

echo "Running migrations..."
python manage.py migrate --noinput

if [ "$ENV" = "dev" ]; then
  python manage.py runserver 0.0.0.0:8000
else
  exec gunicorn \
    --bind 0.0.0.0:8000 \
    --workers 4 \
    --timeout 120 \
    config.wsgi:application
fi
