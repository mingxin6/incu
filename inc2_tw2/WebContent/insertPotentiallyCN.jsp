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
		var form = document.getElementById("myform");
		form.submit();
	}
</script>

</head>

<body >

	<div id="container">

		<%@ include file="/banner.jsp"%>

		<%@ include file="/menuPart.jsp"%>

		<form:form id="myform" method="POST" commandName="potent">
		<h2>潛在企業記錄添加</h2>
		<a href="PotentiallyCompanyNotes.htm">回一覽表</a>| <a href="javascript:submitform()">確定儲存</a>
		<br/>
		<br/>
		<div class="collapse-wrapper">
				<div class="header">
					<a href="#" class="collapse-toggle">基本資訊</a>
				</div>
				<div class="collapse-box">
					<table border='1' WIDTH="100%">
						<tr>
							<td WIDTH="25%" bgcolor=#CCCCCC>企業負責人姓名：</td>
							<td WIDTH="25%"><form:input path="companyPersonName" size="40" />&nbsp;</td>
							<td WIDTH="25%">企業名稱：</td>
							<td WIDTH="25%"><form:input path="companyName" size="40" />&nbsp;</td>
						</tr>
						<tr>
							<td>企業的性質：</td>
							<td><form:input path="companyNature" size="40" />&nbsp;</td>
							<td>企業的詳細地址：</td>
							<td><form:input path="companyAdress" size="40" />&nbsp;</td>
						</tr>
						<tr>
							<td>企業的固定電話：</td>
							<td><form:input path="companyPhone" size="40" />&nbsp;</td>
							<td>企業的郵箱地址：</td>
							<td><form:input path="companyMailbox" size="40" />&nbsp;</td>
						</tr>
					</table>
				</div>
			</div>
		</div>

	</form:form>
	</div>
	<%@ include file="/footer.jsp"%>
</body>
</html> 
