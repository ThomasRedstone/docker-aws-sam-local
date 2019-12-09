FROM homebrew/brew:2.1.11

ENV VERSION=0.37.0


RUN brew tap aws/tap

RUN brew install aws-sam-cli

RUN ln -s /home/linuxbrew/.linuxbrew/bin/sam /usr/local/bin/sam

WORKDIR /var/opt

EXPOSE 3000

ENTRYPOINT ["/usr/local/bin/sam"]
