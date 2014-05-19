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

	var form = document.getElementById("myform");
	form.submit();
}
</script>




		<!-- Date Picker -->
		<link
			href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/themes/hot-sneaks/jquery-ui.css"
			rel="stylesheet" />
		<script type="text/javascript"
			src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js">
</script>
		<script type="text/javascript"
			src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js">
</script>
		<script type="text/javascript"
			src="pkg/jquery/jquery.ui.datepicker-zh-TW.js">
</script>




		<script language="JavaScript">
$(document).ready(function() {
	$("#pickTheDate").datepicker( {
		dateFormat : "yy/mm/dd",
		showMonthAfterYear : true
	});

});
</script>


	</head>

	<body class="yui-skin-sam">

		<div id="container">

			<%@ include file="/banner2.jsp"%>
			<%@ include file="/menuPart.jsp"%>


			 

			<div id="listCon">

				<%-- 
				<div class="midCon">	
					<form:form method="POST" commandName="compListCondition_B">
						<table>
							<tr>
								<td>
									企業名稱:
								</td>
								<td>
									<form:input path="compName" class="listTxt" />
								</td>
								<td>
									<input type="submit" value="過&nbsp;&nbsp;濾" class="filterBtn" />
								</td>
							</tr>
						</table>
					</form:form>
				</div>

				<a href="companyExcelList.htm?output=excel" class="exportBtn">輸
					出 Excel 表</a>
				<a href="compNew_B.htm" class="addBtn">新 增 企 業</a>

--%>



				<form:form id="myform" method="POST" commandName="ReviewPaper"
					enctype="multipart/form-data" acceptcharset="UTF-8">

					<a href="reviewPaperList.htm" class="formIcon"><s:message code="button.backlist"  text="回列表"/></a> | <a
						href="javascript:submitform()" class="okIcon"><s:message code="button.save"  text="儲存"/></a>

					<form:errors path="*" cssClass="errorblock" element="div" />

					<table width=98% border="1" cellpadding="0" cellspacing="0"
						class="listTable" WIDTH="100%">

						<tr>
							<th align="center">
								<s:message code="reviewpaperlist.theme"  text="主題" />：
							</th>
							<td WIDTH="90%">
								<form:input path="title" size="80" />
								&nbsp;
								<form:errors path="title" cssClass="error" />
							</td>
						</tr>

						<tr>
							<th align="center" width="10%" WIDTH="25%" bgcolor=#CCCCCC>
								<s:message code="reviewpaperlist.date"  text="日期" />：
							</th>
							<td WIDTH="90%">
								<form:input id="pickTheDate" path="thedate" size="80" />
								&nbsp;
								<form:errors path="thedate" cssClass="error" />
							</td>
						</tr>
						<tr>
							<th align="center">
								<s:message code="reviewpaperlist.remark"  text="備註" />：
							</th>
							<td>
								<form:hidden path="remark" />
								<textarea name="msgpost" id="msgpost" cols="45" rows="10">${ReviewPaper.remark}</textarea>
								<form:errors path="remark" cssClass="error" />
							</td>
						</tr>

					</table>

					<div>
						<s:message code="reviewpaperadd.pickcomp"  text="挑選企業" />
					</div>

					<table width="100%" border=1 class="listTable" cellpadding="0"
						cellspacing="0">
						<tr>
							<th align="center" width="5%">
								<s:message code="reviewpaperadd.pick"  text="勾選" />
							</th>
							<th align="center" width="25%">
								<s:message code="complist_b.compname"  text="企業名稱" />
							</th>
							<th align="center" width="10%">
								<s:message code="complist_b.establishment"  text="成立" />
							</th>
							<th align="center" width="10%">
								<s:message code="complist_b.field"  text="領域" />
							</th>
							<th align="center" width="10%">
								<s:message code="complist_b.capital"  text="資本額" />
							</th>
							<th align="center" width="10%">
								<s:message code="complist_b.contacts"  text="聯絡人" />
							</th>
							<th align="center" width="10%">
								<s:message code="complist_b.tel"  text="電話" />
							</th>
							<th align="center" width="10%">
								Email
							</th>
							<th align="center" width="10%">
								<s:message code="complist_b.status"  text="狀態" />
							</th>
						</tr>
						<c:forEach items="${compList}" var="comp">
							<tr>
								<td>
									<input type="checkbox" name="compChecked"
										value="${comp.uid}_${comp.compName}">
								</td>

								<%--
								<td align="left">
									<a href="compDetailView_B.htm?compID=${comp.uid}"><span
										style="font-size: 14">${comp.compName}</span> </a>
								</td>
								 --%>
								<td align="left">
									<span style="font-size: 14">${comp.compName}</span>
								</td>

								<td align="left">
									<span style="font-size: 14">${comp.registerDate}</span>
								</td>
								<td align="left">
									<span style="font-size: 14">${comp.domain}</span>
								</td>
								<td align="right">
									<span style="font-size: 14">${comp.registerCaptial}</span>
								</td>

								<td align="center">
									<span style="font-size: 14">${comp.adminContact}</span>
								</td>
								<td align="center">
									<span style="font-size: 14">${comp.adminContactPhone}</span>
								</td>
								<td align="left">
									<span style="font-size: 14">${comp.adminContactEmail2}</span>
								</td>

								<td align="left">
									<span style="font-size: 14">${comp.compStatusRS}</span>
								</td>

								<!-- 
							<td align="left">
								<span style="font-size: 14"><a
									href="TalkNotesById_B.htm?compName=${comp.compName}&compId=${comp.uid}">記錄(${comp.recCount})</a>
								</span>
							</td>
							-->
							</tr>


						</c:forEach>
					</table>

					<div>
						<s:message code="reviewpaperadd.pickreviewer"  text="挑選審查委員" />
					</div>


					<table width="90%" border=1 class="listTable" cellpadding="0"
						cellspacing="0">
						<tr>
							<th align="center" width="20%">
								<s:message code="reviewpaperadd.bookreviewer"  text="書審委員" />
							</th>
							<th align="center" width="20%">
								<s:message code="reviewpaperadd.facereviewer"  text="面審委員" />
							</th>
							<th align="center" width="60%">
								<s:message code="reviewpaperadd.reviewername"  text="姓名" />
							</th>
						</tr>
						<c:forEach items="${reviewerList}" var="reviewer">
							<tr>
								<td align="center">
									<input type="checkbox" name="p_reviewerChecked"
										value="${reviewer.uid}_${reviewer.name}">
								</td>
								<td align="center">
									<input type="checkbox" name="m_reviewerChecked"
										value="${reviewer.uid}_${reviewer.name}">
								</td>
								<%-- 
								<td align="left">
									<span style="font-size: 14"><a
										href="reviewerView.htm?uid=${reviewer.uid}">${reviewer.name}</a>
									</span>
								</td>
								--%>
								<td align="left">
									<span style="font-size: 14">${reviewer.name} </span>
								</td>
							</tr>
						</c:forEach>
					</table>

				</form:form>
			</div>

		</div>
		<!--container ends here--><%@ include file="/footer.jsp"%>
	</body>
</html>
