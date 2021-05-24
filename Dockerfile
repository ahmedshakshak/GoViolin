FROM golang:1.16
WORKDIR /go/src/app
COPY . .
RUN go mod init && go build -o main .
EXPOSE 8080
CMD ["/go/src/app/main"]
