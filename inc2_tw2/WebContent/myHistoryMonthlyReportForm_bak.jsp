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

<script type="text/javascript">
	function submitform(type) {
		var form = document.getElementById("myform");
		form.dotype.value = type;
		form.submit();
	}
</script>

</head>

<body >

	<div id="container">

		<%@ include file="/banner.jsp"%>

		<%@ include file="/menuPart.jsp"%>


		<h2>歷史月報表</h2>


		<form:form id="myform" method="POST" commandName="mmm">
			<table>
				<tr>
					<td>開始年月:</td>
					<td><form:select path="voMonthlyReportCondition.fromYear">
							<form:options items="${years}" />
						</form:select></td>
					<td><form:select path="voMonthlyReportCondition.fromMonth">
							<form:options items="${months}" />
						</form:select></td>
					<td>結束年月:</td>
					<td><form:select path="voMonthlyReportCondition.toYear">
							<form:options items="${years}" />
						</form:select></td>
					<td><form:select path="voMonthlyReportCondition.toMonth">
							<form:options items="${months}" />
						</form:select></td>

					<td><a href="javascript: submitform('filter')">過濾</a></td>

				</tr>
			</table>
			<br />
			<a href="companyExcelList.htm?output=excel">輸出Excel表</a>&nbsp;|&nbsp;
		<a href="myMonthlyReportNew.htm">填寫本月報表</a>&nbsp;|&nbsp;<a
				href="javascript: submitform('save')">儲存</a>

			<form:hidden path="dotype" />

			<br />
			<br />
			<br />

			<!-- xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx -->

			<table border="1">
				<tr>
					<td rowspan="2" valign="middle">年月</td>
					<td rowspan="2" valign="middle">銷售額</td>
					<td colspan="4" align="center">申請智慧財產權數</td>

					<td rowspan="2" valign="middle">軟體產品</td>
					<td rowspan="2" valign="middle">軟體著作權</td>
					<td colspan="5" align="center">人員情況</td>

					<td rowspan="2" valign="middle">備註</td>
				</tr>
				<tr>


					<td>發明<br>專利
					</td>
					<td>實用/新型<br>專利
					</td>
					<td>外觀<br>專利
					</td>
					<td>積體電路<br>布圖
					</td>


					<td>博士</td>
					<td>碩士</td>
					<td>本科</td>
					<td>大專</td>
					<td>總數</td>

				</tr>


				<c:forEach items="${mmm.monthlyreportlist}" var="mr"
					varStatus="index">

					<tr>
						<td>${mr.key}</td>

						<form:hidden path="monthlyreportlist[${index.current.key}].uid" />
						<form:hidden
							path="monthlyreportlist[${index.current.key}].compName" />
						<form:hidden path="monthlyreportlist[${index.current.key}].year" />
						<form:hidden path="monthlyreportlist[${index.current.key}].month" />
						<form:hidden
							path="monthlyreportlist[${index.current.key}].yearMonth" />
						<form:hidden path="monthlyreportlist[${index.current.key}].status" />


						<c:choose>
							<c:when test="${mr.value.status}">

								<td align="right"><form:input size="4"
										path="monthlyreportlist[${index.current.key}].revenue" /></td>
								<td><form:input size="4"
										path="monthlyreportlist[${index.current.key}].ip_invent" /></td>
								<td><form:input size="4"
										path="monthlyreportlist[${index.current.key}].ip_newType" /></td>
								<td><form:input size="4"
										path="monthlyreportlist[${index.current.key}].ip_look" /></td>
								<td><form:input size="4"
										path="monthlyreportlist[${index.current.key}].icDrawing" /></td>
								<td><form:input size="4"
										path="monthlyreportlist[${index.current.key}].softwareProd" /></td>
								<td><form:input size="4"
										path="monthlyreportlist[${index.current.key}].softwareBook" /></td>
								<td><form:input size="4"
										path="monthlyreportlist[${index.current.key}].phd" /></td>
								<td><form:input size="4"
										path="monthlyreportlist[${index.current.key}].master" /></td>
								<td><form:input size="4"
										path="monthlyreportlist[${index.current.key}].proMajor" /></td>
								<td><form:input size="4"
										path="monthlyreportlist[${index.current.key}].bachelor" /></td>
								<td><form:input size="4"
										path="monthlyreportlist[${index.current.key}].totalEmployee" /></td>
								<td><form:input size="30"
										path="monthlyreportlist[${index.current.key}].remark" /></td>
							</c:when>

							<c:otherwise>
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
								<td>${mr.value.remark}</td>
							</c:otherwise>
						</c:choose>
					</tr>



				</c:forEach>
			</table>
		</form:form>

	</div>
	<!--container ends here--><%@ include file="/footer.jsp"%>
</body>
</html> 
