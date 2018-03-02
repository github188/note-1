# ajax --》 V6框架使用基于jquery的ajax，使用ajax进行必要的校验


## 官网
http://api.jquery.com/category/ajax/
$.ajax({
  url: "test.html"
}).done(function() {
  $( this ).addClass( "done" );
});

## 使用ajax提交表单要引入form.js
ajaxSubmit({
	target: '#output',          //把服务器返回的内容放入id为output的元素中
	beforeSubmit: showRequest,  //提交前的回调函数  beforeSubmit会在表单提交前被调用，如果beforeSubmit返回false，则会阻止表单提交
	success: showResponse,      //提交后的回调函数
	//url: url,                 //默认是form的action， 如果申明，则会覆盖
	//type: type,               //默认是form的method（get or post），如果申明，则会覆盖  
	//dataType: null,           //html(默认), xml, script, json...接受服务端返回的类型  
	//clearForm: true,          //成功提交后，清除所有表单元素的值
	//resetForm: true,          //成功提交后，重置所有表单元素的值
	timeout: 3000               //限制请求的时间，当请求大于3秒后，跳出请求 
});