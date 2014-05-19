<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link type="text/css" href="pkg/jquery/mu.css" rel="stylesheet" />
		<link rel="stylesheet" href="css/list_sheet.css">
		<script type="text/javascript" src="pkg/jquery/jquery.js">
</script>
		<link href="pkg/menu/p7exp.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="pkg/menu/p7exp.js">
</script>

	</head>

	<body>
		<div
			style="width: 100%; height: 17px; background: url(images/topbg.png) repeat-x; margin-top: 8px;"></div>
		<div id="container">
			<table width="1000" border="0" cellpadding="0" border="0"
				style="margin: 20px auto 0;">
				<tr>
					<td width="239" align="left">
						<img src="images/nsi_header.png" height="70">
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
			</table>
			<%@ include file="/banner.jsp"%>
			<%@ include file="/menuPart.jsp"%>


			<h2 id="listTit">
				<span>財務記錄</span>
			</h2>

			<div id="listCon">
				<div class="midCon">
					<form:form method="POST" commandName="voYearMonthCondition">
						<table>
							<tr>
								<td>
									年:
								</td>
								<td>
									<form:select path="year" class="listSel">
										<form:option value="NONE" label="---" />
										<form:options items="${selectYear}" />
									</form:select>
								</td>
								<td></td>
							</tr>
							<tr>
								<td>
									月:
								</td>
								<td>
									<form:select path="month" class="listSel">
										<form:option value="NONE" label="---" />
										<form:options items="${selectMonth}" />
									</form:select>
								</td>
								<td>
									<input type="submit" value="過濾" class="filterBtn" />
								</td>
							</tr>
						</table>
					</form:form>
				</div>

				<!-- 
				<a href="companyExcelList.htm?output=excel" class="exportBtn">輸
					出 Excel 表</a>
				<a href="compNew.htm" class="addBtn">新 增 公司</a>

				
				<table width="1228" border=1 class="listTable" cellpadding="0"
					cellspacing="0">
					-->


				<table width="90%" border=1 class="listTable" cellpadding="0"
					cellspacing="0">
					<tr>
						<th align="center" width="8%">
							編號
						</th>
						<th align="center" width="20%">
							公司名稱
						</th>
						<th align="center" width="11%">
							統編
						</th>
						<th align="center" width="6%">
							狀態
						</th>
						<th align="center" width="10%">
							房租
						</th>
						<th align="center" width="10%">
							管理費
						</th>
						<th align="center" width="10%">
							水電費
						</th>
						<th align="center" width="10%">
							耗材費
						</th>
						<th align="center" width="15%">
							合計
						</th>
					</tr>




					<c:forEach items="${feesList}" var="fee">
						<tr>
							<td align="center">
								<span style="font-size: 14">${fee.cid}</span>
							</td>

							<td align="left">
								<span style="font-size: 14">${fee.compName}</span>
							</td>
							<td align="left">
								<span style="font-size: 14">${fee.registerId}</span>
							</td>

							<td align="center">

								<c:if test="${!fee.status}">
									<img src="images/greencircle.png" width="10" />
								</c:if>

								<c:if test="${fee.status}">
									<img src="images/yellowcircle.png" width="10" />
								</c:if>



							</td>


							<td align="right">
								<span style="font-size: 14">${fee.rent}</span>
							</td>
							<td align="right">
								<span style="font-size: 14">${fee.managementFee}</span>
							</td>
							<td align="right">
								<span style="font-size: 14">${fee.utilityFee}</span>
							</td>
							<td align="right">
								<span style="font-size: 14">${fee.consumableFee}</span>
							</td>
							<td align="right">
								<span style="font-size: 14">${fee.total}</span>
							</td>
						</tr>

					</c:forEach>
				</table>

			</div>

		</div>
		<!--container ends here--><%@ include file="/footer.jsp"%>
	</body>
</html>
