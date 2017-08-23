# node.js后台开发基本都会碰到使用 req.param()、req.params 、 req.query、 req.body获取参数的情况， 那么它们有哪些区别呢？以下详细分析之：

## /user/tobi for /user/:name
## req.param('name')
- express路由器传递的参数;
- 地址栏参数；
- postt提交的参数，例如表单中input的值， ajax（异步）提交的对象值等。


## 与req.param()方法相比 该属性只能获取 “express路由器传递的参数”,  值得一提的是： 与req.params配合还能在express路由器中玩正则。
## GET /user/tj
## req.params.name


## req.query 该属性用法最为简单， 直接获取地址栏传递的参数；示例代码如下：
## req.query.order

## req.body 该属性主要用与post方法时传递参数使用， 用法最为广泛也最为常见， 例子也比较多（写这部分最累了有木有）。需要说明下的是使用该属性时， 得先确认app.js中有没有导入“body-parser”， 该模块在express4.x中已经脱离为独立的模块。示例代码如下：