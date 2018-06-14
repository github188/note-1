### 使用IOS云打包，可以通过浏览器进行IOS打包的过程，不必通过mac设备，构建过程将自动下载svn最新程序， <s>执行npm run build进行构建</s>（这一步逻辑并没有，需要自己执行完入库，再把构建的docs目录copy到platform/ios/www），并执行打包app，并在成功后将打包后的结果推送到蒲公英应用平台，可以扫描二维码进行下载，以下是改造工程和使用过程

## 改造现有工程

- 入库构建好的 platform/ios

- 修改 应用\platforms\ios\fastlane\Fastfile
	ENV["APP_NAME"] = "工业移动营销"  //应用名，与config.xml配置的name一致
	ENV["USER_KEY"] = "720eb79e84ac3b677da19692d7fe8454"  //蒲公英应用发布平台账号
	ENV["API_KEY"] = "fe0d3c3e35e13eebaf795680f627b588"  //蒲公英应用发布平台密码

## 浏览器使用
- 地址
	http://10.10.11.149:8081/jenkins/job/test2/63/console

- 创建项目，维护工程svn/platform/ios svn地址，维护svn用户名密码

- execute shell维护成
	```
		cd /Users/are/.jenkins/workspace/sdapp //上面取的项目名
		fastlane production  version:1.2.5
	```

- 返回工程界面，执行立即构建
