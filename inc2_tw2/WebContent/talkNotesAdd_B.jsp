<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加</title>

<link type="text/css" href="pkg/jquery/mu.css" rel="stylesheet" />
<link rel="stylesheet" href="css/listsheet.css" />
<script type="text/javascript" src="pkg/jquery/jquery.js"></script>

<!-- 
<script type="text/javascript" src="pkg/jquery/jQuery.autoCollapser.js"></script>
-->

<!-- p7exp Menu -->
<link href="pkg/menu/p7exp.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="pkg/menu/p7exp.js"></script>

<!-- jQuery -->
<link type="text/css" href="pkg/jquery/jquery-ui.css" rel="stylesheet" />
<!-- 
<script type="text/javascript" src="pkg/jquery/jquery.js"></script>
-->
<script type="text/javascript" src="pkg/jquery/jquery.min_1.9.1.js"></script>
<script type="text/javascript" src="pkg/jquery/jquery-ui.js"></script>



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


<!--=== date time picker===-->
<link href="pkg/jquery/jquery-ui-timepicker-addon.css"
	type="text/css" />
<link href="pkg/jquery/demos.css" rel="stylesheet"
	type="text/css" />
<script src="pkg/jquery/jquery-ui-timepicker-addon.js"
	type="text/javascript"></script>
<!--中文-->
<script src="pkg/jquery/jquery.ui.datepicker-zh-CN.js.js"
	type="text/javascript"></script>
<script src="pkg/jquery/jquery-ui-timepicker-zh-CN.js" type="text/javascript"></script>


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
		$('#talkDateTime').datetimepicker({
			timeFormat : "HH:mm",
			dateFormat : "yy-mm-dd"
		});

	});
</script>

</head>
<body class="yui-skin-sam" >

	<div id="container">

		<%@ include file="/banner.jsp"%>
		<%@ include file="/menuPart.jsp"%>

		<h2 id="listTit">您的位置>${compName}>洽談記錄表</h2>

    <div id="listCon">
		<form:form id="myform" method="POST" commandName="TalkNotes"
			enctype="multipart/form-data" acceptcharset="UTF-8">

			<form:errors path="*" cssClass="errorblock" element="div" />

	
			<a href="TalkNotesById_B.htm?compName=${compName}&compId=${compId}" class="formIcon">回 列 表</a> | <a
				href="javascript:submitform()" class="okIcon">確定儲存</a>

			<form:hidden path="compId" value="${compId}" />

			<table width=98%  border="1" cellpadding="0" cellspacing="0" class="listTable">
				<tr>
					<th align="center" width="10%" WIDTH="25%"><span class="tipneed">*</span>標題：</th>
					<td WIDTH="90%"><form:input path="talkTheme" size="80" />&nbsp;
						<form:errors path="talkTheme" cssClass="error" /></td>
				</tr>

				<tr>
					<th align="center" class="line2">內容：</th>
					<td><form:hidden path="talkContent" /> <textarea
							name="msgpost" id="msgpost" cols="45" rows="10"></textarea> <form:errors
							path="talkContent" cssClass="error" /></td>
				</tr>

				<tr>
					<th align="center" width="10%" WIDTH="25%">時間：</th>
					<td WIDTH="90%"><form:input path="talkDateTime" size="80" />&nbsp;
						<form:errors path="talkDateTime" cssClass="error" /></td>
				</tr>

				<tr>
					<th align="center" width="10%" WIDTH="25%">地點：</th>
					<td WIDTH="90%"><form:input path="talkAddress" size="80" />&nbsp;
						<form:errors path="talkAddress" cssClass="error" /></td>
				</tr>


				<tr>
					<th align="center" width="10%" WIDTH="25%">我方人員：</th>
					<td WIDTH="90%"><form:input path="myPersonincharge" size="80" />&nbsp;
						<form:errors path="myPersonincharge" cssClass="error" /></td>
				</tr>

				<tr>
					<th align="center" width="10%" WIDTH="25%">對方人員：</th>
					<td WIDTH="90%"><form:input path="otherPersonincharge"
							size="80" />&nbsp; <form:errors path="otherPersonincharge"
							cssClass="error" /></td>
				</tr>

			</table>



		</form:form>
		</div>
	</div>

</body>
</html> 
