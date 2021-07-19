#!/bin/sh

# Global variables
DIR_CONFIG="/etc/UnblockNeteaseMusic"
DIR_RUNTIME="/usr/bin"
DIR_TMP="$(mktemp -d)"

# Write V2Ray configuration
cat << EOF > ${DIR_TMP}/heroku.json
{
    "inbounds": [{
        "port": ${PORT},
        "protocol": "vmess",
        "settings": {
            "clients": [{
                "id": "${ID}",
                "alterId": ${AID}
            }]
        },
        "streamSettings": {
            "network": "ws",
            "wsSettings": {
                "path": "${WSPATH}"
            }
        },
		"proxySettings": {
		"tag": "HTTP"
        }
    }],
	"outbounds": [{
		"protocol": "http",
		"settings": {
		"servers": [
			{
				"address": "127.0.0.1",
				"port": 8080,
				"users": []
			}
		]
		},
		"tag": "HTTP"
    }]
}
EOF

# Get V2Ray executable release
curl --retry 10 --retry-max-time 60 -H "Cache-Control: no-cache" -fsSL github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip -o ${DIR_TMP}/v2ray_dist.zip
busybox unzip ${DIR_TMP}/v2ray_dist.zip -d ${DIR_TMP}

# Get UnblockNeteaseMusic executable release
curl --retry 10 --retry-max-time 60 -H "Cache-Control: no-cache" -fsSL github.com/nondanee/UnblockNeteaseMusic/archive/refs/tags/v0.25.3.zip -o ${DIR_TMP}/UnblockNeteaseMusic.zip
busybox unzip ${DIR_TMP}/UnblockNeteaseMusic.zip -d ${DIR_TMP}

# Convert to protobuf format configuration
mkdir -p ${DIR_CONFIG}
${DIR_TMP}/v2ctl config ${DIR_TMP}/heroku.json > ${DIR_CONFIG}/config.pb

# Install UnblockNeteaseMusic
mv ${DIR_TMP}/UnblockNeteaseMusic-0.25.3 ${DIR_RUNTIME}/UnblockNeteaseMusic

# Install V2Ray
install -m 755 ${DIR_TMP}/v2ray ${DIR_RUNTIME}
rm -rf ${DIR_TMP}

# Run
node ${DIR_RUNTIME}/UnblockNeteaseMusic/app.js -e http://music.163.com -p 8080 & ${DIR_RUNTIME}/v2ray --config=${DIR_CONFIG}/config.pb

# Version
node -v
npx -v
