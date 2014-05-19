<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" href="pkg/jquery/mu.css" rel="stylesheet" />
<script type="text/javascript" src="pkg/jquery/jquery.js"></script>
<script type="text/javascript" src="pkg/jquery/jQuery.autoCollapser.js"></script>

<link href="pkg/menu/p7exp.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="pkg/menu/p7exp.js"></script>

<script type="text/javascript">

	function submitform() {
		$('#myform').submit();
	}
	
</script>

</head>

<body >

	<div id="container">

		<%@ include file="/banner.jsp"%>
		<%@ include file="/menuPart.jsp"%>

		<h2>共用資源管理</h2>

		<form:form id="myform" method="POST" commandName="sharedResources">
		
			<form:errors path="*" cssClass="errorblock" element="div" />
			
			 <a href="javascript:submitform()">確定儲存</a>
			<br>
			<br>
			
			<div class="collapse-wrapper">
				<div class="header">
					<a href="#" class="collapse-toggle">添加分類</a>
				</div>
				<div class="collapse-box">
				<form:hidden path="srid" />
				
					<table border='1' WIDTH="100%">
						<tr>
							<td>資源類別：</td>
							<td><form:input path="srname" size="80" />&nbsp;
							<form:errors path="srname" cssClass="error" /></td>
						</tr>
						<tr>
							<td>資源描述：</td>
							<td><form:input path="remark" size="80" />&nbsp;
							<form:errors path="remark" cssClass="error" /></td>
						</tr>
		 			</table>
				</div>
			</div>
			
		</form:form>
	<div id="container1">
			<table border=1>
				<tr>
					<td align="center">編號</td>
					<td align="center">資源類別</td>
					<td align="center">資源描述</td>
					
					<td align="center">管理</td>
					
				
				</tr>
			<c:if test="${IsShow}">
				<c:forEach items="${sharedResourcesList}" var="obj">
					<tr>
						<td align="center">${obj.seq}</td>
						<td align="center">${obj.srname}</td>						
						<td align="center">${obj.remark}</td>						
						
					<td align="center"><a href="fileupload.htm?action=${obj.srname}&type=sr_${obj.srid}">[文件上傳]</a></td>
					
				
					</tr>
				</c:forEach>
</c:if>
<c:if test="${!IsShow}">
			<tr>
				<td align="center" colspan="6">暫無共用資源信息</td>
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
	<!--container ends here-->
<%@ include file="/footer.jsp"%>
</body>
</html> 
