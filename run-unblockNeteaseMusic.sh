#!/bin/sh

# Global variables
DIR_CONFIG="/etc/UnblockNeteaseMusic"
DIR_RUNTIME="/usr/bin"

# Run UnblockNeteaseMusic
node ${DIR_RUNTIME}/UnblockNeteaseMusic/app.js -s -e http://music.163.com -p 8080
