FROM golang:1.20 AS builder

WORKDIR /app

COPY app .

#RUN go build -o server
RUN GOOS=linux go build -ldflags="-w -s" -o server .

FROM scratch
WORKDIR /app
COPY --from=builder /app/server ./server
ENTRYPOINT ["./server"]