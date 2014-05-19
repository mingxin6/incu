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
		<script src="pkg/yuirte/myyui2.js">
</script>


		<script type="text/javascript">

function checkIpNo() {
	var elem = document.getElementsByName('myno');
	for ( var i = 0; i < elem.length; ++i) {
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
	for ( var i = 0; i < elem.length; ++i) {
		if (elem[i].value == "") {
			alert("專利名稱不可空白！");
			return false;
		}
	}
	return true;
}
function checkIpCountry() {
	var elem = document.getElementsByName('mycountry');
	for ( var i = 0; i < elem.length; ++i) {
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
		.ready(function() {
			//add more file components if Add is clicked
				$('#addIp')
						.click(function() {
							//var fileIndex = $('#fileTable tr').children().length;
								$('#ipTable')
										.append(
												'<tr>'
														+'<td>'
														+ '<input type="text" name="myno" />'
														+'</td>'
														+'<td>'
														+ '<input type="text" name="myname" />'
														+'</td>'
														+'<td>'
														+ '<input type="text" name="mycountry" />'
														
														+'</td>'
														+'<td>'
														+ '<input type="text" name="mydate" />'
														+'</td>'
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
			<%@ include file="/menuPart.jsp"%>



			<div id="listCon">
				<h2>
					${comp.compName}
				</h2>

				<br>
				<form:form id="myform" method="POST" commandName="comp"
					enctype="multipart/form-data" acceptcharset="UTF-8">

					<form:errors path="*" cssClass="errorblock" element="div" />

					<a href="compList.htm" class="addBtn">回列表</a>
					<a href="compDetailView.htm?compID=${comp.uid}" class="addBtn">返回</a>
					<a href="javascript:submitform()" class="addBtn">儲存</a>


					<div class="collapse-wrapper">
						<div class="header">
							專利資訊
						</div>
						<div class="collapse-box">

							<input id="addIp" type="button" value="增加 一列" class="upIcon" />

							<table width="100%" border=1 class="listTable" id="ipTable">
								<tr>
									<th align="center">
										<span style="font-size: 14">專利證號</span>
									</th>
									<th align="center">
										<span style="font-size: 14">專利名稱</span>
									</th>
									<th align="center">
										<span style="font-size: 14">取得專利國家</span>
									</th>
									<th align="center">
										<span style="font-size: 14">取得專利日期</span>
									</th>
									<th align="center">
										<span style="font-size: 14">刪除</span>
									</th>
								</tr>

								<c:forEach items="${comp.ipRecs}" var="ip" varStatus="pStatus">
									<tr>
										<td>
											<form:input path="ipRecs[${pStatus.index}].ipNo" />
											&nbsp;
											<form:errors path="ipRecs[${pStatus.index}].ipNo"
												cssClass="error" />
										</td>

										<td>
											<form:input path="ipRecs[${pStatus.index}].ipName" />
											&nbsp;
											<form:errors path="ipRecs[${pStatus.index}].ipName"
												cssClass="error" />
										</td>
										<td>
											<form:input path="ipRecs[${pStatus.index}].ipCountry" />
											&nbsp;
											<form:errors path="ipRecs[${pStatus.index}].ipCountry"
												cssClass="error" />
										</td>

										<td>
											<form:input path="ipRecs[${pStatus.index}].ipDate" />
											&nbsp;
											<form:errors path="ipRecs[${pStatus.index}].ipDate"
												cssClass="error" />
										</td>


										<td align="center">
											<span style="font-size: 14"><input type="checkbox"
													name="deleteIp" value="${ip.uid}" /> 刪除</span>
										</td>
									</tr>

								</c:forEach>
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