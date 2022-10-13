#!/bin/bash

set -e

curl localhost:3000

# curl command - A key that is not found
missing=$(curl -s -X GET localhost:3000/data/lol | jq .data)
if ! [[ "${missing}" == "null" ]]; then
   exit 1
else
   echo ${missing}
fi

# curl command - Add a value for that key
adding=$(curl -s -X PUT localhost:3000/data/foo/bar | jq .status | sed 's/"//g')
if ! [[ "${adding}" == "OK" ]]; then
   exit 2
else
    echo ${adding}
fi

# curl command - Get the same key again and view the response value
foo=$(curl -s -X GET localhost:3000/data/foo  | jq .data | sed 's/"//g')
if ! [[ "${foo}" == "bar" ]]; then
   exit 3
else
    echo ${foo}
fi

# Check the key exists in redis
docker run -it --network host --rm redis redis-cli -h 127.0.0.1 get foo
