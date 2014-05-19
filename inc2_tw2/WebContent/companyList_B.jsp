<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link type="text/css" href="pkg/jquery/mu.css" rel="stylesheet" />
		<link rel="stylesheet" href="css/list_sheet.css" />
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
				<s:message code="yourposition"  text="您的位置" />>
				<s:message code="menuPart.movin.management"  text="進駐管理" />>
				<span><s:message code="menuPart.movin.apply" text="進駐申請" /></span>
				 
			</h2>

			<div id="listCon">

				<div class="midCon">
					<form:form method="POST" commandName="compListCondition_B">
						<table>
							<tr>
								<td>
									<s:message code="complist_b.compname"  text="企業名稱" />:
								</td>
								<td>
									<form:input path="compName" class="listTxt" />
								</td>
								<td></td>
							</tr>
							<tr>
								<td>
									<s:message code="complist_b.compstatus"  text="企業狀態" />:
								</td>
								<td>
									<form:select path="compStatus" class="listSel">
										<form:option value="NONE" label="---" />
										<form:options items="${statusCond_B}" />
									</form:select>
								</td>
								<td>
									<input type="submit" value="<s:message code="button.filter"  text="過濾" />" class="filterBtn" />
								</td>
							</tr>
						</table>
					</form:form>
				</div>

				<%--
				<a href="companyExcelList.htm?output=excel" class="exportBtn">輸
					出 Excel 表</a>
					--%>

				<a href="compB0Add.htm" class="addBtn"><s:message code="complist_b.newapply"  text="新增進駐申請" /></a>


				<table width="100%" border=1 class="listTable" cellpadding="0"
					cellspacing="0">
					<tr>
						<th align="center" width="10%">
							
							<s:message code="complist_b.status"  text="狀態" />
						</th>
						<th align="center" width="26%">
						<s:message code="complist_b.compname"  text="企業名稱" />
							
						</th>
						<th align="center" width="7%">
						<s:message code="complist_b.apply"  text="申請" />
							
						</th>
						<th align="center" width="7%">
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
					</tr>


					<c:forEach items="${compList}" var="comp">
						<tr>
							<td align="left">
								<span style="font-size: 14">${comp.compStatusRS}</span>
							</td>
							
							<td align="left">
								<a href="compDetailView_B.htm?compID=${comp.uid}"><span
									style="font-size: 14">${comp.compName}</span> </a>
							</td>
<%-- 
							<td align="left">
								<span style="font-size: 14">${comp.compName}</span>
							</td>
--%>
							<td align="left">
								<span style="font-size: 14">${comp.createdTime2}</span>
							</td>
							<td align="left">
								<span style="font-size: 14">${comp.registerDate2}</span>
							</td>
							<td align="left">
								<span style="font-size: 14">${comp.domainRS}</span>
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

			</div>

		</div>
		<!--container ends here--><%@ include file="/footer.jsp"%>
	</body>
</html>
