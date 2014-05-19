<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>


<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title><s:message code="Other.consulting.record" text="其它輔導記錄" />-加
			Tag</title>

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
				<s:message code="my.your.position" text="您的位置" />
				>
				<s:message code="Other.consulting.record" text="其它輔導記錄" />
				-加 Tag
			</h2>

			<div id="listCon">

				<a
					href="talkNotesMyViewOther.htm?talkNoteId=${talkNotes.talkNoteId}"
					class="formIcon"><s:message code="my.return" text="返回" /> </a> |

				<a href="javascript:submitform()" class="formIcon"><s:message
						code="my.save" text="儲存" /> </a>
				<br>
				<br>



				<table border='1' cellpadding="0" cellspacing="0" class="listTable"
					WIDTH="98%">
					<tr>
						<th align="right" width="15%" WIDTH="25%" bgcolor=#CCCCCC>
							Tag：
						</th>
						<td WIDTH="90%">
							<form:form id="myform" method="POST" commandName="talkNotes"
								enctype="multipart/form-data" acceptcharset="UTF-8">
								<form:hidden path="talkNoteId" value="${talkNotes.talkNoteId}" />
								<form:checkboxes items="${tagsList}" path="tags" />
							</form:form>
						</td>
					</tr>
					<tr>
						<th align="right" width="10%" WIDTH="25%" bgcolor=#CCCCCC>
							<s:message code="my.subject" text="標題" />
							：
						</th>
						<td WIDTH="90%">
							${talkNotes.talkTheme}&nbsp;
						</td>
					</tr>
					<tr>
						<th align="right" width="10%" WIDTH="25%" bgcolor=#CCCCCC>

							<s:message code="my.status" text="狀態" />
							：
						</th>
						<td WIDTH="90%">
							${talkNotes.status}&nbsp;
						</td>
					</tr>
					<tr>
						<th align="right">
							<s:message code="my.content" text="內容" />
							：
							</td>
							<td>
								${talkNotes.talkContent}
							</td>
					</tr>

					<tr>
						<th align="right" width="10%" WIDTH="25%" bgcolor=#CCCCCC>
							<s:message code="my.time" text="時間" />：
						</th>
						<td WIDTH="90%">
							${talkNotes.talkDateTime2}
						</td>
					</tr>

					<!-- 
				<tr>
					<th align="center" width="10%" WIDTH="25%" bgcolor=#CCCCCC>地點：</th>
					<td WIDTH="90%">${talkNotes.talkAddress}</td>
				</tr>


				<tr>
					<th align="center" width="10%" WIDTH="25%" bgcolor=#CCCCCC>我方人員：</th>
					<td WIDTH="90%">${talkNotes.myPersonincharge}</td>
				</tr>

				<tr>
					<th align="center" width="10%" WIDTH="25%" bgcolor=#CCCCCC>對方人員：</th>
					<td WIDTH="90%">${talkNotes.otherPersonincharge}</td>
				</tr>
-->

					<tr>
						<th align="right">
							<s:message code="request.download" text="申請相關文件下載" />：
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
						<th align="right" width="10%" WIDTH="25%" bgcolor=#CCCCCC>
							<s:message code="request.reply.content" text="回覆內容" />：
						</th>
						<td WIDTH="90%">
							${talkNotes.replyContent}
						</td>
					</tr>

					<tr>
						<th align="right">
							<s:message code="request.reply.download" text="回覆相關文件下載" />：
						</th>
						<td>
							<c:forEach items="${talkNotes.fileInfo_reply}" var="obj">
								<a
									href="downLoadFile.htm?aid=${talkNotes.talkNoteId}&fName=${obj.originalFileName}&mName=${obj.modifiedFileName}">${obj.originalFileName}</a>
								<br>
							</c:forEach>
						</td>
					</tr>

					<c:if test="${talkNotes.closed}">
						<tr>
							<th align="right" width="10%" WIDTH="25%" bgcolor=#CCCCCC>
								<s:message code="request.score" text="評分" />：
							</th>
							<td WIDTH="90%">
								${talkNotes.score}
							</td>
						</tr>
						<tr>
							<th align="right" width="10%" WIDTH="25%" bgcolor=#CCCCCC>
								<s:message code="request.score.opinion" text="評分意見" />：
							</th>
							<td WIDTH="90%">
								${talkNotes.scoreContent}
							</td>
						</tr>
					</c:if>

				</table>
			</div>
		</div>
		<%@ include file="/footer.jsp"%>
	</body>
</html>
