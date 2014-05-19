<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link type="text/css" href="pkg/jquery/mu.css" rel="stylesheet" />
		<link rel="stylesheet" href="css/listsheet.css" />

		<link type="text/css" href="pkg/jquery/jquery-ui.css" rel="stylesheet" />
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

		<script>
$(document)
		.ready(
				function() {

					$("#dialog")
							.dialog(
									{
										autoOpen : false,
										modal : true,
										buttons : {
											"是" : function() {
												//alert("You have confirmed!");
											$(this).dialog("close");
											self.location = "reviewPaperDel.htm?reviewPaperUid=${reviewPaper.reviewPaperUid}";
										},
										"否" : function() {
											$(this).dialog("close");
										}
										}
									});

					$("#callConfirm").on("click", function(e) {
						e.preventDefault();
						$("#dialog").dialog("open");
					});
				});
</script>

	</head>

	<body>

		<div id="dialog" title="<s:message code="my.confirm" text="請確定" />">
			<s:message code="my.delete" text="刪除" />
			?
		</div>

		<div id="container">

			<%@ include file="/banner2.jsp"%>
			<%@ include file="/menuPart.jsp"%>


			<!--<h2 id="listTit">
				您的位置>${reviewPaper.title}
			</h2>
-->
			<div id="listCon">



				<a href=reviewPaperList.htm class="formIcon"><s:message
						code="button.backlist" text="回列表" /> </a>

				<c:if test="${!reviewPaper.closed}">
					<a
						href="reviewPaperEdit.htm?reviewPaperUid=${reviewPaper.reviewPaperUid}"
						class="formIcon"><s:message code="button.modify" text="修改" />
					</a>

					<button id="callConfirm" class="formIcon">
						<s:message code="my.delete" text="刪除" />
					</button>
					<c:if test="${reviewPaper.allHaveAvgScoreTotal}">
						<a
							href="reviewPaperClose.htm?reviewPaperUid=${reviewPaper.reviewPaperUid}"
							class="formIcon"><s:message code="button.readyclear" text="準備結案" /></a>
					</c:if>
				</c:if>


				<%-- 
						<a href="compDetailEdit.htm?uid=${reviewPaper.uid}"><img
								src="images/myedit.png" width="50" /> </a>
--%>



				<div class="collapse-box">

					<table border='1' cellpadding="0" cellspacing="0" class="listTable"
						WIDTH="100%">
						<tr>
							<th align="right" WIDTH="25%" bgcolor=#CCCCCC>
								<s:message code="reviewpaperlist.theme" text="主題" />
								：
							</th>
							<td WIDTH="25%">
								${reviewPaper.title}&nbsp;
							</td>
							<th align="right" WIDTH="25%">
								<s:message code="reviewpaperlist.date" text="日期" />
								：
							</th>
							<td WIDTH="25%">
								${reviewPaper.thedate}&nbsp;
							</td>
						</tr>
						<tr>
							<th align="right" bgcolor=#CCCCCC>
								<s:message code="reviewpaperlist.status" text="狀態" />
								：
							</th>
							<td>
								${reviewPaper.statusRS}&nbsp;
							</td>
							<th align="right">
								<s:message code="reviewpaperlist.remark" text="備註" />
								：
							</th>
							<td>
								${reviewPaper.remark}&nbsp;
							</td>
						</tr>
					</table>

				</div>



				<br />



				<table border="1" class="listTable" cellpadding="10" cellspacing="0"
					WIDTH="98%" style="border: 1px solid black;">
					<tr style="border: 1px solid black;">
						<th align="center" width="20%" style="border: 1px solid black;">
							<span style="font-size: 25"><s:message
									code="reviewpaperview.comp" text="企業" /> </span>
						</th>
						<th align="center " width="25%" colspan="2"
							style="border: 1px solid black;">
							<span style="font-size: 25"><s:message
									code="reviewpaperview.bookreview" text="書審" /> </span>
							<br />
							<c:if test="${!reviewPaper.closed}">
								<a
									href="reviewPaperAskP.htm?reviewPaperUid=${reviewPaper.reviewPaperUid}"
									class="addBtn"><s:message
										code="reviewpaperview.readynotify" text="準備通知" /> </a>
							</c:if>
						</th>

						<th align="center" width="25%" colspan="2"
							style="border: 1px solid black;">
							<span style="font-size: 25"><s:message
									code="reviewpaperview.facereview" text="面審" /> </span>
							<br />
							<c:if test="${!reviewPaper.closed}">
								<a
									href="reviewPaperAskM.htm?reviewPaperUid=${reviewPaper.reviewPaperUid}"
									class="addBtn"><s:message
										code="reviewpaperview.readynotify" text="準備通知" /> </a>
							</c:if>
						</th>

						<th align="center" width="10%" style="border: 1px solid black;">
							<span style="font-size: 25"><s:message
									code="reviewpaperview.totalavg" text="總平均" /> </span>
						</th>
						<th align="center" width="10%" style="border: 1px solid black;">
							<span style="font-size: 25"><s:message
									code="reviewpaperview.result" text="結果" /> </span>
						</th>
					</tr>


					<c:forEach items="${reviewPaper.mp}" var="compEntry">
						<!--each company-->
						<tr style="border: 1px solid black;">
							<td align="left" style="border: 1px solid black;">
								<span style="font-size: 14"><h2>
										${compEntry.key.compName}
									</h2> </span>
							</td>
							<td style="border: 1px solid black;">
								<c:forEach items="${compEntry.value}" var="typeEntry">
									<%--<c:if test="${typeEntry.key=='書審'}">--%>
									<c:if test="${typeEntry.key==reviewPaper.TYPE_PAPERREVIEW}">
										<table borde"0" cellpadding="0" cellspacing="0" width="100%">
											<c:forEach items="${typeEntry.value.reviewResults}"
												var="result">
												<tr style="border: 0;">
													<td align="left" width="40%" style="border: 0;">
														<c:if test="${!reviewPaper.closed}">
															<span style="font-size: 14"> <a
																href="reviewPaperJob.htm?reviewPaperResultUid=${result.reviewPaperResultUid}&&reviewerName=${result.reviewerName}">${result.reviewerName}</a>
															</span>
														</c:if>

														<c:if test="${reviewPaper.closed}">
														${result.reviewerName}
														</c:if>

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


							<td style="border: 1px solid black;">
								<c:forEach items="${compEntry.value}" var="typeEntry">
									<c:if test="${typeEntry.key==reviewPaper.TYPE_MEETINGREVIEW}">

										<table borde"0" cellpadding="0" cellspacing="0" width="100%">
											<c:forEach items="${typeEntry.value.reviewResults}"
												var="result">
												<tr style="border: 0;">
													<td align="left" width="40%" style="border: 0;">
														<c:if test="${!reviewPaper.closed}">
															<span style="font-size: 14"> <a
																href="reviewPaperJob.htm?reviewPaperResultUid=${result.reviewPaperResultUid}&&reviewerName=${result.reviewerName}">${result.reviewerName}</a>
															</span>
														</c:if>
														<c:if test="${reviewPaper.closed}">
															${result.reviewerName}
														</c:if>
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

							<td style="border: 1px solid black;">
								${compEntry.key.avgScoreTotal}
							</td>

							<td style="border: 1px solid black;">
								${compEntry.key.finalPassRS}
							</td>
					</c:forEach>
				</table>

			</div>
		</div>
		<!--container ends here--><%@ include file="/footer.jsp"%>



	</body>
</html>
