FROM python:3.12-slim

WORKDIR /home

RUN apt-get update && apt-get install -y git curl

# RUN git clone https://github.com/bavo96/bavovim.git 

COPY . bavovim

RUN cd bavovim && bash ./install.sh

CMD "python3 -c 'while True: pass'"
