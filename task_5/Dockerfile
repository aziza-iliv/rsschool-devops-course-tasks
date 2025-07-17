#  Берём официальный минимальный образ Python
FROM python:3.9-slim

# Создаём рабочую папку внутри контейнера
WORKDIR /app

# Копируем requirements.txt и устанавливаем зависимости
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Копируем весь код приложения
COPY . .

# Устанавливаем переменную окружения для Flask
ENV FLASK_APP=main.py

# Запускаем Flask
CMD ["flask", "run", "--host=0.0.0.0", "--port=8080"]
