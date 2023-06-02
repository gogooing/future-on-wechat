#!/bin/bash

unset KUBECONFIG

cd .. && docker build -f docker/Dockerfile.latest \
             -t gogooing/future-on-wechat .

docker tag gogooing/future-on-wechat gogooing/future-on-wechat:$(date +%y%m%d)