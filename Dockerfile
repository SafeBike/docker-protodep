FROM golang:1.16 AS base

RUN go get github.com/stormcat24/protodep

FROM base AS bin

COPY --from=base /go/bin/protodep /usr/bin/protodep

ENTRYPOINT [ "/usr/bin/protodep" ]