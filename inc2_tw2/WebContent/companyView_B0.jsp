<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link type="text/css" href="pkg/jquery/mu.css" rel="stylesheet" />
		<link rel="stylesheet" href="css/listsheet.css" />

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
				您的位置>${comp.compName}
			</h2>

			<div id="listTit">
				(${comp.compStatus})
				<br />

				${comp.remark}

			</div>

			<div id="listCon">

 <a href="compList_B0.htm" class="saveIcon">回一覽表</a>
 
				<%--
				<c:if test="${comp.isNewApplying}">
					<!-- <a href="compList_B0.htm" class="saveIcon">回一覽表</a> |-->
					<a href="compEdit_B0.htm?uid=${comp.uid}" class="saveIcon">編輯</a> | <a
						href="compDel_B0.htm?uid=${comp.uid}" class="saveIcon">刪除</a>
				</c:if>
				--%>
				
				<%--
				<c:if test="${comp.isDenied}">
					<a
						href="compDel_B0.htm?uid=${comp.uid}" class="saveIcon">刪除</a>
				</c:if>
				--%>


				<!-- <a href="compList_B0.htm" class="saveIcon">回一覽表</a> |-->
				<%--
				<a href="compEdit_B0.htm?uid=${comp.uid}" class="saveIcon">編輯</a> |
				<a href="compDel_B0.htm?uid=${comp.uid}" class="saveIcon">刪除</a>
 --%>

				<div class="collapse-wrapper">
					<div class="header">
						公司資訊
					</div>
					<div class="collapse-box">
						<table border='1' cellpadding="0" cellspacing="0"
							class="listTable" WIDTH="100%">
							<tr>
								<th align="right" WIDTH="25%" bgcolor=#CCCCCC>
									公司名稱：
								</th>
								<td>
									${comp.compName}&nbsp;
								</td>
								<th WIDTH="25%" align="right">
									統一編號：
								</th>
								<td>
									${comp.registerId}&nbsp;
								</td>
							</tr>

							<tr>
								<th WIDTH="25%" align="right">
									公司成立日期：
								</th>
								<td>
									${comp.registerDate}&nbsp;
								</td>
								<th WIDTH="25%" align="right">
									負責人：
								</th>
								<td>
									${comp.representative}&nbsp;
								</td>

							</tr>

							<tr>
								<th WIDTH="25%" align="right">
									&nbsp;
								</th>
								<td>
									&nbsp;
								</td>
								<th WIDTH="25%" align="right">
									公司領域：
								</th>
								<td>
									${comp.domain}&nbsp;
								</td>
							</tr>

							<tr>
								<th WIDTH="25%" align="right">
									員工人數：
								</th>
								<td>
									${comp.totalEmployees}&nbsp;
								</td>
								<th WIDTH="25%" align="right">
									資本額（元）：
								</th>
								<td>
									${comp.registerCaptial}&nbsp;
								</td>
							</tr>

							<tr>
								<th WIDTH="25%" align="right">
									&nbsp;
								</th>
								<td>
									&nbsp;
								</td>
								<th WIDTH="25%" align="right">
									需求坪數：
								</th>
								<td>
									${comp.roomArea}&nbsp;
								</td>
							</tr>
						</table>
					</div>
				</div>

				<div class="collapse-wrapper">
					<div class="header">
						聯絡人資訊
					</div>
					<div class="collapse-box">
						<table border='1' cellpadding="0" cellspacing="0"
							class="listTable" WIDTH="100%">
							<tr>
								<th WIDTH="25%" align="right">
									聯絡人：
								</th>
								<td>
									${comp.adminContact}&nbsp;
								</td>
								<th WIDTH="25%" align="right">
									聯絡人電話：
								</th>
								<td>
									${comp.adminContactPhone}&nbsp;
								</td>
							</tr>
							<tr>
								<th WIDTH="25%" align="right">
									聯絡人手機：
								</th>
								<td>
									${comp.adminContactMobilePhone}&nbsp;
								</td>
								<th WIDTH="25%" align="right">
									聯絡人信箱：
								</th>
								<td>
									${comp.adminContactEmail2}&nbsp;
								</td>
							</tr>
						</table>
					</div>
				</div>




				<div class="collapse-wrapper">
					<div class="header">
						審查資料
					</div>
					<div class="collapse-box">

						<table border="1" cellpadding="0" cellspacing="0"
							class="listTable" WIDTH="98%">
							<tr>
								<th width="10%">
									文件下載：
								</th>
								<td id="docs">
									<c:forEach items="${comp.paperFileInfo}" var="obj">

										<a
											href="downLoadFile.htm?aid=${comp.uid}&fName=${obj.originalFileName}&mName=${obj.modifiedFileName}">${obj.originalFileName}</a>
										<br>
									</c:forEach>
								</td>
							</tr>


						</table>
					</div>
				</div>
				
				<%--
				<div class="collapse-wrapper">
					<div class="header">
						面審資料
					</div>
					<div class="collapse-box">

						<table border="1" cellpadding="0" cellspacing="0"
							class="listTable" WIDTH="98%">
							<tr>
								<th width="10%">
									文件下載：
								</th>
								<td id="docs">
									<c:forEach items="${comp.interviewFileInfo}" var="obj">

										<a
											href="downLoadFile.htm?aid=${comp.uid}&fName=${obj.originalFileName}&mName=${obj.modifiedFileName}">${obj.originalFileName}</a>
										<br>
									</c:forEach>
								</td>
							</tr>


						</table>

					</div>
				</div>
				 --%>
				 
				<div class="collapse-wrapper">
					<div class="header">
						附件
					</div>
					<div class="collapse-box">

						<table border="1" cellpadding="0" cellspacing="0"
							class="listTable" WIDTH="98%">
							<tr>
								<th width="10%">
									文件下載：
								</th>
								<td id="docs">
									<c:forEach items="${comp.handoverFileInfo}" var="obj">

										<a
											href="downLoadFile.htm?aid=${comp.uid}&fName=${obj.originalFileName}&mName=${obj.modifiedFileName}">${obj.originalFileName}</a>
										<br>
									</c:forEach>
								</td>
							</tr>


						</table>
					</div>
				</div>

			</div>
			<!--container ends here--><%@ include file="/footer.jsp"%>
	</body>
</html>
