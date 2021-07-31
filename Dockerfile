FROM golang:alpine AS golang

WORKDIR /go/src
COPY main.go .
RUN go build main.go
RUN rm main.go

FROM scratch
WORKDIR /go/src
COPY --from=golang /go/src/main .

CMD ["./main"]