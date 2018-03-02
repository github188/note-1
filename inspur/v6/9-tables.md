# 示例
<div class="divBody">
	//头部信息和按钮
	<div class="buttonRightContainer">
		<button class="topBackButton" onclick="forReturn()">返回</button>
		<label class="pageLable" margin-left="0px">零售户采集结果录入</label>	
		<button class="topFunButton" onclick="forSave()">保存</button>	
	</div>
	<form id="form1"  method="post" action="">
		//查询条件部分  
		<div class="queryTableContainer">
			<div class="queryTableleft"  >
				<table class="queryTable" style="width:90%">
				<tr class="tableTrSize">
						<td class="queryLabelTd"><label >零售户姓名: </label></td>
						<td class="queryCaseTd"><input type="text" name="managerSearch" value="${managerSearch}" /></td>
						<td class="queryLabelTd"><label>店面名称: </label></td>
						<td class="queryCaseTd"><input type="text" name="cust_nameSearch" value="${cust_nameSearch}" /></td>
						<td class="queryLabelTd"><label>零售户编码: </label></td>
						<td class="queryCaseTd"><input type="text" name="cust_idSearch" value="${cust_idSearch}" /></td>
						
						<td>
							<div class="buttonQueryContainer">
								<input type="button" class="floatSearch" onclick="forSearch()" />
							</div>
						</td>
				</tr>
				</table>
			</div>
			<div class="queryTableright">
				<a class="moreQueryCaseIcon" state="close" trNumVisableWhenClose="3"></a>
				<button   type="button"  class="searchBtn"	onclick="forSearch()" ></button>
			</div>	
		</div>	
		
		<table id="flexme1"  class="flexigrid" width="100%" >
		//删除
		<td style="text-align: center">
			<span class="hide">
				<img class="hand" src="/skin/${cookie['skin'].value}/flexgrid/delete.png" onclick="doDeleteRow()"></img>
			</span>
		</td>
		//更新
		<td class="aligncenter" >
			<span class="hide"> 
				<img src="/skin/${cookie['skin'].value}/flexgrid/update.png" onclick="forPrint('${listObj.CUST_ID}')"></img>
			</span>
		</td>        
		
		</table>
		
		//翻页
		<div class="pageBarContainer">
			<div class="left">共${rowcount}条 分${totalpages}页</div>
			<div class="right">
				<%@ include file="/jsp/pub/webCtrl/pagebar.jsp"%>
				 <%@ include file="/jsp/pub/webCtrl/excelbar.jsp"%>
			</div>	
		</div>				
</div>		