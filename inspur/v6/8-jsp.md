# jsp --》 JavaServer Pages 基于java的模板引擎

## jsp基础，内置对象，静态引入，动态引入
<%@ include file=” ”%>
通常当应用程序中所有的页面的某些部分（例如标## 页脚和导航栏）都相同的时候，就可以考虑用include。
<%@ include file=” ”%>,jsp的include指令元素读入指定页面的内容。并把这些内容和原来的页面融合到一起。(这个过程是在翻译阶段:也就是jsp被转化成servlet的阶段进行的。)
<jsp:include>元素允许你包含动态文件和静态，这两种包含文件的结果是不同的。
如果文件仅是静态文件，那么这种包含仅仅是把包含文件的内容加到jsp文件中去，而如果这个文件动态的，那么这个被包含文件也会被Jsp编译器执行。

## charset pageEncoding 统一使用编码utf-8编码

## 使用website标签技术组装框架和业务页面
	<website:screenHolder/> //业务页面被引入到框架页面

## jsp逻辑控制使用jstl表达式，不要嵌入java代码

## jsp注释
html注释<!-- -->
jsp注释<%-- --%>

## 组织下拉列表的方式如下，其中statusList为后台传递的字典枚举map对象
<select name="statusSearch" sel="${statusSearch}" multiple="multiple">
	<c:forEach items="${statusList}" var="statusEnum">
		<option value="${statusEnum.key}">${statusEnum.value}</option>
	</c:forEach>
</select>

## V6框架的分页功 导出excel功能，需要引入以下widget
<div class="pageBarContainer">
	<div class="left">共${rowcount}条 分${totalpages}页</div>
	<div class="right">
		<%@ include file="/jsp/pub/webCtrl/pagebar.jsp"%>
		<%@ include file="/jsp/pub/webCtrl/excelbar.jsp"%>
	</div>
</div>

## 导出excel需要在表格表头添加额外的属性columvalue，如果是枚举值需要转换，要添加属性enum，对于数字需要添加属性dimColumn=true

## 如果表格某列要增加排序功能，需要在表头加<a href="${flexigridsorturl}COL_NAME">表头</a>