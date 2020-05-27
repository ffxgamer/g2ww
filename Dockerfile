FROM  golang:stretch AS build


COPY .  /go/src
WORKDIR /go/src

RUN GOPROXY=https://goproxy.io CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build  -o /go/bin/g2ww *.go


FROM alpine

COPY --from=build /go/bin/g2ww /g2ww
CMD ["/g2ww"]