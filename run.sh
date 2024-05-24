#!/bin/bash

if [ -z "$DISCORD_TOKEN" ]; then
  echo "Error: DISCORD_TOKEN is not set."
  exit 1
fi

if [ -z "$OWNER_ID" ]; then
  echo "Error: OWNER_ID is not set."
  exit 1
fi

cat <<EOT > config.txt
token = $DISCORD_TOKEN
owner = $OWNER_ID
prefix = "${PREFIX:-!}"
game = "${GAME:-DEFAULT}"
status = ${STATUS:-ONLINE}
songinstatus = ${SONGINSTATUS:-false}
altprefix = "${ALTPREFIX:-NONE}"
success = "${SUCCESS_EMOJI:-🎶}"
warning = "${WARNING_EMOJI:-💡}"
error = "${ERROR_EMOJI:-🚫}"
loading = "${LOADING_EMOJI:-⌚}"
searching = "${SEARCHING_EMOJI:-🔎}"
help = ${HELP:-help}
npimages = ${NPIMAGES:-false}
stayinchannel = ${STAYINCHANNEL:-false}
maxtime = ${MAXTIME:-0}
maxytplaylistpages = ${MAXYTPLAYLISTPAGES:-10}
skipratio = ${SKIPRATIO:-0.55}
alonetimeuntilstop = ${ALONETIMEUNTILSTOP:-0}
playlistsfolder = "${PLAYLISTSFOLDER:-Playlists}"
updatealerts = ${UPDATEALERTS:-true}
lyrics.default = "${LYRICS_PROVIDER:-A-Z Lyrics}"
aliases {
  settings = [ status ]
  lyrics = []
  nowplaying = [ np, current ]
  play = []
  playlists = [ pls ]
  queue = [ list ]
  remove = [ delete ]
  scsearch = []
  search = [ ytsearch ]
  shuffle = []
  skip = [ voteskip ]
  prefix = [ setprefix ]
  setdj = []
  setskip = [ setskippercent, skippercent, setskipratio ]
  settc = []
  setvc = []
  forceremove = [ forcedelete, modremove, moddelete, modelete ]
  forceskip = [ modskip ]
  movetrack = [ move ]
  pause = []
  playnext = []
  queuetype = []
  repeat = []
  skipto = [ jumpto ]
  stop = [ leave ]
  volume = [ vol ]
}
loglevel = ${LOGLEVEL:-info}
transforms = {}
eval = ${EVAL:-false}
evalengine = "${EVALENGINE:-Nashorn}"
EOT

java -Dnogui=true -jar JMusicBot.jar
