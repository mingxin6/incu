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

		<div id="listCon">
			<a href="problemsList.htm" class="refIcon">回公告列表</a>
			<div >
				<div class="header">
					<a href="#" class="collapse-toggle">公告資訊</a>
				</div>
				<div >
					<table border='1' cellpadding="0" cellspacing="0" class="listTable" WIDTH="98%">
						<tr>
							<th  align="center" WIDTH="25%" bgcolor=#CCCCCC>公告標題：</th>
							<td WIDTH="75%">${pcn.theme}&nbsp;</td>
						</tr>
						<tr>
							<th  align="center" >公告內容：</th>
							<td>${pcn.content}&nbsp;</td>
						</tr>
						<!--  
						<tr>
							<td>發佈人：</td>
							<td>${pcn.announcePerson}&nbsp;</td>
						</tr>
						-->
						<tr>
							<th  align="center">發佈時間：</th>
							<td>${pcn.times}&nbsp;</td>
						</tr>
					</table>
				</div>
                </div>
			</div>
		

		

	</div>
	<!--container ends here 1--><%@ include file="/footer.jsp"%>
</body>
</html> 
