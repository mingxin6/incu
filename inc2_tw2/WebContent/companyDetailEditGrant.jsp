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

function checkGrantName() {
	var elem = document.getElementsByName('myGrantName');
	for ( var i = 0; i < elem.length; ++i) {
		if (elem[i].value == "") {
			alert("申請計畫名稱不可空白！");
			return false;
		}
	}
	return true;
}

function submitform() {
	if (!checkGrantName()) {
		return false;
	}
	var form = document.getElementById("myform");
	form.submit();
}
</script>

		<SCRIPT language="javascript">
      
 
 $(document)
		.ready(function() {
				$('#addGrant')
						.click(function() {
							//var fileIndex = $('#fileTable tr').children().length;
								$('#grantTable')
										.append(
												'<tr>'
														+'<td>'
														+ '<input type="text" name="myGrantName" />'
														+'</td>'
														+'<td>'
														+ '<input type="text" name="myGrantIssuer" />'
														+'</td>'
														+'<td>'
														+ '<input type="text" name="myProjectName" />'
														+'</td>'
														+'<td>'
														+ '<input type="text" name="myGrantDate" />'
														+'</td>'
														+'<td>'
														+ '<input type="text" name="myProjTotalMoney" />'
														+'</td>'
														+'<td>'
														+ '<input type="text" name="myGrantMoney" />'
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
							補助資訊
						</div>
						<div class="collapse-box">

							<input id="addGrant" type="button" value="增加 一列" class="upIcon" />

							<table width="100%" border=1 class="listTable" id="grantTable">
								<tr>
									<th align="center">
										<span style="font-size: 14">申請計畫名稱</span>
									</th>
									<th align="center">
										<span style="font-size: 14">授與單位</span>
									</th>
									<th align="center">
										<span style="font-size: 14">申請計畫標的</span>
									</th>
									<th align="center">
										<span style="font-size: 14">取得補助年月</span>
									</th>
									<th align="center">
										<span style="font-size: 14">計畫總金額</span>
									</th>
									<th align="center">
										<span style="font-size: 14">計畫補助金額</span>
									</th>
									<th align="center">
										<span style="font-size: 14">刪除</span>
									</th>
								</tr>

								<c:forEach items="${comp.grantRecs}" var="grant"
									varStatus="pStatus">
									<tr>
										<td>
											<form:input path="grantRecs[${pStatus.index}].grantName" />
											&nbsp;
											<form:errors path="grantRecs[${pStatus.index}].grantName"
												cssClass="error" />
										</td>

										<td>
											<form:input path="grantRecs[${pStatus.index}].grantIssuer" />
											&nbsp;
											<form:errors path="grantRecs[${pStatus.index}].grantIssuer"
												cssClass="error" />
										</td>
										<td>
											<form:input path="grantRecs[${pStatus.index}].projectName" />
											&nbsp;
											<form:errors path="grantRecs[${pStatus.index}].projectName"
												cssClass="error" />
										</td>

										<td>
											<form:input path="grantRecs[${pStatus.index}].grantDate" />
											&nbsp;
											<form:errors path="grantRecs[${pStatus.index}].grantDate"
												cssClass="error" />
										</td>

										<td>
											<form:input path="grantRecs[${pStatus.index}].projTotalMoney" />
											&nbsp;
											<form:errors
												path="grantRecs[${pStatus.index}].projTotalMoney"
												cssClass="error" />
										</td>

										<td>
											<form:input path="grantRecs[${pStatus.index}].grantMoney" />
											&nbsp;
											<form:errors path="grantRecs[${pStatus.index}].grantMoney"
												cssClass="error" />
										</td>

										<td align="center">
											<span style="font-size: 14"><input type="checkbox"
													name="deleteGrant" value="${grant.uid}" /> 刪除</span>
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
