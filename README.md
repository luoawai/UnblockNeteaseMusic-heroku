# 概述
采用 V2Ray + UnblockNeteaseMusic
部署完成后，每次启动应用时，运行的 V2Ray 将始终为最新版本，能在提供网上冲浪的同时解锁网易云灰色歌曲。

# UnblockNeteaseMusic
<img src="https://user-images.githubusercontent.com/26399680/47980314-0e3f1700-e102-11e8-8857-e3436ecc8beb.png" alt="logo" width="140" height="140" align="right">

解锁网易云音乐客户端变灰歌曲

## 特性

- 使用 QQ / 虾米 / 百度 / 酷狗 / 酷我 / 咪咕 / JOOX 音源替换变灰歌曲链接 (默认仅启用一、五、六)
- 为请求增加 `X-Real-IP` 参数解锁海外限制，支持指定网易云服务器 IP，支持设置上游 HTTP / HTTPS 代理
- 完整的流量代理功能 (HTTP / HTTPS)，可直接作为系统代理 (同时支持 PAC)

# V2Ray

**Heroku 已经封禁本专案，请 Fork 本专案后，将 `README.md` 中的 `Acxym` 替换为自己的用户名后，再进行部署。**


## 部署

对部署时需设定的变量名称做如下说明。

| 变量 | 默认值 | 说明 |
| :--- | :--- | :--- |
| `ID` | `ad806487-2d26-4636-98b6-ab85cc8521f7` | VMess 用户主 ID，用于身份验证，为 UUID 格式 |
| `AID` | `64` | 为进一步防止被探测所设额外 ID，即 AlterID，范围为 0 至 65535 |
| `WSPATH` | `/` | WebSocket 所使用的 HTTP 协议路径 |

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://dashboard.heroku.com/new?template=https://github.com/Acxym/UnblockNeteaseMusic-heroku)

## 接入 CloudFlare

以下两种方式均可以将应用接入 CloudFlare，从而在一定程度上提升速度。

 1. 为应用绑定域名，并将该域名接入 CloudFlare
 2. 通过 CloudFlare Workers 反向代理

## 注意

 1. **请勿滥用本专案，类似 Heroku 的免费服务少之又少，且用且珍惜**
 2. 若使用域名接入 CloudFlare，请考虑启用 TLS 1.3
 3. AWS 绝大部分 IPv4 地址已被 Twitter 屏蔽
