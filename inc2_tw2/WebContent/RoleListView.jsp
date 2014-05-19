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

</head>

<body >

	<div id="container">

				<%@ include file="/banner.jsp"%>

		<%@ include file="/menuPart.jsp"%>


		<h2>角色一覽表</h2>


		<a href="roleNew.htm">新增角色</a> <br /> <br /> <br />
		<table>
			<c:forEach items="${roleList}" var="role">
				<tr>
					<td>${role.seq}</td>
					<td><a href="roleEdit.htm?roleID=${role.roleName}">${role.roleName}</a></td>
					<td>${role.roleChineseName}</td>
				</tr>
			</c:forEach>
		</table>

	</div>
	<!--container ends here--><%@ include file="/footer.jsp"%>
</body>
</html> 
