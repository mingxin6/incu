<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title><s:message code="menuPart.movin.management" text="進駐管理" />
	&gt;<s:message code="menuPart.movin.business" text="進駐企業" />&gt;<s:message
		code="business.info" text="企業資訊" />&gt;<s:message code="my.edit"
		text="編輯" /></title>


<link rel="stylesheet" href="css/common.css" />
<link rel="stylesheet" href="css/funbar.css">
<link rel="stylesheet" href="css/table-edit.css">

<script type="text/javascript" src="pkg/jquery/jquery.js"></script>

<!-- Date Picker -->
<link
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/themes/hot-sneaks/jquery-ui.css"
	rel="stylesheet" />

<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>

<script type="text/javascript"
	src="pkg/jquery/jquery.ui.datepicker-zh-TW.js"></script>



<!-- YUI -->
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

<script language="JavaScript">
	$(document).ready(function() {
		$("#pickRegisterDate").datepicker({
			dateFormat : "yy/mm/dd",
			showMonthAfterYear : true
		});
		$("#pickMoveInDate").datepicker({
			dateFormat : "yy/mm/dd",
			showMonthAfterYear : true
		});

		$("#pickContractStartDate").datepicker({
			dateFormat : "yy/mm/dd",
			showMonthAfterYear : true
		});
		$("#pickContractEndDate").datepicker({
			dateFormat : "yy/mm/dd",
			showMonthAfterYear : true
		});
		$("#pickMoveOutDate").datepicker({
			dateFormat : "yy/mm/dd",
			showMonthAfterYear : true
		});

	});
</script>



<script type="text/javascript">
	function submitform() {
		myEditor.saveHTML();
		var html = myEditor.get('element').value;
		$("#compIntroduction").val(html);

		myEditor2.saveHTML();
		var html2 = myEditor2.get('element').value;
		$("#remark").val(html2);

		var form = document.getElementById("myform");
		form.submit();
	}
</script>

<style>
.table-edit input[name="logoFile"] {
	border: 0px;
}
</style>

</head>

<body class="yui-skin-sam">

	<div id="container">

		<%@ include file="/banner2.jsp"%>


		<div class="funbar">
			<div class="funitem">
				<a href="compList.htm"><s:message code="button.backlist"
						text="回列表" /></a>

				<c:if test="${not empty comp.uid}">
					<a href="compDetailView.htm?compID=${comp.uid}">返回</a>
				</c:if>

				<a href="javascript:submitform()"><s:message code="button.save"
						text="儲存" /></a>
			</div>
			<%@ include file="/homeexit.jsp"%>

		</div>

		<div class="title1">${comp.compName}</div>
		<div class="clear"></div>

		<div class="contentdiv">
			<form:form id="myform" method="POST" commandName="comp"
				enctype="multipart/form-data" acceptcharset="UTF-8">

				<form:errors path="*" cssClass="errorblock" element="div" />




				<div class="collapse-wrapper">
					<div class="header">

						<s:message code="compnew.basicinfo" text="基本資訊" />
					</div>
					<div class="collapse-box">
						<table class="table-edit" WIDTH="90%">
							<tr>
								<th align="right" WIDTH="25%"><span class="tipneed">*</span>
									<s:message code="compnew.id" text="編號" />：</th>
								<td WIDTH="25%"><c:choose>
										<c:when test="${requestScope.pagetype=='edit'}">
												${comp.customId}
											</c:when>
										<c:otherwise>
												(<s:message code="compnew.autogen" text="自動產生" />)	&nbsp;		
											</c:otherwise>
									</c:choose></td>



								<th align="right" WIDTH="25%"><span class="tipneed">*</span>
									<s:message code="compnew.id2" text="統一編號" />：</th>
								<td WIDTH="25%"><form:input path="registerId" size="25" />
									&nbsp; <form:errors path="registerId" cssClass="error" /></td>
							</tr>
							<tr>
								<th align="right"><s:message code="compnew.compname"
										text="企業名稱" />：</th>
								<td><form:input path="compName" size="25" /> &nbsp; <form:errors
										path="compName" cssClass="error" /></td>
								<th align="right"><s:message code="compnew.compenname"
										text="企業英文名稱" />：</th>
								<td><form:input path="compEngName" size="25" /> &nbsp; <form:errors
										path="compEngName" cssClass="error" /></td>
							</tr>
							<tr>
								<th align="right"><s:message code="compnew.shortname"
										text="企業簡稱" />：</th>
								<td><form:input path="compShortName" size="25" /> &nbsp; <form:errors
										path="compShortName" cssClass="error" /></td>
								<th align="right"><s:message code="compnew.complogo"
										text="企業 logo" />：</th>
								<td><c:if
										test="${comp.logoFileName!=null && comp.logoFileName!='' }">
										<div>
											<div style="float: left; margin-right: 10px">
												<img src="${comp.logoFileName}" width="129" border="0" />
											</div>
											<div style="float: left">
												<input type="checkbox" name="deleteLogo"
													value="${comp.logoFileName}" /> 刪除
											</div>
										</div>
										<br />
									</c:if> <input name="logoFile" type="file" /></td>
							</tr>
							<tr>
								<th align="right"><s:message code="compnew.establishment"
										text="企業成立日期" />：</th>
								<td><form:input id="pickRegisterDate" path="registerDate"
										size="25" /> &nbsp; <form:errors path="registerDate"
										cssClass="error" /></td>
								<th align="right"><s:message code="compnew.head" text="負責人" />：
								</th>
								<td><form:input path="representative" size="25" /> &nbsp;
									<form:errors path="representative" cssClass="error" /></td>
							</tr>
							<tr>
								<th align="right"><s:message code="compnew.comptype"
										text="企業類別" />：</th>
								<td><form:select path="kind">
										<form:options items="${compKind}" />
									</form:select></td>
								<th align="right"><s:message code="compnew.compfield"
										text="企業領域" />：</th>
								<td><form:select path="domain">
										<form:options items="${compDomain}" />
									</form:select></td>
							</tr>
							<tr>
								<th align="right"><s:message code="compnew.firstindate"
										text="首次進駐日" />：</th>
								<td><form:input id="pickMoveInDate" path="moveInDate"
										size="25" /> &nbsp; <form:errors path="moveInDate"
										cssClass="error" /></td>
								<th align="right"><s:message code="compnew.status"
										text="狀態" />：</th>
								<td><form:select path="compStatus">
										<form:options items="${statusCond}" />
									</form:select></td>
							</tr>
							<tr>
								<th align="right"><s:message code="compnew.staffnum"
										text="員工人數" />：</th>
								<td><form:input path="totalEmployees" size="25" /> &nbsp;
									<form:errors path="totalEmployees" cssClass="error" /></td>
								<th align="right"><s:message code="compnew.capital"
										text="資本額(元)" />：</th>
								<td><form:input path="registerCaptial" size="25" /> &nbsp;
									<form:errors path="registerCaptial" cssClass="error" /></td>
							</tr>
							<tr>
								<th align="right"><s:message code="compnew.realcapital"
										text="實收資本額(元)" />：</th>
								<td><form:input path="actualCaptial" size="25" /> &nbsp; <form:errors
										path="actualCaptial" cssClass="error" /></td>
								<th align="right">&nbsp;</th>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<th align="right"><s:message code="compnew.compwebsite"
										text="企業網址" />：</th>
								<td><form:input path="compWebURL" size="25" /> &nbsp; <form:errors
										path="compWebURL" cssClass="error" /></td>
								<th align="right"><s:message code="compnew.mainproduct"
										text="主力產品" />：</th>
								<td><form:input path="prod" size="25" /> &nbsp; <form:errors
										path="prod" cssClass="error" /></td>
							</tr>
							<tr>
								<th align="right"><s:message code="compnew.deposit"
										text="押金" />：</th>
								<td><form:input path="deposit" size="25" /> &nbsp; <form:errors
										path="deposit" cssClass="error" /></td>
								<th align="right"><s:message code="compnew.deposit2"
										text="施工保證金" />：</th>
								<td><form:input path="bond" size="25" /> &nbsp; <form:errors
										path="bond" cssClass="error" /></td>
							</tr>
							<tr>
								<th align="right"><s:message code="compnew.compintro"
										text="企業簡介" />：</th>
								<td colspan="3"><form:hidden path="compIntroduction" /> <textarea
										name="msgpost" id="msgpost" cols="30" rows="10">${comp.compIntroduction}</textarea>
									<form:errors path="compIntroduction" cssClass="error" /></td>



							</tr>



							<%--
								<tr>
									<th align="right">
										進駐培育間：
									</th>
									<td>
										<form:input path="room" size="25" />
										&nbsp;
										<form:errors path="room" cssClass="error" />
									</td>
									<th align="right">
										簽約坪數：
									</th>
									<td>
										<form:input path="roomArea" size="25" />
										&nbsp;
										<form:errors path="roomArea" cssClass="error" />
									</td>
								</tr>
--%>

							<tr>
								<th align="right"><s:message code="compnew.remark"
										text="備註" />：</th>
								<td colspan="3"><form:hidden path="remark" /> <textarea
										name="msgpost2" id="msgpost2" cols="30" rows="10">${comp.remark}</textarea>
									<form:errors path="remark" cssClass="error" /></td>


							</tr>


						</table>
					</div>
				</div>


				<div class="collapse-wrapper">
					<div class="header">
						<s:message code="compnew.contactsinfo" text="聯絡人資訊" />
					</div>
					<div class="collapse-box">
						<table class="table-edit" WIDTH="90%">
							<tr>
								<th align="right" WIDTH="25%"><s:message code="compnew.gm"
										text="總經理" />：</th>
								<td WIDTH="25%"><form:input path="boss" size="25" />
									&nbsp; <form:errors path="boss" cssClass="error" /></td>
								<th align="right" WIDTH="25%"><s:message
										code="compnew.gmtel" text="總經理電話" />：</th>
								<td WIDTH="25%"><form:input path="phone" size="25" />
									&nbsp; <form:errors path="phone" cssClass="error" /></td>
							</tr>
							<tr>
								<th align="right"><s:message code="compnew.gmphone"
										text="總經理手機" />：</th>
								<td><form:input path="mobilePhone" size="25" /> &nbsp; <form:errors
										path="mobilePhone" cssClass="error" /></td>
								<th align="right"><s:message code="compnew.gmmailbox"
										text="總經理信箱" />：</th>
								<td><form:input path="email" size="25" /> &nbsp; <form:errors
										path="email" cssClass="error" /></td>
							</tr>
							<tr>
								<th align="right"><s:message code="compnew.contacts"
										text="聯絡人" />：</th>
								<td><form:input path="adminContact" size="25" /> &nbsp; <form:errors
										path="adminContact" cssClass="error" /></td>
								<th align="right"><s:message code="compnew.contactstel"
										text="聯絡人電話" />：</th>
								<td><form:input path="adminContactPhone" size="25" />
									&nbsp; <form:errors path="adminContactPhone" cssClass="error" />
								</td>
							</tr>
							<tr>
								<th align="right"><s:message code="compnew.contactsphone"
										text="聯絡人手機" />：</th>
								<td><form:input path="adminContactMobilePhone" size="25" />
									&nbsp; <form:errors path="adminContactMobilePhone"
										cssClass="error" /></td>
								<th align="right"><s:message code="compnew.contactsmailbox"
										text="聯絡人信箱" />：</th>
								<td><form:input path="adminContactEmail" size="25" />
									&nbsp; <form:errors path="adminContactEmail" cssClass="error" />
								</td>
							</tr>

							<tr>
								<th align="right">AM：</th>
								<td><form:select path="amId">
										<form:options items="${staffList}" itemValue="uid"
											itemLabel="name" />
									</form:select></td>
								<th align="right">PM：</th>
								<td><form:select path="pmId">
										<form:options items="${staffList}" itemValue="uid"
											itemLabel="name" />
									</form:select></td>
							</tr>
						</table>
					</div>
				</div>


				<div class="collapse-wrapper">
					<div class="header">
						<s:message code="compnew.contractinfo" text="合約資訊" />
					</div>
					<div class="collapse-box">
						<table class="table-edit" WIDTH="90%">
							<tr>
								<th align="right" WIDTH="25%"><s:message
										code="compnew.contractid" text="合約編號" />：</th>
								<td WIDTH="25%"><form:input path="contractNumber" size="25" />
									&nbsp; <form:errors path="contractNumber" cssClass="error" /></td>
								<th align="right" WIDTH="25%"><s:message
										code="compnew.contractbegin" text="合約起日" />：</th>
								<td WIDTH="25%"><form:input id="pickContractStartDate"
										path="contractStartDate" size="25" /> &nbsp; <form:errors
										path="contractStartDate" cssClass="error" /></td>
							</tr>
							<tr>
								<th align="right"><s:message code="compnew.contractend"
										text="合約迄日" />：</th>
								<td><form:input id="pickContractEndDate"
										path="contractEndDate" size="25" /> &nbsp; <form:errors
										path="contractEndDate" cssClass="error" /></td>
								<th align="right"><s:message code="compnew.code"
										text="新創代號" />&nbsp;</th>
								<td><form:select path="innoKind">
										<form:options items="${innoKind}" />
									</form:select></td>
							</tr>
						</table>
					</div>
				</div>

				<div class="collapse-wrapper">
					<div class="header">
						<s:message code="compnew.finishinfo" text="畢業資訊" />
					</div>
					<div class="collapse-box">
						<table class="table-edit" WIDTH="90%">
							<tr>
								<th align="right" WIDTH="25%"><s:message
										code="compnew.finishdate" text="畢業日" />：</th>
								<td WIDTH="25%"><form:input id="pickMoveOutDate"
										path="moveOutDate" size="25" /> &nbsp; <form:errors
										path="moveOutDate" cssClass="error" /></td>
								<th align="right" WIDTH="25%"><s:message
										code="compnew.finishaddress" text="畢業聯絡地址" />：</th>
								<td WIDTH="25%"><form:input path="moveOutAddesss" size="25" />
									&nbsp; <form:errors path="moveOutAddesss" cssClass="error" /></td>
							</tr>
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
