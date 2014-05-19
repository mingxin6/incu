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

		<div id="container">

			<%@ include file="/banner2.jsp"%>
			<%@ include file="/menuPart.jsp"%>


			<h2 id="listTit">
				<span>審查列表</span>
			</h2>

			<div id="listCon">

				<!--  
				<a href="reviewPaperAdd.htm" class="addBtn">新 增 書審</a>
-->
				<table width="100%" border=1 class="listTable" cellpadding="0"
					cellspacing="0">
					<tr>
						<th align="center" width="35%">
							公司
						</th>
						<th align="center" width="8%">
							日期
						</th>
						<th align="center" width="7%">
							分數
						</th>
						<th align="center" width="40%">
							備註
						</th>
						<th align="center" width="10%">
							狀態
						</th>
					</tr>
					<c:forEach items="${reviewPaperJobList}" var="rpjob">
						<tr>
							<td align="left">
								<a
									href="reviewPaperJobEdit.htm?reviewPaperResultUid=${rpjob.reviewPaperResultUid}"><span
									style="font-size: 14">${rpjob.companyName}</span> </a>
							</td>
							<td align="left">
								<span style="font-size: 14">${rpjob.reviewPaper.thedate}</span>
							</td>
							<td align="right">
								<span style="font-size: 14">${rpjob.score}</span>
							</td>
							<td align="right">
								<span style="font-size: 14">${rpjob.remark}</span>
							</td>

							<td align="center">
								<span style="font-size: 14">${rpjob.status}</span>
							</td>

						</tr>

					</c:forEach>
				</table>

			</div>

		</div>
		<!--container ends here--><%@ include file="/footer.jsp"%>
	</body>
</html>
