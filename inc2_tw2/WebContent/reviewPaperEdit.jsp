<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link type="text/css" href="pkg/jquery/mu.css" rel="stylesheet" />
		<link rel="stylesheet" href="css/listsheet.css" />

		<script type="text/javascript" src="pkg/jquery/jquery-1.9.1.js">
</script>
		<script type="text/javascript" src="pkg/jquery/jquery-ui-1.10.4.js">
</script>

		<link rel="stylesheet" href="pkg/tabby/css/tabby-css.css">

		<!-- 
<script type="text/javascript" src="pkg/jquery/jQuery.autoCollapser.js"></script>
-->

		<link href="pkg/menu/p7exp.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="pkg/menu/p7exp.js">
</script>


		<!-- YUI Menu -->
		<link rel="stylesheet" type="text/css" href="pkg/yuirte/skin.css">
		<script src="pkg/yuirte/yahoo-dom-event.js">
</script>
		<script src="pkg/yuirte/element-min.js">
</script>
		<!-- Needed for Menus, Buttons and Overlays used in the Toolbar -->
		<script src="pkg/yuirte/container_core-min.js">
</script>
		<script src="pkg/yuirte/menu-min.js">
</script>
		<script src="pkg/yuirte/button-min.js">
</script>
		<!-- Source file for Rich Text Editor-->
		<script src="pkg/yuirte/editor-min.js">
</script>
		<script src="pkg/yuirte/myyui.js">
</script>

		<script type="text/javascript">
function submitform() {
	myEditor.saveHTML();
	var html = myEditor.get('element').value;
	$("#remark").val(html);

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
	$("#pickTheDate").datepicker( {
		dateFormat : "yy/mm/dd",
		showMonthAfterYear : true
	});

});
</script>





		
</script>

	</head>

	<body class="yui-skin-sam">

		<div id="container">

			<%@ include file="/banner2.jsp"%>
			<%@ include file="/menuPart.jsp"%>


			<h2 id="listTit">
				您的位置>${reviewPaper.title}
			</h2>

			<div id="listCon">


				<a
					href="reviewPaperView.htm?reviewPaperUid=${reviewPaper.reviewPaperUid}"
					class="formIcon">返回</a>

				<a href="reviewPaperList.htm" class="formIcon"><s:message code="button.backlist"  text="回列表"/></a> |
				<a href="javascript:submitform()" class="formIcon"><s:message code="button.save"  text="儲存"/></a>

				<form:form id="myform" method="POST" commandName="reviewPaper"
					enctype="multipart/form-data" acceptcharset="UTF-8">

					<form:errors path="*" cssClass="errorblock" element="div" />


					<table border='1' cellpadding="0" cellspacing="0" class="listTable"
						WIDTH="100%">
						<tr>
							<th align="right" WIDTH="10%" bgcolor=#CCCCCC>
								<s:message code="reviewpaperlist.theme"  text="主題" />：
							</th>
							<td WIDTH="40%">
								<form:input path="title" size="80" />
								&nbsp;
								<form:errors path="title" cssClass="error" />
							</td>

							<th align="right" WIDTH="10%">
								<s:message code="reviewpaperlist.date"  text="日期" />：
							</th>
							<td WIDTH="20%">
								<form:input id="pickTheDate" path="thedate" size="20" />
								&nbsp;
								<form:errors path="thedate" cssClass="error" />
							</td>

							<th WIDTH="10%" align="right" bgcolor=#CCCCCC>
								<s:message code="reviewpaperlist.status"  text="狀態" />：
							</th>
							<td WIDTH="10%">
								${reviewPaper.statusRS}&nbsp;
							</td>
						</tr>
						<tr>

							<th align="right">
								<s:message code="reviewpaperlist.remark"  text="備註" />：
							</th>
							<td colspan="5">
								<form:hidden path="remark" />
								<textarea name="msgpost" id="msgpost" cols="45" rows="10">${reviewPaper.remark}</textarea>
								<form:errors path="remark" cssClass="error" />
							</td>
						</tr>
					</table>





					<br />



					<table border="1" class="listTable" cellpadding="10"
						cellspacing="0" WIDTH="98%" style="border: 1px solid black;">
						<tr style="border: 1px solid black;">
							<th align="center" width="20%" style="border: 1px solid black;">
								<span style="font-size: 25"><s:message code="reviewpaperview.comp"  text="企業" /></span>
							</th>
							<th align="center " width="25%" colspan="2"
								style="border: 1px solid black;">
								<span style="font-size: 25"><s:message code="reviewpaperview.bookreview"  text="書審" /></span>
							</th>

							<th align="center" width="25%" colspan="2"
								style="border: 1px solid black;">
								<span style="font-size: 25"><s:message code="reviewpaperview.facereview"  text="面審" /></span>
							</th>

							<th align="center" width="10%" style="border: 1px solid black;">
								<span style="font-size: 25"><s:message code="reviewpaperview.totalavg"  text="總平均" /></span>
							</th>
							<th align="center" width="10%" style="border: 1px solid black;">
								<span style="font-size: 25"><s:message code="reviewpaperview.result"  text="結果" /></span>
							</th>
						</tr>


						<!-- loop 公司 -->

						<c:forEach items="${reviewPaper.mp}" var="compEntry">
							<!--each company-->
							<tr style="border: 1px solid black;">
								<td align="left" style="border: 1px solid black;">
									<span style="font-size: 14"><h2>
											${compEntry.key.compName}
										</h2> </span>
								</td>

								<!-- loop , 單一公司數位書審委員的評分 -->

								<td style="border: 1px solid black;">
									<c:forEach items="${compEntry.value}" var="typeEntry">
										<c:if test="${typeEntry.key==reviewPaper.TYPE_PAPERREVIEW}">

											<table borde"0" cellpadding="0" cellspacing="0" width="100%">
												<c:forEach items="${typeEntry.value.reviewResults}"
													var="result">
													<tr style="border: 0;">
														<td align="left" width="40%" style="border: 0;">
															<span style="font-size: 14">${result.reviewerName}</span>
														</td>
														<td align="center" width="40%" style="border: 0;">
															<span style="font-size: 14">${result.score}</span>
														</td>
														<%-- 
														<td align="center" width="25%" style="border:0;">
															<span style="font-size: 14">${result.remark}</span>
														</td>--%>
														<td width="20%" style="border: 0;">
															<c:forEach items="${result.fileInfo}" var="obj">
																<a
																	href="downLoadFile.htm?aid=${result.reviewPaperResultUid}&fName=${obj.originalFileName}&mName=${obj.modifiedFileName}"><img
																		src="images/mydownload.png" width="100" /> </a>

																<br>
															</c:forEach>
														</td>
													</tr>
												</c:forEach>
											</table>

										</c:if>
									</c:forEach>
								</td>



								<td style="border: 1px solid black;">
									<c:forEach items="${compEntry.value}" var="typeEntry">
										<c:if test="${typeEntry.key==reviewPaper.TYPE_PAPERREVIEW}">
											${typeEntry.value.avgScore}
										</c:if>
									</c:forEach>
								</td>

								<!-- loop 單一公司數位面審委員的評分 -->

								<td style="border: 1px solid black;">
									<c:forEach items="${compEntry.value}" var="typeEntry">
										<c:if test="${typeEntry.key==reviewPaper.TYPE_MEETINGREVIEW}">

											<table borde"0" cellpadding="0" cellspacing="0" width="100%">
												<c:forEach items="${typeEntry.value.reviewResults}"
													var="result">
													<tr style="border: 0;">
														<td align="left" width="40%" style="border: 0;">
															<span style="font-size: 14">${result.reviewerName}</span>
														</td>
														<td align="center" width="40%" style="border: 0;">
															<span style="font-size: 14">${result.score}</span>
														</td>
														<%-- 
														<td align="center" width="25%" style="border:0;">
															<span style="font-size: 14">${result.remark}</span>
														</td>--%>
														<td width="20%" style="border: 0;">
															<c:forEach items="${result.fileInfo}" var="obj">
																<a
																	href="downLoadFile.htm?aid=${result.reviewPaperResultUid}&fName=${obj.originalFileName}&mName=${obj.modifiedFileName}"><img
																		src="images/mydownload.png" width="100" /> </a>

																<br>
															</c:forEach>
														</td>
													</tr>
												</c:forEach>
											</table>

										</c:if>
									</c:forEach>
								</td>



								<td style="border: 1px solid black;">
									<c:forEach items="${compEntry.value}" var="typeEntry">
										<c:if test="${typeEntry.key==reviewPaper.TYPE_MEETINGREVIEW}">
											${typeEntry.value.avgScore}
										</c:if>
									</c:forEach>
								</td>

								<!--  單一公司總平均 -->

								<td style="border: 1px solid black;">
									${compEntry.key.avgScoreTotal}
								</td>

								<!-- 單一公司結果 -->

								<td style="border: 1px solid black;">
									${compEntry.key.finalPassRS}
								</td>
						</c:forEach>
					</table>





					<div>
						<s:message code="reviewpaperadd.pickcomp"  text="挑選企業" />
					</div>

					<table width="100%" border=1 class="listTable" cellpadding="0"
						cellspacing="0">
						<tr>
							<th align="center" width="5%">
								<s:message code="reviewpaperadd.pick"  text="勾選" />
							</th>
							<th align="center" width="25%">
								<s:message code="complist_b.compname"  text="企業名稱" />
							</th>
							<th align="center" width="10%">
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
							<th align="center" width="10%">
								<s:message code="complist_b.status"  text="狀態" />
							</th>
						</tr>
						<c:forEach items="${compList}" var="comp">
							<tr>
								<td>
									<input type="checkbox" name="compChecked"
										value="${comp.uid}_${comp.compName}"
										<c:if test="${comp.exist}">checked</c:if>>
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
									<span style="font-size: 14">${comp.registerDate}</span>
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

								<td align="left">
									<span style="font-size: 14">${comp.compStatusRS}</span>
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

					<div>
						<s:message code="reviewpaperadd.pickreviewer"  text="挑選審查委員" />
					</div>


					<table width="90%" border=1 class="listTable" cellpadding="0"
						cellspacing="0">
						<tr>
							<th align="center" width="20%">
								<s:message code="reviewpaperadd.bookreviewer"  text="書審委員" />
							</th>
							<th align="center" width="20%">
								<s:message code="reviewpaperadd.facereviewer"  text="面審委員" />
							</th>
							<th align="center" width="60%">
								<s:message code="reviewpaperadd.reviewername"  text="姓名" />
							</th>
						</tr>
						<c:forEach items="${reviewerList}" var="reviewer">
							<tr>
								<td align="center">
									<input type="checkbox" name="p_reviewerChecked"
										value="${reviewer.uid}_${reviewer.name}"
										<c:if test="${reviewer.existPaperRiviewer}">checked</c:if>>
								</td>
								<td align="center">
									<input type="checkbox" name="m_reviewerChecked"
										value="${reviewer.uid}_${reviewer.name}"
										<c:if test="${reviewer.existMeetingRiviewer}">checked</c:if>>
								</td>
								<%--
								<td align="left">
									<span style="font-size: 14"><a
										href="reviewerView.htm?uid=${reviewer.uid}">${reviewer.name}</a>
									</span>
								</td>
								 --%>
								<td align="left">
									<span style="font-size: 14">${reviewer.name} </span>
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
