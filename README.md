# kizzycode/teamfortress2

Yet another trivial Team-Fortress-2-server docker image

## EULA
Note: by using this image, you agree to the SteamCMD EULA.

## Configuration
Before you can use the server, you need to set two settings:
 - Your server token in `docker-compose.yml`. You can generate a server token at
   https://steamcommunity.com/dev/managegameservers
 - Your server password in `files/server.cfg`

## Docker Users
The server runs as user `teamfortress2:10000` with group `teamfortress2:10000`.
