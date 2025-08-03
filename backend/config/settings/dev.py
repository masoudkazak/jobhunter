from decouple import config

from .base import *  # noqa: F403

ALLOWED_HOSTS = config("ALLOWED_HOSTS", "").split(",")
DEBUG = config("DJANGO_DEBUG") == "True"
SECRET_KEY = config("DJANGO_SECRET_KEY")
STATIC_URL = config("STATIC_URL")
CORS_ALLOW_ALL_ORIGINS = True
CELERY_BROKER_URL = config("CELERY_BROKER_URL")
CELERY_RESULT_BACKEND = config("CELERY_RESULT_BACKEND")
CELERY_ACCEPT_CONTENT = ["json"]
CELERY_TASK_SERIALIZER = "json"
CELERY_TIMEZONE = "Asia/Tehran"
