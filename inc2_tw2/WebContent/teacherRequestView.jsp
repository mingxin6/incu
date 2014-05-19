<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>


<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title><s:message code="teacher.info" text="業師資訊" />
		</title>

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
				<s:message code="my.your.position" text="您的位置" />
				> ${compName}
				<s:message code="teacher.info" text="業師資訊" />
			</h2>

			<div id="listCon">

				<a href="teacherRequestList.htm" class="formIcon"><s:message
						code="my.back.to.list" text="回列表" />
				</a>

				<a href="requestAddTeacher.htm?teacherId=${teacher.uid}"
					class="formIcon"><s:message code="teacher.application"
						text="申請輔導" />
				</a>



				<br>
				<br>



				<table border='1' cellpadding="5" cellspacing="0" class="listTable"
					WIDTH="98%">
					<tr>
						<th align="center" width="10%" WIDTH="25%" bgcolor=#CCCCCC>
							<s:message code="teacher.domain" text="領域" />
							：
						</th>
						<td WIDTH="90%">
							${teacher.domain}&nbsp;
						</td>
					</tr>

					<tr>
						<th align="center">
							<s:message code="teacher.name" text="姓名" />
							：
							</td>
							<td>
								${teacher.name}
							</td>
					</tr>
					<tr>
						<th align="center" bgcolor=#CCCCCC>
							<s:message code="my.email" text="郵箱" />
							：
						</th>
						<td>
							${teacher.email}&nbsp;
						</td>
					</tr>

					<tr>
						<th align="center" bgcolor=#CCCCCC>
							<s:message code="my.phone" text="電話" />
							：
						</th>
						<td>
							${teacher.phone}&nbsp;
						</td>
					</tr>
					<tr>
						<th align="center" width="10%" WIDTH="25%" bgcolor=#CCCCCC>
							<s:message code="teacher.unit" text="單位" />
							：
						</th>
						<td WIDTH="90%">
							${teacher.unit}
						</td>
					</tr>

					<tr>
						<th align="center" width="10%" WIDTH="25%" bgcolor=#CCCCCC>
							<s:message code="teacher.title" text="職稱" />
							：
						</th>
						<td WIDTH="90%">
							${teacher.title}
						</td>
					</tr>

					<tr>
						<th align="center">
							<s:message code="my.remark" text="備註" />
							：
							</td>
							<td>
								${teacher.remark}
							</td>
					</tr>
					<tr>
						<th align="center">
							<s:message code="teacher.officehour" text="服務時間" />
							：
							</td>
							<td>
								${teacher.officeHour}
							</td>
					</tr>
					<tr>
						<th align="center">
							<s:message code="my.status" text="狀態" />
							：
							</td>
							<td>
								${teacher.status}
							</td>
					</tr>

					<%--
					<tr>
						<th>
							文件下載：
						</th>
						<td>
							<c:forEach items="${activityRec.fileInfo}" var="obj">
								<a
									href="downLoadFile.htm?aid=${activityRec.uid}&fName=${obj.originalFileName}&mName=${obj.modifiedFileName}">${obj.originalFileName}</a>
								<br>
							</c:forEach>
						</td>
					</tr>
 --%>
				</table>
			</div>
		</div>
		<%@ include file="/footer.jsp"%>
	</body>
</html>
