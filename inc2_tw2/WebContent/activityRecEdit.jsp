<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>


<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>添加</title>

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
	$("#content").val(html);

	var form = document.getElementById("myform");
	form.submit();
}
</script>

		<script>
$(document).ready(function() {
	$('#talkDateTime').datetimepicker( {
		timeFormat : "HH:mm",
		dateFormat : "yy/mm/dd"
	});

});
</script>

	</head>
	<body class="yui-skin-sam">


		<div id="container">
			<%@ include file="/banner2.jsp"%>
			<%@ include file="/menuPart.jsp"%>
<!-- 
			<h2 id="listTit">
				您的位置>${compName}>活動記錄
			</h2>
 -->
			<div id="listCon">
				<form:form id="myform" method="POST" commandName="ActivityRec"
					enctype="multipart/form-data" acceptcharset="UTF-8">

					<form:errors path="*" cssClass="errorblock" element="div" />

					<a href="activityRecView.htm?uid=${activityRec.uid}"
						class="saveIcon"><s:message code="button.backcontent"  text="回內容" /></a> | <a href="javascript:submitform()"
						class="saveIcon"><s:message code="button.save"  text="儲存" /></a>

					<form:hidden path="uid" value="${uid}" />

					<table width=98% border="1" cellpadding="0" cellspacing="0"
						class="listTable" WIDTH="100%">
						<tr>
							<th align="center" width="10%" WIDTH="25%" bgcolor=#CCCCCC>
								<s:message code="activityrecadd.subject"  text="標題" />：
							</th>
							<td WIDTH="90%">
								<form:input path="title" size="80" />
								&nbsp;
								<form:errors path="title" cssClass="error" />
							</td>
						</tr>

						<tr>
							<th align="center">
								<s:message code="activityrecadd.content"  text="內容" />：
							</th>
							<td>
								<form:hidden path="content" />
								<textarea name="msgpost" id="msgpost" cols="45" rows="10">${activityRec.content}</textarea>
								<form:errors path="content" cssClass="error" />
							</td>
						</tr>

						<tr>
							<th align="center" width="10%" WIDTH="25%" bgcolor=#CCCCCC>
								<s:message code="activityrecadd.date"  text="時間" />：
							</th>
							<td WIDTH="90%">
								<form:input path="theDate" size="80" />
								&nbsp;
								<form:errors path="theDate" cssClass="error" />
							</td>
						</tr>

						<tr>
							<th>
								<s:message code="activityrecview.filedownload"  text="文件下載" />：
							</th>
							<td>
								<c:forEach items="${activityRec.fileInfo}" var="obj">
									<input type="checkbox" name="deleteCheck"
										value="${obj.modifiedFileName}" /> 刪除
								<a
										href="downLoadFile.htm?aid=${activityRec.uid}&fName=${obj.originalFileName}&mName=${obj.modifiedFileName}">${obj.originalFileName}</a>
									<br>
								</c:forEach>
							</td>
						</tr>

					</table>

					<%@ include file="/fileUploadIncluded.jsp"%>

				</form:form>
			</div>
		</div>
		<%@ include file="/footer.jsp"%>
	</body>
</html>
