<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="pkg/jquery/mu.css" />
<link rel="stylesheet" href="css/list_sheet.css">
<script type="text/javascript" src="pkg/jquery/jquery.js"></script>

<!-- Menu -->
<link href="pkg/menu/p7exp.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="pkg/menu/p7exp.js"></script>

<!-- smart pagination -->
<script type="text/javascript" src="pkg/jquery/jquery-1.4.4.min.js"></script>
<script type="text/javascript"
	src="pkg/smartpagination/smartpaginator.js"></script>
<link rel="stylesheet" type="text/css"
	href="pkg/smartpagination/smartpaginator.css" />


<script type="text/javascript">
	$(document).ready(function() {

		$('#paginationBar').smartpaginator({
			totalrecords : '${fn:length(compList)}',
			recordsperpage : 15,
			length : 4,
			next : 'Next',
			prev : 'Prev',
			first : 'First',
			last : 'Last',
			theme : 'red',
			datacontainer : 'smartPagetable',
			dataelement : 'tr',
			controlsalways : true,
			onchange : function(newPage) {
				//alert('Page # ' + newPage);
			}

		});

		navigate(3);
		
	});
</script>

<style type="text/css">
.sss {
	width: 1250px;
	height: 700px;
	background: #fff;
	-webkit-box-shadow: 5px 5px 25px #333;
	border-radius: 15px;
	margin: 0 auto;
	padding: 10px 0;
}

#paginationBar {
	float: right;
}

#paginationBar .btn {
	float: left;
}

#paginationBar ul {
	float: left;
}

#paginationBar .short {
	float: right;
	margin-left: 20px;
}

.pager div.short input[type="text"] {
	border: solid 1px;
	text-align: center;
}
</style>
</head>

<body>

	<div id="container">

		<%@ include file="/banner2.jsp"%>
		<%@ include file="/menuPart.jsp"%>


		<h2 id="listTit">
			<s:message code="yourposition" text="您的位置" />
			>
			<s:message code="menuPart.movin.management" text="進駐管理" />
			> <span><s:message code="menuPart.movin.business" text="進駐企業" /></span>
		</h2>

		<div id="listCon">
			<div class="midCon">
				<form:form method="POST" commandName="compListCondition">
					<table>
						<tr>
							<td><s:message code="complist.compname" text="企業名稱" />:</td>
							<td><form:input path="compName" class="listTxt" /></td>
							<td></td>
						</tr>
						<tr>
							<td><s:message code="complist.compstatus" text="企業狀態" />:</td>
							<td><form:select path="compStatus" class="listSel">
									<form:option value="NONE" label="---" />
									<form:options items="${statusCond}" />
								</form:select></td>
							<td><input type="submit"
								value="<s:message code="button.filter"  text="過濾" />"
								class="filterBtn" /></td>
						</tr>
					</table>
				</form:form>
			</div>


			<div class="sss">
				<%--
				<a href="companyExcelList.htm?output=excel" class="exportBtn">輸	出 Excel 表</a>
				--%>

				<a href="compNew.htm" class="addBtn"><s:message
						code="complist.newapply" text="新增企業" /></a>

				<div id="paginationBar"></div>

				<table width="100%" border=1 class="listTable" cellpadding="0"
					cellspacing="0" id="smartPagetable">
					<tr>
						<th align="center" width="4%"><s:message code="complist.id"
								text="編號" /></th>
						<th align="center" width="21%"><s:message
								code="complist.compname" text="企業名稱" /></th>
						<th align="center" width="8%"><s:message
								code="complist.establishment" text="成立日期" /></th>
						<th align="center" width="10%"><s:message
								code="complist.field" text="領域" /></th>
						<th align="center" width="8%"><s:message
								code="complist.capital" text="資本額" /></th>
						<th align="center" width="21%"><s:message
								code="complist.mainproduct" text="主力產品" /></th>
						<th align="center" width="6%"><s:message
								code="complist.contacts" text="聯絡人" /></th>
						<th align="center" width="12%"><s:message code="complist.tel"
								text="電話" /></th>
						<th align="center" width="10%">Email</th>

						<!--  
						<th align="center" width="12%">
							記錄
						</th>
						-->
					</tr>




					<c:forEach items="${compList}" var="comp">
						<tr>
							<td align="center"><span style="font-size: 14">${comp.customId}</span>
							</td>
							<td align="left"><a
								href="compDetailView.htm?compID=${comp.uid}"><span
									style="font-size: 14">${comp.compName}</span> </a></td>
							<td align="left"><span style="font-size: 14">${comp.registerDate2}</span>
							</td>
							<td align="left"><span style="font-size: 14">${comp.domainRS}</span>
							</td>
							<td align="right"><span style="font-size: 14">${comp.registerCaptial}</span>
							</td>
							<td align="left"><span style="font-size: 14">${comp.prod}</span>
							</td>
							<td align="center"><span style="font-size: 14">${comp.adminContact}</span>
							</td>
							<td align="center"><span style="font-size: 14">${comp.adminContactPhone}</span>
							</td>
							<td align="left"><span style="font-size: 14">${comp.adminContactEmail2}</span>
							</td>

							<%-- 
							<td align="left">
								<span style="font-size: 14"><a
									href="TalkNotesById.htm?compName=${comp.compName}&compId=${comp.uid}">記錄(${comp.recCount})</a>
								</span>
							</td>
							--%>
						</tr>

					</c:forEach>
				</table>

				<!--sss ends here-->
			</div>

			<!--container ends here-->
		</div>
		<%@ include file="/footer.jsp"%>

		
</body>
</html>
