## 安装Cordova
- npm install -g cordova

## 新建Cordova项目:
- cordova create imrSichuan

## 添加Android平台:
- cordova platform add android

## 打包:
- cordova build --release android

## 证书加密：
- jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore inspur.keystore app-release-unsigned.apk inspur




## 版本更新
- cordova-hcp build
- 注意login.html index.html必须引入cordova.js



- https://note.youdao.com/share/?id=038c7a222492015b7d379ee326738a12&type=note#/

## 原生通知
- https://github.com/zjcboy/ionic2-jpush-demo
- https://docs.jiguang.cn/jpush/server/sdk/java_sdk/

- adb devices -l 查看当前连接到本级的手机列表