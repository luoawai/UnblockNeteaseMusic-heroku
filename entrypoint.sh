#!/bin/sh

# Global variables
DIR_CONFIG="/etc/UnblockNeteaseMusic"
DIR_RUNTIME="/usr/bin"
DIR_TMP="$(mktemp -d)"

# Get UnblockNeteaseMusic executable release
curl --retry 10 --retry-max-time 60 -H "Cache-Control: no-cache" -fsSL github.com/UnblockNeteaseMusic/server/archive/refs/tags/v0.27.0-rc.2.zip -o ${DIR_TMP}/UnblockNeteaseMusic.zip
busybox unzip ${DIR_TMP}/UnblockNeteaseMusic.zip -d ${DIR_TMP}

# Install UnblockNeteaseMusic
mv ${DIR_TMP}/server-0.27.0-rc.2 ${DIR_RUNTIME}/UnblockNeteaseMusic

# Run
node ${DIR_RUNTIME}/UnblockNeteaseMusic/app.js -p 8080 ${UnblockNeteaseMusicStartup}

# Version
node -v
npx -v
