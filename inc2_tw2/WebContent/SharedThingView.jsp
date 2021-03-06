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

		<h2 id="listTit">您的位置>${SharedThing.title}</h2>
        
		<div id="listCon">
		<a href="SharedThingList.htm?type=${type}" class="refIcon">回列表</a>

		<c:if test="${user.userAuth.managerMenu}"> | <a
				href="SharedThingEdit.htm?type=${type}&aid=${SharedThing.aid}" class="saveIcon">編輯</a>
		</c:if>
<!-- 
		<h1>公告資訊</h1>
-->
		<br>

		<table border='1' cellpadding="0" cellspacing="0" class="listTable" WIDTH="98%">
			<tr>
				<th WIDTH="25%" bgcolor=#CCCCCC>標題：</th>
				<td WIDTH="75%">${SharedThing.title}&nbsp;</td>
			</tr>
			<tr>
				<th>內容：</th>
				<td>${SharedThing.message}&nbsp;</td>
			</tr>
			
			<!-- 
			<tr>
				<td>發佈人：</td>
				<td>${SharedThing.createName}&nbsp;</td>
			</tr>
			-->
			
			<tr>
				<th>發佈時間：</th>
				<td>${SharedThing.createDate}&nbsp;</td>
			</tr>

			<tr>
				<th>文件下載：</th>
				<td><c:forEach items="${SharedThing.fileInfo}" var="obj">
				<a href="downLoadFile.htm?aid=${SharedThing.aid}&fName=${obj.originalFileName}&mName=${obj.modifiedFileName}">${obj.originalFileName}</a><br>
					</c:forEach></td>
			</tr>

			<c:if test="${user.userAuth.managerMenu}">
				<tr>
					<th>公告狀態：</th>
					<td>${SharedThing.status}&nbsp;</td>
				</tr>
			</c:if>

		</table>
		</div>



	</div>
	<!--container ends here 1--><%@ include file="/footer.jsp"%>
</body>
</html> 
