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

		<div id="container">

			<%@ include file="/banner2.jsp"%>
			<%@ include file="/menuPart.jsp"%>


			<h2 id="listTit">
				<span><s:message code="outsource.list" text="委外項目列表" />
				</span>
			</h2>

			<div id="listCon">

				<c:if test="${user.isStaff}">
					<a href="outsourceAdd.htm" class="addBtn"><span><s:message
								code="outsource.project.new" text="新 增 委 外 項 目" />
					</a>
				</c:if>


				<table width="90%" border=1 class="listTable" cellpadding="0"
					cellspacing="0">
					<tr>
						<th align="center" width="20%">
							<s:message code="outsource.item" text="委外項目" />
						</th>
						<th align="center" width="20%">
							<s:message code="outsource.contract.name" text="合約名稱" />
						</th>
						<th align="center" width="10%">
							<s:message code="outsource.contract.startdate" text="合約起日" />
						</th>
						<th align="center" width="10%">
							<s:message code="outsource.contract.enddate" text="合約迄日" />
						</th>
						<th align="center" width="10%">
							<s:message code="outsource.company" text="委外廠商" />
						</th>
						<th align="center" width="10%">
							<s:message code="outsource.amount" text="金額" />
						</th>
						<th align="center" width="10%">
							<s:message code="outsource.email" text="郵箱" />
						</th>
						<th align="center" width="10%">
							<s:message code="outsource.phone" text="電話" />
						</th>
					</tr>

					<c:forEach items="${outsourceList}" var="outsource">
						<tr>
							<td align="left">
								<span style="font-size: 14"><a
									href="outsourceView.htm?uid=${outsource.uid}">${outsource.proj}</a>
								</span>
							</td>

							<td align="left">
								<span style="font-size: 14">${outsource.contractName}</span>
							</td>

							<td align="left">
								<span style="font-size: 14">${outsource.contractStartDate}</span>
							</td>

							<td align="left">
								<span style="font-size: 14">${outsource.contractEndDate}</span>
							</td>

							<td align="left">
								<span style="font-size: 14">${outsource.outSourceCompany}</span>
							</td>

							<td align="left">
								<span style="font-size: 14">${outsource.amount}</span>
							</td>

							<td align="left">
								<span style="font-size: 14">${outsource.email}</span>
							</td>

							<td align="left">
								<span style="font-size: 14">${outsource.phone}</span>
							</td>

						</tr>

					</c:forEach>
				</table>

			</div>

		</div>
		<!--container ends here--><%@ include file="/footer.jsp"%>
	</body>
</html>
