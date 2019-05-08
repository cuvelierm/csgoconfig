#!/bin/bash
: ${CSGO_DIR:?"ERROR: CSGO_DIR IS NOT SET!"}

cd $CSGO_DIR

### Create dynamic server config
cat << SERVERCFG > $CSGO_DIR/csgo/cfg/server.cfg
hostname "$SERVER_HOSTNAME"
rcon_password "$RCON_PASSWORD"
sv_password "$SERVER_PASSWORD"
sv_lan 0
sv_cheats 0
SERVERCFG

./srcds_run \
    -console \
    -usercon \
    -game csgo \
    -tickrate $TICKRATE \
    -port $PORT \
    -maxplayers_override $MAXPLAYERS \
    +game_type $GAME_TYPE \
    +game_mode $GAME_MODE \
    +mapgroup $MAPGROUP \
    +map $MAP \
    +ip $IP \
    +sv_setsteamaccount $STEAM_ACCOUNT