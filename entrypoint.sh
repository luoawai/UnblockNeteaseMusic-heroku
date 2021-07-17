#!/bin/sh

# Global variables
DIR_CONFIG="/etc/UnblockNeteaseMusic"
DIR_RUNTIME="/usr/bin"
DIR_TMP="$(mktemp -d)"

# Get UnblockNeteaseMusic executable release
curl --retry 10 --retry-max-time 60 -H "Cache-Control: no-cache" -fsSL github.com/nondanee/UnblockNeteaseMusic/archive/refs/tags/v0.25.3.zip -o ${DIR_TMP}/UnblockNeteaseMusic.zip
busybox unzip ${DIR_TMP}/UnblockNeteaseMusic.zip -d ${DIR_TMP}

# Install UnblockNeteaseMusic
mv ${DIR_TMP}/UnblockNeteaseMusic-0.25.3 ${DIR_RUNTIME}/UnblockNeteaseMusic
rm -rf ${DIR_TMP}

# Run UnblockNeteaseMusic
node ${DIR_RUNTIME}/UnblockNeteaseMusic/app.js -s -e http://music.163.com -p ${P}