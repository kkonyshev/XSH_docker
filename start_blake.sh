#!/bin/sh
docker rm -f shield_blake
docker run -d --name shield_blake -p 20103:20100 coin_shild/blake:1
