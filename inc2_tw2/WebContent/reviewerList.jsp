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
				<span><s:message code="reviewer.list" text="審查委員名錄" /></span>
			</h2>

			<div id="listCon">

				<c:if test="${user.isStaff}">
					<a href="reviewerAdd.htm" class="formIcon"><s:message code="reviewer.new" text="新 增 審 查 委 員" /></a>
				</c:if>


				<table width="90%" border=1 class="listTable" cellpadding="0"
					cellspacing="0">
					<tr>
						<th align="center" width="10%">
							<s:message code="reviewer.name" text="姓名" />
						</th>
						<th align="center" width="20%">
							<s:message code="reviewer.email" text="郵箱" />
						</th>
						<th align="center" width="20%">
							<s:message code="reviewer.phone" text="電話" />
						</th>
						<th align="center" width="20%">
							<s:message code="reviewer.unit" text="單位" />
						</th>
						<th align="center" width="20%">
							<s:message code="reviewer.title" text="職稱" />
						</th>
						<th align="center" width="10"%">
							<s:message code="reviewer.status" text="狀態" />
						</th>
					</tr>

					<c:forEach items="${reviewerList}" var="reviewer">
						<tr>
							<td align="left">
								<span style="font-size: 14"><a
									href="reviewerView.htm?uid=${reviewer.uid}">${reviewer.name}</a>
								</span>
							</td>

							<td align="left">
								<span style="font-size: 14">${reviewer.email}</span>
							</td>

							<td align="left">
								<span style="font-size: 14">${reviewer.phone}</span>
							</td>


							<td align="left">
								<span style="font-size: 14">${reviewer.unit}</span>
							</td>
							<td align="left">
								<span style="font-size: 14">${reviewer.title}</span>
							</td>
							<td align="left">
								<span style="font-size: 14">${reviewer.entityStatusRS}</span>
							</td>
						</tr>

					</c:forEach>
				</table>

			</div>

		</div>
		<!--container ends here--><%@ include file="/footer.jsp"%>
	</body>
</html>
