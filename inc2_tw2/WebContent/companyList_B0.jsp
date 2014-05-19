<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link type="text/css" href="pkg/jquery/mu.css" rel="stylesheet" />
		<link rel="stylesheet" href="css/list_sheet.css" />
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
				<span>申請紀錄</span>
			</h2>

			<div id="listCon">


				<table width="100%" border=1 class="listTable" cellpadding="0"
					cellspacing="0">
					<tr>

						<th align="center" width="25%">
							公司名稱
						</th>
						<th align="center" width="8%">
							申請
						</th>
						<th align="center" width="8%">
							成立
						</th>
						<th align="center" width="17%">
							領域
						</th>
						<th align="center" width="8%">
							資本額
						</th>



						<th align="center" width="6%">
							聯絡人
						</th>
						<th align="center" width="6%">
							電話
						</th>
						<th align="center" width="10%">
							Email
						</th>


						<th align="center" width="12%">
							狀態
						</th>
					</tr>




					<c:forEach items="${compList}" var="comp">
						<tr>
							<td align="left">
								<a href="compView_B0.htm?compID=${comp.uid}"><span
									style="font-size: 14">${comp.compName}</span> </a>
							</td>
							<td align="left">
								<span style="font-size: 14">${comp.createdTime2}</span>
							</td>
							<td align="left">
								<span style="font-size: 14">${comp.registerDate2}</span>
							</td>
							<td align="left">
								<span style="font-size: 14">${comp.domain}</span>
							</td>
							<td align="right">
								<span style="font-size: 14">${comp.registerCaptial}</span>
							</td>

							<td align="center">
								<span style="font-size: 14">${comp.adminContact}</span>
							</td>
							<td align="center">
								<span style="font-size: 14">${comp.adminContactPhone}</span>
							</td>
							<td align="left">
								<span style="font-size: 14">${comp.adminContactEmail2}</span>
							</td>
							<td align="left">
								<span style="font-size: 14">${comp.compStatus}</span>
							</td>
							<!-- 
							<td align="left">
								<span style="font-size: 14"><a
									href="TalkNotesById_B.htm?compName=${comp.compName}&compId=${comp.uid}">記錄(${comp.recCount})</a>
								</span>
							</td>
							-->
						</tr>

					</c:forEach>
				</table>

			</div>

		</div>
		<!--container ends here--><%@ include file="/footer.jsp"%>
	</body>
</html>
