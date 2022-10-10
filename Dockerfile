FROM golang:1.17-buster 

ENV CGO_ENABLED=0
ENV GO111MODULE=on

WORKDIR /go/src/flog
RUN apt update
RUN apt install -y wbritish 

COPY go.mod go.sum ./
RUN go mod download

COPY . ./
RUN go build -o /bin/flog


ENTRYPOINT ["flog"]
