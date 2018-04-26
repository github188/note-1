## MessageChannel

- 调试VUE源码的时候发现，DOM更新的时候用到了这么一个技术，作为一个调用回调的脚手架来用的，
	那么为什么要用到这么个对象，而不是直接setTimeout( callback, 0 )呢

- MessageChannel接口是信道通信API的一个接口，它允许我们创建一个新的信道并通过信道的两个MessagePort属性来传递数据

- 简单来说，MessageChannel创建了一个通信的管道，这个管道有两个口子，每个口子都可以通过postMessage发送数据，
	而一个口子只要绑定了onmessage回调方法，就可以接收从另一个口子传过来的数据。

- 当我们使用多个web worker并想要在两个web worker之间实现通信的时候，MessageChannel就可以派上用场：

	什么是 Web Worker？
	当在 HTML 页面中执行脚本时，页面的状态是不可响应的，直到脚本已完成。

	web worker 是运行在后台的 JavaScript，独立于其他脚本，不会影响页面的性能。您可以继续做任何愿意做的事情：
	点击、选取内容等等，而此时 web worker 在后台运行。

	```
	<script>
			var w1 = new Worker("worker1.js");
			var w2 = new Worker("worker2.js");
			var ch = new MessageChannel();
			w1.postMessage("initial port",[ch.port1]);
			w2.postMessage("initial port",[ch.port2]);
			w2.onmessage = function(e){
				console.log(e.data);
			}
	<script>
	```

- 然而搜索VUE的源码，并没有发现Worker对象,使用该对象的代码：

	```
	if (typeof MessageChannel !== 'undefined' && (
		isNative(MessageChannel) ||
		// PhantomJS
		MessageChannel.toString() === '[object MessageChannelConstructor]'
	)) {
		const channel = new MessageChannel()
		const port = channel.port2
		channel.port1.onmessage = flushCallbacks
		macroTimerFunc = () => {
			port.postMessage(1)
		}
	}
	```

- 因此，这里仅仅是用来代替setTimeout来实现回调函数的逻辑