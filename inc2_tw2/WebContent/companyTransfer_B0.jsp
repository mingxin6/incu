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

		<script type="text/javascript">
function submitform() {

	var form = document.getElementById("myform");
	form.submit();
}
</script>

	</head>

	<body>

		<div id="container">
			<%@ include file="/banner2.jsp"%>
			<%@ include file="/menuPart.jsp"%>

			<%--
			<h2 id="listTit">
				您的位置>${comp.compName}
			</h2>
 --%>

			<div id="listCon">
				<c:if test="${!user.isBusiness}">
					<a href="compList_B.htm" class="saveIcon">回一覽表</a>
					| <a href="compDetailView_B.htm?compID=${comp.uid}" class="reIcon">返回</a>
					| <a href="javascript:submitform()" class="okIcon">確定進駐</a>


					<%-- 
					| <a
						href="compDetailEdit_B.htm?uid=${comp.uid}" class="saveIcon">編輯</a> 
					| <a
						href="compDetailView_B_transfer.htm?uid=${comp.uid}" class="saveIcon">入駐</a>
						--%>
				</c:if>


				<form:form id="myform" method="POST" commandName="comp"
					enctype="multipart/form-data" acceptcharset="UTF-8">

					<div class="header">
						公司資訊 (${comp.compStatus})
						<br />
						${comp.remark}
					</div>
					<table border='1' cellpadding="0" cellspacing="0" class="listTable"
						WIDTH="100%">
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



					<div class="header">
						聯絡人資訊
					</div>
					<table border='1' cellpadding="0" cellspacing="0" class="listTable"
						WIDTH="100%">
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






					<div class="header">
						審查資料
					</div>
					<table border="1" cellpadding="0" cellspacing="0" class="listTable"
						WIDTH="98%">
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

					<%-- 
				<div class="header">
					面審資料
				</div>
				<table border="1" cellpadding="0" cellspacing="0" class="listTable"
					WIDTH="98%">
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

--%>


					<div class="header">
						附件
					</div>
					<table border="1" cellpadding="0" cellspacing="0" class="listTable"
						WIDTH="98%">
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



					<div>
						AM / PM
					</div>


					<table width="90%" border=1 class="listTable" cellpadding="0"
						cellspacing="0">
						<tr>
							<td>
								AM :
							</td>
							<td>
								<select name="amId">
									<c:forEach items="${staffList}" var="staff">
										<option value="${staff.uid}">
											${staff.name}
										</option>
									</c:forEach>
								</select>
							</td>
							<td>
								PM :
							</td>
							<td>
								<select name="pmId">
									<c:forEach items="${staffList}" var="staff">
										<option value="${staff.uid}">
											${staff.name}
										</option>
									</c:forEach>
								</select>
							</td>
						</tr>
					</table>


					<div>
						培育間
					</div>


					<table width="90%" border=1 class="listTable" cellpadding="0"
						cellspacing="0">
						<tr>
							<th align="center" width="10%">
								選擇
							</th>
							<th align="center" width="10%">
								號碼
							</th>
							<th align="center" width="10%">
								樓層
							</th>
							<th align="center" width="40%">
								公司
							</th>
							<th align="center" width="10%">
								坪數
							</th>
							<th align="center" width="10%">
								備註
							</th>
							<th align="center" width="10%">
								狀態
							</th>

						</tr>

						<c:forEach items="${roomList}" var="room">
							<tr>
								<td align="center">
									<c:if test="${empty room.compId}">
										<input type="checkbox" name="roomChecked" value="${room.uid}">
									</c:if>
								</td>

								<td align="left">
									${room.roomNo}
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
									<span style="font-size: 14">${room.status}</span>
								</td>



							</tr>

						</c:forEach>
					</table>

				</form:form>

			</div>
			<!--container ends here--><%@ include file="/footer.jsp"%>
	</body>
</html>
