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

					<a href="compList.htm" class="addBtn">回列表</a>
					<a href="compDetailView.htm?compID=${comp.uid}" class="addBtn">返回</a>
					<a href="javascript:submitform()" class="addBtn">儲存</a>

					<%--
				<div class="collapse-wrapper">
					<div class="header">
						書審資料
					</div>
					<div class="collapse-box">


						<table border="1" cellpadding="0" cellspacing="0"
							class="listTable" WIDTH="98%">
							<tr>
								<th  width="10%">
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
								<th  width="10%">
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

		</div>
		<!--container ends here-->
		<%@ include file="/footer.jsp"%>
	</body>
</html>
