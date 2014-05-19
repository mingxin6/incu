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
</script>

		<script type="text/javascript">
		function submitform() {
			var form = document.getElementById("myform");
			form.submit();
		}
</script>

		<SCRIPT language="javascript">
  $(document)
		.ready(function() {

				$('#addPaperCheckFile')
						.click(function() {
							//var fileIndex = $('#fileTable tr').children().length;
								$('#paperCheckFileTable')
										.append(
												'<tr>'
														+ '<td>'
														+ '<input type="button" value="刪除" onClick="$(this).closest(\'tr\').remove();"/>'
														+ '</td>'
														+ '<td>'
														+ '<input type="file" name="paperCheckFiles" />'
														+ '</td></tr>');
							});//書審
							
				$('#addInterviewCheckFile')
						.click(function() {
							//var fileIndex = $('#fileTable tr').children().length;
								$('#interviewCheckFileTable')
										.append(
												'<tr>'
														+ '<td>'
														+ '<input type="button" value="刪除" onClick="$(this).closest(\'tr\').remove();"/>'
														+ '</td>'
														+ '<td>'
														+ '<input type="file" name="interviewCheckFiles" />'
														+ '</td></tr>');
							});//面審
							
							
				$('#addHandoverCheckFile')
						.click(function() {
							//var fileIndex = $('#fileTable tr').children().length;
								$('#handoverCheckFileTable')
										.append(
												'<tr>'
														+ '<td>'
														+ '<input type="button" value="刪除" onClick="$(this).closest(\'tr\').remove();"/>'
														+ '</td>'
														+ '<td>'
														+ '<input type="file" name="handoverCheckFiles" />'
														+ '</td></tr>');
							});//點交

			}//

		);
		
		
    </SCRIPT>
	</head>

	<body>
		
		<div id="container">
			
			<%@ include file="/banner2.jsp"%>
			<%@ include file="/menuPart.jsp"%>


			<h2>
				${comp.compName}
			</h2>

			<br>
			<div id="listCon">

				<form:form id="myform" method="POST" commandName="comp"
					enctype="multipart/form-data" acceptcharset="UTF-8">

					<form:errors path="*" cssClass="errorblock" element="div" />

					<a href="compList_B.htm" class="reIcon">回一覽表</a> | <a
						href="javascript:submitform()" class="adIcon">確定儲存</a>



					<div class="collapse-wrapper">
						<div class="header">
							公司資訊
						</div>
						<div class="collapse-box">
							<table border="1" cellpadding="0" cellspacing="0"
								class="listTable" WIDTH="100%">

								<tr>
									<th align="right" WIDTH="25%" bgcolor=#CCCCCC>
										公司名稱：
									</th>
									<td>
										<form:input path="compName" size="40" />
										&nbsp;
										<form:errors path="compName" cssClass="error" />

									</td>
									<th WIDTH="25%" align="right">
										統一編號：
									</th>
									<td>
										<form:input path="registerId" size="40" />
										&nbsp;
										<form:errors path="registerId" cssClass="error" />
									</td>
								</tr>


								<tr>
									<th WIDTH="25%" align="right">
										公司成立日期：
									</th>
									<td>
										<form:input path="registerDate" size="40" />
										&nbsp;
										<form:errors path="registerDate" cssClass="error" />

									</td>
									<th WIDTH="25%" align="right">
										負責人：
									</th>
									<td>
										<form:input path="representative" size="40" />
										&nbsp;
										<form:errors path="representative" cssClass="error" />

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
										<form:input path="domain" size="40" />
										&nbsp;
										<form:errors path="domain" cssClass="error" />

									</td>
								</tr>

								<tr>
									<th WIDTH="25%" align="right">
										員工人數：
									</th>
									<td>
										<form:input path="totalEmployees" size="40" />
										&nbsp;
										<form:errors path="totalEmployees" cssClass="error" />

									</td>
									<th WIDTH="25%" align="right">
										資本額（元）：
									</th>
									<td>
										<form:input path="registerCaptial" size="40" />
										&nbsp;
										<form:errors path="registerCaptial" cssClass="error" />

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
										<form:input path="roomArea" size="40" />
										&nbsp;
										<form:errors path="roomArea" cssClass="error" />

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
							<table border="1" cellpadding="0" cellspacing="0"
								class="listTable" WIDTH="100%">

								<tr>
									<th WIDTH="25%" align="right">
										聯絡人：
									</th>
									<td>
										<form:input path="adminContact" size="40" />
										&nbsp;
										<form:errors path="adminContact" cssClass="error" />

									</td>
									<th WIDTH="25%" align="right">
										聯絡人電話：
									</th>
									<td>
										<form:input path="adminContactPhone" size="40" />
										&nbsp;
										<form:errors path="adminContactPhone" cssClass="error" />

									</td>
								</tr>
								<tr>
									<th WIDTH="25%" align="right">
										聯絡人手機：
									</th>
									<td>
										<form:input path="adminContactMobilePhone" size="40" />
										&nbsp;
										<form:errors path="adminContactMobilePhone" cssClass="error" />

									</td>
									<th WIDTH="25%" align="right">
										聯絡人信箱：
									</th>
									<td>
										<form:input path="adminContactEmail2" size="40" />
										&nbsp;
										<form:errors path="adminContactEmail2" cssClass="error" />

									</td>
								</tr>


							</table>
						</div>
					</div>


					<div class="collapse-wrapper">
						<div class="header">
							書審資料
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
											<input type="checkbox" name="deleteCheckPaper"
												value="${obj.modifiedFileName}" /> 刪除
					<a
												href="downLoadFile.htm?aid=${comp.uid}&fName=${obj.originalFileName}&mName=${obj.modifiedFileName}">${obj.originalFileName}</a>
											<br>
										</c:forEach>
									</td>
								</tr>

							</table>

							<input id="addPaperCheckFile" type="button" value="增加上傳檔"
								class="upIcon" />

							<table id="paperCheckFileTable">
								<tr>
									<td>
										<input type="button" value="刪除"
											onClick="$(this).closest('tr').remove();" class="deIcon" />
									</td>
									<td>
										<input name="paperCheckFiles" type="file" />
									</td>
								</tr>
								<tr>
									<td>
										<input type="button" value="刪除"
											onClick="$(this).closest('tr').remove();" class="deIcon" />
									</td>
									<td>
										<input name="paperCheckFiles" type="file" />
									</td>
								</tr>
								<tr>
									<td>
										<input type="button" value="刪除"
											onClick="$(this).closest('tr').remove();" class="deIcon" />
									</td>
									<td>
										<input name="paperCheckFiles" type="file" />
									</td>
								</tr>
							</table>



						</div>
					</div>




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
											<input type="checkbox" name="deleteCheckInterview"
												value="${obj.modifiedFileName}" /> 刪除
					<a
												href="downLoadFile.htm?aid=${comp.uid}&fName=${obj.originalFileName}&mName=${obj.modifiedFileName}">${obj.originalFileName}</a>
											<br>
										</c:forEach>
									</td>
								</tr>


							</table>

							<input id="addInterviewCheckFile" type="button" value="增加上傳檔"
								class="upIcon" />

							<table id="interviewCheckFileTable">
								<tr>
									<td>
										<input type="button" value="刪除"
											onClick="$(this).closest('tr').remove();" class="deIcon" />
									</td>
									<td>
										<input name="interviewFiles" type="file" />
									</td>
								</tr>
								<tr>
									<td>
										<input type="button" value="刪除"
											onClick="$(this).closest('tr').remove();" class="deIcon" />
									</td>
									<td>
										<input name="interviewFiles" type="file" />
									</td>
								</tr>
								<tr>
									<td>
										<input type="button" value="刪除"
											onClick="$(this).closest('tr').remove();" class="deIcon" />
									</td>
									<td>
										<input name="interviewFiles" type="file" />
									</td>
								</tr>
							</table>



						</div>
					</div>



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
											<input type="checkbox" name="deleteCheckHandover"
												value="${obj.modifiedFileName}" /> 刪除
					<a
												href="downLoadFile.htm?aid=${comp.uid}&fName=${obj.originalFileName}&mName=${obj.modifiedFileName}">${obj.originalFileName}</a>
											<br>
										</c:forEach>
									</td>
								</tr>


							</table>

							<input id="addHandoverCheckFile" type="button" value="增加上傳檔"
								class="upIcon" />

							<table id="handoverCheckFileTable">
								<tr>
									<td>
										<input type="button" value="刪除"
											onClick="$(this).closest('tr').remove();" class="deIcon" />
									</td>
									<td>
										<input name="handoverFiles" type="file" />
									</td>
								</tr>
								<tr>
									<td>
										<input type="button" value="刪除"
											onClick="$(this).closest('tr').remove();" class="deIcon" />
									</td>
									<td>
										<input name="handoverFiles" type="file" />
									</td>
								</tr>
								<tr>
									<td>
										<input type="button" value="刪除"
											onClick="$(this).closest('tr').remove();" class="deIcon" />
									</td>
									<td>
										<input name="handoverFiles" type="file" />
									</td>
								</tr>
							</table>



						</div>
					</div>
				</form:form>

			</div>


		</div>
		<!--container ends here-->
		<%@ include file="/footer.jsp"%>
	</body>
</html>
