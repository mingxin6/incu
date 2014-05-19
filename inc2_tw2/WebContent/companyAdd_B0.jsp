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


		<script type="text/javascript">
function submitform() {
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
	$("#pickRegisterDate").datepicker( {
		dateFormat : "yy/mm/dd",
		showMonthAfterYear : true
	});
});
</script>

	</head>

	<body>

		<div id="container">

			<%@ include file="/banner2.jsp"%>
			<%@ include file="/menuPart.jsp"%>

			<div id="listCon">

				<form:form id="myform" method="POST" commandName="comp"
					enctype="multipart/form-data" acceptcharset="UTF-8">

					<form:errors path="*" cssClass="errorblock" element="div" />

					<a href="compList_B.htm" class="addBtn"><s:message
							code="button.backlist" text="回列表" />
					</a>
					<a href="javascript:submitform()" class="addBtn"><s:message
							code="button.save" text="儲存" />
					</a>



					<div class="collapse-wrapper">
						<div class="header">
							<s:message code="compboadd.compinfo" text="企業資訊" />
						</div>
						<div class="collapse-box">
							<table border="1" cellpadding="0" cellspacing="0"
								class="listTable" WIDTH="100%">

								<tr>
									<th align="right" WIDTH="25%" bgcolor=#CCCCCC>
										<s:message code="compboadd.compname" text="企業名稱" />
										：
									</th>
									<td>
										<form:input path="compName" size="40" />
										&nbsp;
										<form:errors path="compName" cssClass="error" />

									</td>
									<th WIDTH="25%" align="right">
										<s:message code="compboadd.id" text="統一編號" />
										：
									</th>
									<td>
										<form:input path="registerId" size="40" />
										&nbsp;
										<form:errors path="registerId" cssClass="error" />
									</td>
								</tr>


								<tr>
									<th WIDTH="25%" align="right">
										<s:message code="compboadd.establishmentdate" text="成立日期" />
										：
									</th>
									<td>
										<form:input id="pickRegisterDate" path="registerDate"
											size="40" />
										&nbsp;
										<form:errors path="registerDate" cssClass="error" />

									</td>
									<th WIDTH="25%" align="right">
										<s:message code="compboadd.head" text="負責人" />
										：
									</th>
									<td>
										<form:input path="representative" size="40" />
										&nbsp;
										<form:errors path="representative" cssClass="error" />

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
										<s:message code="compboadd.compfield" text="企業領域" />
										：
									</th>
									<td>
										<form:select path="domain">
											<form:options items="${compDomain}" />
										</form:select>
										&nbsp;
										<form:errors path="domain" cssClass="error" />

									</td>
								</tr>

								<tr>
									<th WIDTH="25%" align="right">
										<s:message code="compboadd.staffnum" text="員工人數" />
										：
									</th>
									<td>
										<form:input path="totalEmployees" size="40" />
										&nbsp;
										<form:errors path="totalEmployees" cssClass="error" />

									</td>
									<th WIDTH="25%" align="right">
										<s:message code="compboadd.capital" text="資本額（元）" />
										：
									</th>
									<td>
										<form:input path="registerCaptial" size="40" />
										&nbsp;
										<form:errors path="registerCaptial" cssClass="error" />

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
										<s:message code="compboadd.area" text="需求坪數" />
										：
									</th>
									<td>
										<form:input path="roomArea" size="40" />
										&nbsp;
										<form:errors path="roomArea" cssClass="error" />

									</td>
								</tr>
							</table>
						</div>
					</div>

					<div class="collapse-wrapper">
						<div class="header">
							<s:message code="compboadd.contactsinfo" text="聯絡人資訊" />
						</div>
						<div class="collapse-box">
							<table border="1" cellpadding="0" cellspacing="0"
								class="listTable" WIDTH="100%">

								<tr>
									<th WIDTH="25%" align="right">
										<s:message code="compboadd.contacts" text="聯絡人" />
										：
									</th>
									<td>
										<form:input path="adminContact" size="40" />
										&nbsp;
										<form:errors path="adminContact" cssClass="error" />

									</td>
									<th WIDTH="25%" align="right">
										<s:message code="compboadd.contactstel" text="聯絡人電話" />
										：
									</th>
									<td>
										<form:input path="adminContactPhone" size="40" />
										&nbsp;
										<form:errors path="adminContactPhone" cssClass="error" />

									</td>
								</tr>
								<tr>
									<th WIDTH="25%" align="right">
										<s:message code="compboadd.contactsphone" text="聯絡人手機" />
										：
									</th>
									<td>
										<form:input path="adminContactMobilePhone" size="40" />
										&nbsp;
										<form:errors path="adminContactMobilePhone" cssClass="error" />

									</td>
									<th WIDTH="25%" align="right">
										<s:message code="compboadd.contactsmailbox" text="聯絡人信箱" />
										：
									</th>
									<td>
										<form:input path="adminContactEmail2" size="40" />
										&nbsp;
										<form:errors path="adminContactEmail2" cssClass="error" />

									</td>
								</tr>


							</table>
						</div>
					</div>

					<%-- 
					<div class="collapse-wrapper">
						<div class="header">
							書審資料
						</div>
						<div class="collapse-box">


							<table border="1" cellpadding="0" cellspacing="0"
								class="listTable" WIDTH="98%">
								<tr>
									<th width="10%">
										文件下載：
									</th>
									<td id="docs">
										<c:forEach items="${comp.paperFileInfo}" var="obj">
											<input type="checkbox" name="deleteCheckPaper"
												value="${obj.modifiedFileName}" /> 刪除
					<a
												href="downLoadFile.htm?aid=${comp.uid}&fName=${obj.originalFileName}&mName=${obj.modifiedFileName}">${obj.originalFileName}</a>
											<br>
										</c:forEach>
									</td>
								</tr>

							</table>

							<input id="addPaperCheckFile" type="button" value="增加上傳檔"
								class="upIcon" />

							<table id="paperCheckFileTable">
								<tr>
									<td>
										<input type="button" value="刪除"
											onClick="$(this).closest('tr').remove();" class="deIcon" />
									</td>
									<td>
										<input name="paperCheckFiles" type="file" />
									</td>
								</tr>
								<tr>
									<td>
										<input type="button" value="刪除"
											onClick="$(this).closest('tr').remove();" class="deIcon" />
									</td>
									<td>
										<input name="paperCheckFiles" type="file" />
									</td>
								</tr>
								<tr>
									<td>
										<input type="button" value="刪除"
											onClick="$(this).closest('tr').remove();" class="deIcon" />
									</td>
									<td>
										<input name="paperCheckFiles" type="file" />
									</td>
								</tr>
							</table>



						</div>
					</div>




					<div class="collapse-wrapper">
						<div class="header">
							面審資料
						</div>
						<div class="collapse-box">


							<table border="1" cellpadding="0" cellspacing="0"
								class="listTable" WIDTH="98%">
								<tr>
									<th width="10%">
										文件下載：
									</th>
									<td id="docs">
										<c:forEach items="${comp.interviewFileInfo}" var="obj">
											<input type="checkbox" name="deleteCheckInterview"
												value="${obj.modifiedFileName}" /> 刪除
					<a
												href="downLoadFile.htm?aid=${comp.uid}&fName=${obj.originalFileName}&mName=${obj.modifiedFileName}">${obj.originalFileName}</a>
											<br>
										</c:forEach>
									</td>
								</tr>


							</table>

							<input id="addInterviewCheckFile" type="button" value="增加上傳檔"
								class="upIcon" />

							<table id="interviewCheckFileTable">
								<tr>
									<td>
										<input type="button" value="刪除"
											onClick="$(this).closest('tr').remove();" class="deIcon" />
									</td>
									<td>
										<input name="interviewFiles" type="file" />
									</td>
								</tr>
								<tr>
									<td>
										<input type="button" value="刪除"
											onClick="$(this).closest('tr').remove();" class="deIcon" />
									</td>
									<td>
										<input name="interviewFiles" type="file" />
									</td>
								</tr>
								<tr>
									<td>
										<input type="button" value="刪除"
											onClick="$(this).closest('tr').remove();" class="deIcon" />
									</td>
									<td>
										<input name="interviewFiles" type="file" />
									</td>
								</tr>
							</table>



						</div>
					</div>



					<div class="collapse-wrapper">
						<div class="header">
							附件
						</div>
						<div class="collapse-box">


							<table border="1" cellpadding="0" cellspacing="0"
								class="listTable" WIDTH="98%">
								<tr>
									<th width="10%">
										文件下載：
									</th>
									<td id="docs">
										<c:forEach items="${comp.handoverFileInfo}" var="obj">
											<input type="checkbox" name="deleteCheckHandover"
												value="${obj.modifiedFileName}" /> 刪除
					<a
												href="downLoadFile.htm?aid=${comp.uid}&fName=${obj.originalFileName}&mName=${obj.modifiedFileName}">${obj.originalFileName}</a>
											<br>
										</c:forEach>
									</td>
								</tr>


							</table>

							<input id="addHandoverCheckFile" type="button" value="增加上傳檔"
								class="upIcon" />

							<table id="handoverCheckFileTable">
								<tr>
									<td>
										<input type="button" value="刪除"
											onClick="$(this).closest('tr').remove();" class="deIcon" />
									</td>
									<td>
										<input name="handoverFiles" type="file" />
									</td>
								</tr>
								<tr>
									<td>
										<input type="button" value="刪除"
											onClick="$(this).closest('tr').remove();" class="deIcon" />
									</td>
									<td>
										<input name="handoverFiles" type="file" />
									</td>
								</tr>
								<tr>
									<td>
										<input type="button" value="刪除"
											onClick="$(this).closest('tr').remove();" class="deIcon" />
									</td>
									<td>
										<input name="handoverFiles" type="file" />
									</td>
								</tr>
							</table>


						</div>
					</div>
					
					--%>

				</form:form>

			</div>


		</div>
		<!--container ends here-->
		<%@ include file="/footer.jsp"%>
	</body>
</html>
