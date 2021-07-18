#!/bin/sh

# Global variables
DIR_CONFIG="/etc/UnblockNeteaseMusic"
DIR_RUNTIME="/usr/bin"
DIR_TMP="$(mktemp -d)"

# Get UnblockNeteaseMusic executable release
curl --retry 10 --retry-max-time 60 -H "Cache-Control: no-cache" -fsSL github.com/nondanee/UnblockNeteaseMusic/archive/refs/tags/v0.25.3.zip -o ${DIR_TMP}/UnblockNeteaseMusic.zip
unzip ${DIR_TMP}/UnblockNeteaseMusic.zip -d ${DIR_TMP}

#Get node.js
curl --retry 10 --retry-max-time 60 -H "Cache-Control: no-cache" -fsSL nodejs.org/dist/v12.18.1/node-v12.18.1-linux-x64.tar.xz -o ${DIR_RUNTIME}/node.tar.xz
tar xf ${DIR_RUNTIME}/node.tar.xz
export PATH=$PATH:${DIR_RUNTIME}/node-v12.18.1-linux-x64/bin

# Install UnblockNeteaseMusic
mv ${DIR_TMP}/UnblockNeteaseMusic-0.25.3 ${DIR_RUNTIME}/UnblockNeteaseMusic
rm -rf ${DIR_TMP}

#
node -v
npx -v

# Run UnblockNeteaseMusic
npx ${DIR_RUNTIME}/UnblockNeteaseMusic/app.js -s -e http://music.163.com -p ${P}
