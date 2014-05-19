<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" href="pkg/jquery/mu.css" rel="stylesheet" />
<link rel="stylesheet" href="css/listsheet.css" />
<script type="text/javascript" src="pkg/jquery/jquery-1.9.1.js"></script>
<link href="pkg/menu/p7exp.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="pkg/menu/p7exp.js"></script>


<script src="pkg/jquery/jquery-ui.js"></script>
<link rel="stylesheet" href="pkg/jquery/jquery-ui.css" />
<link rel="stylesheet" href="style.css" />

</head>

<body >

	<div id="container">

		<%@ include file="/banner.jsp"%>

		<%@ include file="/menuPart.jsp"%>


		<h2 id="listTit">您的位置>${year}年報表</h2>

		<div id="listCon">
		<a href="theYearReports.htm?key=${year}&output=excel" class="refIcon">輸出Excel表</a>
		<!-- xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx -->

		<table border="1" cellpadding="0" cellspacing="0" class="listTable" WIDTH="98%">
			<tr>
				<th rowspan="2" valign="middle">No.</th>
				<th rowspan="2" valign="middle">企業名稱</th>
				<th rowspan="2" valign="middle">銷售額(萬元)</th>
				<th colspan="4" align="center">申請智慧財產權數</th>

				<th rowspan="2" valign="middle">軟體產品(件)</th>
				<th rowspan="2" valign="middle">軟體著作權(件)</th>
				<th colspan="5" align="center">人員情況(人)</th>

				<th rowspan="2" valign="middle">備註</th>
			</tr>
			<tr>


				<th>發明<br>專利(件)
				</th>
				<th>實用/新型<br>專利(件)
				</th>
				<th>外觀<br>專利(件)
				</th>
				<th>積體電路<br>布圖(個)
				</th>


				<th>博士</th>
				<th>碩士</th>
				<th>本科</th>
				<th>大專</th>
				<th>總數</th>

			</tr>


			<c:forEach items="${comps}" var="mr">
				<tr>
					<td>${mr.seq}</td>
					<td>${mr.compName}</td>



					<c:choose>
						<c:when test="${mr.status}">

							<td align="right">${mr.revenue}</td>
							<td>${mr.ip_invent}</td>
							<td>${mr.ip_newType}</td>
							<td>${mr.ip_look}</td>
							<td>${mr.icDrawing}</td>
							<td>${mr.softwareProd}</td>
							<td>${mr.softwareBook}</td>
							


							<c:choose>
								<c:when test="${mr.compName=='Total'}">
									<td>-</td>
									<td>-</td>
									<td>-</td>
									<td>-</td>
									<td>-</td>
								</c:when>
								<c:otherwise>
									<td>${mr.phd}</td>
									<td>${mr.master}</td>
									<td>${mr.proMajor}</td>
									<td>${mr.bachelor}</td>
									<td>${mr.totalEmployee}</td>
								</c:otherwise>
							</c:choose>

							<td>${mr.remark}</td>
						</c:when>



						<c:otherwise>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>

						</c:otherwise>
					</c:choose>

				</tr>
			</c:forEach>
		</table>
		</div>

	</div>
	<!--container ends here-->

<%@ include file="/footer.jsp"%>
</body>
</html> 
