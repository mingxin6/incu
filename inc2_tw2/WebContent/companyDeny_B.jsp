<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link type="text/css" href="pkg/jquery/mu.css" rel="stylesheet" />
		<link rel="stylesheet" href="css/listsheet.css" />
		<script type="text/javascript" src="pkg/jquery/jquery.js">
</script>

		<link href="pkg/menu/p7exp.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="pkg/menu/p7exp.js">
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
	$("#remark").val(html);

	var form = document.getElementById("myform");
	form.submit();
}
</script>


	</head>

	<body class="yui-skin-sam">

		<div id="container">

			<%@ include file="/banner2.jsp"%>
			<%@ include file="/menuPart.jsp"%>


			<h2>
				中止申請 - ${comp.compName}
			</h2>

			<br>
			<div id="listCon">

				<form:form id="myform" method="POST" commandName="comp"
					enctype="multipart/form-data" acceptcharset="UTF-8">

					<form:errors path="*" cssClass="errorblock" element="div" />

					<a href="compDetailView_B.htm?compID=${comp.uid}" class="formIcon">返回</a>
					<a href="javascript:submitform()" class="formIcon">確定中止申請</a>



					<div class="collapse-wrapper">
						<div class="header">
							企業資訊
						</div>
						<div class="collapse-box">
							<table border='1' cellpadding="0" cellspacing="0"
								class="listTable" WIDTH="100%">
								<tr>
									<th align="right" WIDTH="25%" bgcolor=#CCCCCC>
										退件說明：
									</th>
									<td colspan="3">
										<form:hidden path="remark" />
										<textarea name="msgpost" id="msgpost" cols="45" rows="10">${comp.remark}</textarea>
										<form:errors path="remark" cssClass="error" />
									</td>
								</tr>

								<tr>
									<th align="right" WIDTH="25%" bgcolor=#CCCCCC>
										企業名稱：
									</th>
									<td>
										${comp.compName}&nbsp;
									</td>
									<th WIDTH="25%" align="right">
										統一編號：
									</th>
									<td>
										${comp.registerId}&nbsp;
									</td>
								</tr>

								<tr>
									<th WIDTH="25%" align="right">
										企業成立日期：
									</th>
									<td>
										${comp.registerDate}&nbsp;
									</td>
									<th WIDTH="25%" align="right">
										負責人：
									</th>
									<td>
										${comp.representative}&nbsp;
									</td>

								</tr>

								<tr>
									<th WIDTH="25%" align="right">
										&nbsp;
									</th>
									<td>
										&nbsp;
									</td>
									<th WIDTH="25%" align="right">
										企業領域：
									</th>
									<td>
										${comp.domain}&nbsp;
									</td>
								</tr>

								<tr>
									<th WIDTH="25%" align="right">
										員工人數：
									</th>
									<td>
										${comp.totalEmployees}&nbsp;
									</td>
									<th WIDTH="25%" align="right">
										資本額（元）：
									</th>
									<td>
										${comp.registerCaptial}&nbsp;
									</td>
								</tr>

								<tr>
									<th WIDTH="25%" align="right">
										&nbsp;
									</th>
									<td>
										&nbsp;
									</td>
									<th WIDTH="25%" align="right">
										需求坪數：
									</th>
									<td>
										${comp.roomArea}&nbsp;
									</td>
								</tr>
							</table>
						</div>
					</div>

					<div class="collapse-wrapper">
						<div class="header">
							聯絡人資訊
						</div>
						<div class="collapse-box">
							<table border='1' cellpadding="0" cellspacing="0"
								class="listTable" WIDTH="100%">
								<tr>
									<th WIDTH="25%" align="right">
										聯絡人：
									</th>
									<td>
										${comp.adminContact}&nbsp;
									</td>
									<th WIDTH="25%" align="right">
										聯絡人電話：
									</th>
									<td>
										${comp.adminContactPhone}&nbsp;
									</td>
								</tr>
								<tr>
									<th WIDTH="25%" align="right">
										聯絡人手機：
									</th>
									<td>
										${comp.adminContactMobilePhone}&nbsp;
									</td>
									<th WIDTH="25%" align="right">
										聯絡人信箱：
									</th>
									<td>
										${comp.adminContactEmail2}&nbsp;
									</td>
								</tr>
							</table>
						</div>
					</div>



				</form:form>

			</div>


		</div>
		<!--container ends here-->
		<%@ include file="/footer.jsp"%>
	</body>
</html>
