FROM debian

WORKDIR /app

RUN apt-get update && apt-get install -y wget unzip python3 python3-venv && \
  python3 -m venv venv && \
  ./venv/bin/python3 -m pip install aiohttp paho-mqtt cryptography python-dotenv

RUN wget https://github.com/runDMCA/home-assistant-mazda/archive/refs/heads/main.zip && \
  unzip main.zip && rm -rf main.zip

COPY app.py /app/home-assistant-mazda-main/custom_components/mazda/app.py

SHELL ["/bin/ash", "-c"]
CMD ["./venv/bin/python3", "./home-assistant-mazda-main/custom_components/mazda/app.py"]
