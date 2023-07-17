FROM golang:1.20.6 AS build
WORKDIR /app
COPY hello.go .
RUN go build -o hello hello.go

FROM scratch
WORKDIR /app
COPY --from=build /app/hello .
CMD [ "./hello" ]