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
				<span><s:message code="parking.bike.list" text="機車停車位列表" /></span>
			</h2>

			<div id="listCon">

				<c:if test="${user.isStaff}">
					<a href="parkingLotBikeAdd.htm" class="formIcon"><s:message code="parking.bike.new" text="新增機車停車位" /></a>
				</c:if>


				<table width="90%" border=1 class="listTable" cellpadding="0"
					cellspacing="0">
					<tr>

						<th align="center" width="10%">
							<s:message code="parking.bike.no" text="機車停車位號碼" />
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

					<c:forEach items="${parkingLotBikeList}" var="parkingLotBike">
						<tr>
							<td align="left">
								<span style="font-size: 14"><a
									href="parkingLotBikeView.htm?uid=${parkingLotBike.uid}">${parkingLotBike.parkingLotBikeNo}</a> </span>
							</td>

							<td align="left">
								<span style="font-size: 14">${parkingLotBike.usedBy}</span>
							</td>


							<td align="left">
								<span style="font-size: 14">${parkingLotBike.remark}</span>
							</td>

							<td align="left">
								<span style="font-size: 14">${parkingLotBike.entityStatusRS}</span>
							</td>



						</tr>

					</c:forEach>
				</table>

			</div>

		</div>
		<!--container ends here--><%@ include file="/footer.jsp"%>
	</body>
</html>
