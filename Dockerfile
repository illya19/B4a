FROM ubuntu:20.04
RUN apt update -y && apt install wget -y
RUN wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz
RUN tar xf ngrok-v3-stable-linux-amd64.tgz && rm ngrok-v3-stable-linux-amd64.tgz
RUN echo "authtoken=$(os.getenv('NGROK_AUTH_TOKEN'))" > /root/.ngrok2/ngrok.yml
RUN useradd user
RUN echo "user:123123" | chpasswd
RUN apt install ssh openssh-server -y
RUN echo "root:123123" | chpasswd
RUN service ssh start

CMD service ssh start && ./ngrok tcp 22
