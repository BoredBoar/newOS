FROM ubuntu:latest

RUN apt update && apt install -y build-essential nasm genisoimage bochs bochs-sdl

CMD bash