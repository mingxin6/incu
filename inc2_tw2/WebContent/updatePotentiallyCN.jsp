<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" href="pkg/jquery/mu.css" rel="stylesheet" />
<script type="text/javascript" src="pkg/jquery/jquery.js"></script>


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



		<h2>潛在企業記錄修改</h2>

		<form:form id="myform" method="POST" commandName="pcn">

			<a href="PotentiallyCompanyNotes.htm">回一覽表</a>| <a
				href="javascript:submitform()">確定儲存</a>
			<br />
			<br />
			<div>

				<div>
					<table border='1' WIDTH="100%">
						<tr>
							<td align="center" WIDTH="25%">企業名稱：</td>
							<td WIDTH="25%"><form:input path="companyName" />&nbsp;</td>

							<td align="center" WIDTH="25%" bgcolor=#CCCCCC>負責人：</td>
							<td WIDTH="25%"><form:input path="companyPersonName" />&nbsp;</td>

						</tr>
						<tr>
							<td align="center">企業性質：</td>
							<td><form:input path="companyNature" />&nbsp;</td>
							<td align="center">地址：</td>
							<td><form:input path="companyAdress" />&nbsp;</td>
						</tr>
						<tr>
							<td align="center">電話：</td>
							<td><form:input path="companyPhone" />&nbsp;</td>
							<td align="center">郵箱：</td>
							<td><form:input path="companyMailbox" />&nbsp;</td>
						</tr>
						
						<tr>
							<td align="center">洽談人：</td>
							<td><form:input path="contactPerson" />&nbsp;</td>
							<td align="center">進度：</td>
							<!-- 
							<td><form:input path="contactStatus" />&nbsp;</td>
							-->
							<td><form:select path="contactStatus">
									<form:options items="${statusCond}" />
								</form:select></td>
								
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
