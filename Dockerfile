FROM debian:latest

RUN apt update && apt upgrade -y
RUN apt install git python3-pip ffmpeg -y

RUN cd /
RUN git clone https://github.com/megabottaa/Mega-DL
RUN cd Mega-DL
WORKDIR /Mega-DL

RUN pip3 install --upgrade pip
RUN pip3 install -U -r requirements.txt

CMD gunicorn app:app & python3 main.py
