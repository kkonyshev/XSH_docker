#!/bin/sh
docker rm -f shield_lyra2re
docker run -d --name shield_lyra2re -p 20102:20100 coin_shild/lyra2re:1
