## 安装Cordova
- npm install -g cordova

## 新建Cordova项目:
- cordova create imrSichuan

## 添加Android平台:
- cordova platform add android

## 打包:
- cordova build --release android

## 证书加密：
- jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore inspur.keystore android-release-unsigned.apk inspur




## 版本更新
- cordova-hcp build
- 注意login.html index.html必须引入cordova.js



- https://note.youdao.com/share/?id=038c7a222492015b7d379ee326738a12&type=note#/

## 原生通知
- https://github.com/zjcboy/ionic2-jpush-demo
- https://docs.jiguang.cn/jpush/server/sdk/java_sdk/

- adb devices -l 查看当前连接到本级的手机列表

- cordova plugin add https://github.com/ETENG-OSP/cordova-plugin-baidu-geolocation.git --variable API_KEY=qwoE9jjwcfoAPLnQcfxyOZfQ2rbzrv4d --save

- cordova plugin add cordova-plugin-bdlocation --variable ANDROID_API_KEY=qwoE9jjwcfoAPLnQcfxyOZfQ2rbzrv4d --variable IOS_API_KEY=qwoE9jjwcfoAPLnQcfxyOZfQ2rbzrv4d --save

- cordova plugin add cordova-plugin-baidumaplocation --variable ANDROID_KEY=qwoE9jjwcfoAPLnQcfxyOZfQ2rbzrv4d  --variable IOS_KEY=qwoE9jjwcfoAPLnQcfxyOZfQ2rbzrv4d

- https://www.npmjs.com/package/cordova-plugin-baidumaplocation


- copyFileSync: could not write to dest file (code=EPERM):C:\myApp\platforms\android\res\xml\config.xml
- 解决: 以管理员运行脚本


包名 com.inspur.sdApp
keytool -list -v -keystore inspur.keystore
SHA1: A7:C2:ED:5D:1A:7C:85:BB:A5:68:CE:56:39:1B:04:79:CC:20:6F:18

android ak
jP7TexuLLz6P4omhqKoReFLrADMD5bk6

ios ak
tTkoCtSECCQMjVdDbGKSgUL0f0fQVByp

- 安装cordova过程中遇到错误
	npm ERR! path C:\Users\zhangwenjie\AppData\Roaming\npm\node_modules\cordova\node_modules\insight\package.json.1204456938
	npm ERR! code EPERM
	npm ERR! errno -4048
	npm ERR! syscall rename
	npm ERR! Error: EPERM: operation not permitted, rename 'C:\Users\zhangwenjie\AppData\Roaming\npm\node_modules\cordova\node_modules\insight\package.json.1204456938' -> 'C:\Users\zhangwenjie\AppData\Roaming\npm\node_modules\cordova\no
	de_modules\insight\package.json'

	猜想可能是某公司的电脑，个人用户的权限有问题或者有全局安装的npm包冲突了，把全局安装的npm包位置改到D盘去

	npm config ls
	npm config set prefix "D:\\npm"
	环境变量增加 D:\npm