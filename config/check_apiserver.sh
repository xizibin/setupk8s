#!/bin/sh

errorExit() {
    echo "*** $*" 1>&2
    exit 1
}

curl --silent --max-time 2 --insecure https://localhost:16443/ -o /dev/null || errorExit "Error GET https://localhost:16443/"
if ip addr | grep -q ${APISERVER_VIP}; then
    curl --silent --max-time 2 --insecure https://172.16.5.234:16443/ -o /dev/null || errorExit "Error GET https://172.16.5.234:16443/"
fi