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
				您的位置>系統設定>服務資料設定>
				<span>使用者一覽表</span>
			</h2>

			<div id="listCon">
				<div class="midCon">
					<form:form method="POST" commandName="userAccountListCondition">
						<table cellpadding="0"	cellspacing="0">
							<tr style="padding:0; margin:0">
								<td align="right">
									使用者名稱:
								</td>
								<td>
									<form:input path="userName" class="listTxt"  style="padding:0; margin:5"/>
								</td>
								<td>

								</td>
							</tr>

							<tr style="padding:0; margin:0">
								<td align="right">
									狀態:
								</td>
								<td>
									<form:select path="userStatus" class="listSel"  style="padding:0; margin:5">
										<form:options items="${userStats}" />
									</form:select>
								</td>
								<td>

								</td>
							</tr>

							<tr style="padding:0; margin:0">
								<td align="right">
									角色:
								</td>
								<td>
									<form:select path="userRole" class="listSel"  style="padding:0; margin:5">
										<form:options items="${userRoles}" />
									</form:select>
								</td>
								<td>
									<input type="submit" value="過濾" class="UserBtn" />
								</td>
							</tr>


						</table>
					</form:form>
				</div>
				<br />
				<a href="userNew.htm" class="UserBtn">新 增 使 用 者</a>
				
				


				<table width="1228" height="122" border="1" cellpadding="0"
					cellspacing="0" class="temTable">
					<tr>
						<!-- 
                    <th align="center">序號</th>
                    <th align="center">公司</th>
                    -->

						<th align="center">
							使用者
						</th>
						<!--
                    <th align="center">角色</th>
                    -->

						<th align="center">
							帳號
						</th>
						<th align="center">
							密碼
						</th>
						<th align="center">
							狀態
						</th>
					</tr>


					<c:forEach items="${userAccountList}" var="usr">
						<tr>
							<td>
								<a href="userEdit.htm?userID=${usr.uid}">${usr.userName}</a>
							</td>
							<td>
								${usr.userLoginId}
							</td>
							<td>
								${usr.userLoginPwd}
							</td>
							<td>
								${usr.userStatus}
							</td>
						</tr>
					</c:forEach>





				</table>

			</div>
		</div>
		<!--container ends here--><%@ include file="/footer.jsp"%>
	</body>
</html>
