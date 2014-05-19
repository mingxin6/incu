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

		<%@ include file="/banner2.jsp"%>

		<%@ include file="/menuPart.jsp"%>


		<h2>潛在企業記錄</h2>
		<table border=1>
			<tr>
				<td align="center" width="4%">編號</td>
				<td align="center" width="10%">洽談的主題</td>
				<td align="center" width="10%">洽談的內容</td>
				<td align="center" width="13%">洽談的開始時間</td>
				<td align="center" width="13%">洽談的結束時間</td>
				<td align="center" width="13%">我方洽談負責人</td>
				<td align="center" width="13%">客戶洽談負責人</td>
				<td align="center" width="10%">洽談地址</td>
			</tr>

		


			<c:forEach items="${tnlist}" var="comp">
				<tr>
					<td align="center">${comp.id}</td>
					<td align="center"><span style="font-size: 16">${comp.talkTheme}</span></td>
					<td align="center"><span style="font-size: 16">${comp.talkContent}</span></td>
					<td align="center"><span style="font-size: 16">${comp.talkStartTime}</span></td>
					<td align="center"><span style="font-size: 16">${comp.talkEndTime}</span></td>
					<td align="center"><span style="font-size: 16">${comp.myPersonincharge}</span></td>
					<td align="center"><span style="font-size: 16">${comp.otherPersonincharge}</span></td>
					<td align="center"><span style="font-size: 16">${comp.talkAddress}</span></td>
				</tr>
			</c:forEach>
		</table>

	</div>
	<!--container ends here--><%@ include file="/footer.jsp"%>
</body>
</html> 
