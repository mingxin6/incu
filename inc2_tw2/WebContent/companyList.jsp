<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:message code="menuPart.movin.management" text="進駐管理" />
	&gt;<s:message code="menuPart.movin.business" text="進駐企業" /></title>


<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/funbar.css">
<link rel="stylesheet" href="css/table-list.css">
<link rel="stylesheet" href="css/table-nogrid.css">

<script type="text/javascript" src="pkg/jquery/jquery.js"></script>


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

	});
</script>

<style type="text/css">
.contentdiv {
	width: 1280px;
	/* 	border-right: 1px solid black; */
	/* 	border-left: 1px solid black; */
	box-sizing: border-box;
}

#paginationBar {
	float: right;
	font-family: arial;
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

#listTit {
	font-family: DFKai-SB;
	color: #5E5E5E;
	font-size: 13px;
}
</style>






<style type="text/css">
#fade {
	display: none;
	position: absolute;
	top: 0%;
	left: 0%;
	width: 100%;
	height: 100%;
	background-color: black;
	z-index: 1001;
	-moz-opacity: 0.8;
	opacity: .80;
	filter: alpha(opacity = 80);
}

#popupdiv {
	display: none;
	position: absolute;
	top: 150px;
	left: 25%;
	width: 50%;
	height: 500px;
	padding: 16px;
	border: 3px solid orange;
	background-color: white;
	z-index: 1002;
	overflow: auto;
}
</style>
<script type="text/javascript">
	window.onload = function() {
		var linkbt = document.getElementById("linkbt");
		var popupdiv = document.getElementById('popupdiv');
		var fade = document.getElementById('fade');
		var closebt = document.getElementById("closebt");
		linkbt.onclick = function() {
			popupdiv.style.display = 'block';
			fade.style.display = 'block';
		}
		closebt.onclick = function() {
			popupdiv.style.display = 'none';
			fade.style.display = 'none';
		}
	}
</script>


</head>

<body>

	<div id="container">

		<%@ include file="/banner2.jsp"%>

		<div class="funbar">
			<div class="funitem">
				<a href="javascript:void(0)" id="linkbt"><s:message
						code="button.filter" text="過濾" /> </a>&nbsp; <a href="compNew.htm"><s:message
						code="complist.newapply" text="新增企業" /></a>
			</div>
			<%@ include file="/homeexit.jsp"%>
		</div>



		<div class="contentdiv">
			<%--
				<a href="companyExcelList.htm?output=excel" class="exportBtn">輸	出 Excel 表</a>
				

				<a href="compNew.htm" class="addBtn"><s:message
						code="complist.newapply" text="新增企業" /></a>
--%>


			<div id="paginationBar"></div>

			<table width="100%" class="table-list" id="smartPagetable">
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

			<!--contentdiv ends here-->
		</div>


		<%@ include file="/footer.jsp"%>

		<!--container ends here-->
	</div>





	<div id="popupdiv">
		<a href="javascript:void(0)" id="closebt">关闭窗口</a> <br />
		<div class="formdiv">
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
						<td></td>
					</tr>
				</table>
				<br />
				<input type="submit"
					value="<s:message code="button.filter"  text="過濾" />"
					class="filterBtn" />
			</form:form>
		</div>
	</div>
	<div id="fade"></div>

</body>
</html>
