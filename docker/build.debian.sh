#!/bin/bash

# fetch latest release tag
CHATGPT_ON_WECHAT_TAG=`curl -sL "https://api.github.com/repos/gogooing/future-on-wechat/releases/latest" | \
     grep '"tag_name":' | \
     sed -E 's/.*"([^"]+)".*/\1/'`

# build image
docker build -f Dockerfile.debian \
             --build-arg CHATGPT_ON_WECHAT_VER=$CHATGPT_ON_WECHAT_TAG \
             -t gogooing/future-on-wechat .

# tag image
docker tag gogooing/future-on-wechat gogooing/future-on-wechat:debian
docker tag gogooing/future-on-wechat gogooing/future-on-wechat:$CHATGPT_ON_WECHAT_TAG-debian