<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link type="text/css" href="pkg/jquery/mu.css" rel="stylesheet" />
		<link rel="stylesheet" href="css/listsheet.css" />

		<!--  
		<script type="text/javascript" src="pkg/jquery/jquery.js">
</script>-->


		<script type="text/javascript" src="pkg/jquery/jquery-1.9.1.js">
</script>
		<script type="text/javascript" src="pkg/jquery/jquery-ui-1.10.4.js">
</script>


		<!-- Menu -->
		<link href="pkg/menu/p7exp.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="pkg/menu/p7exp.js">
</script>


		<!-- Tabs -->
		<link type="text/css" href="pkg/tabs/tabs.css" rel="stylesheet" />

		<script>
$(function() {
	$("#tabs").tabs();
});

$(document).ready(function() {
	<c:if test="${not empty tab2}">
   		$('#tabs a[href="#tab2"]').trigger('click');
	</c:if>
	
	<c:if test="${!empty tab1}">
   		$('#tabs a[href="#tab1"]').trigger('click');
	</c:if>
});

</script>

	</head>

	<body>

		<div id="container">

			<%@ include file="/banner2.jsp"%>
			<%@ include file="/menuPart.jsp"%>


			<h2 id="listTit">  
				<s:message code="yourposition"  text="您的位置" />>
				<s:message code="menuPart.movin.management"  text="進駐管理" />>
				<span><s:message code="menuPart.movin.review" text="審查管理" /></span>
			</h2>

			<div id="listCon">



				<a href="reviewPaperAdd.htm" class="formIcon"><s:message code="reviewpaperlist.newreview"  text="新增審查" /></a>


				<div id="tabs">
					<ul>
						<li>
							<a href="#tab1"><s:message code="reviewpaperlist.applycomp"  text="申請進駐企業" /></a>
						</li>
						<li>
							<a href="#tab2"><s:message code="reviewpaperlist.reviewer"  text="審查會" /></a>
						</li>
					</ul>

					<div class="tabs-pane" id="tab1">

						<div class="header">
							<s:message code="reviewpaperlist.applycompdata"  text="申請進駐企業資料" />
						</div>

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


					<div class="tabs-pane" id="tab2">

						<div class="header">
							<s:message code="reviewpaperlist.reviewerdata"  text="審查會資料" />
						</div>

						<div class="midCon">
							<form:form method="POST" commandName="ReviewPaperListController">
								<table>
									<tr>
										<td align="right">
											<s:message code="reviewpaperlist.status"  text="狀態" />:
										</td>
										<td>
											<form:select path="status" class="listSel">
												<form:options items="${statuses}" />
											</form:select>
										</td>

										<td align="left">
											<input type="submit" value="<s:message code="reviewpaperlist.filter"  text="過濾" />" class="formIcon" />
										</td>
									</tr>
								</table>
							</form:form>
						</div>


						<table width="100%" border=1 class="listTable" cellpadding="0"
							cellspacing="0">
							<tr>

								<th align="center" width="25%">
									<s:message code="reviewpaperlist.theme"  text="主題" />
								</th>
								<th align="center" width="8%">
									<s:message code="reviewpaperlist.date"  text="日期" />
								</th>
								<th align="center" width="25%">
									<s:message code="reviewpaperlist.remark"  text="備註" />
								</th>
								<th align="center" width="12%">
									<s:message code="reviewpaperlist.status"  text="狀態" />
								</th>

							</tr>
							<c:forEach items="${reviewPaperList}" var="reviewPaper">
								<tr>
									<td align="left">
										<a
											href="reviewPaperView.htm?reviewPaperUid=${reviewPaper.reviewPaperUid}"><span
											style="font-size: 14">${reviewPaper.title}</span> </a>
									</td>
									<td align="left">
										<span style="font-size: 14">${reviewPaper.thedate}</span>
									</td>
									<td align="right">
										<span style="font-size: 14">${reviewPaper.remark}</span>
									</td>

									<td align="center">
										<span style="font-size: 14">${reviewPaper.statusRS}</span>
									</td>

								</tr>

							</c:forEach>
						</table>

					</div>

				</div>
			</div>

		</div>
		<!--container ends here--><%@ include file="/footer.jsp"%>
	</body>
</html>
