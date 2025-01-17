FROM python:3

RUN mkdir /code
WORKDIR /code

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "--workers", "3", "--timeout", "600", "django_redis_cache.wsgi"]
