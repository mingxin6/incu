<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link type="text/css" href="pkg/jquery/mu.css" rel="stylesheet" />
		<link rel="stylesheet" href="css/list_sheet.css">
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

function deleteFile() {
	$($(this).closest("tr"));
}
</script>

		<SCRIPT language="javascript">
  $(document)
		.ready(function() {							
				$('#addTag')
						.click(function() {
							//var fileIndex = $('#fileTable tr').children().length;
								$('#tagTable')
										.append(
												'<tr>'
														+ '<td>'
														+ '<input type="button" value="刪除" onClick="$(this).closest(\'tr\').remove();"  class="addBtn"/>'
														+ '</td>'
														+ '<td>'
														+ '<input type="text" name="myTag" />'
														+ '</td></tr>');
							});
			}//
		);
		
		
    </SCRIPT>
	</head>

	<body>

		<div id="container">

			<%@ include file="/banner2.jsp"%>
			<%@ include file="/menuPart.jsp"%>

			<h2 id="listTit"> 
				<s:message code="yourposition" text="您的位置" />>
				<s:message code="menuPart.system.manager"  text="系統設定" />>
				<span><s:message code="menuPart.system.tag" text="Tag 設定" /></span>
			</h2>

			<div id="listCon">

				<form:form id="myform" method="POST" commandName="Dumb"
					enctype="multipart/form-data" acceptcharset="UTF-8">

					<a href="javascript:submitform()" class="formIcon"><s:message code="button.save" text="儲存" /></a>

					<input id="addTag" type="button" value="<s:message code="taglist.newtag" text="增加 Tag" />" class="formIcon" />

					<table id="tagTable" width="90%" border=1 class="listTable"
						cellpadding="0" cellspacing="0">
						<tr>
							<th align="center" width="15%">
								<s:message code="button.delete" text="刪除" />
							</th>
							<th align="center" width="35%">
								Tag
							</th>
						</tr>

						<c:forEach items="${tagsList}" var="tag">
							<tr>
								<td align="left">
									<input type="button" value="<s:message code="button.delete" text="刪除" />"
										onClick="$(this).closest('tr').remove();" class="addBtn" />
								</td>
								<td align="left">
									<input type="text" name="myTag" value="${tag.tagName}">
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
