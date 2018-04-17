FROM docker:latest

RUN apk update \
    && apk upgrade \
    && apk add ca-certificates openssh-client wget curl make git bash go go-tools alpine-sdk \
    && rm -rf /var/cache/apk/*

RUN mkdir -p ~/.ssh && chmod 700 ~/.ssh \
    && mkdir -p /go/bin && mkdir -p /go/src
ENV GOPATH /go
ENV PATH "/go/bin:${PATH}"

RUN curl https://glide.sh/get | sh
RUN curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh
