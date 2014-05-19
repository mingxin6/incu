<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>


<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>編輯審查資料</title>

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

function submitform2() {
	var form = document.getElementById("myform");
	form.submit();
}

function submitform() {
	myEditor.saveHTML();
	var html = myEditor.get('element').value;
	$("#remark").val(html);

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

			<h2 id="listTit">
				${reviewerName}-<s:message code="reviewpaperjob.review" text="委員審查意見" />-${reviewPaper.title}-${comp.compName}
			</h2>

			<div id="listCon">

				<%@ include file="/reviewPaperJobEdit_compInfo.jsp"%>

				<br />
				<h1>
					${reviewerName}-<s:message code="reviewpaperjob.review" text="委員審查意見" />-${reviewPaper.title}-${comp.compName}
				</h1>

				<form:form id="myform" method="POST" commandName="ReviewPaperResult"
					enctype="multipart/form-data" acceptcharset="UTF-8">

					<form:errors path="*" cssClass="errorblock" element="div" />


					<a
						href="reviewPaperView.htm?reviewPaperUid=${reviewPaper.reviewPaperUid}"
						class="formIcon"><s:message code="button.backlist"  text="返回"/></a> 
					<a href="javascript:submitform()" class="formIcon"><s:message code="button.save"  text="儲存"/></a>



					<form:hidden path="reviewPaperResultUid"
						value="${reviewPaperResultUid}" />

					<table width=98% border="1" cellpadding="0" cellspacing="0"
						class="listTable" WIDTH="100%">
						<tr>
							<th align="center" width="10%" WIDTH="25%" bgcolor=#CCCCCC>
								<s:message code="reviewpaperjob.score" text="分數" />：
							</th>
							<td WIDTH="90%">
								<form:input path="score" size="10" />
								&nbsp;
								<form:errors path="score" cssClass="error" />
							</td>
						</tr>

						
						<tr>
							<th align="center">
								<s:message code="reviewpaperjob.remark" text="備註" />：
							</th>
							<td>
								<form:hidden path="remark" />
								<textarea name="msgpost" id="msgpost" cols="45" rows="10">${reviewPaperResult.remark}</textarea>
								<form:errors path="remark" cssClass="error" />
							</td>
						</tr>



						<tr>
							<th>
								<s:message code="reviewpaperjob.filedownload" text="文件下載" />：
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


					</table>

					<table id="fileTable">
						<tr>
							<td>
								<input name="files" type="file" />
							</td>
						</tr>

					</table>


					<%--<%@ include file="/fileUploadIncluded.jsp"--%>

				</form:form>
			</div>
		</div>
		<%@ include file="/footer.jsp"%>
	</body>
</html>
