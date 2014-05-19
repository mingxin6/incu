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

<script type="text/javascript">
	function submitform(type) {
		var form = document.getElementById("myform");
		form.dotype.value = type;
		form.submit();
	}
</script>

</head>

<body >
	<div style="width:100%; height:17px; background:url(images/topbg.png) repeat-x; margin-top:8px;"></div>
	<div id="container">
		<table width="1000" border="0"  cellpadding="0" border="0" style="margin:20px auto 0;">
              <tr>
                    <td width="239" align="left"><img src="images/nsi_header.png" height="70"></td>
                    <td>&nbsp;</td>
              </tr>
        </table>
		<%@ include file="/banner.jsp"%>

		<%@ include file="/menuPart.jsp"%>


		<h2 id="listTit">您的位置><span>歷史月報表</span></h2>


		<form:form id="myform" method="POST" commandName="monthlyreportlist">
		
        <div id="listCon">

			<a href="myMonthlyReportNew.htm" class="addIcon">填寫月報表</a>


			<!-- xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx -->

			<table width="1228" height="122" border="1" cellpadding="0" cellspacing="0" class="temTable">
				<tr>
					<th rowspan="2" valign="middle">年月</th>
					<th rowspan="2" valign="middle">銷售額(萬元)</th>
					<th colspan="4" align="center">申請智慧財產權數</th>

					<th rowspan="2" valign="middle">軟體產品(件)</th>
					<th rowspan="2" valign="middle">軟體著作權(件)</th>
					<th colspan="5" align="center">人員情況(人)</th>

					<th rowspan="2" valign="middle">備註</th>
				</tr>
				<tr>


					<th>發明專利
					</th>
					<th>實用/新型專利(件)
					</th>
					<th>外觀專利(件)
					</th>
					<th>積體電路布圖(個)
					</th>


					<th>博士</th>
					<th>碩士</th>
					<th>本科</th>
					<th>大專</th>
					<th>總數</th>

				</tr>


				<c:forEach items="${monthlyreportlist}" var="mr">
					<tr>
						<td>${mr.key}</td>

						<td align="center">${mr.value.revenue}</td>
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
					</tr>



				</c:forEach>
			</table>
		</form:form>
		</div>
	</div>
	<!--container ends here--><%@ include file="/footer.jsp"%>
</body>
</html> 
