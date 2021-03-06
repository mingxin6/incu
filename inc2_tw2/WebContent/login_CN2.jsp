<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>
<%@page import="java.util.Locale"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>園區管理系統登錄介面</title>
<link rel="stylesheet" href="css/index.css" />
<script type="text/javascript" src="jquery-1.7.2.js">
	
</script>
<script type="text/javascript">
	$(function() {
		$('.loginBtn').click(function() {
			$(this).css('background-image', 'url(images/blueBtn.png)')
		});
	})
</script>


</head>

<body>

	<div id="loginWrap">
		<div id="loginBar">

			<div id="loginLeft">
				<h1 id="logo">
					<img src="images/logo_CN2.png" width="590" height="140" />
				</h1>
			</div>

			<div id="loginRight">


				<form:form method="POST" commandName="voLogin">
					<%
						String str;
							if ((str = (String) session.getAttribute("check_error")) != null) {
								out.println("<b style=\"color:red;\">" + str + "</b><br/>");
								session.removeAttribute("check_error");
							}
					%>
					<form:errors path="*" cssClass="error" element="div" />
					<strong>账&nbsp;&nbsp;&nbsp;号：</strong>
					<form:input path="userLoginId" cssClass="username" />
					<form:errors path="userLoginId" cssClass="error" />
					<br />

					<strong>密&nbsp;&nbsp;&nbsp;码：</strong>
					<form:password path="userLoginPwd" cssClass="password" />
					<form:errors path="userLoginPwd" cssClass="error" />
					<br />

					<p class="yzm">验证码：</p>
					<form:input path="userLoginCheck" cssClass="loginCheck" />


					<img class="loginImg" style="cursor: pointer;" title="点击图片刷新验证码"
						width="90px" height="40px" src="captcha-image.htm"
						onclick="javascript:window.location.href='login_CN2.htm'" />
					<span>&nbsp;</span>
					<form:errors path="userLoginCheck" cssClass="error" />
					<input name="" type="submit" value="提  交" class="loginBtn" />
				</form:form>

			</div>
		</div>
		<%--
			<a href="docs/NSI-1.pdf" target="_blank">申請書</a>

			<a href="userNew0.htm" target="_blank">註冊</a>

 --%>
	</div>
</body>
</html>

