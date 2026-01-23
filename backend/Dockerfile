FROM python:3.9-slim
WORKDIR /app
COPY requirements.txt /app/requirements.txt
RUN pip install --upgrade pip && pip install -r /app/requirements.txt
COPY . /app
CMD ["gunicorn", "kittygram_backend.wsgi:application", "--bind", "0.0.0.0:9000"]
