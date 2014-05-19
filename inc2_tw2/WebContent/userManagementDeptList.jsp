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

</head>

<body >

	<div id="container">

		<%@ include file="/banner.jsp"%>
		<%@ include file="/menuPart.jsp"%>

		<h2 id="listTit">您的位置>部門資訊</h2>

		<div id="listCon">

			<table width="1228" height="122" border="1" cellpadding="0" cellspacing="0" class="temTable">
				<tr>
					<th align="center">編號</th>
					<th align="center">部門</th>
					<th align="center">主要職責</th>
					<th align="center">連絡人</th>
					<th align="center">聯繫電話</th>
					
				
				</tr>
			<c:if test="${IsShow}">
				<c:forEach items="${managementDeptList}" var="obj">
					<tr>
						<td align="center">${obj.seq}</td>
						<td align="center">${obj.department}</td>
						<td align="center">${obj.duty}</td>
						<td align="center">${obj.contacts}</td>
						<td align="center">${obj.tel}</td>
						
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
	</div>
	<!--container ends here--><%@ include file="/footer.jsp"%>
</body>
</html> 
