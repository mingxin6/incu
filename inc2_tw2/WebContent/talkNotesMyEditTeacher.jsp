<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>


<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title><s:message code="edit.teacher.consulting.record"
				text="編輯業師輔導記錄" />
		</title>

		<link type="text/css" href="pkg/jquery/mu.css" rel="stylesheet" />

		<script type="text/javascript" src="pkg/jquery/jquery.js">
</script>

		<!-- 
<script type="text/javascript" src="pkg/jquery/jQuery.autoCollapser.js"></script>
-->

		<!-- p7exp Menu -->
		<link href="pkg/menu/p7exp.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="pkg/menu/p7exp.js">
</script>

		<!-- jQuery -->
		<link type="text/css" href="pkg/jquery/jquery-ui.css" rel="stylesheet" />
		<!-- 
<script type="text/javascript" src="pkg/jquery/jquery.js"></script>
-->
		<script type="text/javascript" src="pkg/jquery/jquery.min_1.9.1.js">
</script>
		<script type="text/javascript" src="pkg/jquery/jquery-ui.js">
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


		<!--=== date time picker===-->
		<link href="pkg/jquery/jquery-ui-timepicker-addon.css" type="text/css" />
		<link href="pkg/jquery/demos.css" rel="stylesheet" type="text/css" />

		<link rel="stylesheet" href="css/listsheet.css" />
		<script src="pkg/jquery/jquery-ui-timepicker-addon.js"
			type="text/javascript">
</script>
		<!--中文-->
		<script src="pkg/jquery/jquery.ui.datepicker-zh-CN.js.js"
			type="text/javascript">
</script>
		<script src="pkg/jquery/jquery-ui-timepicker-zh-CN.js"
			type="text/javascript">
</script>


		<script type="text/javascript">
function submitform() {
	myEditor.saveHTML();
	var html = myEditor.get('element').value;
	$("#replyContent").val(html);

	var form = document.getElementById("myform");
	form.submit();
}
</script>

		<script>
$(document).ready(function() {
	$('#talkDateTime').datetimepicker( {
		timeFormat : "HH:mm",
		dateFormat : "yy-mm-dd"
	});

});
</script>

	</head>
	<body class="yui-skin-sam">

		<div id="container">

			<%@ include file="/banner2.jsp"%>
			<%@ include file="/menuPart.jsp"%>

			<h2 id="listTit">
				<s:message code="my.your.position" text="您的位置" />
				>
				<s:message code="edit.teacher.consulting.record" text="編輯業師輔導記錄" />
			</h2>



			<div id="listCon">
				<a href="talkNotesMyListTeacher.htm" class="formIcon"><s:message
						code="my.back.to.list" text="回列表" />
				</a>|
				<a
					href="talkNotesMyViewTeacher.htm?talkNoteId=${talkNotes.talkNoteId}"
					class="formIcon"><s:message code="my.return" text="返回" />
				</a>|
				<a href="javascript:submitform()" class="formIcon"><s:message
						code="my.save" text="儲存" />
				</a>

				<br />

				<form:form id="myform" method="POST" commandName="talkNotes"
					enctype="multipart/form-data" acceptcharset="UTF-8">

					<form:errors path="*" cssClass="errorblock" element="div" />



					<form:hidden path="compId" value="${compId}" />

					<table width=98% border="1" cellpadding="0" cellspacing="0"
						class="listTable" WIDTH="100%">


						<tr>
							<th align="right" width="15%" WIDTH="25%" bgcolor=#CCCCCC>
								Tag：
							</th>
							<td>
								<form:checkboxes items="${tagsList}" path="tags" />
								<form:errors path="tags" cssClass="error" />
							</td>
						</tr>


						<tr>
							<th align="right" width="10%" WIDTH="25%" bgcolor=#CCCCCC>
								<s:message code="my.subject" text="標題" />
								：
							</th>
							<td WIDTH="90%">
								${talkNotes.talkTheme}
							</td>
						</tr>

						<tr>
							<th align="right">
								<s:message code="my.content" text="內容" />
								：
							</th>
							<td>
								${talkNotes.talkContent}
							</td>
						</tr>

						<tr>
							<th align="right" width="10%" WIDTH="25%" bgcolor=#CCCCCC>
								<s:message code="my.time" text="時間" />
								：
							</th>
							<td WIDTH="90%">
								${talkNotes.talkDateTime2}

							</td>
						</tr>

						<!-- 
				<tr>
					<th align="right" width="10%" WIDTH="25%" bgcolor=#CCCCCC>地點：</th>
					<td WIDTH="90%"><form:input path="talkAddress" size="80" />&nbsp;
						<form:errors path="talkAddress" cssClass="error" /></td>
				</tr>


				<tr>
					<th align="right" width="10%" WIDTH="25%" bgcolor=#CCCCCC>我方人員：</th>
					<td WIDTH="90%"><form:input path="myPersonincharge" size="80" />&nbsp;
						<form:errors path="myPersonincharge" cssClass="error" /></td>
				</tr>

				<tr>
					<th align="right" width="10%" WIDTH="25%" bgcolor=#CCCCCC>對方人員：</th>
					<td WIDTH="90%"><form:input path="otherPersonincharge"
							size="80" />&nbsp; <form:errors path="otherPersonincharge"
							cssClass="error" /></td>
				</tr>
-->

						<tr>
							<th align="right" >
								<s:message code="request.download" text="申請相關文件下載" />
								：
							</th>
							<td>
								<c:forEach items="${talkNotes.fileInfo}" var="obj">
									<a
										href="downLoadFile.htm?aid=${talkNotes.talkNoteId}&fName=${obj.originalFileName}&mName=${obj.modifiedFileName}">${obj.originalFileName}</a>
									<br>
								</c:forEach>
							</td>
						</tr>




						<tr>
							<th align="right">
								<s:message code="request.reply.content" text="回覆內容" />
								：
							</th>
							<td>
								<form:hidden path="replyContent" />
								<textarea name="msgpost" id="msgpost" cols="45" rows="10">${talkNotes.replyContent}</textarea>
								<form:errors path="replyContent" cssClass="error" />
							</td>
						</tr>



						<tr>
							<th  align="right">
								<s:message code="request.reply.download" text="回覆相關文件下載" />
								：
							</th>
							<td>
								<c:forEach items="${talkNotes.fileInfo_reply}" var="obj">
									<input type="checkbox" name="deleteCheck"
										value="${obj.modifiedFileName}" />
									<s:message code="my.delete" text="刪除" />
									<a
										href="downLoadFile.htm?aid=${talkNotes.talkNoteId}&fName=${obj.originalFileName}&mName=${obj.modifiedFileName}">${obj.originalFileName}</a>
									<br>
								</c:forEach>
							</td>
						</tr>


					</table>

					<%@ include file="/fileUploadIncluded_talknote_reply.jsp"%>

				</form:form>
			</div>
		</div>
		<%@ include file="/footer.jsp"%>
	</body>
</html>
