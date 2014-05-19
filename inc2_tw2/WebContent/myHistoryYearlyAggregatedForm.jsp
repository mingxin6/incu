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


		<h2>年報表</h2>

		<%-- 
		<form:form method="POST" commandName="voMonthlyReportCondition">
			<table>
				<tr>
					<td>開始年月:</td>
					<td><form:select path="fromYear">
							<form:options items="${years}" />
						</form:select></td>
					<td><form:select path="fromMonth">
							<form:options items="${months}" />
						</form:select></td>
					<td>結束年月:</td>
					<td><form:select path="toYear">
							<form:options items="${years}" />
						</form:select></td>
					<td><form:select path="toMonth">
							<form:options items="${months}" />
						</form:select></td>
					<td><input type="submit" value="過濾" /></td>
					
				</tr>
			</table>
		</form:form>

--%>
		<br /> <a href="QuarterlyReportExcel.htm?output=excel">輸出Excel表</a>

		<!-- 	
		
		<a href="myMonthlyReportNew.htm">季報表</a> <br /> <br /> <br />
-->
		<!-- xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx -->

		<table border="1">
			<tr>
				<td rowspan="2" valign="middle">年</td>
				<td rowspan="2" valign="middle">銷售額(萬元)</td>
				<td colspan="4" align="center">申請智慧財產權數</td>

				<td rowspan="2" valign="middle">軟體產品(件)</td>
				<td rowspan="2" valign="middle">軟體著作權(件)</td>
				<td colspan="5" align="center">人員情況(人)</td>


			</tr>
			<tr>


				<td>發明專利(件)</td>
				<td>實用/新型專利(件)</td>
				<td>外觀專利(件)</td>
				<td>積體電路布圖(個)</td>


				<td>博士</td>
				<td>碩士</td>
				<td>本科</td>
				<td>大專</td>
				<td>總數</td>

			</tr>


			<c:forEach items="${yearlyreportlist}" var="mr">

				<tr>
					<td><a
						href="theYearReports.htm?key=${mr.key}&f=${mr.value.status}">${mr.key}</a></td>

					<c:choose>
						<c:when test="${mr.value.status}">
							<td align="right">${mr.value.revenue}</td>
							<td>${mr.value.ip_invent}</td>
							<td>${mr.value.ip_newType}</td>
							<td>${mr.value.ip_look}</td>
							<td>${mr.value.icDrawing}</td>
							<td>${mr.value.softwareProd}</td>
							<td>${mr.value.softwareBook}</td>
							<td>${mr.value.phd}</td>
							<td>${mr.value.master}</td>
							<td>${mr.value.proMajor}</td>
							<td>${mr.value.bachelor}</td>
							<td>${mr.value.totalEmployee}</td>


						</c:when>
						<c:otherwise>
							<td align="right">${mr.value.revenue} xxx</td>
							<td>${mr.value.ip_invent}</td>
							<td>${mr.value.ip_newType}</td>
							<td>${mr.value.ip_look}</td>
							<td>${mr.value.icDrawing}</td>
							<td>${mr.value.softwareProd}</td>
							<td>${mr.value.softwareBook}</td>
							<td>${mr.value.phd}</td>
							<td>${mr.value.master}</td>
							<td>${mr.value.proMajor}</td>
							<td>${mr.value.bachelor}</td>
							<td>${mr.value.totalEmployee}</td>

						</c:otherwise>
					</c:choose>
				</tr>

			</c:forEach>
		</table>


	</div>
	<!--container ends here--><%@ include file="/footer.jsp"%>
</body>
</html> 
