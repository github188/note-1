#整个框架以spring为核心，完全采用注解的方式实现依赖注入
#认证与授权
##User currentUser = (User) request.getSession().getAttribute(Constants.CURRENT_USER); 根据session中是否有属性判断是否已经登录系统
##currentUser.getPermissionSet(); 获取功能权限，有无数据权限未知