# 传参和获取参数
- { path: '/chooseByDate/:visitDate' }
- router.push( { path:'/chooseByDate/'+this.visitDate,params:{visitDate:this.visitDate} } )
- this.$route.params.visitDate
- 使用params传递的参数，在路由进去的组件中使用 $route.params 获取到的是空的，那这个参数是干嘛用的？

- $route.path 字符串，对应当前路由的路径，总是解析为绝对路径，如 "/foo/bar"。
- route.params 一个 key/value 对象，包含了 动态片段 和 全匹配片段，如果没有路由参数，就是一个空对象。
- route.query 一个 key/value 对象，表示 URL 查询参数。例如，对于路径 /foo?user=1，
则有 $route.query.user == 1，如果没有查询参数，则是个空对象。
- $route.fullPath 完成解析后的 URL，包含查询参数和 hash 的完整路径。