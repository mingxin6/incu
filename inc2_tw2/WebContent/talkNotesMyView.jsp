<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>


<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>添加</title>

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
	myEditor.saveHTML();
	var html = myEditor.get('element').value;
	$("#talkContent").val(html);

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
				您的位置> ${compName}輔導記錄
			</h2>

			<div id="listCon">

				<a href="talkNotesMyList.htm" class="formIcon">回列表</a>
				<c:if test="${!TalkNotes.closed}">
					<a href="talkNotesMyEdit.htm?talkNoteId=${TalkNotes.talkNoteId}"
						class="formIcon">編輯</a>
				</c:if>
				<a href="talkNotesMyTagEdit.htm?talkNoteId=${TalkNotes.talkNoteId}"
					class="formIcon">加Tag</a>


				<br>
				<br>

				<table border='1' cellpadding="0" cellspacing="0" class="listTable"
					WIDTH="98%">
					<tr>
						<th align="right" width="10%" WIDTH="25%" bgcolor=#CCCCCC>
							Tag：
						</th>
						<td WIDTH="90%">
							${TalkNotes.allTagNames}&nbsp;
						</td>
					</tr>
					<tr>
						<th align="right" width="10%" WIDTH="25%" bgcolor=#CCCCCC>
							標題：
						</th>
						<td WIDTH="90%">
							${TalkNotes.talkTheme}&nbsp;
						</td>
					</tr>
					<tr>
						<th align="right" width="10%" WIDTH="25%" bgcolor=#CCCCCC>
							狀態：
						</th>
						<td WIDTH="90%">
							${TalkNotes.caseStatusRS}&nbsp;
						</td>
					</tr>
					<tr>
						<th align="right">
							申請內容：
							</td>
							<td>
								${TalkNotes.talkContent}
							</td>
					</tr>

					<tr>
						<th align="right" width="10%" WIDTH="25%" bgcolor=#CCCCCC>
							申請時間：
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
						<th align="right">
							申請相關文件：
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
						<th align="right" width="10%" WIDTH="25%" bgcolor=#CCCCCC>
							回覆：
						</th>
						<td WIDTH="90%">
							${TalkNotes.replyContent}
						</td>
					</tr>

					<tr>
						<th align="right">
							回覆相關文件：
						</th>
						<td>
							<c:forEach items="${TalkNotes.fileInfo_reply}" var="obj">
								<a
									href="downLoadFile.htm?aid=${TalkNotes.talkNoteId}&fName=${obj.originalFileName}&mName=${obj.modifiedFileName}">${obj.originalFileName}</a>
								<br>
							</c:forEach>
						</td>
					</tr>

					<c:if test="${TalkNotes.closed}">
						<tr>
							<th align="right" width="10%" WIDTH="25%" bgcolor=#CCCCCC>
								評分：
							</th>
							<td WIDTH="90%">
								${TalkNotes.score}
							</td>
						</tr>
						<tr>
							<th align="right" width="10%" WIDTH="25%" bgcolor=#CCCCCC>
								評分意見：
							</th>
							<td WIDTH="90%">
								${TalkNotes.scoreContent}
							</td>
						</tr>
					</c:if>
				</table>


			</div>
		</div>
		<%@ include file="/footer.jsp"%>
	</body>
</html>
