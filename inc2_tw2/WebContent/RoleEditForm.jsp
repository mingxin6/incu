<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><link type="text/css" href="pkg/jquery/mu.css" rel="stylesheet" />
<link type="text/css" href="pkg/jquery/mu.css" rel="stylesheet" />
<script type="text/javascript" src="pkg/jquery/jquery.js"></script>
<link href="pkg/menu/p7exp.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="pkg/menu/p7exp.js"></script>

</head>

<body >

	<div id="container">

			<%@ include file="/banner.jsp"%>

		<%@ include file="/menuPart.jsp"%>



		<h2>角色許可權維護</h2>

		<form:form method="POST" commandName="userAuth">

			<table>
				<tr>
					<td>角色代號:</td>
					<td>${userAuth.roleName}</td>
				</tr>
				<tr>
					<td>角色名稱 :</td>
					<td><form:input path="roleChineseName" /></td>
				</tr>
				<tr>
					<td>企業資訊? :</td>
					<td><form:checkbox path="compList" /></td>
				</tr>
				<tr>
					<td>統計報表? :</td>
					<td><form:checkbox path="statistics" /></td>
				</tr>


				<form:hidden path="roleName" />

				<tr>
					<td colspan="3"><input type="submit" value="確定" /></td>
				</tr>
			</table>
		</form:form>

	</div>
	<!--container ends here--><%@ include file="/footer.jsp"%>
</body>
</html> 
