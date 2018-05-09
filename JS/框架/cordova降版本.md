## 由于要引入百度sdk定位的插件，cordova7.0的目录结构与插件需要的cordova版本不一致，因此需要将cordova降版本处理

- 重新安装cordova6.3.0, 这是系统某些已安装插件所需要的最低的cordova版本

- 修改config.xml <engine name="android" spec="^5.0.0" /> 将7.0.0改成5.0.0
	因为7.0 platform add android 时 报错Error: cordovaProject.projectConfig.getFileResources is not a function

- If you have Android Studio installed, try to copy the templates directory of Android Studio
	C:\Program Files\Android\Android Studio\plugins\android\lib\templates
	to your android sdk tools directory:
	C:\Android\sdk\tools
	原因 cordova build报错: Error: Could not find gradle wrapper within Android SDK. Might need to update your Android SDK.

- cordova build 报错 : Error: cmd: Command failed with exit code 1 Error output:
	D:\appBuild6.5\sdApp\platforms\android\build\intermediates\res\merged\release\values-v24\values-v24.xml:3: AAPT: Error retrieving parent for item: No resource found that matches the given name 'android:TextAppearance.Material.Widget.Button.Borderless.Colored'.