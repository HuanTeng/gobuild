FROM docker:latest

RUN apk add --no-cache ca-certificates openssh-client wget curl make git bash go go-tools alpine-sdk python3 py3-psycopg2 postgresql-dev \
    && pip3 install migra

RUN mkdir -p ~/.ssh && chmod 700 ~/.ssh \
    && mkdir -p /go/bin && mkdir -p /go/src
ENV GOPATH /go
ENV PATH "/go/bin:${PATH}"

RUN curl https://glide.sh/get | sh
RUN curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh
