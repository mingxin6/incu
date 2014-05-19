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


		<h2 id="listTit">您的位置>統計報表><span>月報表</span></h2>

		<div id="listCon">
            <div class="temCon">
                <form:form method="POST" commandName="voMonthlyReportCondition">
                    <table width="540">
                        <tr>
                            <td>自:</td>
                            <td><form:select path="fromYear" class="sely">
                                    <form:options items="${years}"/>
                                </form:select></td>
                            <td>&#47;<form:select path="fromMonth" class="selm">
                                    <form:options items="${months}"/>
                                </form:select></td>
                            <td>至:</td>
                            <td><form:select path="toYear" class="sely">
                                    <form:options items="${years}"/>
                                </form:select></td>
                            <td>&#47;<form:select path="toMonth" class="selm">
                                    <form:options items="${months}"/>
                                </form:select></td>
                            <td><input type="submit" value="過&nbsp;&nbsp;濾" class="temBtn"/></td>
        
                        </tr>
                    </table>
                </form:form>
			</div>

		<a href="ExcelController.htm?output=ExcelMonthlyReportView" class="exportBtn">輸 出 Excel 表</a>
		

		<!--
		&nbsp;|&nbsp;
		<a href="QuarterlyRpt.htm">季報表</a>&nbsp;|&nbsp; <a
			href="YearlyRpt.htm">年報表</a> <br /> <br /> <br />
-->
		<!-- xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx -->

		<table width="1228" height="122" border="1" cellpadding="0" cellspacing="0" class="temTable">
			<tr>
				<th rowspan="2" valign="middle">年月</th>
				<th rowspan="2" valign="middle">銷售額(萬元)</th>
				<th colspan="4" align="center">申請智慧財產權數</th>

				<th rowspan="2" valign="middle">軟體產品(件)</th>
				<th rowspan="2" valign="middle">軟體著作權(件)</th>
				<th colspan="5" align="center">人員情況(人)</th>


			</tr>
			<tr>


				<th>發明專利(件)</th>
				<th>實用/新型專利(件)</th>
				<th>外觀專利(件)</th>
				<th>積體電路布圖(個)</th>


				<th>博士</th>
				<th>碩士</th>
				<th>本科</th>
				<th>大專</th>
				<th>總數</th>

			</tr>


			<c:forEach items="${monthlyreportlist}" var="mr">

				<tr>
					<td><c:choose>
							<c:when test="${mr.key=='Total'}">
								${mr.key}
							</c:when>
							<c:when test="${mr.value.status}">
								<a
									href="MonthlyReportOfCompsConfirmed.htm?key=${mr.key}&output=view">${mr.key}</a>
							</c:when>
							<c:otherwise>
								<a href="theMonthReports.htm?key=${mr.key}">${mr.key}</a>
							</c:otherwise>
						</c:choose></td>

					<c:choose>
						<c:when test="${mr.value.status}">
							<td align="center">${mr.value.revenue}</td>
							<td>${mr.value.ip_invent}</td>
							<td>${mr.value.ip_newType}</td>
							<td>${mr.value.ip_look}</td>
							<td>${mr.value.icDrawing}</td>
							<td>${mr.value.softwareProd}</td>
							<td>${mr.value.softwareBook}</td>

							<c:choose>
								<c:when test="${mr.key=='Total'}">
									<td>-</td>
									<td>-</td>
									<td>-</td>
									<td>-</td>
									<td>-</td>
								</c:when>
								<c:otherwise>
									<td>${mr.value.phd}</td>
									<td>${mr.value.master}</td>
									<td>${mr.value.proMajor}</td>
									<td>${mr.value.bachelor}</td>
									<td>${mr.value.totalEmployee}</td>
								</c:otherwise>
							</c:choose>





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
	<!--container ends here--><%@ include file="/footer.jsp"%>
</body>
</html> 
