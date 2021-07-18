#!/bin/sh

# Global variables
DIR_CONFIG="/etc/UnblockNeteaseMusic"
DIR_RUNTIME="/usr/bin"

# Run V2Ray
${DIR_RUNTIME}/v2ray -config=${DIR_CONFIG}/config.pb
