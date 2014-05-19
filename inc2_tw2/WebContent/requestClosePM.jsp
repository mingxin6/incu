<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>


<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title><s:message code="request.PM.close" text="PM 輔導結案" /></title>

		<link type="text/css" href="pkg/jquery/mu.css" rel="stylesheet" />
		<link rel="stylesheet" href="css/listsheet.css" />
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






		<!--=== date time picker===-->
		<link href="pkg/jquery/jquery-ui-timepicker-addon.css" type="text/css" />
		<link href="pkg/jquery/demos.css" rel="stylesheet" type="text/css" />
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


		<script type="text/javascript">
function submitform() {
	myEditor.saveHTML();
	var html = myEditor.get('element').value;
	$("#scoreContent").val(html);

	var form = document.getElementById("myform");
	form.submit();
}
</script>

	</head>

	<body class="yui-skin-sam">


		<div id="container">

			<%@ include file="/banner2.jsp"%>
			<%@ include file="/menuPart.jsp"%>

			<h2 id="listTit">
				<s:message code="request.PM.close" text="PM 輔導結案" /> - ${TalkNotes.consultantName}
			</h2>

			<div id="listCon">

				<form:form id="myform" method="POST" commandName="TalkNotes"
					enctype="multipart/form-data" acceptcharset="UTF-8">

					<form:errors path="*" cssClass="errorblock" element="div" />

					<a href="requestListPM.htm" class="formIcon"><s:message code="my.back.to.list" text="回列表" /></a>
					<a href="requestViewPM.htm?noteId=${TalkNotes.talkNoteId}"
						class="formIcon"><s:message code="my.back.to.content" text="回內容" /></a>
					<a href="javascript:submitform()" class="formIcon"><s:message code="my.save" text="儲存" /></a>

					<form:hidden path="compId" value="${compId}" />

					<br>
					<br>

					<table border='1' cellpadding="0" cellspacing="0" class="listTable"
						WIDTH="98%">
						<tr>
							<th align="center" width="10%" WIDTH="25%" bgcolor=#CCCCCC>
								<s:message code="my.subject" text="標題" />：
							</th>
							<td WIDTH="90%">
								${TalkNotes.talkTheme}&nbsp;
							</td>
						</tr>

						<tr>
							<th align="center" width="10%" WIDTH="25%" bgcolor=#CCCCCC>
								<s:message code="request.score" text="評分" />：
							</th>
							<td WIDTH="90%">
								<form:input path="score" size="80" />
								&nbsp;
								<form:errors path="score" cssClass="error" />
							</td>
						</tr>


						<tr>
							<th align="center">
								<s:message code="request.score.opinion" text="評分意見" />：
							</th>
							<td>
								<form:hidden path="scoreContent" />
								<textarea name="msgpost" id="msgpost" cols="45" rows="10"></textarea>
								<form:errors path="scoreContent" cssClass="error" />
							</td>
						</tr>

						<tr>
							<th align="center">
								<s:message code="my.status" text="狀態" />：
								</td>
								<td>
									${TalkNotes.caseStatusRS}
								</td>
						</tr>

						<tr>
							<th align="center">
								<s:message code="my.content" text="內容" />：
								</td>
								<td>
									${TalkNotes.talkContent}
								</td>
						</tr>

						<tr>
							<th align="center" width="10%" WIDTH="25%" bgcolor=#CCCCCC>
								<s:message code="my.time" text="時間" />：
							</th>
							<td WIDTH="90%">
								${TalkNotes.talkDateTime2}
							</td>
						</tr>

						<!-- 
				<tr>
					<th align="center" width="10%" WIDTH="25%" bgcolor=#CCCCCC>地點：</th>
					<td WIDTH="90%">${TalkNotes.talkAddress}</td>
				</tr>


				<tr>
					<th align="center" width="10%" WIDTH="25%" bgcolor=#CCCCCC>我方人員：</th>
					<td WIDTH="90%">${TalkNotes.myPersonincharge}</td>
				</tr>

				<tr>
					<th align="center" width="10%" WIDTH="25%" bgcolor=#CCCCCC>對方人員：</th>
					<td WIDTH="90%">${TalkNotes.otherPersonincharge}</td>
				</tr>
-->

						<tr>
							<th>
								<s:message code="request.download" text="申請相關文件下載" />：
							</th>
							<td>
								<c:forEach items="${TalkNotes.fileInfo}" var="obj">
									<a
										href="downLoadFile.htm?aid=${TalkNotes.talkNoteId}&fName=${obj.originalFileName}&mName=${obj.modifiedFileName}">${obj.originalFileName}</a>
									<br>
								</c:forEach>
							</td>
						</tr>


						<tr>
							<th align="center">
								<s:message code="request.reply.content" text="回覆內容" />：
								</td>
								<td>
									${TalkNotes.replyContent}
								</td>
						</tr>

						<tr>
							<th>
								<s:message code="request.reply.download" text="回覆相關文件下載" />：
							</th>
							<td>
								<c:forEach items="${TalkNotes.fileInfo_reply}" var="obj">
									<a
										href="downLoadFile.htm?aid=${TalkNotes.talkNoteId}&fName=${obj.originalFileName}&mName=${obj.modifiedFileName}">${obj.originalFileName}</a>
									<br>
								</c:forEach>
							</td>
						</tr>
					</table>

				</form:form>
			</div>
		</div>
		<%@ include file="/footer.jsp"%>
	</body>
</html>
