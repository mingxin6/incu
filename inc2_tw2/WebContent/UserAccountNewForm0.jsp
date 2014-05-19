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
	</head>

	<body>
		
		<div id="container">
			
			<%@ include file="/banner2.jsp"%>
			<%@ include file="/menuPart.jsp"%>

			<div id="listCon">

				<form:form method="POST" commandName="member">
					<form:errors path="*" cssClass="errorblock" element="div" />
					<table border="1" cellpadding="0" cellspacing="0" class="listTable"
						WIDTH="98%">

						<tr id="usrcomp">
							<th>
								<span class="tipneed">*</span>公司名稱:
							</th>
							<td>
								<form:input size="40" path="unit" />
								<form:errors path="unit" cssClass="unit" />


							</td>
						</tr>


						<tr id="xxxx">
							<th>
								<span class="tipneed">*</span>姓名:
							</th>
							<td>
								<form:input size="40" path="name" />
								<form:errors path="name" cssClass="error" />
							</td>

						</tr>
						<tr>
							<th>
								郵箱 :
							</th>
							<td>
								<form:input size="40" path="email" />
								<form:errors path="email" cssClass="error" />
							</td>
						</tr>
						<tr>
							<th>
								電話
							</th>
							<td>
								<form:input size="40" path="phone" />
								<form:errors path="phone" cssClass="error" />
							</td>
						</tr>



						<tr>
							<th>
								<span class="tipneed">*</span>帳號 :
							</th>
							<td>
								<form:input size="40" path="userLoginId" />
								<form:errors path="userLoginId" cssClass="error" />
							</td>
						</tr>

						<tr>
							<th>
								<span class="tipneed">*</span>密碼 :
							</th>
							<td>
								<form:password size="40" path="userLoginPwdClearText" />
								<form:errors path="userLoginPwdClearText" cssClass="error" />
							</td>
						</tr>

						<tr>
							<th>
								<span class="tipneed">*</span>再輸入一次密碼 :
							</th>
							<td>
								<form:password size="40" path="userLoginPwdClearText2" />
								<form:errors path="userLoginPwdClearText2" cssClass="error" />
							</td>
						</tr>


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
