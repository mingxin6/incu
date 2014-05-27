<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>园区管理系统登录界面</title>
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

			<div id="loginLeft"
				style="position: relative; top: -20px; left: 130px;">
				<h1 id="logo">
					<img src="images/logo1.png" width="240" height="240" />
				</h1>
				<h2 id="sysName">
					<img src="images/sysName.png" width="480" height="36" />
				</h2>
			</div>

			<div id="loginRight">
				<form:form method="POST" commandName="voLogin">
                	账号：<form:input path="userLoginId" cssClass="username" />
					<form:errors path="userLoginId" cssClass="error" />
					<br />
                  	 密码：<form:password path="userLoginPwd"
						cssClass="password" />
					<form:errors path="userLoginPwd" cssClass="error" />
					<br />
						
					验证码：<form:input path="userLoginCheck" cssClass="loginCheck" />
					<%
						String str;
							if ((str = (String) session.getAttribute("check_error")) != null) {
								out.println(str);
								session.removeAttribute("check_error");
							}
					%>
					<form:errors path="userLoginCheck" cssClass="error" />
					<br />
					<img width="90px" height="40px" src="captcha-image.htm"
						onclick="javascript:window.location.href='login_CN2.htm'" />
					<br />


					<input name="" type="submit" value="提  交" class="loginBtn" />


				</form:form>
			</div>
		</div>
		<p id="copyright">Copyright&copy;2013祥合利信息技术服务有限公司版权所有</p>
	</div>
</body>
</html>
