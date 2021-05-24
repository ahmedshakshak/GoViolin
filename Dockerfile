FROM golang:1.16 AS builder
WORKDIR /go/src/app
COPY . .
RUN export CGO_ENABLED=0 && go mod init && go build -o main .

FROM alpine:latest
RUN apk --no-cache add ca-certificates
WORKDIR /app
COPY --from=builder /go/src/app .
EXPOSE 8080
CMD ["./main"]