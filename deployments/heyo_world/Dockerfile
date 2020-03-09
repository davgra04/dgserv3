
FROM golang:alpine
ADD ./app /go/src/app
WORKDIR /go/src/app
# ENV PORT=3001
CMD ["go", "run", "main.go"]

EXPOSE 10101
# EXPOSE 80

# #build stage
# FROM golang:alpine AS builder
# WORKDIR /go/src/app
# COPY . .
# RUN apk add --no-cache git
# RUN go get -d -v ./...
# RUN go install -v ./...

# #final stage
# FROM alpine:latest
# RUN apk --no-cache add ca-certificates
# COPY --from=builder /go/bin/app /app
# ENTRYPOINT ./app
# LABEL Name=heyoworld Version=0.0.1
# EXPOSE 80
