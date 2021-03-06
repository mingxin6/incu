<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title><s:message code="menuPart.movin.management" text="進駐管理" />
	&gt;<s:message code="menuPart.movin.business" text="進駐企業" />&gt;<s:message
		code="business.info" text="企業資訊" />&gt;<s:message code="my.edit.ip"
		text="編輯專利資料" /></title>


<!-- <link type="text/css" href="pkg/jquery/mu.css" rel="stylesheet" /> -->
<!-- <link rel="stylesheet" href="css/listsheet.css" /> -->


<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/funbar.css">
<link rel="stylesheet" href="css/table-nogrid.css">
<link rel="stylesheet" href="css/table-grid.css">


<script type="text/javascript" src="pkg/jquery/jquery.js"></script>





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
<script src="pkg/yuirte/myyui2.js"></script>





<script type="text/javascript">
	function checkIpNo() {
		var elem = document.getElementsByName('myno');
		for (var i = 0; i < elem.length; ++i) {
			//if (typeof elem[i].value !== "undefined") {
			//names.push(elem[i].value);
			//}
			if (elem[i].value == "") {
				alert("專利證號不可空白！");
				return false;
			}
		}
		return true;
	}
	function checkIpName() {
		var elem = document.getElementsByName('myname');
		for (var i = 0; i < elem.length; ++i) {
			if (elem[i].value == "") {
				alert("專利名稱不可空白！");
				return false;
			}
		}
		return true;
	}
	function checkIpCountry() {
		var elem = document.getElementsByName('mycountry');
		for (var i = 0; i < elem.length; ++i) {
			if (elem[i].value == "") {
				alert("取得專利國家不可空白！");
				return false;
			}
		}
		return true;
	}
	function submitform() {
		if (!checkIpNo()) {
			return false;
		}
		if (!checkIpName()) {
			return false;
		}
		if (!checkIpCountry()) {
			return false;
		}
		var form = document.getElementById("myform");
		form.submit();
	}
</script>

<SCRIPT language="javascript">
	$(document)
			.ready(
					function() {
						//add more file components if Add is clicked
						$('#addIp')
								.click(
										function() {
											//var fileIndex = $('#fileTable tr').children().length;
											$('#table-grid')
													.append(
															'<tr>'
																	+ '<td>'
																	+ '<input type="text" name="myno" />'
																	+ '</td>'
																	+ '<td>'
																	+ '<input type="text" name="myname" />'
																	+ '</td>'
																	+ '<td>'
																	+ '<input type="text" name="mycountry" />'

																	+ '</td>'
																	+ '<td>'
																	+ '<input type="text" name="mydate" />'
																	+ '</td>'
																	+ '<td  align="center">'
																	+ '<input type="button" value="刪除" onClick="$(this).closest(\'tr\').remove();"/>'
																	+ '</td>'

																	+ '</tr>');

										});

					}//ready function

			);
</SCRIPT>
</head>

<body class="yui-skin-sam">

	<div id="container">

		<%@ include file="/banner2.jsp"%>



		<div class="funbar">
			<div class="funitem">
				<a href="compList.htm" class="addBtn">回列表</a> <a
					href="compDetailView.htm?compID=${comp.uid}" class="addBtn">返回</a>
				<a href="javascript:submitform()" class="addBtn">儲存</a>
			</div>
			<%@ include file="/homeexit.jsp"%>
		</div>



		<div class="title1">${comp.compName}</div>
		<div class="clear"></div>

		<div class="contentdiv">

			<div class="header">
				<s:message code="my.edit.ip" text="編輯專利資料" />
			</div>

			<form:form id="myform" method="POST" commandName="comp"
				enctype="multipart/form-data" acceptcharset="UTF-8">

				<form:errors path="*" cssClass="errorblock" element="div" />

				<div class="collapse-wrapper">

					<div class="collapse-box">

						<input id="addIp" type="button" value="增加 一列" class="upIcon" />

						<table width="100%" border=1 class="table-grid" id="table-grid">
							<tr>
								<th align="center"><span style="font-size: 14">專利證號</span>
								</th>
								<th align="center"><span style="font-size: 14">專利名稱</span>
								</th>
								<th align="center"><span style="font-size: 14">取得專利國家</span>
								</th>
								<th align="center"><span style="font-size: 14">取得專利日期</span>
								</th>
								<th align="center"><span style="font-size: 14">刪除</span></th>
							</tr>

							<c:forEach items="${comp.ipRecs}" var="ip" varStatus="pStatus">
								<tr>
									<td><form:input path="ipRecs[${pStatus.index}].ipNo" />
										&nbsp; <form:errors path="ipRecs[${pStatus.index}].ipNo"
											cssClass="error" /></td>

									<td><form:input path="ipRecs[${pStatus.index}].ipName" />
										&nbsp; <form:errors path="ipRecs[${pStatus.index}].ipName"
											cssClass="error" /></td>
									<td><form:input path="ipRecs[${pStatus.index}].ipCountry" />
										&nbsp; <form:errors path="ipRecs[${pStatus.index}].ipCountry"
											cssClass="error" /></td>

									<td><form:input path="ipRecs[${pStatus.index}].ipDate" />
										&nbsp; <form:errors path="ipRecs[${pStatus.index}].ipDate"
											cssClass="error" /></td>


									<td align="center"><span style="font-size: 14"><input
											type="checkbox" name="deleteIp" value="${ip.uid}" /> 刪除</span></td>
								</tr>

							</c:forEach>
						</table>

					</div>
				</div>
			</form:form>

			<!-- contentdiv end -->
		</div>



		<%@ include file="/footer.jsp"%>
		<!--container ends here-->
	</div>


</body>
</html>
