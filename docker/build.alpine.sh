#!/bin/bash

# fetch latest release tag
FUTURE_ON_WECHAT_TAG=`curl -sL "https://api.github.com/repos/gogooing/future-on-wechat/releases/latest" | \
     grep '"tag_name":' | \
     sed -E 's/.*"([^"]+)".*/\1/'`

# build image
docker build -f Dockerfile.alpine \
             --build-arg FUTURE_ON_WECHAT_VER=$FUTURE_ON_WECHAT_TAG \
             -t gogooing/future-on-wechat .

# tag image
docker tag gogooing/future-on-wechat gogooing/future-on-wechat:alpine
docker tag gogooing/future-on-wechat gogooing/future-on-wechat:$FUTURE_ON_WECHAT_TAG-alpine
