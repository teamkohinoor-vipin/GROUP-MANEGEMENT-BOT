FROM python:3.11-slim

ENV PIP_NO_CACHE_DIR=1

RUN apt update && apt install -y --no-install-recommends \
    git \
    ffmpeg \
    curl \
    gcc \
    libffi-dev \
    libssl-dev \
    libpq-dev \
    libjpeg-dev \
    zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /root/MukeshRobot

RUN git clone https://github.com/Noob-Mukesh/MukeshRobot /root/MukeshRobot

COPY ./MukeshRobot/config.py ./MukeshRobot/MukeshRobot/

RUN pip install --upgrade pip setuptools
RUN pip install -r requirements.txt

CMD ["python3","-m","MukeshRobot"]
