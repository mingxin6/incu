<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" href="pkg/jquery/mu.css" rel="stylesheet" />
<link rel="stylesheet" href="css/listsheet.css" />
<script type="text/javascript" src="pkg/jquery/jquery.js"></script>
<link href="pkg/menu/p7exp.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="css/listsheet.css">
<script type="text/javascript" src="pkg/menu/p7exp.js"></script>
</head>

<body  >
	<!-- <div style="width:100%; height:17px; background:url(images/topbg.png) repeat-x; margin-top:8px;"></div> -->
	<div id="container">
	<!-- 	<table width="1000" border="0"  cellpadding="0" border="0" style="margin:20px auto 0;">
              <tr>
                    <td width="239" align="left"><img src="images/nsi_header.png" height="70"></td>
                    <td>&nbsp;</td>
              </tr>
        </table> -->
		<%@ include file="/banner2.jsp"%>

		<%@ include file="/menuPart.jsp"%>


		<h2 class="changeName"><br /><s:message code="changepwd.changepwd" text="變更密碼" /></h2>

		<form:form method="POST" commandName="voChangePwd">

			<form:errors path="*" cssClass="errorblock" element="div" />



			<table>
				<tr>
					<td><span class="tipneed">*</span><s:message code="changepwd.newpwd" text="新密碼" />:</td>
					<td><form:password path="newPwd" class="newP"/></td>
					<td><form:errors path="newPwd" cssClass="error" /></td>
				</tr>

				<tr>
					<td><span class="tipneed">*</span><s:message code="changepwd.newpwdagain" text="再輸入一次新密碼" /> :</td>
					<td><form:password path="newPwdAgain" class="newP2"/></td>
					<td><form:errors path="newPwdAgain" cssClass="error" /></td>
				</tr>

				<tr>
					<td><span class="tipneed">*</span><s:message code="changepwd.oldpwd" text="原密碼" /> :</td>
					<td><form:password path="oldPwd" class="newP"/></td>
					<td><form:errors path="oldPwd" cssClass="error" /></td>
				</tr>



				<tr>
					<td colspan="3"><input type="submit" value="<s:message code="button.confirm" text="確定" />" class="newBtn"/></td>
				</tr>
			</table>
			
			
		</form:form>


	</div>
	<!--container ends here--><%@ include file="/footer.jsp"%>
</body>
</html>
