FROM golang:1.22.4-alpine AS build

WORKDIR /server

COPY . ./

COPY go.mod ./

RUN go mod download

RUN go build -o /server/app ./main.go

FROM debian:buster-slim

COPY --from=build /server/app /server/app

RUN chmod +x /server/app

EXPOSE 8080

CMD ["/server/app"]

