#!/bin/bash
set -e

echo "Waiting for RabbitMQ..."
while ! nc -z rabbitmq 5672; do
  sleep 1
done

echo "Waiting for Redis..."
while ! nc -z redis 6379; do
  sleep 1
done

echo "Waiting for Database..."
python manage.py wait_for_db

echo "Starting Celery worker..."
exec celery -A config worker -l info
