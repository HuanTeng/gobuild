FROM docker:19-git

ENV GO111MODULE on
ENV GOPATH /go
ENV GOBIN "${GOPATH}/bin"
ENV PATH "${GOBIN}:${PATH}"

RUN apk update && apk add --no-cache go=1.13.4-r1 alpine-sdk bash && apk upgrade && \
    mkdir -p ${GOBIN} && \
    go get github.com/huanteng/pgdiff && \
    go clean -cache -testcache -modcache && \
    rm -rf ${GOPATH}/src/* && \
    rm -rf /tmp/*
