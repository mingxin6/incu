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
				<span><s:message code="room.list" text="培育間列表" /></span>
			</h2>

			<div id="listCon">

				<c:if test="${user.isStaff}">
					<a href="roomAdd.htm" class="formIcon"><s:message code="room.new" text="新增培育間" /></a>
				</c:if>


				<table width="90%" border=1 class="listTable" cellpadding="0"
					cellspacing="0">
					<tr>

						<th align="center" width="10%">
							<s:message code="room.no" text="培育間號碼" />
						</th>
						<th align="center" width="10%">
							<s:message code="room.floor" text="樓層" />
						</th>
						<th align="center" width="50%">
							<s:message code="room.company" text="公司" />
						</th>
						<th align="center" width="10%">
							<s:message code="room.area" text="坪數" />
						</th>
						<th align="center" width="10%">
							<s:message code="my.remark" text="備註" />
						</th>
						<th align="center" width="10%">
							<s:message code="my.status" text="狀態" />
						</th>

					</tr>

					<c:forEach items="${roomList}" var="room">
						<tr>
							<td align="left">
								<span style="font-size: 14"><a
									href="roomView.htm?uid=${room.uid}">${room.roomNo}</a> </span>
							</td>

							<td align="left">
								<span style="font-size: 14">${room.floor}</span>
							</td>

							<td align="left">
								<span style="font-size: 14">${room.compName}</span>
							</td>

							<td align="left">
								<span style="font-size: 14">${room.roomArea}</span>
							</td>

							<td align="left">
								<span style="font-size: 14">${room.remark}</span>
							</td>

							<td align="left">
								<span style="font-size: 14">${room.entityStatusRS}</span>
							</td>



						</tr>

					</c:forEach>
				</table>

			</div>

		</div>
		<!--container ends here--><%@ include file="/footer.jsp"%>
	</body>
</html>
