<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link type="text/css" href="pkg/jquery/mu.css" rel="stylesheet" />
		<link rel="stylesheet" href="css/listsheet.css">
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
				<span><s:message code="staff.list" text="中心人員名錄" /></span>
			</h2>

			<div id="listCon">

				<c:if test="${user.isStaff}">
					<a href="staffAdd.htm" class="formIcon"><s:message code="staff.new" text="新 增 中心人員" /></a>
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
							<s:message code="staff.name" text="姓名" />
						</th>
						<th align="center" width="15%">
							<s:message code="staff.officehour" text="服務時間" />
						</th>
						<th align="center" width="35%">
							<s:message code="statff.unit" text="單位" />
						</th>
						<th align="center" width="15%">
							<s:message code="staff.title" text="職稱" />
						</th>
						<th align="center" width="10%">
							<s:message code="staff.id" text="ID" />
						</th>
						<th align="center" width="10%">
							<s:message code="staff.status" text="狀態" />
						</th>
					</tr>

					<c:forEach items="${staffList}" var="staff">
						<tr>
						<%--
							<td align="left">
								<span style="font-size: 14">${staff.domain}</span>
							</td>
							 --%>
							<td align="left">
								<span style="font-size: 14"><a
									href="staffView.htm?uid=${staff.uid}">${staff.name}</a> </span>
							</td>
							<td align="left">
								<span style="font-size: 14">${staff.officeHour}</span>
							</td>
							<td align="left">
								<span style="font-size: 14">${staff.unit}</span>
							</td>
							<td align="left">
								<span style="font-size: 14">${staff.title}</span>
							</td>
							<td align="left">
								<span style="font-size: 14">${staff.userLoginId}</span>
							</td>
							<td align="left">
								<span style="font-size: 14">${staff.entityStatusRS}</span>
							</td>
						</tr>

					</c:forEach>
				</table>

			</div>

		</div>
		<!--container ends here--><%@ include file="/footer.jsp"%>
	</body>
</html>
