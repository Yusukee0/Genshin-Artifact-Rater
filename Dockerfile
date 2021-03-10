FROM ubuntu:20.04

WORKDIR /app
COPY ./bot /app

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Paris
RUN apt-get update -y && apt-get install -y libgl1-mesa-glx libglib2.0-0 libsm6 libxext6 libxrender-dev python3-pip python-dev

RUN python3 -m pip install -r requirements.txt

CMD [ "python3", "bot.py" ]
