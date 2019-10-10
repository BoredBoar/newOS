FROM ubuntu:latest

RUN apt update && apt install -y build-essential nasm xorriso grub-pc-bin bochs bochs-sdl

CMD bash