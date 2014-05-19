<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link type="text/css" href="pkg/jquery/mu.css" rel="stylesheet" />
		<link rel="stylesheet" href="css/listsheet.css">
		<script type="text/javascript" src="pkg/jquery/jquery.js">
</script>
		<link href="pkg/menu/p7exp.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="pkg/menu/p7exp.js">
</script>

	</head>

	<body>

		<div id="container">

			<%@ include file="/banner2.jsp"%>
			<%@ include file="/menuPart.jsp"%>


			<h2 id="listTit">
				<s:message code="yourposition" text="您的位置" />>
				<s:message code="menuPart.consult.management"  text="輔導管理" />>
				<span><s:message code="menuPart.consult.all" text="所有輔導記錄" /></span>
			</h2>

			<div id="listCon">
				<div class="midCon">
					<form:form method="POST" commandName="TalkNotesListController">
						<table>
							<tr>
								<td align="right">
									<s:message code="my.year" text="年" />:
								</td>
								<td>
									<form:select path="year" class="listSel">
										<form:option value="NONE" label="---" />
										<form:options items="${selectYear}" />
									</form:select>
								</td>
								<td align="right">
									<s:message code="my.month" text="月" />:
								</td>
								<td>
									<form:select path="month" class="listSel">
										<form:option value="NONE" label="---" />
										<form:options items="${selectMonth}" />
									</form:select>
								</td>
								<td align="right">
									<s:message code="my.status" text="狀態" />:
								</td>
								<td>
									<form:select path="status" class="listSel">
										<form:options items="${statuses}" />
									</form:select>
								</td>
								<td align="right">

								</td>
							</tr>
							<tr>
								<td align="right">
									<s:message code='my.company.name' text='公司名稱' />:
								</td>
								<td>
									<form:input path="compName" class="listTxt" />
								</td>

								<td align="right">
									<s:message code="request.keyword" text="關鍵詞" />:
								</td>
								<td>
									<form:input path="keyContent" class="listTxt" />
								</td>
								<td align="right">
									<s:message code='my.kind' text='類別' />:
								</td>
								<td>
									<form:select path="type" class="listSel">
										<form:options items="${consultTypes}" />
									</form:select>
								</td>

								<td align="right">
									<input type="submit" value="<s:message code='request.filter' text='過濾' />" class="formIcon" />
								</td>
							</tr>
							<tr>
								<td align="right">
									Tag :
								</td>
								<td colspan="5">
									<form:checkboxes items="${tagsList}" path="tags" />
									<form:errors path="tags" cssClass="error" />
								</td>
							</tr>
						</table>
					</form:form>
				</div>

				<!-- 
				<a href="companyExcelList.htm?output=excel" class="exportBtn">輸
					出 Excel 表</a>
				<a href="compNew.htm" class="addBtn">新 增 公司</a>

				
				<table width="1228" border=1 class="listTable" cellpadding="0"
					cellspacing="0">
					-->


				<table width="90%" border=1 class="listTable" cellpadding="0"
					cellspacing="0">
					<tr>
						<!-- 
						<th align="center" width="8%">
							編號
						</th>
						-->
						<th align="center" width="20%">
							<s:message code='my.company.name' text='公司名稱' />
						</th>
						<th align="center" width="10%">
							<s:message code='my.kind' text='類別' />
						</th>
						<th align="center" width="20%">
							<s:message code="my.subject" text="標題" />
						</th>
						<th align="center" width="10%">
							<s:message code="my.date" text="日期" />
						</th>
						<th align="center" width="10%">
							<s:message code="my.consultant" text="輔導人" />
						</th>
						<th align="center" width="10%">
							<s:message code="my.status" text="狀態" />
						</th>
						<th align="center" width="20%">
							Tag
						</th>

					</tr>

					<c:forEach items="${talkNotesList}" var="talkNotes">
						<tr>
							<%-- 
							<td align="center">
								<span style="font-size: 14">${talkNotes.compId}</span>
							</td>
							--%>
							<td align="left">
								<span style="font-size: 14">${talkNotes.compName}</span>
							</td>
							<td align="left">
								<span style="font-size: 14">${talkNotes.typeRS}</span>
							</td>

							<td align="left">
								<span style="font-size: 14"><a
									href="TalkNotesViewFromList.htm?compName=${compName}&compId=${compId}&talkNoteId=${talkNotes.talkNoteId}">${talkNotes.talkTheme}</a>
								</span>
							</td>

							<td align="left">
								<span style="font-size: 14">${talkNotes.talkDateTime}</span>
							</td>
							<td align="left">
								<span style="font-size: 14">${talkNotes.consultantName}</span>
							</td>
							<td align="left">
								<span style="font-size: 14">${talkNotes.caseStatusRS}</span>
							</td>
							<td align="left">
								<span style="font-size: 14">${talkNotes.allTagNames}</span>
							</td>
						</tr>

					</c:forEach>
				</table>

			</div>

		</div>
		<!--container ends here--><%@ include file="/footer.jsp"%>
	</body>
</html>
