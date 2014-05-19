<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>
<%@ page   import="java.net.URLEncoder"%> 

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

		<h2>共用資源下載</h2>

	<br /> <br />

			<table border=1>
			<tr>
					<td align="center">編號</td>
					<td align="center">資源分類</td>
					<td align="center">資源描述</td>
					<td align="center"></td>
				
				</tr>
			
			<c:if test="${IsShow}">
				<c:forEach items="${sharedResourcesList}" var="obj">
		
				<tr>
					<td align="center">${obj.seq }</td>
					<td align="center">${obj.srname }</td>
					<td align="center">${obj.remark }</td>
					<td align="center"><a href="filedownload.htm?action=${obj.srname}&type=sr_${obj.srid}">相關資料下載</a></td>
						
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
	<!--container ends here--><%@ include file="/footer.jsp"%>
</body>
</html> 
