FROM debian
# FROM python:3.11-slim

WORKDIR /app

RUN apt-get update && apt-get install -y wget unzip python3 python3-venv && \
  python3 -m venv venv && \
  ./venv/bin/python3 -m pip install aiohttp paho-mqtt cryptography python-dotenv

COPY pymazda.zip /app/pymazda.zip
RUN unzip pymazda.zip && rm -rf pymazda.zip

COPY app.py /app/app.py

SHELL ["/bin/ash", "-c"]
CMD ["./venv/bin/python3", "./app.py"]
