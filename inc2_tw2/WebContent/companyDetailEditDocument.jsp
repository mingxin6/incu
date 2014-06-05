<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title><s:message code="menuPart.movin.management" text="進駐管理" />
	&gt;<s:message code="menuPart.movin.business" text="進駐企業" />&gt;<s:message
		code="business.info" text="企業資訊" />&gt;<s:message code="my.edit.docs"
		text="編輯文件資料" /></title>

<!-- <link type="text/css" href="pkg/jquery/mu.css" rel="stylesheet" /> -->
<!-- <link rel="stylesheet" href="css/listsheet.css" /> -->

<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/funbar.css">
<link rel="stylesheet" href="css/table-nogrid.css">
<link rel="stylesheet" href="css/table-grid.css">
<link rel="stylesheet" href="css/table-edit.css">



<script type="text/javascript" src="pkg/jquery/jquery.js"></script>


<!-- YUI Menu -->
<link rel="stylesheet" type="text/css" href="pkg/yuirte/skin.css">
<script src="pkg/yuirte/yahoo-dom-event.js"></script>
<script src="pkg/yuirte/element-min.js"></script>

<!-- Needed for Menus, Buttons and Overlays used in the Toolbar -->
<script src="pkg/yuirte/container_core-min.js"></script>
<script src="pkg/yuirte/menu-min.js"></script>
<script src="pkg/yuirte/button-min.js"></script>

<!-- Source file for Rich Text Editor-->
<script src="pkg/yuirte/editor-min.js"></script>
<script src="pkg/yuirte/myyui.js"></script>
<script src="pkg/yuirte/myyui2.js"></script>


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
			.ready(
					function() {

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
								.click(
										function() {
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


		<div class="funbar">
			<div class="funitem">
				<a href="compList.htm">回列表</a> <a
					href="compDetailView.htm?compID=${comp.uid}">返回</a> <a
					href="javascript:submitform()">儲存</a>
			</div>
			<%@ include file="/homeexit.jsp"%>
		</div>



		<div class="title1">${comp.compName}</div>
		<div class="clear"></div>


		<div class="contentdiv">
			<div class="header">
				<s:message code="my.edit.docs" text="編輯文件資料" />
			</div>

			<form:form id="myform" method="POST" commandName="comp"
				enctype="multipart/form-data" acceptcharset="UTF-8">

				<form:errors path="*" cssClass="errorblock" element="div" />

				<table class="table-grid" WIDTH="98%">
					<tr>
						<th width="10%">文件下載：</th>
						<td id="docs"><c:forEach items="${comp.handoverFileInfo}"
								var="obj">
								<input type="checkbox" name="deleteCheckHandover"
									value="${obj.modifiedFileName}" /> 刪除
					<a
									href="downLoadFile.htm?aid=${comp.uid}&fName=${obj.originalFileName}&mName=${obj.modifiedFileName}">${obj.originalFileName}</a>
								<br>
							</c:forEach></td>
					</tr>
				</table>







				<br />
				<input id="addHandoverCheckFile" type="button" value="增加上傳檔"
					class="upIcon" />
				<br />
				<table id="handoverCheckFileTable" class="table-edit">
					<tr>
						<td><input type="button" value="刪除"
							onClick="$(this).closest('tr').remove();" class="deIcon" /></td>
						<td><input name="handoverFiles" type="file" /></td>
					</tr>
					<tr>
						<td><input type="button" value="刪除"
							onClick="$(this).closest('tr').remove();" class="deIcon" /></td>
						<td><input name="handoverFiles" type="file" /></td>
					</tr>
					<tr>
						<td><input type="button" value="刪除"
							onClick="$(this).closest('tr').remove();" class="deIcon" /></td>
						<td><input name="handoverFiles" type="file" /></td>
					</tr>
				</table>



			</form:form>



			<!-- contentdiv end -->
		</div>

		<%@ include file="/footer.jsp"%>

		<!--container ends here-->
	</div>
</body>
</html>
