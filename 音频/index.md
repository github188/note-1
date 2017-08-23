# OpenCV 是一个基于BSD许可（开源）发行的跨平台计算机视觉库
# RTMP 
# Red5是一个采用Java开发开源的Flash流媒体服务器。它支持：把音频（MP3）和视频（FLV）转换成播放流； 录制客户端播放流（只支持FLV）；共享对象；现场直播流发布；远程调用。Red5使用RTMP, RTMPT, RTMPS, 和RTMPE作为流媒体传输协议，在其自带的一些示例中演示了在线录制，flash流媒体播放，在线聊天，视频会议等一些基本功能。

Red5 is an Open Source Flash Server written in Java that supports:

Streaming Video (FLV, F4V, MP4, 3GP)

Streaming Audio (MP3, F4A, M4A, AAC)

Recording Client Streams (FLV and AVC+AAC in FLV container)

Shared Objects

Live Stream Publishing

Remoting

Protocols: RTMP, RTMPT, RTMPS, and RTMPE

Additional features supported via plugin:

WebSocket (ws and wss)

RTSP (From Axis-type cameras)

HLS


HTML 5 直播有几种方案： 
（当然为了照顾国内大环境， Flash fallback 还是得有的） 
1. HLS 
ajax 读分片， JS 转一下容器，加上 mp4 的 header/box ，用 media source extension 来播放，在移动端上可以直接播放。 
优点： HTTP 协议， CDN 友好，还可以跟 iOS 必备的 HLS 用一套源，免得服务器切片一堆东西，支持所有主流浏览器。 
缺点：比 dash 占用稍微高一点点，延迟至少一个 GOP + 网络传输时间。 

2. DASH 
ajax 读分片，利用 media source extension 来播放 
优点： HTTP 协议， CDN 友好，比 HLS 稍快点，支持所有主流浏览器。 
缺点：服务器需要切片 hls + dash 两套，降低 cdn 缓存利用率，延迟至少一个 GOP + 网络传输时间。 

3. Matroska 
真正意义上的流，<video> 标签直接播放，具体看这里： https://matroska.org/technical/streaming/index.html 
注意别转码，别转码，别转码，直接封装 rtmp 推上来的 h264 进去，每个请求来的时候生成一份 metadata ，做重传，不用等到一个关键帧就可以播放。 
优点：速度最快占用最低，延迟可以做到跟 rtmp 一个级别 
缺点：只支持 Chromium-based 浏览器，没法用 CDN 


直播不需要什么配置，大部分情况下都是重新封装一下视频容器，树莓派也能扛几千人。 
除非你要转码，或者你用的 Java 写的媒体服务器。