# 协议概览

协议包含两部分：握手，数据传输。

## 客户端的握手如下：
- GET /chat HTTP/1.1
- Host: server.example.com
- Upgrade: websocket
- Connection: Upgrade
- Sec-WebSocket-Key: dGhlIHNhbXBsZSBub25jZQ==
- Origin: http://example.com
- Sec-WebSocket-Protocol: chat, superchat
- Sec-WebSocket-Version: 13
发起握手是为了兼容基于HTTP的服务端程序，这样一个端口可以同时处理HTTP客户端和WebSocket客户端
因此WebSocket客户端握手是一个HTTP Upgrade请求

## 服务端的握手如下：
- HTTP/1.1 101 Switching Protocols
- Upgrade: websocket
- Connection: Upgrade
- Sec-WebSocket-Accept: s3pPLMBiTxaQ9kYGzzhZRbK+xOo=
- Sec-WebSocket-Protocol: chat
客户端和服务端都发送了握手，并且成功，数据传输即可开始。