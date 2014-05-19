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


		<h2>潛在企業</h2>
		<br /> <a href="InsertPotentiallyCN.htm">添加</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<!-- <a href="PotentiallyCompanyNotes.htm">刷新</a> -->
		<br />
		<br />
		<table border=1>
			<tr>
				<td align="center" width="4%">編號</td>
				<td align="center" width="16%">企業名稱</td>
				<td align="center" width="10%">負責人</td>
				<td align="center" width="10%">企業性質</td>
				<td align="center" width="10%">地址</td>
				<td align="center" width="10%">電話</td>
				<td align="center" width="10%">郵箱</td>
				
				<td align="center" width="10%">洽談人</td>
				<td align="center" width="10%">進度</td>
				
				<td align="center" width="10%">操作</td>
			</tr>



			<c:forEach items="${pcnlist}" var="comp">
				<c:if test="${comp.statusId==0}">
					<tr>
						<td align="center">${comp.id}</td>
						<td align="left"><span style="font-size: 16"><a
								href="TalkNotesById.htm?compId=${comp.id}">${comp.companyName}</a></span></td>
						<td align="center"><span style="font-size: 16">${comp.companyPersonName}</span></td>
						<td align="left"><span style="font-size: 16">${comp.companyNature}</span></td>
						<td align="left"><span style="font-size: 16">${comp.companyAdress}</span></td>
						<td align="center"><span style="font-size: 16">${comp.companyPhone}</span></td>
						<td align="center"><span style="font-size: 16">${comp.companyMailbox}</span></td>
						
						<td align="center"><span style="font-size: 16">${comp.contactPerson}</span></td>
						<td align="center"><span style="font-size: 16">${comp.contactStatus}</span></td>
						
						<td align="center"><span style="font-size: 16"><a
								href="DeletePotentiallyCN.htm?did=${comp.id}">刪除</a> | <a
								href="UpdatePotentiallyCN.htm?id=${comp.id}">修改</a></span></td>
					</tr>
				</c:if>
			</c:forEach>
		</table>

	</div>
	<!--container ends here--><%@ include file="/footer.jsp"%>
</body>
</html> 
