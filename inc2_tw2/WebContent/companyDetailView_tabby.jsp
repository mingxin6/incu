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

	</head>

	<body>
		<div id="container">
			<%@ include file="/banner2.jsp"%>
			<%@ include file="/menuPart.jsp"%>


			<h2 id="listTit">
				您的位置>${comp.compName}
			</h2>

			<div id="listCon">




				<c:if test="${!user.isBusiness}">
					<a href="compList.htm" class="addBtn">回列表</a>
				</c:if>

				<div class="tabs" style="margin-top: 20; margin-bottom: 10">
					<button data-tab data-target="#tab1" style="font-size: 14">
						基本資料
					</button>
					<button data-tab data-target="#tab2" style="font-size: 14">
						專利/獲獎/補助
					</button>
					<button data-tab data-target="#tab3" style="font-size: 14">
						審查資料
					</button>
					<button data-tab data-target="#tab4" style="font-size: 14">
						附件資料
					</button>
					<button data-tab data-target="#tab5" style="font-size: 14">
						輔導資料
					</button>
				</div>


				<div class="tabs-content">
					<div class="tabs-pane active" id="tab1">


						<c:if test="${user.isStaff}">
							<a href="compDetailEdit.htm?uid=${comp.uid}"><img
									src="images/myedit.png" width="50" /> </a>
						</c:if>

						<div class="collapse-wrapper">
							<div class="header">
								企業資訊
							</div>
							<div class="collapse-box">

								<table border='1' cellpadding="0" cellspacing="0"
									class="listTable" WIDTH="100%">
									<tr>
										<th align="right" WIDTH="25%" bgcolor=#CCCCCC>
											編號：
										</th>
										<td WIDTH="25%">
											${comp.customId}&nbsp;
										</td>
										<th align="right">
											統一編號：
										</th>
										<td>
											${comp.registerId}&nbsp;
										</td>
									</tr>
									<tr>
										<th align="right" WIDTH="25%" bgcolor=#CCCCCC>
											企業名稱：
										</th>
										<td WIDTH="25%">
											${comp.compName}&nbsp;
										</td>
										<th align="right" WIDTH="25%" bgcolor=#CCCCCC>
											企業英文名稱：
										</th>
										<td WIDTH="25%">
											${comp.compEngName}&nbsp;
										</td>
									</tr>
									<tr>
										<th align="right" WIDTH="25%" bgcolor=#CCCCCC>
											企業簡稱：
										</th>
										<td WIDTH="25%">
											${comp.compShortName}&nbsp;
										</td>
										<th align="right" WIDTH="25%" bgcolor=#CCCCCC>
											企業 logo：
										</th>
										<td WIDTH="25%">
											<img src="${comp.logoFileName}" width="129" border="0" />
											&nbsp;
										</td>
									</tr>
									<tr>
										<th align="right">
											企業成立日期：
										</th>
										<td>
											${comp.registerDate2}&nbsp;
										</td>
										<th align="right">
											負責人：
										</th>
										<td>
											${comp.representative}&nbsp;
										</td>

									</tr>
									<tr>
										<th align="right">
											企業類別：
										</th>
										<td>
											${comp.kind}&nbsp;
										</td>
										<th align="right">
											企業領域：
										</th>
										<td>
											${comp.domain}&nbsp;
										</td>
									</tr>
									<tr>
										<th align="right">
											首次進駐日：
										</th>
										<td>
											${comp.moveInDate2}&nbsp;
										</td>
										<th align="right">
											狀態
										</th>
										<td>
											${comp.compStatus}&nbsp;
										</td>
									</tr>
									<tr>
										<th align="right">
											員工人數：
										</th>
										<td>
											${comp.totalEmployees}&nbsp;
										</td>
										<th align="right">
											資本額（元）：
										</th>
										<td>
											${comp.registerCaptial}&nbsp;
										</td>
									</tr>
									<tr>
										<th align="right">
											實收資本額（元）：
										</th>
										<td>
											${comp.actualCaptial}&nbsp;
										</td>
										<th align="right">
											&nbsp;
										</th>
										<td>
											&nbsp;
										</td>
									</tr>
									<tr>
										<th align="right">
											企業簡介：
										</th>
										<td>
											${comp.compIntroduction}&nbsp;
										</td>
										<th align="right">
											&nbsp;
										</th>
										<td>
											&nbsp;
										</td>
									</tr>
									<tr>
										<th align="right">
											企業網址：
										</th>
										<td>
											<a href="${comp.compWebURL}" target="_blank">${comp.compWebURL}</a>&nbsp;
										</td>
										<th align="right">
											主力產品：
										</th>
										<td>
											${comp.prod}&nbsp;
										</td>
									</tr>
									<tr>
										<th align="right">
											進駐培育間：
										</th>
										<td>
											${comp.room}&nbsp;
										</td>
										<th align="right">
											簽約坪數：
										</th>
										<td>
											${comp.roomArea}&nbsp;
										</td>
									</tr>
									<tr>
										<th align="right">
											備註：
										</th>
										<td>
											${comp.remark}&nbsp;
										</td>
										<th>
											&nbsp;
										</th>
										<td>
											&nbsp;
										</td>
									</tr>
								</table>


							</div>
						</div>

						<div class="collapse-wrapper">
							<div class="header">
								聯絡人資訊
							</div>
							<div class="collapse-box">
								<table border='1' cellpadding="0" cellspacing="0"
									class="listTable" WIDTH="100%">
									<tr>
										<th WIDTH="25%" align="right" WIDTH="25%">
											總經理：
										</th>
										<td WIDTH="25%">
											${comp.boss}&nbsp;
										</td>
										<th WIDTH="25%" align="right" WIDTH="25%">
											總經理電話：
										</th>
										<td WIDTH="25%">
											${comp.phone}&nbsp;
										</td>
									</tr>
									<tr>
										<th WIDTH="25%" align="right">
											總經理手機：
										</th>
										<td>
											${comp.mobilePhone}&nbsp;
										</td>
										<th WIDTH="25%" align="right">
											總經理信箱：
										</th>
										<td>
											${comp.email}&nbsp;
										</td>
									</tr>
									<tr>
										<th WIDTH="25%" align="right">
											聯絡人：
										</th>
										<td>
											${comp.adminContact}&nbsp;
										</td>
										<th WIDTH="25%" align="right">
											聯絡人電話：
										</th>
										<td>
											${comp.adminContactPhone}&nbsp;
										</td>
									</tr>
									<tr>
										<th WIDTH="25%" align="right">
											聯絡人手機：
										</th>
										<td>
											${comp.adminContactMobilePhone}&nbsp;
										</td>
										<th WIDTH="25%" align="right">
											聯絡人信箱：
										</th>
										<td>
											${comp.adminContactEmail2}&nbsp;
										</td>
									</tr>
									<tr>
										<th WIDTH="25%" align="right">
											AM：
										</th>
										<td>
											${comp.amName}&nbsp;
										</td>
										<th WIDTH="25%" align="right">
											PM：
										</th>
										<td>
											${comp.pmName}&nbsp;
										</td>
									</tr>
								</table>
							</div>
						</div>


						<div class="collapse-wrapper">


							<div class="header">
								合約資訊
								<!--<a href="#" class="collapse-toggle">合約資訊</a>
				-->
							</div>
							<div class="collapse-box">
								<table border='1' cellpadding="0" cellspacing="0"
									class="listTable" WIDTH="100%">
									<tr>
										<th align="right" WIDTH="25%">
											合約編號：
										</th>
										<td WIDTH="25%">
											${comp.contractNumber}&nbsp;
										</td>
										<th align="right" WIDTH="25%">
											合約起日：
										</th>
										<td WIDTH="25%">
											${comp.contractStartDate2}&nbsp;
										</td>
									</tr>
									<tr>
										<th WIDTH="25%" align="right">
											合約迄日：
										</th>
										<td>
											${comp.contractEndDate2}&nbsp;
										</td>
										<th WIDTH="25%" align="right">
											新創代號：
										</th>
										<td>
											${comp.innoKind}&nbsp;
										</td>
									</tr>
								</table>
							</div>
						</div>

						<div class="collapse-wrapper">
							<div class="header">
								畢業資訊
								<!-- <a href="#" class="collapse-toggle">畢業資訊</a>-->
							</div>
							<div class="collapse-box">
								<table border='1' cellpadding="0" cellspacing="0"
									class="listTable" WIDTH="100%">
									<tr>
										<th align="right" WIDTH="25%">
											畢業日：
										</th>
										<td WIDTH="25%">
											${comp.moveOutDate2}&nbsp;
										</td>
										<th align="right" WIDTH="25%">
											畢業聯絡地址：
										</th>
										<td WIDTH="25%">
											${comp.moveOutAddesss}&nbsp;
										</td>
									</tr>
								</table>
							</div>
						</div>

					</div>

					<div class="tabs-pane" id="tab2">
						<div class="collapse-wrapper">
							<div class="header">
								專利資料&nbsp;

								<c:if test="${user.isStaff}">
									<a href="compDetailEditIp.htm?uid=${comp.uid}"><img
											src="images/myedit.png" width="25" /> </a>
								</c:if>
							</div>
							<div class="collapse-box">

								<table border="1" class="listTable" cellpadding="10"
									cellspacing="0" WIDTH="98%">
									<tr>
										<th align="center">
											<span style="font-size: 14">專利證號</span>
										</th>
										<th align="center">
											<span style="font-size: 14">專利名稱</span>
										</th>
										<th align="center">
											<span style="font-size: 14">取得專利國家</span>
										</th>
										<th align="center">
											<span style="font-size: 14">取得專利日期</span>
										</th>
									</tr>

									<c:forEach items="${comp.ipRecs}" var="ip">
										<tr>
											<td align="center">
												<span style="font-size: 14">${ip.ipNo}</span>
											</td>
											<td align="left">
												<span style="font-size: 14">${ip.ipName}</span>
											</td>
											<td align="center">
												<span style="font-size: 14">${ip.ipCountry}</span>
											</td>
											<td align="center">
												<span style="font-size: 14">${ip.ipDate}</span>
											</td>
										</tr>

									</c:forEach>
								</table>
							</div>
						</div>

						<div class="collapse-wrapper">
							<div class="header">
								獲獎資料&nbsp;
								<c:if test="${user.isStaff}">
									<a href="compDetailEditAward.htm?uid=${comp.uid}"><img
											src="images/myedit.png" width="25" /> </a>
								</c:if>
							</div>
							<div class="collapse-box">

								<table border="1" class="listTable" cellpadding="10"
									cellspacing="0" WIDTH="98%">
									<tr>
										<th WIDTH="45%" align="center">
											<span style="font-size: 14">獎項名稱</span>
										</th>
										<th WIDTH="30%" align="center">
											<span style="font-size: 14">頒發單位國家</span>
										</th>
										<th WIDTH="10%" align="center">
											<span style="font-size: 14">有無獎金</span>
										</th>
										<th WIDTH="15%" align="center">
											<span style="font-size: 14">得獎年月</span>
										</th>
									</tr>

									<c:forEach items="${comp.awardRecs}" var="award">
										<tr>
											<td align="left">
												<span style="font-size: 14">${award.awardName}</span>
											</td>
											<td align="left">
												<span style="font-size: 14">${award.awardIssuer}</span>
											</td>
											<td align="center">
												<span style="font-size: 14">${award.hasAwardMoney}</span>
											</td>
											<td align="center">
												<span style="font-size: 14">${award.awardDate}</span>
											</td>
										</tr>

									</c:forEach>
								</table>
							</div>
						</div>

						<div class="collapse-wrapper">
							<div class="header">
								補助資料&nbsp;
								<c:if test="${user.isStaff}">
									<a href="compDetailEditGrant.htm?uid=${comp.uid}"><img
											src="images/myedit.png" width="25" /> </a>
								</c:if>
							</div>
							<div class="collapse-box">
								<table border="1" class="listTable" cellpadding="10"
									cellspacing="0" WIDTH="98%">
									<tr>
										<th align="center">
											<span style="font-size: 14">申請計畫名稱</span>
										</th>
										<th align="center">
											<span style="font-size: 14">授與單位</span>
										</th>
										<th align="center">
											<span style="font-size: 14">申請計畫標的</span>
										</th>
										<th align="center">
											<span style="font-size: 14">取得補助年月</span>
										</th>
										<th align="center">
											<span style="font-size: 14">計畫總金額</span>
										</th>
										<th align="center">
											<span style="font-size: 14">計畫補助金額</span>
										</th>
									</tr>

									<c:forEach items="${comp.grantRecs}" var="grant">
										<tr>
											<td align="left">
												<span style="font-size: 14">${grant.grantName}</span>
											</td>
											<td align="left">
												<span style="font-size: 14">${grant.grantIssuer}</span>
											</td>
											<td align="left">
												<span style="font-size: 14">${grant.projectName}</span>
											</td>
											<td align="center">
												<span style="font-size: 14">${grant.grantDate}</span>
											</td>
											<td align="right">
												<span style="font-size: 14">${grant.projTotalMoney}</span>
											</td>
											<td align="right">
												<span style="font-size: 14">${grant.grantMoney}</span>
											</td>
										</tr>

									</c:forEach>
								</table>

							</div>
						</div>

					</div>

					<div class="tabs-pane" id="tab3">



						<div class="collapse-wrapper">
							<div class="header">
								企業送審資料
							</div>
							<div class="collapse-box">


								<table border="1" cellpadding="0" cellspacing="0"
									class="listTable" WIDTH="98%">
									<tr>
										<th width="10%">
											進駐申請表：
										</th>
										<td id="docs">
											<c:forEach items="${comp.applicationFileInfo}" var="obj">
												<a
													href="downLoadFile.htm?aid=${comp.uid}&fName=${obj.originalFileName}&mName=${obj.modifiedFileName}">${obj.originalFileName}</a>
												<br>
											</c:forEach>
										</td>
									</tr>
									<tr>
										<th width="10%">
											企業設立函文：
										</th>
										<td id="docs">
											<c:forEach items="${comp.establishPaperFileInfo}" var="obj">
												<a
													href="downLoadFile.htm?aid=${comp.uid}&fName=${obj.originalFileName}&mName=${obj.modifiedFileName}">${obj.originalFileName}</a>
												<br>
											</c:forEach>
										</td>
									</tr>
									<tr>
										<th width="10%">
											營運計劃書：
										</th>
										<td id="docs">
											<c:forEach items="${comp.businessPlanFileInfo}" var="obj">
												<a
													href="downLoadFile.htm?aid=${comp.uid}&fName=${obj.originalFileName}&mName=${obj.modifiedFileName}">${obj.originalFileName}</a>
												<br>
											</c:forEach>
										</td>
									</tr>
									<tr>
										<th width="10%">
											會計師簽證：
										</th>
										<td id="docs">
											<c:forEach items="${comp.accountantNoteFileInfo}" var="obj">
												<a
													href="downLoadFile.htm?aid=${comp.uid}&fName=${obj.originalFileName}&mName=${obj.modifiedFileName}">${obj.originalFileName}</a>
												<br>
											</c:forEach>
										</td>
									</tr>
									<tr>
										<th width="10%">
											401 報表：
										</th>
										<td id="docs">
											<c:forEach items="${comp.form401FileInfo}" var="obj">
												<a
													href="downLoadFile.htm?aid=${comp.uid}&fName=${obj.originalFileName}&mName=${obj.modifiedFileName}">${obj.originalFileName}</a>
												<br>
											</c:forEach>
										</td>
									</tr>
								</table>

							</div>
						</div>



						<div class="collapse-wrapper">
							<div class="header">
								審查資料
							</div>

							<table border="1" class="listTable" cellpadding="10"
								cellspacing="0" WIDTH="98%" style="border: 1px solid black;">
								<tr style="border: 1px solid black;">
									<th align="center" width="20%" style="border: 1px solid black;">
										<span style="font-size: 25">企業</span>
									</th>
									<th align="center " width="25%" colspan="2"
										style="border: 1px solid black;">
										<span style="font-size: 25">書審</span>

									</th>

									<th align="center" width="25%" colspan="2"
										style="border: 1px solid black;">
										<span style="font-size: 25">面審</span>

									</th>

									<th align="center" width="10%" style="border: 1px solid black;">
										<span style="font-size: 25">總平均</span>
									</th>
									<th align="center" width="10%" style="border: 1px solid black;">
										<span style="font-size: 25">結果</span>
									</th>
								</tr>


								<c:forEach items="${reviewPaper.mp}" var="compEntry">
									<!--each company-->
									<c:if test="${compEntry.key.compName==comp.compName}">
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
														<table borde"0" cellpadding="0" cellspacing="0"
															width="100%">
															<c:forEach items="${typeEntry.value.reviewResults}"
																var="result">
																<tr style="border: 0;">
																	<td align="left" width="40%" style="border: 0;">
																		<c:if test="${!reviewPaper.closed}">
																			<span style="font-size: 14"> <a
																				href="reviewPaperJob.htm?reviewPaperResultUid=${result.reviewPaperResultUid}">${result.reviewerName}</a>
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
													<c:if
														test="${typeEntry.key==reviewPaper.TYPE_MEETINGREVIEW}">

														<table borde"0" cellpadding="0" cellspacing="0"
															width="100%">
															<c:forEach items="${typeEntry.value.reviewResults}"
																var="result">
																<tr style="border: 0;">
																	<td align="left" width="40%" style="border: 0;">
																		<c:if test="${!reviewPaper.closed}">
																			<span style="font-size: 14"> <a
																				href="reviewPaperJob.htm?reviewPaperResultUid=${result.reviewPaperResultUid}">${result.reviewerName}</a>
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
													<c:if
														test="${typeEntry.key==reviewPaper.TYPE_MEETINGREVIEW}">
											${typeEntry.value.avgScore}
										</c:if>
												</c:forEach>
											</td>

											<td style="border: 1px solid black;">
												${compEntry.key.avgScoreTotal}
											</td>

											<td style="border: 1px solid black;">
												${compEntry.key.finalPass}
											</td>
									</c:if>

								</c:forEach>
							</table>
							<%--
							
						<div class="collapse-wrapper">
							<div class="header">
								面審資料
							</div>
							<div class="collapse-box">

								<table border="1" cellpadding="3" cellspacing="0"
									class="listTable" WIDTH="98%">
									<tr>
										<th style="vertical-align: top;" width="10%">
											文件下載：
										</th>
										<td id="docs">
											<c:forEach items="${comp.interviewFileInfo}" var="obj">

												<a
													href="downLoadFile.htm?aid=${comp.uid}&fName=${obj.originalFileName}&mName=${obj.modifiedFileName}">${obj.originalFileName}</a>
												<br>
												<br />
											</c:forEach>
										</td>
									</tr>


								</table>

							</div>
							--%>
						</div>

					</div>

					<div class="tabs-pane" id="tab4">
						<c:if test="${user.isStaff}">
							<a href="compDetailEditDocument.htm?uid=${comp.uid}"><img
									src="images/myedit.png" width="50" /> </a>
						</c:if>
						<div class="header">
							附件資料
						</div>

						<div class="collapse-wrapper">
							<div class="header">
								附件
							</div>
							<div class="collapse-box">

								<table border="1" cellpadding="3" cellspacing="0"
									class="listTable" WIDTH="98%">
									<tr>
										<th style="vertical-align: top;" width="10%">
											文件下載：
										</th>
										<td id="docs">
											<c:forEach items="${comp.handoverFileInfo}" var="obj">

												<a
													href="downLoadFile.htm?aid=${comp.uid}&fName=${obj.originalFileName}&mName=${obj.modifiedFileName}">${obj.originalFileName}</a>
												<br>
												<br>
											</c:forEach>
										</td>
									</tr>


								</table>
							</div>
						</div>
					</div>

					<div class="tabs-pane" id="tab5">
						<c:if test="${user.isStaff}">
							<a href="#"><img src="images/myedit.png" width="50" /> </a>
						</c:if>
						<div class="collapse-wrapper">
							<table border="1" class="listTable" cellpadding="10"
								cellspacing="0" WIDTH="98%">
								<tr>
									<th align="center" width="5%">
										編號
									</th>
									<th align="center" width="80%">
										主題
									</th>
									<th align="center" width="15%">
										時間
									</th>
								</tr>

								<c:forEach items="${comp.talkNotes}" var="talkNote">
									<tr>
										<td align="center">
											${talkNote.seq}
										</td>
										<td align="left">
											<span style="font-size: 16"><a
												href="TalkNotesView.htm?compName=${talkNote.compName}&compId=${talkNote.compId}&noteId=${talkNote.talkNoteId}">${talkNote.talkTheme}</a>
											</span>
										</td>

										<td align="left">
											<span style="font-size: 16">${talkNote.talkDateTime}</span>
										</td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>

				</div>



			</div>
		</div>
		<!--container ends here--><%@ include file="/footer.jsp"%>

		<script type="text/javascript" src="pkg/tabby/js/buoy.js">
</script>
		<script type="text/javascript" src="pkg/tabby/js/tabby.js">
</script>

	</body>
</html>
