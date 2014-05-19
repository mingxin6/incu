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


		<!-- YUI Menu -->
		<link rel="stylesheet" type="text/css" href="pkg/yuirte/skin.css">
		<script src="pkg/yuirte/yahoo-dom-event.js">
</script>
		<script src="pkg/yuirte/element-min.js">
</script>

		<!-- Needed for Menus, Buttons and Overlays used in the Toolbar -->
		<script src="pkg/yuirte/container_core-min.js">
</script>
		<script src="pkg/yuirte/menu-min.js">
</script>
		<script src="pkg/yuirte/button-min.js">
</script>

		<!-- Source file for Rich Text Editor-->
		<script src="pkg/yuirte/editor-min.js">
</script>
		<script src="pkg/yuirte/myyui.js">
</script>
		<script src="pkg/yuirte/myyui2.js">
</script>


		<script type="text/javascript">

function submitform() {
	var form = document.getElementById("myform");
	form.submit();
}

function deleteFile() {
	$($(this).closest("tr"));
}
</script>

		<SCRIPT language="javascript">
  $(document)
		.ready(function() {

			/*	$('#addPaperCheckFile')
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
							*/
							
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

	<body class="yui-skin-sam">

		<div id="container">

			<%@ include file="/banner2.jsp"%>
			<%@ include file="/menuPart.jsp"%>

			<div id="listCon">
				<h2>
					${comp.compName}
				</h2>

				<br>


				<form:form id="myform" method="POST" commandName="comp"
					enctype="multipart/form-data" acceptcharset="UTF-8">

					<form:errors path="*" cssClass="errorblock" element="div" />

					<a href="compList.htm" class="formIcon">回列表</a>
					<a href="compDetailView.htm?compID=${comp.uid}" class="formIcon">返回</a>
					<a href="javascript:submitform()" class="formIcon">儲存</a>



					<div class="collapse-wrapper">
						<div class="header">
							審查資料
						</div>
						<div class="collapse-box">


							<table border="1" cellpadding="0" cellspacing="0"
								class="listTable" WIDTH="98%">
								<tr>
									<th width="10%">
										進駐申請表：
									</th>
									<td width="30%" id="docs">
										<c:forEach items="${comp.applicationFileInfo}" var="obj">
											刪除<input type="checkbox" name="deleteCheckApplicationFile2"
												value="${obj.modifiedFileName}" />
											<input type="checkbox" name="deleteCheckApplicationFile"
												value="${obj.modifiedFileName}" style="display: none"
												checked="checked" />

											<a
												href="downLoadFile.htm?aid=${comp.uid}&fName=${obj.originalFileName}&mName=${obj.modifiedFileName}">${obj.originalFileName}</a>
											<br>
										</c:forEach>
									</td>
									<td width="60%">
										<input name="applicationFiles" type="file" />
									</td>
								</tr>
								<tr>
									<th width="10%">
										企業設立函文：
									</th>
									<td id="docs">
										<c:forEach items="${comp.establishPaperFileInfo}" var="obj">
											刪除<input type="checkbox"
												name="deleteCheckEstablishPaperFile2"
												value="${obj.modifiedFileName}" />
											<input type="checkbox" name="deleteCheckEstablishPaperFile"
												value="${obj.modifiedFileName}" style="display: none"
												checked="checked" />

											<a
												href="downLoadFile.htm?aid=${comp.uid}&fName=${obj.originalFileName}&mName=${obj.modifiedFileName}">${obj.originalFileName}</a>
											<br>
										</c:forEach>
									</td>
									<td>
										<input name="establishPaperFiles" type="file" />
									</td>
								</tr>
								<tr>
									<th width="10%">
										營運計劃書：
									</th>
									<td id="docs">
										<c:forEach items="${comp.businessPlanFileInfo}" var="obj">
										刪除<input type="checkbox" name="deleteCheckBusinessPlanFile2"
												value="${obj.modifiedFileName}" />
											<input type="checkbox" name="deleteCheckBusinessPlanFile"
												value="${obj.modifiedFileName}" style="display: none"
												checked="checked" />

											<a
												href="downLoadFile.htm?aid=${comp.uid}&fName=${obj.originalFileName}&mName=${obj.modifiedFileName}">${obj.originalFileName}</a>
											<br>
										</c:forEach>
									</td>
									<td>
										<input name="businessPlanFiles" type="file" />
									</td>
								</tr>
								<tr>
									<th width="10%">
										會計師簽證：
									</th>
									<td id="docs">
										<c:forEach items="${comp.accountantNoteFileInfo}" var="obj">
										刪除<input type="checkbox" name="deleteCheckAccountantNoteFile2"
												value="${obj.modifiedFileName}" />
											<input type="checkbox" name="deleteCheckAccountantNoteFile"
												value="${obj.modifiedFileName}" style="display: none"
												checked="checked" />

											<a
												href="downLoadFile.htm?aid=${comp.uid}&fName=${obj.originalFileName}&mName=${obj.modifiedFileName}">${obj.originalFileName}</a>
											<br>
										</c:forEach>
									</td>
									<td>
										<input name="accountantNoteFiles" type="file" />
									</td>
								</tr>
								<tr>
									<th width="10%">
										401 報表：
									</th>
									<td id="docs">
										<c:forEach items="${comp.form401FileInfo}" var="obj">
										刪除<input type="checkbox" name="deleteCheckForm401File2"
												value="${obj.modifiedFileName}" />
											<input type="checkbox" name="deleteCheckForm401File"
												value="${obj.modifiedFileName}" style="display: none"
												checked="checked" />

											<a
												href="downLoadFile.htm?aid=${comp.uid}&fName=${obj.originalFileName}&mName=${obj.modifiedFileName}">${obj.originalFileName}</a>
											<br>
										</c:forEach>
									</td>
									<td>
										<input name="form401Files" type="file" />
									</td>
								</tr>
							</table>



						</div>
					</div>

				</form:form>

			</div>


		</div>

		</div>
		<!--container ends here-->
		<%@ include file="/footer.jsp"%>
	</body>
</html>
