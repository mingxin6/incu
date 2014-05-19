<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" href="pkg/jquery/mu.css" rel="stylesheet" />
<link type="text/css" href="pkg/jquery/mu.css" rel="stylesheet" />
<script type="text/javascript" src="pkg/jquery/jquery.js"></script>
<link href="pkg/menu/p7exp.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="pkg/menu/p7exp.js"></script>

</head>

<body >

	<div id="container">

			<%@ include file="/banner.jsp"%>

		<%@ include file="/menuPart.jsp"%>

		<h2>新增角色與許可權</h2>

		<form:form method="POST" commandName="userAuth">
			<form:errors path="*" cssClass="errorblock" element="div" />
			<table>
				<tr>
					<td>角色代號*:</td>
					<td><form:input path="roleName" />&nbsp;<form:errors
							path="roleName" cssClass="error" /></td>
				</tr>
				<tr>
					<td>角色名稱* :</td>
					<td><form:input path="roleChineseName" />&nbsp;<form:errors
							path="roleChineseName" cssClass="error" /></td>
				</tr>
				<tr>
					<td>企業資訊? :</td>
					<td><form:checkbox path="compList" /></td>
				</tr>
				<tr>
					<td>統計報表? :</td>
					<td><form:checkbox path="statistics" /></td>
				</tr>


				

				<tr>
					<td colspan="3"><input type="submit" value="確定" /></td>
				</tr>
			</table>
		</form:form>

	</div>
	<!--container ends here--><%@ include file="/footer.jsp"%>
</body>
</html> 
