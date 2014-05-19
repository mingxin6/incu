<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link type="text/css" href="pkg/jquery/mu.css" rel="stylesheet" />
<link rel="stylesheet" href="css/listsheet.css" />
<script type="text/javascript" src="pkg/jquery/jquery.js"></script>
<link href="pkg/menu/p7exp.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="pkg/menu/p7exp.js"></script>

<script type="text/javascript">

	function submitform() {
		$('#action').val('back');
		$('#myform').submit();
	}
	function submitform2() {
		
		$('#action').val('saveback');
		$('#myform').submit();
	}
</script>

</head>

<body onLoad="P7_ExpMenu()">

	<div id="container">

		<%@ include file="/banner.jsp"%>
		<%@ include file="/menuPart.jsp"%>

		<h2 id="listTit">您的位置>新增交流活動</h2>

		<div id="listCon">
        
		<form:form id="myform" method="POST" commandName="actvisitor">
		
			<form:errors path="*" cssClass="errorblock" element="div" />
			
			<a href="activityList.htm" class="formIcon">回一覽表</a> | <a href="javascript:submitform()" class="okIcon">儲存返回</a> | <a href="javascript:submitform2()" class="saIcon">儲存繼續</a>

			
			<div class="collapse-wrapper">
				<div class="header">
					<a href="#" class="collapse-toggle">活動企業來賓管理</a>
				</div>
				<div class="collapse-box">
				
				<form:hidden path="action" id="action"/>
				
					<table border="1" cellpadding="0" cellspacing="0" class="listTable" WIDTH="100%">
						<tr>
							<th>企業名稱：</th>
							<td><form:input path="companyname" size="80" />&nbsp;
							<form:errors path="companyname" cssClass="error" /></td>
						</tr>
						<tr>
							<th>連絡人：</th>
							<td><form:input path="contacts" size="80" />&nbsp;
							<form:errors path="contacts" cssClass="error" />
							</td>
						</tr>
						<tr>
							<th>電話：</th>
							<td><form:input path="tel" size="80" />&nbsp;
							<form:errors path="tel" cssClass="error" />
							</td>
						</tr>
						<tr>
							<th>是否已建立商務關係：</th>
							<td>
							<form:select path="compid">
									<form:options items="${statusCond}" />
								</form:select>&nbsp;
							</td>
						</tr>
						<tr>
							<th>是否已轉為潛在進駐企業：</th>
							<td><form:select path="status">
									<form:options items="${statusCondSec}" />
								</form:select>&nbsp;</td>
						</tr>
					</table>
				</div>
			</div>
			
			</form:form>
        
	<div id="container1">
			<table width="1228" height="123" border="1" cellpadding="0" cellspacing="0" class="temTable">
				<tr>
					<th align="center">編號</th>
					<th align="center">公司名稱</th>
					<th align="center">連絡人</th>
					<th align="center">電話</th>
					<th align="center">商務關係</th>
					<th align="center">狀態</th>
					<th align="center">管理</th>
				
				</tr>
			<c:if test="${IsShow}">
				<c:forEach items="${actvisitorList}" var="obj">
					<tr>
						<td align="center">${obj.seq}</td>
						<td align="center">${obj.companyname}</td>
						<td align="center">${obj.contacts}</td>
						<td align="center">${obj.tel}</td>
						<td align="center">
						<c:if test="${obj.compid==-1}">
							不存在商務關係
						</c:if>
						<c:if test="${obj.compid==-2}">
							已建立商務關係
						</c:if>
						</td>
						
						<td align="center">
						<c:if test="${obj.status==1}">
							潛在進駐企業
						
						</c:if>
						<c:if test="${obj.status==0}">
							非潛在進駐企業
						
						</c:if>
						</td>
						
					<td align="center"><a href="actVisitorAdd.htm?avid=${obj.avid}&actid=${obj.actid}" class="btnEdit">修改</a></td>
					
				
					</tr>
				</c:forEach>
</c:if>
<c:if test="${!IsShow}">
			<tr>
				<td align="center" colspan="6">暫無部門資訊</td>
			</tr>
</c:if>
			</table>

	</div>
		<script>
			$('.collapse-wrapper').autoCollapser().on(
					'autoCollapser.toggle.start',
					function(event, data) {
						console.log("Collapser has started "
								+ (data.show ? 'expanding' : 'collasping'));
					}).on(
					'autoCollapser.toggle.after',
					function(event, data) {
						console.log("Collapser was successfully "
								+ (data.show ? 'expanded' : 'collasped'));
					});
		</script>
		</div>
	</div>
	<!--container ends here-->

</body>
</html>
