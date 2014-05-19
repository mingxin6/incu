<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>


<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title><s:message code="staff.new" text="新 增 中心人員" /></title>

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

		<script src="pkg/yuirte/myyui2.js">
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
	$("#remark").val(html);

	myEditor2.saveHTML();
	var html2 = myEditor2.get('element').value;
	$("#officeHour").val(html2);

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


		<script>
$(document).ready(function() {
	$("input:radio[name=seeAllTalkNote]").change(function() {
		var n = $(this).val();
		switch (n) {
		case "是":
			$("#selectSee").hide();
			break;
		case "否":
			$("#selectSee").show();
			break;
		default:
			$("#selectSee").hide();
		}
	});

	var yesno = document.getElementsByName("seeAllTalkNote");
	if (yesno[0].checked == true) {
		$("#selectSee").hide();
	} else if (yesno[1].checked == true) {
		$("#selectSee").show();
	} else {
		$("#selectSee").hide();
	}

	//$("input:radio[name=seeAllTalkNote]").trigger('change');
	});
</script>

	</head>
	<body class="yui-skin-sam">


		<div id="container">

			<%@ include file="/banner2.jsp"%>
			<%@ include file="/menuPart.jsp"%>

			<h2 id="listTit">
				<s:message
						code="my.your.position" text="您的位置" />>${compName}><s:message code="staff.new" text="新 增 中心人員" />
			</h2>

			<div id="listCon">
				<form:form id="myform" method="POST" commandName="staff"
					enctype="multipart/form-data" acceptcharset="UTF-8">

					<form:errors path="*" cssClass="errorblock" element="div" />

					<a href="staffList.htm" class="formIcon"><s:message
						code="my.back.to.list" text="回列表" /></a> | <a
						href="javascript:submitform()" class="formIcon"><s:message code="my.save" text="儲存" /></a>



					<table width=98% border="1" cellpadding="0" cellspacing="0"
						class="listTable" WIDTH="100%">
						<tr>
							<%--
							<th align="center" width="10%" WIDTH="25%" bgcolor=#CCCCCC>
								領域：
							</th>
							<td WIDTH="90%">
								<form:input path="domain" size="80" />
								&nbsp;
								<form:errors path="domain" cssClass="error" />
							</td>
						</tr>
 --%>
							<tr>
								<th align="center">
									<s:message code="staff.name" text="姓名" />：
								</th>
								<td WIDTH="90%">
									<form:input path="name" size="80" />
									&nbsp;
									<form:errors path="name" cssClass="error" />
								</td>
							</tr>
							<tr>
								<th align="center" width="10%" WIDTH="25%" bgcolor=#CCCCCC>
									<s:message code="my.email" text="郵箱" />：
								</th>
								<td WIDTH="90%">
									<form:input path="email" size="80" />
									&nbsp;
									<form:errors path="email" cssClass="error" />
								</td>
							</tr>

							<tr>
								<th align="center" width="10%" WIDTH="25%" bgcolor=#CCCCCC>
									<s:message code="my.phone" text="電話" />：
								</th>
								<td WIDTH="90%">
									<form:input path="phone" size="80" />
									&nbsp;
									<form:errors path="phone" cssClass="error" />
								</td>
							</tr>
							<tr>
								<th align="center" width="10%" WIDTH="25%" bgcolor=#CCCCCC>
									<s:message code="statff.unit" text="單位" />：
								</th>
								<td WIDTH="90%">
									<form:input path="unit" size="80" />
									&nbsp;
									<form:errors path="unit" cssClass="error" />
								</td>
							</tr>

							<tr>
								<th align="center" width="10%" WIDTH="25%" bgcolor=#CCCCCC>
									<s:message code="staff.title" text="職稱" />：
								</th>
								<td WIDTH="90%">
									<form:input path="title" size="80" />
									&nbsp;
									<form:errors path="title" cssClass="error" />
								</td>
							</tr>

							<tr>
								<th align="center">
									<s:message code="my.remark" text="備註" />：
								</th>
								<td>
									<form:hidden path="remark" />
									<textarea name="msgpost" id="msgpost" cols="45" rows="10">${staff.remark}</textarea>
									<form:errors path="remark" cssClass="error" />
								</td>
							</tr>

							<tr>
								<th align="center">
									<s:message code="staff.officehour" text="服務時間" />：
								</th>
								<td>
									<form:hidden path="officeHour" />
									<textarea name="msgpost2" id="msgpost2" cols="45" rows="10"></textarea>
									<form:errors path="officeHour" cssClass="error" />
								</td>
							</tr>

							<tr>
								<th align="center" width="10%" WIDTH="25%" bgcolor=#CCCCCC>
									<s:message code="my.loginId" text="帳號" />：
								</th>
								<td WIDTH="90%">
									<form:input path="userLoginId" size="80" />
									&nbsp;
									<form:errors path="userLoginId" cssClass="error" />
								</td>
							</tr>

							<tr>
								<th align="center" width="10%" WIDTH="25%" bgcolor=#CCCCCC>
									<s:message code="my.loginPwd" text="密碼" />：
								</th>
								<td WIDTH="90%">
									<form:input path="userLoginPwdClearText" size="80" />
									&nbsp;
									<form:errors path="userLoginPwdClearText" cssClass="error" />
								</td>
							</tr>


							<tr>
								<th>
									<s:message code="staff.status" text="狀態" /> :
								</th>
								<td>
									<form:select path="status">
										<!-- form:option value="NONE" label="--- Select ---" /-->
										<form:options items="${userStatuses}" />
									</form:select>
								</td>
							</tr>


							<tr>
								<th>
									<s:message code="staff.can.seeall" text="可檢視所有輔導記錄 ?" />
								</th>
								<td>
									<form:radiobuttons path="seeAllTalkNote" items="${yesnoList}" />
								</td>
							</tr>

							<tr id="selectSee">
								<th>
									<s:message code="staff.cover.list" text="可檢視的輔導記錄 :" />
								</th>
								<td align="left">
									<form:checkboxes element="li" items="${staffList}"
										itemValue="uid" itemLabel="name" path="coveredUserOfTalkNote" />
								</td>
							</tr>
					</table>

					<%--
					<%@ include file="/fileUploadIncluded.jsp"%>
 --%>

				</form:form>
			</div>
		</div>
		<%@ include file="/footer.jsp"%>
	</body>
</html>
