#!/bin/sh
docker rm -f shield_scrypt
docker run -d --name shield_scrypt -p 20101:20100 coin_shild/scrypt:1
