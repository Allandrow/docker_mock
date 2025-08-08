# BUILD Stage
FROM --platform=$BUILDPLATFORM golang:1.24.2 AS build

WORKDIR /src

ARG TARGETARCH
ARG TARGETOS

COPY . /src

RUN CGO_ENABLED=0 GOARCH=$TARGETARCH GOOS=$TARGETOS go build -o /bin/server .

#RUN stage
FROM alpine:latest

COPY --from=build /bin/server /bin/

EXPOSE 4763

CMD ["/bin/server"]