FROM alpine:3.10

ENV VERSION=0.37.0

RUN apk add tar gzip

RUN apk add --no-cache curl && \
    curl -sSLO https://github.com/awslabs/aws-sam-cli/releases/download/v${VERSION}/aws-sam-cli-${VERSION}.x86_64_linux.bottle.tar.gz && \
    tar -C /usr/local/bin -zxvf /aws-sam-cli-${VERSION}.x86_64_linux.bottle.tar.gz && \
    apk del curl && \
    rm -f /aws-sam-cli-${VERSION}.x86_64_linux.bottle.tar.gz

# awscli for "sam package" and "sam deploy"
RUN apk add --no-cache py-pip && pip install awscli

WORKDIR /var/opt

EXPOSE 3000

ENTRYPOINT ["/usr/local/bin/sam"]
