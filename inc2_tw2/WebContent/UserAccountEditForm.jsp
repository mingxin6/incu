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

		<link rel="stylesheet" href="pkg/jquery/jquery-ui.css" />
		<script src="pkg/jquery/jquery-ui.js">
</script>

		<link href="pkg/menu/p7exp.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="pkg/menu/p7exp.js">
</script>


		<%
			String s = (String) request.getAttribute("complist");
		%>

		<script>

$(function() {
		var availableTags = [<%=s%>];
		$("#tags").autocomplete({
			source : availableTags
		});
	});
</script>


	</head>

	<body>
		<div
			style="width: 100%; height: 17px; background: url(images/topbg.png) repeat-x; margin-top: 8px;"></div>
		<div id="container">
			<table width="1000" border="0" cellpadding="0" border="0"
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

			<%@ include file="/banner.jsp"%>
			<%@ include file="/menuPart.jsp"%>


			<h2 id="listTit">
				您的位置>使用者維護
			</h2>



			<div id="listCon">

				<a href="user.htm" class="UserBtn">返回一覽表</a>

				<form:form method="POST" commandName="userx">
					<form:errors path="*" cssClass="errorblock" element="div" />
					<table border="1" cellpadding="0" cellspacing="0" class="listTable"
						WIDTH="98%">


						<tr>
							<th>
								角色:
							</th>
							<td>
								${userx.userRole}
							</td>
						</tr>

						<c:if test="${user.isBusiness}">
							<tr>
								<th>
									使用者公司名稱 :
								</th>
								<td>
									${userx.userComp}
								</td>
							</tr>
						</c:if>

						<tr>
							<th>
								<span class="tipneed">*</span>使用者名稱:
							</th>
							<td>
								<form:input size="40" path="userName" />
							</td>

						</tr>

						<tr>
							<th>
								使用者電話
							</th>
							<td>
								<form:input size="40" path="userPhone" />
							</td>
						</tr>
						<tr>
							<th>
								使用者郵箱 :
							</th>
							<td>
								<form:input size="40" path="userEmail" />
							</td>
						</tr>
						<tr>
							<th>
								<span class="tipneed">*</span>使用者帳號 :
							</th>
							<td>
								<form:input size="40" path="userLoginId" />
							</td>
						</tr>

						<tr>
							<th>
								<span class="tipneed">*</span>使用者密碼 :
							</th>
							<td>
								<form:input size="40" path="userLoginPwdClearText" />
								（若要更改密碼, 請於左側空白處輸入新密碼.）
							</td>
						</tr>

						<tr>
							<th>
								使用者狀態 :
							</th>

							<td>
								<form:select path="userStatus">
									<!-- form:option value="NONE" label="--- Select ---" /-->
									<form:options items="${userStatuses}" />
								</form:select>
							</td>
						</tr>

						<form:hidden path="uid" />

						<%-- 
						<tr>
							<th>
								權限 :
							</th>
							<td>
								<form:checkboxes items="${authList}" path="auths" />
							</td>
						</tr>

--%>


						<tr>
							<td colspan="2">
								<input type="submit" value="確定" class="suIcon" />
							</td>
						</tr>
					</table>
				</form:form>
			</div>
		</div>
		<!--container ends here--><%@ include file="/footer.jsp"%>
	</body>
</html>
