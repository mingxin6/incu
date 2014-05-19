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
				<span>企業用戶名錄</span>
			</h2>

			<div id="listCon">

				<c:if test="${user.isStaff}">
					<a href="companyUserAdd.htm" class="addBtn">新 增 企業用戶</a>
				</c:if>


				<table width="90%" border=1 class="listTable" cellpadding="0"
					cellspacing="0">
					<tr>
					<%--
						<th align="center" width="10%">
							領域
						</th>
						 --%>
						<th align="center" width="15%">
							姓名
						</th>
						<th align="center" width="40%">
							公司名稱
						</th>
						<th align="center" width="15%">
							郵件
						</th>
						<th align="center" width="15%">
							電話
						</th>
						<th align="center" width="15%">
							狀態
						</th>
					</tr>

					<c:forEach items="${companyUserList}" var="companyUser">
						<tr>
						<%--
							<td align="left">
								<span style="font-size: 14">${companyUser.domain}</span>
							</td>
							 --%>
							<td align="left">
								<span style="font-size: 14"><a
									href="companyUserView.htm?uid=${companyUser.uid}">${companyUser.name}</a> </span>
							</td>
							<td align="left">
								<span style="font-size: 14">${companyUser.compName}</span>
							</td>
							<td align="left">
								<span style="font-size: 14">${companyUser.email}</span>
							</td>
							<td align="left">
								<span style="font-size: 14">${companyUser.phone}</span>
							</td>
							<td align="left">
								<span style="font-size: 14">${companyUser.status}</span>
							</td>
						</tr>

					</c:forEach>
				</table>

			</div>

		</div>
		<!--container ends here--><%@ include file="/footer.jsp"%>
	</body>
</html>
