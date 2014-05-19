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
		<!-- <div
			style="width: 100%; height: 17px; background: url(images/topbg.png) repeat-x; margin-top: 8px;"></div> -->
		<div id="container">
			<!-- <table width="1000" border="0" cellpadding="0" border="0"
				style="margin: 20px auto 0;">
				<tr>
					<td width="239" align="left">
						<img src="images/nsi_header.png" height="70">
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
			</table> -->
			<%@ include file="/banner2.jsp"%>
			<%@ include file="/menuPart.jsp"%>


			<h2 id="listTit"> 
				<s:message code="yourposition" text="您的位置" />>
				<s:message code="menuPart.system.manager"  text="系統設定" />>
				<span><s:message code="menuPart.system.setting" text="系統管理者設定" /></span>
			</h2>

			<div id="listCon">

				<c:if test="${user.isStaff}">
					<a href="administratorAdd.htm" class="formIcon"><s:message code="administratorlist.newadmin" text="新增系統管理員" /></a>
				</c:if>


				<table width="90%" border=1 class="listTable" cellpadding="0"
					cellspacing="0">
					<tr>
						<th align="center" width="50%">
							<s:message code="administratorlist.name" text="姓名" />
						</th>
						<th align="center" width="20%">
							<s:message code="administratorlist.mailbox" text="郵箱" />
						</th>
						<th align="center" width="20%">
							<s:message code="administratorlist.tel" text="電話" />
						</th>
						
						<%--
						<th align="center" width="20%">
							單位
						</th>
						<th align="center" width="20%">
							職稱
						</th>
						--%>
						
						<th align="center" width="10"%">
							<s:message code="administratorlist.status" text="狀態" />
						</th>
					</tr>

					<c:forEach items="${administratorList}" var="administrator">
						<tr>
							<td align="left">
								<span style="font-size: 14"><a
									href="administratorView.htm?uid=${administrator.uid}">${administrator.name}</a>
								</span>
							</td>

							<td align="left">
								<span style="font-size: 14">${administrator.email}</span>
							</td>

							<td align="left">
								<span style="font-size: 14">${administrator.phone}</span>
							</td>

<%--
							<td align="left">
								<span style="font-size: 14">${administrator.unit}</span>
							</td>
							<td align="left">
								<span style="font-size: 14">${administrator.title}</span>
							</td>
							--%>
							
							<td align="left">
								<span style="font-size: 14">${administrator.entityStatusRS}</span>
							</td>
						</tr>

					</c:forEach>
				</table>

			</div>

		</div>
		<!--container ends here--><%@ include file="/footer.jsp"%>
	</body>
</html>
