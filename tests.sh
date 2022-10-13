#!/bin/bash

# curl command - A key that is not found
curl -X GET localhost:3000/data/foo

# curl command - Add a value for that key
curl -X PUT localhost:3000/data/foo/bar

# curl command - Get the same key again and view the response value
curl -X PUT localhost:3000/data/foo/bar 

# Check the key exists in redis
docker run -it --network host --rm redis redis-cli -h 127.0.0.1 get foo
