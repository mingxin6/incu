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
		<!-- <div
			style="width: 100%; height: 17px; background: url(images/topbg.png) repeat-x; margin-top: 8px;"></div> -->
		<div id="container">
		<!-- 	<table width="1000" border="0" cellpadding="0" border="0"
				style="margin: 20px auto 0;">
				<tr>
					<td width="239" align="left">
						<img src="images/nsi_header.png" height="70">
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
			</table>
			 -->
			<%@ include file="/banner2.jsp"%>
			<%@ include file="/menuPart.jsp"%>


			<h2 id="listTit"> 
				<s:message code="yourposition" text="您的位置" />> 
				<span><s:message code="menuPart.activity" text="活動管理" /></span>
				
			</h2>

			<div id="listCon">
				<div class="midCon">
					<form:form method="POST" commandName="voActivityRecSearchCondition">
						<table>
							<tr>
								<td align="right">
									<s:message code="activityreclist.year" text="年" />:
								</td>
								<td>
									<form:select path="year" class="listSel">
										<form:option value="NONE" label="---" />
										<form:options items="${selectYear}" />
									</form:select>
								</td>
								<td align="right">
									<s:message code="activityreclist.month" text="月" />:
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
									<s:message code="activityreclist.keyword" text="關鍵詞" />:
								</td>
								<td>
									<form:input path="keyContent" class="listTxt" />
								</td>

								<td>
									<input type="submit" value="<s:message code="button.filter" text="過濾" />" class="filterBtn" />
								</td>
								<td>
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

				<c:if test="${user.isStaff}">
					<a href="activityRecAdd.htm"  class="addBtn"><s:message code="activityreclist.newactivity" text="新增活動" /></a>
				</c:if>

				<table width="90%" border=1 class="listTable" cellpadding="0"
					cellspacing="0">
					<tr>

						<th align="center" width="20%">
							<s:message code="activityreclist.theme" text="主題" />
						</th>

						<th align="center" width="15%">
							<s:message code="activityreclist.date" text="日期" />
						</th>

					</tr>

					<c:forEach items="${activityRecList}" var="activityRec">
						<tr>
							<td align="left">
								<span style="font-size: 14"><a
									href="activityRecView.htm?uid=${activityRec.uid}">${activityRec.title}</a>
								</span>
							</td>

							<td align="left">
								<span style="font-size: 14">${activityRec.theDate}</span>
							</td>
						</tr>

					</c:forEach>
				</table>

			</div>

		</div>
		<!--container ends here--><%@ include file="/footer.jsp"%>
	</body>
</html>
