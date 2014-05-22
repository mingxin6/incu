<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>


<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title><s:message code="meetingRoom.info" text="會議室資訊" /></title>

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

	$("#dialog").dialog( {
		autoOpen : false,
		modal : true,
		buttons : {
			"是" : function() {
				//alert("You have confirmed!");
			$(this).dialog("close");
			self.location = "meetingRoomDelete.htm?uid=${meetingRoom.uid}";
		},
		"否" : function() {
			$(this).dialog("close");
		}
		}
	});

	$("#callConfirm").on("click", function(e) {
		e.preventDefault();
		$("#dialog").dialog("open");
	});
});
</script>

	</head>
	<body class="yui-skin-sam">

		<div id="dialog" title="<s:message code="my.confirm" text="請確定" />">
			<s:message code="my.delete" text="刪除" />
			?
		</div>

		<div id="container">

			<%@ include file="/banner2.jsp"%>
			<%@ include file="/menuPart.jsp"%>

			<h2 id="listTit">
				<s:message code="my.your.position" text="您的位置" />
				>
				<s:message code="meetingRoom.info" text="會議室資訊" />
			</h2>

			<div id="listCon">

				<a href="meetingRoomList.htm" class="formIcon"><s:message
						code="my.back.to.list" text="回列表" /> </a>

				<c:if test="${user.isStaff}">
					<a href="meetingRoomEdit.htm?uid=${meetingRoom.uid}" class="formIcon"><s:message
							code="my.edit" text="編輯" /> </a>

					
					<button id="callConfirm" class="formIcon">
						<s:message code="my.delete" text="刪除" />
					</button>
				</c:if>


				<br>
				<br>



				<table border='1' cellpadding="5" cellspacing="0" class="listTable"
					WIDTH="98%">

					<tr>
						<th align="center">
							<s:message code="meetingRoom.no" text="會議室號碼" />
							：
						</th>
						<td>
							${meetingRoom.meetingRoomNo}
						</td>
					</tr>

					

					<tr>
						<th align="center">
							<s:message code="my.remark" text="備註" />
							：
						</th>
						<td>
							${meetingRoom.remark}
						</td>
					</tr>

					<tr>
						<th align="center">
							<s:message code="my.status" text="狀態" />
							：
						</th>
						<td>
							${meetingRoom.entityStatusRS}
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
