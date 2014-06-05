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
* {
	margin: 0px;
	padding: 0px;
}

body {
	background-color: #E6E6E6;
}

.logintop {
	/*background-color: #ff4c3b;*/
	background-color: white;
	height: 5px;
	box-sizing: border-box;
	/*width: 1282px;*/
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
	background-image: url(images_mu/light1.png);
}

.loginAreaDiv {
	width: 500px;
	height: 340px;
	margin-top: 200px;
	margin-left: auto;
	margin-right: auto;
	/*background-color: #3E3D49;*/
	box-shadow: 10px 10px 10px rgba(0, 0, 0, .5);
	/*background-image: url("images/wood.png");*/
}

.loginFormLogo img {
	width: 440px;
	display: block;
	padding-left: 60px;
	background-color: white;
}

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
	padding: 15px 0px;
	overflow: auto;
}

#loginForm .elem label {
	clear: left;
	float: left;
	padding: 2px 6px 2px 0px;
	text-align: left;
	width: 60px;
	color: white;
}

#loginForm .elem input {
	display: inline-block;
	float: left;
}

#loginForm .elem input {
	display: block;
	float: left;
	width: 230px;
	height: 30px;
	padding-left: 40px;
	/*outline: none !important;*/
	border: 0px solid;
	background-color: transparent;
	/*border-color: inherit;*/
	/*-webkit-box-shadow: none;*/
	/*box-shadow: none;*/
	border-bottom: solid white 1px;
	/*background-color: #DEBA9A;*/
}

#xx {
	width: 105px !important;
}

#loginForm .elem img[id="yy"] {
	border: solid 1px;
}

#loginForm .elem img[id="yy"]:hover {
	cursor: pointer !important;
	border: solid 5px;
	/*box-shadow: 39px 39px 5px 0px rgba(0,0,0,0.75) !important;*/
}

#loginForm .elem input:focus {
	background-color: #EFD9C6;
}

#loginForm .elem img {
	display: block;
	float: left;
}

/*#loginForm .elem img:hover:after{*/
/*background: #333;*/
/*background: rgba(0,0,0,.8);*/
/*border-radius: 5px;*/
/*bottom: 26px;*/
/*color: #fff;*/
/*content: attr(hint);*/
/*left: 20%;*/
/*padding: 5px 15px;*/
/*position: absolute;*/
/*z-index: 98;*/
/*width: 220px;*/
/*}*/
#loginForm .elem input[type="submit"] {
	width: 246px;
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
	background-color: #000000;
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

<script type="text/javascript">
	function submitform() {
		var form = document.getElementById("loginForm");
		form.submit();
	}
</script>

</head>

<body>

	<div class="loginDivWrapper">
		<div class="logintop"></div>
		<div class="loginDiv">
			<div class="loginAreaDiv">
				<div class="loginFormLogo">
					<img src="images/nsi_header.png" />
				</div>

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
						<img src="images_mu/loginhead3.png" widtht="30" title="請輸入帳號" />
						<form:input path="userLoginId" />
					</div>
					<div class="elem">
						<img src="images_mu/password2.png" widtht="30" title="請輸入密碼" />
						<form:password path="userLoginPwd" />
					</div>
					<div class="elem">
						<img height="30px" style="cursor: pointer;" title="点击图片刷新验证码"
							src="captcha-image.htm"
							onclick="javascript:window.location.href='login.htm'" />
						<form:input path="userLoginCheck" id="xx" />
						<a href="javascript:submitform()"><img src="images_mu/go2.png"
							widtht="30" id="yy" /></a>
					</div>

<!-- 					<div class="elem"> -->
<!-- 						<label>帳號</label> -->
<%-- 						<form:input path="userLoginId" /> --%>

<!-- 					</div> -->

<!-- 					<div class="elem"> -->
<!-- 						<label>密碼</label> -->
<%-- 						<form:password path="userLoginPwd" /> --%>

<!-- 					</div> -->

<!-- 					<div class="elem"> -->
<!-- 						<label>驗證碼</label> -->
<%-- 						<form:input path="userLoginCheck" /> --%>
<!-- 						<img style="cursor: pointer;" title="点击图片刷新验证码" -->
<!-- 							src="captcha-image.htm" -->
<!-- 							onclick="javascript:window.location.href='login.htm'" /> -->

<!-- 					</div> -->

					<!-- 					<div class="elem"> -->
					<!-- 						<label></label><input type="submit" value="登 入" /> -->
					<!-- 					</div> -->
				</form:form>
			</div>
		</div>

		<br class="clear">
			<div class="loginfooter">
				<div class="p1"></div>
				<div class="p2"></div>
				<div class="p3">
					Copyright © 2014 by SME Entrepreneurship and Innovation Service
					Center .<br> All Rights Reserved. 隱私權與網站資訊使用聲明 
				</div>
			</div>
	</div>


</body>
</html>

