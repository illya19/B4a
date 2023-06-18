FROM ubuntu:22.04
RUN apt update -y && apt install wget -y
RUN wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz
RUN tar xf ngrok-v3-stable-linux-amd64.tgz && rm ngrok-v3-stable-linux-amd64.tgz
RUN ./ngrok config add-authtoken 2RMl4xGrjD0IlBxzH6eNl34p7DD_63pWrXgkZWVZ1GuLQe3kr
RUN useradd user
RUN echo "user:123123" | chpasswd
RUN apt install ssh openssh-server -y
RUN echo "root:123123" | chpasswd
RUN service ssh start

CMD service ssh start && ./ngrok tcp 22
