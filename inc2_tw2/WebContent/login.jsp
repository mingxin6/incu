<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>
<%-- <%@page import="java.util.Locale"%> --%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>園區管理系統登錄介面</title>
<!-- <link rel="stylesheet" href="css/index.css" /> -->
<!-- <script type="text/javascript" src="jquery-1.7.2.js"></script> -->

<style type='text/css'>
.error {
	color: white;
}
</style>


<style type='text/css'>
* {
	margin: 0px;
	padding: 0px;
}

body {
	background-color: #E8E8E8;
}

.bannertop {
	background-image: url(images_jellyfish/logo.png);
	background-position: left center;
	background-repeat: no-repeat;
	/*width: 1280px;*/
	height: 74px;
	/*position: relative;*/
}

.hellodiv {
	box-sizing: border-box;
	/* position: relative; */
	/*background-image: url(images_jellyfish/home.png);*/
	/*background-position: left center;*/
	/*background-repeat: no-repeat;*/
	/*width: 300px;*/
	height: 60px;
	/* top: 10px; */
	/* left: 900px; */
	padding-left: 55px;
	padding-top: 20px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	color: #5E5E5E;
	font-size: 13px;
	float: right;
	margin-top: 10px;
}

.loginDivWrapper {
	width: 1280px;
	margin: 0 auto;
}

.loginDiv {
	width: 1280px;
	height: 793px;
	/*border: solid 1px;*/
	float: left;
	background-image: url(images_jellyfish/bg.jpg);
}

.loginAreaDiv {
	width: 600px;
	height: 340px;
	margin-top: 200px;
	margin-left: auto;
	margin-right: auto;
	background-color: #4C475E;
	box-shadow: 10px 10px 10px rgba(0, 0, 0, .5);
	/*background-image: url("images/wood.png");*/
	overflow: auto;
}

.loginFormLogo {
	background-position: center;
	background-repeat: no-repeat;
	background-image: url(" images_jellyfish/logo2.png");
	height: 120px;
	margin-top: 20px;
	/*background-size: contain;*/
	/*border:transparent 5px;*/
}

/*.loginFormLogo img {*/
/*width: 550px;*/
/*display: block;*/
/*padding-left: 50px;*/
/*background-color: white;*/
/*}*/
#loginForm {
	display: block;
	/*width: 100%;*/
	margin-left: auto;
	margin-right: auto;
	float: left;
	padding-left: 100px;
}

#loginForm .elem {
	margin-top: 10px;
	/*padding: 15px 0px;*/
	overflow: auto;
}

#loginForm .elem label {
	clear: left;
	float: left;
	padding: 2px 6px 2px 0px;
	text-align: left;
	width: 60px;
	color: white;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	line-height: 16pt;
	font-size: 13px;
	color: #FFFFFF;
	text-decoration: none;
}

#loginForm .elem input {
	display: block;
	float: left;
	/* 	width: 230px; */
	padding: 2px;
	/*border: solid;*/
	background-color: #DEBA9A;
}

#loginForm .elem input:focus {
	background-color: #EFD9C6;
}

#loginForm .elem img {
	display: block;
	float: left;
	width: 90px;
	height: 24px;
}

#loginForm .elem input[id="xx"] {
	margin-right: 10px;
}

#loginForm .elem input[type="submit"] {
	width: 120px;
	background-color: #5996ab;
	color: white;
}

#loginForm .elem input[type="submit"]:hover {
	/*width: 246px;*/
	background-color: #ff6e62;
}

br.clear {
	clear: both;
}

.loginfooter {
	padding-top: 30px;
	padding-left: 120px;;
	height: 100px;;
	background-color: #7E6B5A;
	box-sizing: border-box;
	/*width: 1282px;*/
}

.loginfooter .p1 {
	float: left;
	background-image: url("images_jellyfish/footer_01.png");
	width: 236px;
	height: 38px;
}

.loginfooter .p2 {
	float: left;
	background-image: url("images_jellyfish/footer_02.png");
	width: 257px;
	height: 38px;
}

.loginfooter .p3 {
	float: left;
	color: white;
}
</style>



</head>

<body>


	<div class="loginDivWrapper">
		<div class="bannertop">
			<div class="hellodiv">台北市115南港區三重路19-11號&nbsp;&nbsp;&nbsp;02-6607-6298&nbsp;&nbsp;&nbsp;
				http://www.nsi.org.tw</div>
		</div>
		<div class="loginDiv">
			<div class="loginAreaDiv">
				<div class="loginFormLogo"></div>
				<form:form id="loginForm" method="POST" commandName="voLogin">
					<%
						String str;
							if ((str = (String) session.getAttribute("check_error")) != null) {
								out.println("<b style=\"color:red;\">" + str + "</b><br/>");
								session.removeAttribute("check_error");
							}
					%>
					<form:errors path="*" cssClass="error" element="div" />

					<div class="elem">
						<label>帳號</label>
						<form:input path="userLoginId" />
					</div>
					<div class="elem">
						<label>密碼</label>
						<form:password path="userLoginPwd" />
					</div>
					<div class="elem">
						<label>驗證碼</label>
						<form:input path="userLoginCheck" id="xx" />
						<img style="cursor: pointer;" title="点击图片刷新验证码"
							src="captcha-image.htm"
							onclick="javascript:window.location.href='login.htm'" />
					</div>
					<div class="elem">
						<label></label><input type="submit" value="登 入" />
					</div>
				</form:form>
			</div>
		</div>
		<br class="clear" />


		<div class="loginfooter">
			<div class="p1"></div>
			<div class="p2"></div>
			<div class="p3">
				Copyright © 2014 by SME Entrepreneurship and Innovation Service
				Center .<br /> All Rights Reserved. 隱私權與網站資訊使用聲明
			</div>
		</div>
	</div>


</body>
</html>

