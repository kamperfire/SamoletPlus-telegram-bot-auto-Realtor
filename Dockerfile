FROM python:3.11-slim

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY src ./src
COPY config ./config

RUN mkdir -p /app/data/objects/Flat \
    /app/data/objects/House \
    /app/data/objects/Commerce \
    /app/data/objects/Land \
    /app/data/objects/Room \
    /app/data/city_reports \
    /app/storage/users

CMD ["python", "src/portfolio_bot/main.py"]
