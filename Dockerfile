FROM golang:1.20 AS builder

WORKDIR /app

COPY app .

RUN go build -o server

FROM alpine:3.17.2
WORKDIR /app
COPY --from=builder /app/server ./server
ENTRYPOINT ["./server"]