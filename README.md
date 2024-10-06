# mazda2mqtt
Mazda API to MQTT bridge

## Setup
- Clone this repo `https://github.com/brunob45/mazda2mqtt.git`
- Enter the folder `cd mazda2mqtt`
- Fill the .env file. Only `MAZDA_USERNAME` and `MAZDA_PASSWORD` are mandatory.
- Build the image `docker compose build`
- Run the container `docker compose up -d`

## Known issues
- Some users are not able to connect to the Mazda API using the debian base image.
Try to swap the base image in the Dockerfile.

Change the first 2 lines from

```dockerfile
FROM debian
# FROM python:3.11-slim
```

to

```dockerfile
# FROM debian
FROM python:3.11-slim
```