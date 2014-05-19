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
				<span><s:message code="teacher.list" text="業師名錄" /></span>
			</h2>

			<div id="listCon">

				<c:if test="${user.isStaff}">
					<a href="teacherAdd.htm" class="formIcon"><s:message code="teacher.new" text="新 增 業 師" /></a>
				</c:if>


				<table width="90%" border=1 class="listTable" cellpadding="0"
					cellspacing="0">
					<tr>
						<th align="center" width="10%">
							<s:message code="teacher.domain" text="領域" />
						</th>
						<th align="center" width="15%">
							<s:message code="teacher.name" text="姓名" />
						</th>
						<th align="center" width="15%">
							<s:message code="teacher.officehour" text="服務時間" />
						</th>
						<th align="center" width="45%">
							<s:message code="teacher.unit" text="單位" />
						</th>
						<th align="center" width="15%">
							<s:message code="teacher.title" text="職稱" />
						</th>
					</tr>

					<c:forEach items="${teacherList}" var="teacher">
						<tr>
							<td align="left">
								<span style="font-size: 14">${teacher.domain}</span>
							</td>
							<td align="left">
								<span style="font-size: 14"><a
									href="teacherView.htm?uid=${teacher.uid}">${teacher.name}</a> </span>
							</td>
							<td align="left">
								<span style="font-size: 14">${teacher.officeHour}</span>
							</td>
							<td align="left">
								<span style="font-size: 14">${teacher.unit}</span>
							</td>
							<td align="left">
								<span style="font-size: 14">${teacher.title}</span>
							</td>
						</tr>

					</c:forEach>
				</table>

			</div>

		</div>
		<!--container ends here--><%@ include file="/footer.jsp"%>
	</body>
</html>
