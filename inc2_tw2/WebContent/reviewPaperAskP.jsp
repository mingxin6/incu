<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>


<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>書面審查通知資料</title>

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
				書面審查通知資料
			</h2>
 -->
			<div id="listCon">



				<br />
				<h1>

				</h1>

				<form:form id="myform" method="POST" commandName="notify"
					enctype="multipart/form-data" acceptcharset="UTF-8">

					<form:errors path="*" cssClass="errorblock" element="div" />


					<a href="reviewPaperView.htm?reviewPaperUid=${notify.referenceUid}"
						class="saveIcon"><s:message code="button.back" text="返回" /></a> 
					| <a href="javascript:submitform()" class="saveIcon"><s:message code="button.send" text="發送" /></a>



					<form:hidden path="notifyUid" value="${notifyUid}" />

					<table width=98% border="1" cellpadding="0" cellspacing="0"
						class="listTable" WIDTH="100%">
						<tr>
							<th align="center" width="10%" WIDTH="25%" bgcolor=#CCCCCC>
								<s:message code="reviewpaperask.theme" text="主旨" />：
							</th>
							<td WIDTH="90%">
								<form:input path="subject" size="45" />
								&nbsp;
								<form:errors path="subject" cssClass="error" />
							</td>

						</tr>
						<tr>
							<th align="center">
								<s:message code="reviewpaperask.content" text="內容" />：
							</th>
							<td>
								<form:hidden path="content" />
								<textarea name="msgpost" id="msgpost" cols="45" rows="10">${notify.content}</textarea>
								<form:errors path="content" cssClass="error" />
							</td>

						</tr>
						<tr>
							<th align="center">
								<s:message code="reviewpaperask.recipient" text="收件人" />:
							</th>
							<td>
								<table style="border: 0;">
									<c:forEach items="${notify.notifyees}" var="notifyees">
										<tr style="border: 0;">
											<td align="left" style="border: 0;">
												<span style="font-size: 14">${notifyees.name}</span>
											</td>
											<td align="left" style="border: 0;">
												<span style="font-size: 14">${notifyees.email}</span>
											</td>
										</tr>
									</c:forEach>
								</table>
							</td>
						</tr>
					</table>


					<br />


					<div>
						<s:message code="reviewpaperask.sentrecord" text="發送紀錄" />:
					</div>
					<table>
						<c:forEach items="${oldNotifys}" var="oldNotify">
							<c:forEach items="${oldNotify.notifyees}" var="notifyee">
								<tr>
									<td align="left">
										<span style="font-size: 8">${notifyee.name}</span>
									</td>
									<td align="left">
										<span style="font-size: 8">${notifyee.email}</span>
									</td>
									<td align="left">
										<span style="font-size: 8">${notifyee.createdTime}</span>
									</td>
									<td align="left">
										<span style="font-size: 8">${notifyee.result}</span>
									</td>
								</tr>

							</c:forEach>
						</c:forEach>
					</table>

					<%--
						<tr>
							<th>
								文件下載：
							</th>
							<td>
								<c:forEach items="${reviewPaperResult.fileInfo}" var="obj">
									<input type="checkbox" name="deleteCheck"
										value="${obj.modifiedFileName}" /> 刪除
								<a
										href="downLoadFile.htm?aid=${reviewPaperResult.reviewPaperResultUid}&fName=${obj.originalFileName}&mName=${obj.modifiedFileName}">${obj.originalFileName}</a>
									<br>
								</c:forEach>
							</td>
						</tr>
--%>

					</table>
					<%--
					<table id="fileTable">
						<tr>
							<td>
								<input name="files" type="file" />
							</td>
						</tr>

					</table>
--%>


					<%--<%@ include file="/fileUploadIncluded.jsp"--%>

				</form:form>
			</div>
		</div>
		<%@ include file="/footer.jsp"%>
	</body>
</html>
