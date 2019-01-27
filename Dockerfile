FROM alpine:3.8
WORKDIR /code

RUN apk --no-cache add youtube-dl bash jq

ADD src /code

# Download into volume
VOLUME /download

ENV PATH=/code:$PATH
