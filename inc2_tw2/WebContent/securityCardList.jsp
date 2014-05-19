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
				<span><s:message code="securiycard.list" text="門禁卡列表" /></span>
			</h2>

			<div id="listCon">

				<c:if test="${user.isStaff}">
					<a href="securityCardAdd.htm" class="addBtn"><s:message code="securiycard.new" text="新增門禁卡" /></a>
				</c:if>


				<table width="90%" border=1 class="listTable" cellpadding="0"
					cellspacing="0">
					<tr>

						<th align="center" width="10%">
							<s:message code="securiycard.no" text="門禁卡號碼" />
						</th>
						<th align="center" width="10%">
							<s:message code="my.user" text="使用人" />
						</th>

						<th align="center" width="10%">
							<s:message code="my.remark" text="備註" />
						</th>
						<th align="center" width="10%">
							<s:message code="my.status" text="狀態" />
						</th>

					</tr>

					<c:forEach items="${securityCardList}" var="securityCard">
						<tr>
							<td align="left">
								<span style="font-size: 14"><a
									href="securityCardView.htm?uid=${securityCard.uid}">${securityCard.securityCardNo}</a> </span>
							</td>

							<td align="left">
								<span style="font-size: 14">${securityCard.usedBy}</span>
							</td>


							<td align="left">
								<span style="font-size: 14">${securityCard.remark}</span>
							</td>

							<td align="left">
								<span style="font-size: 14">${securityCard.entityStatusRS}</span>
							</td>



						</tr>

					</c:forEach>
				</table>

			</div>

		</div>
		<!--container ends here--><%@ include file="/footer.jsp"%>
	</body>
</html>
