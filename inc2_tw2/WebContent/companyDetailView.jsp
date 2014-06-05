<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:message code="menuPart.movin.management" text="進駐管理" />
	&gt;<s:message code="menuPart.movin.business" text="進駐企業" />&gt;<s:message
		code="business.info" text="企業資訊" /></title>

<script type="text/javascript" src="pkg/jquery/jquery-1.9.1.js"></script>
<script type="text/javascript" src="pkg/jquery/jquery-ui-1.10.4.js"></script>

<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/funbar.css">
<link rel="stylesheet" href="css/table-nogrid.css">
<link rel="stylesheet" href="css/table-grid.css">

<!-- Tabs -->
<link type="text/css" href="pkg/tabs/tabs.css" rel="stylesheet" />
<script>
	$(function() {
		$("#tabs").tabs();
	});
</script>



</head>

<body>
	<div id="container">
		<%@ include file="/banner2.jsp"%>




		<div class="funbar">
			<div class="funitem">
				<c:if test="${!user.isBusiness}">
					<a href="compList.htm"><s:message code="button.backlist"
							text="回列表" /></a>
				</c:if>
			</div>
			<%@ include file="/homeexit.jsp"%>
		</div>

		<div class="title1">${comp.compName}</div>
<!-- 		<div class="clear"></div> -->

		<div class="contentdiv">

			<div id="tabs">

				<ul>
					<li><a href="#tab1"><s:message code="compdetailview.tab1"
								text="基本資料" /></a></li>
					<li><a href="#tab2"><s:message code="compdetailview.tab2"
								text="專利/獲獎/補助" /></a></li>
					<li><a href="#tab3"><s:message code="compdetailview.tab3"
								text="審查資料" /></a></li>

					<li><a href="#tab4"><s:message code="compdetailview.tab4"
								text="其他附件" /></a></li>
					<li><a href="#tab5"><s:message code="compdetailview.tab5"
								text="輔導資料" /></a></li>
					<li><a href="#tab6"><s:message code="compdetailview.tab6"
								text="帳號資料" /></a></li>
				</ul>

				<div class="tabs-pane active" id="tab1">

					<c:if test="${user.isStaff}">
						<a href="compDetailEdit.htm?uid=${comp.uid}"><img
							src="images/myedit.png" width="50" /> </a>
					</c:if>

					<div class="collapse-wrapper">
						<div class="header">
							<s:message code="compnew.basicinfo" text="基本資訊" />
						</div>
						<div class="collapse-box">

							<table class="table-nogrid" WIDTH="100%">
								<tr>
									<th align="right" WIDTH="25%"><s:message code="compnew.id"
											text="編號" />：</th>
									<td WIDTH="25%">${comp.customId}&nbsp;</td>
									<th align="right"><s:message code="compnew.id2"
											text="統一編號" />：</th>
									<td>${comp.registerId}&nbsp;</td>
								</tr>
								<tr>
									<th align="right" WIDTH="25%"><s:message
											code="compnew.compname" text="企業名稱" />：</th>
									<td WIDTH="25%">${comp.compName}&nbsp;</td>
									<th align="right" WIDTH="25%"><s:message
											code="compnew.compenname" text="企業英文名稱" />：</th>
									<td WIDTH="25%">${comp.compEngName}&nbsp;</td>
								</tr>
								<tr>
									<th align="right" WIDTH="25%"><s:message
											code="compnew.shortname" text="企業簡稱" />：</th>
									<td WIDTH="25%">${comp.compShortName}&nbsp;</td>
									<th align="right" WIDTH="25%"><s:message
											code="compnew.complogo" text="企業 logo" />：</th>
									<td WIDTH="25%"><img src="${comp.logoFileName}"
										width="129" border="0" /> &nbsp;</td>
								</tr>
								<tr>
									<th align="right"><s:message code="compnew.establishment"
											text="企業成立日期" />：</th>
									<td>${comp.registerDate2}&nbsp;</td>
									<th align="right"><s:message code="compnew.head"
											text="負責人" />：</th>
									<td>${comp.representative}&nbsp;</td>

								</tr>
								<tr>
									<th align="right"><s:message code="compnew.comptype"
											text="企業類別" />：</th>
									<td>${comp.kindRS}&nbsp;</td>
									<th align="right"><s:message code="compnew.compfield"
											text="企業領域" />：</th>
									<td>${comp.domainRS}&nbsp;</td>
								</tr>
								<tr>
									<th align="right"><s:message code="compnew.firstindate"
											text="首次進駐日" />：</th>
									<td>${comp.moveInDate2}&nbsp;</td>
									<th align="right"><s:message code="compnew.status"
											text="狀態" />：</th>
									<td>${comp.compStatusRS}&nbsp;</td>
								</tr>
								<tr>
									<th align="right"><s:message code="compnew.staffnum"
											text="員工人數" />：</th>
									<td>${comp.totalEmployees}&nbsp;</td>
									<th align="right"><s:message code="compnew.capital"
											text="資本額(元)" />：</th>
									<td>${comp.registerCaptial}&nbsp;</td>
								</tr>
								<tr>
									<th align="right"><s:message code="compnew.realcapital"
											text="實收資本額(元)" />：</th>
									<td>${comp.actualCaptial}&nbsp;</td>
									<th align="right">&nbsp;</th>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<th align="right"><s:message code="compnew.compintro"
											text="企業簡介" />：</th>
									<td>${comp.compIntroduction}&nbsp;</td>
									<th align="right">&nbsp;</th>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<th align="right"><s:message code="compnew.compwebsite"
											text="企業網址" />：</th>
									<td><a href="${comp.compWebURL}" target="_blank">${comp.compWebURL}</a>&nbsp;
									</td>
									<th align="right"><s:message code="compnew.mainproduct"
											text="主力產品" />：</th>
									<td>${comp.prod}&nbsp;</td>
								</tr>
								<tr>
									<th align="right"><s:message code="compdetailview.room"
											text="進駐培育間" />：</th>
									<td>${comp.room}&nbsp;</td>
									<th align="right"><s:message code="compdetailview.area"
											text="簽約坪數" />：</th>
									<td>${comp.roomArea}&nbsp;</td>
								</tr>
								<tr>
									<th align="right"><s:message code="compnew.remark"
											text="備註" />：</th>
									<td>${comp.remark}&nbsp;</td>
									<th>&nbsp;</th>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<th align="right"><s:message code="compnew.deposit"
											text="押金" />：</th>
									<td>${comp.deposit}&nbsp;</td>
									<th align="right"><s:message code="compnew.deposit2"
											text="施工保證金" />：</th>
									<td>${comp.bond}&nbsp;</td>
								</tr>
							</table>


						</div>
					</div>

					<div class="collapse-wrapper">
						<div class="header">
							<s:message code="compnew.contactsinfo" text="聯絡人資訊" />
						</div>
						<div class="collapse-box">
							<table class="table-nogrid" WIDTH="100%">
								<tr>
									<th WIDTH="25%" align="right" WIDTH="25%"><s:message
											code="compnew.gm" text="總經理" />：</th>
									<td WIDTH="25%">${comp.boss}&nbsp;</td>
									<th WIDTH="25%" align="right" WIDTH="25%"><s:message
											code="compnew.gmtel" text="總經理電話" />：</th>
									<td WIDTH="25%">${comp.phone}&nbsp;</td>
								</tr>
								<tr>
									<th WIDTH="25%" align="right"><s:message
											code="compnew.gmphone" text="總經理手機" />：</th>
									<td>${comp.mobilePhone}&nbsp;</td>
									<th WIDTH="25%" align="right"><s:message
											code="compnew.gmmailbox" text="總經理信箱" />：</th>
									<td>${comp.email}&nbsp;</td>
								</tr>
								<tr>
									<th WIDTH="25%" align="right"><s:message
											code="compnew.contacts" text="聯絡人" />：</th>
									<td>${comp.adminContact}&nbsp;</td>
									<th WIDTH="25%" align="right"><s:message
											code="compnew.contactstel" text="聯絡人電話" />：</th>
									<td>${comp.adminContactPhone}&nbsp;</td>
								</tr>
								<tr>
									<th WIDTH="25%" align="right"><s:message
											code="compnew.contactsphone" text="聯絡人手機" />：</th>
									<td>${comp.adminContactMobilePhone}&nbsp;</td>
									<th WIDTH="25%" align="right"><s:message
											code="compnew.contactsmailbox" text="聯絡人信箱" />：</th>
									<td>${comp.adminContactEmail2}&nbsp;</td>
								</tr>
								<tr>
									<th WIDTH="25%" align="right">AM：</th>
									<td>${comp.amName}&nbsp;</td>
									<th WIDTH="25%" align="right">PM：</th>
									<td>${comp.pmName}&nbsp;</td>
								</tr>
							</table>
						</div>
					</div>


					<div class="collapse-wrapper">


						<div class="header">
							<s:message code="compnew.contractinfo" text="合約資訊" />
							<!--<a href="#" class="collapse-toggle">合約資訊</a>
				-->
						</div>
						<div class="collapse-box">
							<table class="table-nogrid" WIDTH="100%">
								<tr>
									<th align="right" WIDTH="25%"><s:message
											code="compnew.contractid" text="合約編號" />：</th>
									<td WIDTH="25%">${comp.contractNumber}&nbsp;</td>
									<th align="right" WIDTH="25%"><s:message
											code="compnew.contractbegin" text="合約起日" />：</th>
									<td WIDTH="25%">${comp.contractStartDate2}&nbsp;</td>
								</tr>
								<tr>
									<th WIDTH="25%" align="right"><s:message
											code="compnew.contractend" text="合約迄日" />：</th>
									<td>${comp.contractEndDate2}&nbsp;</td>
									<th WIDTH="25%" align="right"><s:message
											code="compnew.code" text="新創代號" />:</th>
									<td>${comp.innoKindRS}&nbsp;</td>
								</tr>
							</table>
						</div>
					</div>

					<div class="collapse-wrapper">
						<div class="header">
							<s:message code="compnew.finishinfo" text="畢業資訊" />
							<!-- <a href="#" class="collapse-toggle">畢業資訊</a>-->
						</div>
						<div class="collapse-box">
							<table class="table-nogrid" WIDTH="100%">
								<tr>
									<th align="right" WIDTH="25%"><s:message
											code="compnew.finishdate" text="畢業日" />：</th>
									<td WIDTH="25%">${comp.moveOutDate2}&nbsp;</td>
									<th align="right" WIDTH="25%"><s:message
											code="compnew.finishaddress" text="畢業聯絡地址" />：</th>
									<td WIDTH="25%">${comp.moveOutAddesss}&nbsp;</td>
								</tr>
							</table>
						</div>
					</div>

				</div>

				<div class="tabs-pane" id="tab2">
					<div class="collapse-wrapper">
						<div class="header">
							<s:message code="compdetailview.patentdata" text="專利資料" />
							&nbsp;

							<c:if test="${user.isStaff}">
								<a href="compDetailEditIp.htm?uid=${comp.uid}"><img
									src="images/myedit.png" width="25" /> </a>
							</c:if>
						</div>
						<div class="collapse-box">

							<table class="table-grid" WIDTH="98%">
								<tr>
									<th align="center"><span><s:message
												code="compdetailview.patentid" text="專利證號" /></span></th>
									<th align="center"><span><s:message
												code="compdetailview.patentname" text="專利名稱" /></span></th>
									<th align="center"><span><s:message
												code="compdetailview.patentcountry" text="取得專利國家" /></span></th>
									<th align="center"><span><s:message
												code="compdetailview.patentdate" text="取得專利日期" /></span></th>
								</tr>

								<c:forEach items="${comp.ipRecs}" var="ip">
									<tr>
										<td align="center"><span>${ip.ipNo}</span></td>
										<td align="left"><span>${ip.ipName}</span></td>
										<td align="center"><span>${ip.ipCountry}</span></td>
										<td align="center"><span>${ip.ipDate}</span></td>
									</tr>

								</c:forEach>
							</table>
						</div>
					</div>

					<div class="collapse-wrapper">
						<div class="header">
							<s:message code="compdetailview.awarddata" text="獲獎資料" />
							&nbsp;
							<c:if test="${user.isStaff}">
								<a href="compDetailEditAward.htm?uid=${comp.uid}"><img
									src="images/myedit.png" width="25" /> </a>
							</c:if>
						</div>
						<div class="collapse-box">

							<table class="table-grid" WIDTH="98%">
								<tr>
									<th WIDTH="45%" align="center"><span><s:message
												code="compdetailview.awardname" text="獎項名稱" /></span></th>
									<th WIDTH="30%" align="center"><span><s:message
												code="compdetailview.awardcountry" text="頒發單位國家" /></span></th>
									<th WIDTH="10%" align="center"><span><s:message
												code="compdetailview.awardboolean" text="有無獎金" /></span></th>
									<th WIDTH="15%" align="center"><span><s:message
												code="compdetailview.awarddate" text="得獎年月" /></span></th>
								</tr>

								<c:forEach items="${comp.awardRecs}" var="award">
									<tr>
										<td align="left"><span>${award.awardName}</span></td>
										<td align="left"><span>${award.awardIssuer}</span></td>
										<td align="center"><span>${award.hasAwardMoney}</span></td>
										<td align="center"><span>${award.awardDate}</span></td>
									</tr>

								</c:forEach>
							</table>
						</div>
					</div>

					<div class="collapse-wrapper">
						<div class="header">
							<s:message code="compdetailview.subsidydata" text="補助資料" />
							&nbsp;
							<c:if test="${user.isStaff}">
								<a href="compDetailEditGrant.htm?uid=${comp.uid}"><img
									src="images/myedit.png" width="25" /> </a>
							</c:if>
						</div>
						<div class="collapse-box">
							<table class="table-grid" WIDTH="98%">
								<tr>
									<th align="center"><span><s:message
												code="compdetailview.subsidyname" text="申請計畫名稱" /></span></th>
									<th align="center"><span><s:message
												code="compdetailview.subsidyfrom" text="授與單位" /></span></th>
									<th align="center"><span><s:message
												code="compdetailview.subsidytarget" text="申請計畫標的" /></span></th>
									<th align="center"><span><s:message
												code="compdetailview.subsidydate" text="取得補助年月" /></span></th>
									<th align="center"><span><s:message
												code="compdetailview.subsidytotalamount" text="計畫總金額" /></span></th>
									<th align="center"><span><s:message
												code="compdetailview.subsidyamount" text="計畫補助金額" /></span></th>
								</tr>

								<c:forEach items="${comp.grantRecs}" var="grant">
									<tr>
										<td align="left"><span>${grant.grantName}</span></td>
										<td align="left"><span>${grant.grantIssuer}</span></td>
										<td align="left"><span>${grant.projectName}</span></td>
										<td align="center"><span>${grant.grantDate}</span></td>
										<td align="right"><span>${grant.projTotalMoney}</span></td>
										<td align="right"><span>${grant.grantMoney}</span></td>
									</tr>

								</c:forEach>
							</table>

						</div>
					</div>

				</div>

				<div class="tabs-pane" id="tab3">



					<div class="collapse-wrapper">
						<div class="header">

							<s:message code="compdetailview.compdata" text="企業資料" />

							<c:if test="${user.isStaff}">
								<a href="compDetailEditReview.htm?uid=${comp.uid}"><img
									src="images/myedit.png" width="25" /> </a>
							</c:if>
						</div>


						<div class="collapse-box">
							<table class="table-grid" WIDTH="98%">
								<tr>
									<th align="right" width="15%"><s:message
											code="compdetail.reviewdata1" text="進駐申請表" />：</th>
									<td id="docs" width="85%"><c:forEach
											items="${comp.applicationFileInfo}" var="obj">
											<a
												href="downLoadFile.htm?aid=${comp.uid}&fName=${obj.originalFileName}&mName=${obj.modifiedFileName}">${obj.originalFileName}</a>
											<br>
										</c:forEach></td>
								</tr>
								<tr>
									<th align="right"><s:message code="compdetail.reviewdata2"
											text="企業設立函文" />：</th>
									<td id="docs"><c:forEach
											items="${comp.establishPaperFileInfo}" var="obj">
											<a
												href="downLoadFile.htm?aid=${comp.uid}&fName=${obj.originalFileName}&mName=${obj.modifiedFileName}">${obj.originalFileName}</a>
											<br>
										</c:forEach></td>
								</tr>
								<tr>
									<th align="right"><s:message code="compdetail.reviewdata3"
											text="營運計劃書" />：</th>
									<td id="docs"><c:forEach
											items="${comp.businessPlanFileInfo}" var="obj">
											<a
												href="downLoadFile.htm?aid=${comp.uid}&fName=${obj.originalFileName}&mName=${obj.modifiedFileName}">${obj.originalFileName}</a>
											<br>
										</c:forEach></td>
								</tr>
								<tr>
									<th align="right"><s:message code="compdetail.reviewdata4"
											text="會計師簽證" />：</th>
									<td id="docs"><c:forEach
											items="${comp.accountantNoteFileInfo}" var="obj">
											<a
												href="downLoadFile.htm?aid=${comp.uid}&fName=${obj.originalFileName}&mName=${obj.modifiedFileName}">${obj.originalFileName}</a>
											<br>
										</c:forEach></td>
								</tr>
								<tr>
									<th align="right"><s:message code="compdetail.reviewdata5"
											text="401 報表" />：</th>
									<td id="docs"><c:forEach items="${comp.form401FileInfo}"
											var="obj">
											<a
												href="downLoadFile.htm?aid=${comp.uid}&fName=${obj.originalFileName}&mName=${obj.modifiedFileName}">${obj.originalFileName}</a>
											<br>
										</c:forEach></td>
								</tr>
							</table>

						</div>
					</div>

					<!-- 中心人員看到的審查資料 -->
					<c:if test="${user.isStaff}">

						<div class="collapse-wrapper">
							<div class="header">
								<s:message code="compdetail.reviewdata" text="審查資料" />
							</div>

							<table class="table-grid" WIDTH="98%">
								<tr>
									<th align="center" width="20%"><span><s:message
												code="reviewpaperview.comp" text="企業" /></span></th>
									<th align="center " width="25%" colspan="2"><span><s:message
												code="reviewpaperview.bookreview" text="書審" /></span></th>

									<th align="center" width="25%" colspan="2"><span><s:message
												code="reviewpaperview.facereview" text="面審" /></span></th>

									<th align="center" width="10%"><span><s:message
												code="reviewpaperview.totalavg" text="總平均" /></span></th>
									<th align="center" width="10%"><span><s:message
												code="reviewpaperview.result" text="結果" /></span></th>
								</tr>


								<c:forEach items="${reviewPaper.mp}" var="compEntry">
									<!--each company-->
									<c:if test="${compEntry.key.compName==comp.compName}">
										<tr>
											<td align="left"><span><h2>
														${compEntry.key.compName}</h2> </span></td>
											<td><c:forEach items="${compEntry.value}"
													var="typeEntry">
													<%--<c:if test="${typeEntry.key=='書審'}">--%>
													<c:if test="${typeEntry.key==reviewPaper.TYPE_PAPERREVIEW}">
														<table borde"0" cellpadding="0" cellspacing="0"
															width="100%">
															<c:forEach items="${typeEntry.value.reviewResults}"
																var="result">
																<tr style="border: 0;">
																	<td align="left" width="40%" style="border: 0;"><c:if
																			test="${!reviewPaper.closed}">
																			<span> <a
																				href="reviewPaperJob.htm?reviewPaperResultUid=${result.reviewPaperResultUid}">${result.reviewerName}</a>
																			</span>
																		</c:if> <c:if test="${reviewPaper.closed}">
														${result.reviewerName}
														</c:if></td>
																	<td align="center" width="40%" style="border: 0;">
																		<span>${result.score}</span>
																	</td>
																	<%-- 
														<td align="center" width="25%" style="border:0;">
															<span >${result.remark}</span>
														</td>--%>
																	<td width="20%" style="border: 0;"><c:forEach
																			items="${result.fileInfo}" var="obj">
																			<a
																				href="downLoadFile.htm?aid=${result.reviewPaperResultUid}&fName=${obj.originalFileName}&mName=${obj.modifiedFileName}"><img
																				src="images/mydownload.png" width="100" /> </a>

																			<br>
																		</c:forEach></td>
																</tr>
															</c:forEach>
														</table>

													</c:if>
												</c:forEach></td>



											<td><c:forEach items="${compEntry.value}"
													var="typeEntry">
													<c:if test="${typeEntry.key==reviewPaper.TYPE_PAPERREVIEW}">
											${typeEntry.value.avgScore}
										</c:if>
												</c:forEach></td>


											<td><c:forEach items="${compEntry.value}"
													var="typeEntry">
													<c:if
														test="${typeEntry.key==reviewPaper.TYPE_MEETINGREVIEW}">

														<table borde"0" cellpadding="0" cellspacing="0"
															width="100%">
															<c:forEach items="${typeEntry.value.reviewResults}"
																var="result">
																<tr style="border: 0;">
																	<td align="left" width="40%" style="border: 0;"><c:if
																			test="${!reviewPaper.closed}">
																			<span> <a
																				href="reviewPaperJob.htm?reviewPaperResultUid=${result.reviewPaperResultUid}">${result.reviewerName}</a>
																			</span>
																		</c:if> <c:if test="${reviewPaper.closed}">
															${result.reviewerName}
														</c:if></td>
																	<td align="center" width="40%" style="border: 0;">
																		<span>${result.score}</span>
																	</td>
																	<%-- 
														<td align="center" width="25%" style="border:0;">
															<span >${result.remark}</span>
														</td>--%>
																	<td width="20%" style="border: 0;"><c:forEach
																			items="${result.fileInfo}" var="obj">
																			<a
																				href="downLoadFile.htm?aid=${result.reviewPaperResultUid}&fName=${obj.originalFileName}&mName=${obj.modifiedFileName}"><img
																				src="images/mydownload.png" width="100" /> </a>

																			<br>
																		</c:forEach></td>
																</tr>
															</c:forEach>
														</table>

													</c:if>
												</c:forEach></td>



											<td><c:forEach items="${compEntry.value}"
													var="typeEntry">
													<c:if
														test="${typeEntry.key==reviewPaper.TYPE_MEETINGREVIEW}">
											${typeEntry.value.avgScore}
										</c:if>
												</c:forEach></td>

											<td>${compEntry.key.avgScoreTotal}</td>

											<td>${compEntry.key.finalPassRS}</td>
									</c:if>

								</c:forEach>
							</table>

						</div>
					</c:if>

					<!-- 企業看到的審查資料 -->
					<c:if test="${!user.isStaff}">
						<div class="collapse-wrapper">
							<div class="header">審查資料</div>

							<table class="table-grid" WIDTH="98%">
								<tr>
									<th align="center" width="20%"><span><s:message
												code="reviewpaperview.comp" text="企業" /></span></th>
									<th align="center " width="25%"><span><s:message
												code="reviewpaperview.bookreview" text="書審" /></span></th>

									<th align="center" width="25%"><span><s:message
												code="reviewpaperview.facereview" text="面審" /></span></th>

									<th align="center" width="10%"><span><s:message
												code="reviewpaperview.totalavg" text="總平均" /></span></th>
									<th align="center" width="10%"><span><s:message
												code="reviewpaperview.result" text="結果" /></span></th>
								</tr>


								<c:forEach items="${reviewPaper.mp}" var="compEntry">
									<!--each company-->
									<c:if test="${compEntry.key.compName==comp.compName}">
										<tr>
											<td align="left"><span><h2>
														${compEntry.key.compName}</h2> </span></td>

											<td><c:forEach items="${compEntry.value}"
													var="typeEntry">
													<c:if test="${typeEntry.key==reviewPaper.TYPE_PAPERREVIEW}">${typeEntry.value.avgScore}</c:if>
												</c:forEach></td>

											<td><c:forEach items="${compEntry.value}"
													var="typeEntry">
													<c:if
														test="${typeEntry.key==reviewPaper.TYPE_MEETINGREVIEW}">${typeEntry.value.avgScore}</c:if>
												</c:forEach></td>

											<td>${compEntry.key.avgScoreTotal}</td>

											<td>${compEntry.key.finalPassRS}</td>
										</tr>
									</c:if>

								</c:forEach>
							</table>

						</div>
					</c:if>

				</div>


				<div class="tabs-pane" id="tab4">
					<c:if test="${user.isStaff}">
						<a href="compDetailEditDocument.htm?uid=${comp.uid}"><img
							src="images/myedit.png" width="50" /> </a>
					</c:if>
					<div class="header">
						<s:message code="compdetailview.attachmentdata" text="附件資料" />
						</span>

					</div>

					<div class="collapse-wrapper">

						<div class="collapse-box">

							<table class="table-grid" WIDTH="98%">
								<tr>
									<th style="vertical-align: top;" width="15%"><s:message
											code="compdetail.otherfiledownload" text="其他文件下載" />：</th>
									<td id="docs"><c:forEach items="${comp.handoverFileInfo}"
											var="obj">

											<a
												href="downLoadFile.htm?aid=${comp.uid}&fName=${obj.originalFileName}&mName=${obj.modifiedFileName}">${obj.originalFileName}</a>
											<br>
											<br>
										</c:forEach></td>
								</tr>


							</table>
						</div>
					</div>
				</div>

				<div class="tabs-pane" id="tab5">
					<%--
					<c:if test="${user.isStaff}">
						<a href="#"><img src="images/myedit.png" width="50" /> </a>
					</c:if>
					 --%>
					<div class="header">
						<s:message code="compdetailview.coachdata" text="輔導資料" />

					</div>
					<div class="collapse-wrapper">
						<table class="table-grid" WIDTH="98%">
							<tr>
								<th align="center" width="5%"><s:message
										code="compdetailview.coachid" text="編號" /></th>
								<th align="center" width="80%"><s:message
										code="compdetailview.coachtheme" text="主題" /></th>
								<th align="center" width="15%"><s:message
										code="compdetailview.coachdate" text="時間" /></th>
							</tr>

							<c:forEach items="${comp.talkNotes}" var="talkNote">
								<tr>
									<td align="center">${talkNote.seq}</td>
									<td align="left"><span style="font-size: 16"><a
											href="compTalkNote.htm?compId=${comp.uid}&&compName=${comp.compName}&&talkNoteId=${talkNote.talkNoteId}">${talkNote.talkTheme}</a>
									</span></td>

									<td align="left"><span style="font-size: 16">${talkNote.talkDateTime}</span>
									</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>

				<div class="tabs-pane" id="tab6">
					<c:if test="${user.isStaff}">
						<a href="compDetailEditAccount.htm?uid=${comp.uid}"><img
							src="images/myedit.png" width="50" /> </a>
					</c:if>
					<div class="header">
						<s:message code="compdetailview.accountdata" text="帳號資料" />

					</div>

					<div class="collapse-wrapper">

						<div class="collapse-box">

							<table class="table-grid" WIDTH="98%">

								<tr>
									<th align="right" width="15%"><s:message
											code="compdetailview.account" text="帳號" />：</th>
									<td>${comp.userLoginId}</td>
								</tr>
								<tr>
									<th align="right" width="5%"><s:message
											code="compdetailview.accountstatus" text="狀態" />：</th>
									<td>${comp.accountStatus}</td>
								</tr>
							</table>

						</div>
					</div>
				</div>

				<!-- tabs end -->
			</div>

			<!-- contentdiv end -->
		</div>


		<%@ include file="/footer.jsp"%>

		<!--container ends here-->
	</div>




</body>
</html>
