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

	</head>

	<body>

		<div id="container">

			<%@ include file="/banner2.jsp"%>
			<%@ include file="/menuPart.jsp"%>


			<h2 id="listTit">
				<span>輔導紀錄</span>
			</h2>

			<div id="listCon">
				<div class="midCon">
					<form:form method="POST" commandName="TalkNotesListController">
						<table>
							<tr>
								<td align="right">
									年:
								</td>
								<td>
									<form:select path="year" class="listSel">
										<form:option value="NONE" label="---" />
										<form:options items="${selectYear}" />
									</form:select>
								</td>
								<td align="right">
									月:
								</td>
								<td>
									<form:select path="month" class="listSel">
										<form:option value="NONE" label="---" />
										<form:options items="${selectMonth}" />
									</form:select>
								</td>
								<td>
								</td>
								<td>
								</td>
							</tr>
							<tr>
								<td align="right">
								</td>
								<td>
								</td>

								<td align="right">
									關鍵詞:
								</td>
								<td>
									<form:input path="keyContent" class="listTxt" />
								</td>

								<td>
									<input type="submit" value="過濾" class="filterBtn" />
								</td>
								<td>
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
							公司名稱
						</th>

						<th align="center" width="30%">
							主題
						</th>
						<th align="center" width="15%">
							日期
						</th>
						<th align="center" width="15%">
							狀態
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
								<span style="font-size: 14"><a
									href="talkNotesMyView.htm?compName=${compName}&compId=${compId}&talkNoteId=${talkNotes.talkNoteId}">${talkNotes.talkTheme}</a>
								</span>
							</td>

							<td align="left">
								<span style="font-size: 14">${talkNotes.talkDateTime2}</span>
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
