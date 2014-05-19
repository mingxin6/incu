<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link type="text/css" href="pkg/jquery/mu.css" rel="stylesheet" />
		<link rel="stylesheet" href="css/listsheet.css" />

		<script type="text/javascript" src="pkg/jquery/jquery.js">
</script>

		<link href="pkg/menu/p7exp.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="pkg/menu/p7exp.js">
</script>

		<script type="text/javascript">
function submitform() {

	var form = document.getElementById("myform");
	form.submit();
}
</script>

	</head>

	<body>

		<div id="container">
			<%@ include file="/banner2.jsp"%>
			<%@ include file="/menuPart.jsp"%>

			<%--
			<h2 id="listTit">
				您的位置>${comp.compName}
			</h2>
 --%>

			<div id="listCon">
				<c:if test="${!user.isBusiness}">
					<a href="compWaitList_B.htm" class="formIcon"><s:message code="button.backlist"  text="回列表"/></a>
					<a href="compWaitDetailView_B.htm?compID=${comp.uid}"
						class="formIcon"><s:message code="button.back"  text="返回"/></a>
					<a href="javascript:submitform()" class="formIcon"><s:message code="button.confirmin"  text="確定進駐"/></a>


					<%-- 
					| <a
						href="compDetailEdit_B.htm?uid=${comp.uid}" class="saveIcon">編輯</a> 
					| <a
						href="compDetailView_B_transfer.htm?uid=${comp.uid}" class="saveIcon">入駐</a>
						--%>
				</c:if>


				<form:form id="myform" method="POST" commandName="comp"
					enctype="multipart/form-data" acceptcharset="UTF-8">

					<div class="header">
						<s:message code="compboadd.compinfo"  text="企業資訊"/> (${comp.compStatusRS})
						<br />
						${comp.remark}
					</div>
					<table border='1' cellpadding="0" cellspacing="0" class="listTable"
						WIDTH="90%">
						<tr>
							<th align="right" WIDTH="25%" bgcolor=#CCCCCC>
								<s:message code="compboadd.compname"  text="企業名稱"/>：
							</th>
							<td WIDTH="25%">
								${comp.compName}&nbsp;
							</td>
							<th WIDTH="25%" align="right">
								<s:message code="compboadd.id"  text="統一編號"/>：
							</th>
							<td WIDTH="25%">
								${comp.registerId}&nbsp;
							</td>
						</tr>
						<tr>
							<th WIDTH="25%" align="right">
								<s:message code="compboadd.establishmentdate"  text="成立日期"/>：
							</th>
							<td>
								${comp.registerDate2}&nbsp;
							</td>
							<th WIDTH="25%" align="right">
								<s:message code="compboadd.head"  text="負責人"/>：
							</th>
							<td>
								${comp.representative}&nbsp;
							</td>
						</tr>
						<tr>
							<th WIDTH="25%" align="right">
								&nbsp;
							</th>
							<td>
								&nbsp;
							</td>
							<th WIDTH="25%" align="right">
								<s:message code="compboadd.compfield"  text="企業領域"/>：
							</th>
							<td>
								${comp.domainRS}&nbsp;
							</td>
						</tr>
						<tr>
							<th WIDTH="25%" align="right">
								<s:message code="compboadd.staffnum"  text="員工人數"/>：
							</th>
							<td>
								${comp.totalEmployees}&nbsp;
							</td>
							<th WIDTH="25%" align="right">
								<s:message code="compboadd.capital"  text="資本額（元）"/>：
							</th>
							<td>
								${comp.registerCaptial}&nbsp;
							</td>
						</tr>
						<tr>
							<th WIDTH="25%" align="right">
								&nbsp;
							</th>
							<td>
								&nbsp;
							</td>
							<th WIDTH="25%" align="right">
								<s:message code="compboadd.area"  text="需求坪數"/>：
							</th>
							<td>
								${comp.roomArea}&nbsp;
							</td>
						</tr>
					</table>



					<div class="header">
						<s:message code="compboadd.contactsinfo"  text="聯絡人資訊"/>
					</div>
					<table border='1' cellpadding="0" cellspacing="0" class="listTable"
						WIDTH="90%">
						<tr>
							<th WIDTH="25%" align="right">
								<s:message code="compboadd.contacts"  text="聯絡人"/>：
							</th>
							<td  WIDTH="25%" >
								${comp.adminContact}&nbsp;
							</td>
							<th WIDTH="25%" align="right">
								<s:message code="compboadd.contactstel"  text="聯絡人電話"/>：
							</th>
							<td  WIDTH="25%" >
								${comp.adminContactPhone}&nbsp;
							</td>
						</tr>
						<tr>
							<th WIDTH="25%" align="right">
								<s:message code="compboadd.contactsphone"  text="聯絡人手機"/>：
							</th>
							<td>
								${comp.adminContactMobilePhone}&nbsp;
							</td>
							<th WIDTH="25%" align="right">
								<s:message code="compboadd.contactsmailbox"  text="聯絡人信箱"/>：
							</th>
							<td>
								${comp.adminContactEmail2}&nbsp;
							</td>
						</tr>
					</table>






					<div class="header">
						<s:message code="compdetail.reviewdata"  text="審查資料"/>
					</div>
					<table border="1" cellpadding="0" cellspacing="0" class="listTable"
						WIDTH="90%">

						<tr>
							<th width="25%" align="right">
								<s:message code="compdetail.reviewdata1"  text="進駐申請表"/>：
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
							<th width="15%" align="right">
								<s:message code="compdetail.reviewdata2"  text="企業設立函文"/>：
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
							<th width="15%" align="right">
								<s:message code="compdetail.reviewdata3"  text="營運計劃書"/>：
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
							<th width="15%" align="right">
								<s:message code="compdetail.reviewdata4"  text="會計師簽證"/>：
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
							<th width="15%" align="right">
								<s:message code="compdetail.reviewdata5"  text="401 報表"/>：
							</th>
							<td id="docs">
								<c:forEach items="${comp.form401FileInfo}" var="obj">
									<a
										href="downLoadFile.htm?aid=${comp.uid}&fName=${obj.originalFileName}&mName=${obj.modifiedFileName}">${obj.originalFileName}</a>
									<br>
								</c:forEach>
							</td>
						</tr>


						<tr>
							<th width="10%"  align="right">
								<s:message code="compdetail.otherfiledownload"  text="其他文件下載"/>：
							</th>
							<td id="docs">
								<c:forEach items="${comp.handoverFileInfo}" var="obj">

									<a
										href="downLoadFile.htm?aid=${comp.uid}&fName=${obj.originalFileName}&mName=${obj.modifiedFileName}">${obj.originalFileName}</a>
									<br>
								</c:forEach>
							</td>
						</tr>
						<%-- 
					</table>

					
				<div class="header">
					面審資料
				</div>
				<table border="1" cellpadding="0" cellspacing="0" class="listTable"
					WIDTH="98%">
					<tr>
						<th width="10%">
							文件下載：
						</th>
						<td id="docs">
							<c:forEach items="${comp.interviewFileInfo}" var="obj">

								<a
									href="downLoadFile.htm?aid=${comp.uid}&fName=${obj.originalFileName}&mName=${obj.modifiedFileName}">${obj.originalFileName}</a>
								<br>
							</c:forEach>
						</td>
					</tr>
				</table>




					<div class="header">
						附件
					</div>
					<table border="1" cellpadding="0" cellspacing="0" class="listTable"
						WIDTH="98%">
						<tr>
							<th width="10%"  align="right">
								文件下載：
							</th>
							<td id="docs">
								<c:forEach items="${comp.handoverFileInfo}" var="obj">

									<a
										href="downLoadFile.htm?aid=${comp.uid}&fName=${obj.originalFileName}&mName=${obj.modifiedFileName}">${obj.originalFileName}</a>
									<br>
								</c:forEach>
							</td>
						</tr>--%>
					</table>


					<div>
						<s:message code="compwaittransfer.insetting"  text="進駐設定"/>
						
					</div>


					<table width="90%" border=1 class="listTable" cellpadding="0"
						cellspacing="0">
						<tr>
							<th width="25%" align="right">
								<s:message code="compwaittransfer.account"  text="帳號"/>:
							</th>
							<td width="25%">
								<form:input path="userLoginId" size="25" />
								&nbsp;
								<form:errors path="userLoginId" cssClass="error" />
							</td>
							<th width="25%" align="right">
								<s:message code="compwaittransfer.password"  text="密碼"/>:
							</th>
							<td width="25%">
								<form:password path="userLoginPwdClearText" size="25" />
								&nbsp;
								<form:errors path="userLoginPwdClearText" cssClass="error" />
							</td>
						</tr>
						<tr>
							<th align="right">
								<s:message code="compwaittransfer.deposit"  text="押金"/>:
							</th>
							<td>
								<form:input path="deposit" size="25" />
								&nbsp;
								<form:errors path="deposit" cssClass="error" />
							</td>
							<th align="right">
								<s:message code="compwaittransfer.deposit2"  text="施工保證金"/>:
							</th>
							<td>
								<form:input path="bond" size="25" />
								&nbsp;
								<form:errors path="bond" cssClass="error" />
							</td>
						</tr>

						<tr>
							<th align="right">
								AM :
							</th>
							<td>
								<select name="amId">
									<c:forEach items="${staffList}" var="staff">
										<option value="${staff.uid}">
											${staff.name}
										</option>
									</c:forEach>
								</select>
							</td>
							<th align="right">
								PM :
							</th>
							<td>
								<select name="pmId">
									<c:forEach items="${staffList}" var="staff">
										<option value="${staff.uid}">
											${staff.name}
										</option>
									</c:forEach>
								</select>
							</td>
						</tr>
					</table>


					<div>
						<s:message code="compwaittransfer.room"  text="培育間"/>
					</div>


					<table width="90%" border=1 class="listTable" cellpadding="0"
						cellspacing="0">
						<tr>
							<th align="center" width="10%">
								<s:message code="compwaittransfer.choose"  text="選擇"/>
							</th>
							<th align="center" width="10%">
								<s:message code="compwaittransfer.number"  text="號碼"/>
							</th>
							<th align="center" width="10%">
								<s:message code="compwaittransfer.floor"  text="樓層"/>
							</th>
							<th align="center" width="40%">
								<s:message code="compwaittransfer.company"  text="公司"/>
							</th>
							<th align="center" width="10%">
								<s:message code="compwaittransfer.area"  text="坪數"/>
							</th>
							<th align="center" width="10%">
								<s:message code="compwaittransfer.remark"  text="備註"/>
							</th>
							<th align="center" width="10%">
								<s:message code="compwaittransfer.status"  text="狀態"/>
							</th>

						</tr>

						<c:forEach items="${roomList}" var="room">
							<tr>
								<td align="center">
									<c:if test="${empty room.compId}">
										<input type="checkbox" name="roomChecked" value="${room.uid}">
									</c:if>
								</td>

								<td align="left">
									${room.roomNo}
								</td>

								<td align="left">
									<span style="font-size: 14">${room.floor}</span>
								</td>

								<td align="left">
									<span style="font-size: 14">${room.compName}</span>
								</td>

								<td align="left">
									<span style="font-size: 14">${room.roomArea}</span>
								</td>

								<td align="left">
									<span style="font-size: 14">${room.remark}</span>
								</td>

								<td align="left">
									<span style="font-size: 14">${room.entityStatusRS}</span>
								</td>



							</tr>

						</c:forEach>
					</table>

				</form:form>

			</div>
			<!--container ends here--><%@ include file="/footer.jsp"%>
	</body>
</html>
