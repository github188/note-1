## VUE的DOM更新根据见到的资料来看，是比传统的更新方式要高效。根据源码调试，有以下一些机制

- 由未知的技术，实现了页面Input元素输入的时候，修改vm data的数据 （待学习）
	补充： 虽然最终的原理还没有贯通，但是最终是通过 \vue\src\core\vdom\helpers\update-listeners.js
	updateListeners函数实现的dom变化调用数据变更的逻辑
	
	```
		set: function reactiveSetter (newVal) {
			var value = getter ? getter.call(obj) : val;
			/* eslint-disable no-self-compare */
			if (newVal === value || (newVal !== newVal && value !== value)) {
				return
			}
			/* eslint-enable no-self-compare */
			if ("development" !== 'production' && customSetter) {
				customSetter();
			}
			if (setter) {
				setter.call(obj, newVal);
			} else {
				val = newVal;
			}
			childOb = !shallow && observe(newVal);
			dep.notify(); //执行到这一行
		}
	```
	dep 对象是 Watcher 与数据变更抽象出来的中间层，数据变化时通过dep对象通知Watcher，Watcher收集依赖，即deps属性，同时dep将Watcher加入到自己的subs属性。

- Watcher对象收到数据变化的通知，执行update，调用queueWatcher
	watcher的expression属性为
	```
		function () {
			vm._update(vm._render(), hydrating);
		}
	```

- queueWatcher缓存此次wathcer变化，等待当前执行栈无执行任务，nextTick 执行 flushSchedulerQueue

- 通过MessageChannel对象，实现回调调用 flushCallbacks

- 调用栈走到flushSchedulerQueue，去执行所有缓存的Watcher的变化

- 执行Watcher的run函数，调用Watcher.get()，执行this.getter
	```
		vm._update(vm._render(), hydrating);
	```

- vm._render()构造出了一个VDom对象， _update则将更新写到浏览器dom流

- 具体执行浏览器dom渲染的对象是 \vue\src\platforms\web\runtime\node-ops.js