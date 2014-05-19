<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" href="pkg/jquery/mu.css" rel="stylesheet" />
<link rel="stylesheet" href="css/listsheet.css" />
<script type="text/javascript" src="pkg/jquery/jquery.js"></script>

<!--
<script type="text/javascript" src="pkg/jquery/jQuery.autoCollapser.js"></script>
-->

<link href="pkg/menu/p7exp.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="pkg/menu/p7exp.js"></script>

<!-- YUI Menu -->
<link rel="stylesheet" type="text/css" href="pkg/yuirte/skin.css">
<script src="pkg/yuirte/yahoo-dom-event.js"></script>
<script src="pkg/yuirte/element-min.js"></script>
<!-- Needed for Menus, Buttons and Overlays used in the Toolbar -->
<script src="pkg/yuirte/container_core-min.js"></script>
<script src="pkg/yuirte/menu-min.js"></script>
<script src="pkg/yuirte/button-min.js"></script>
<!-- Source file for Rich Text Editor-->
<script src="pkg/yuirte/editor-min.js"></script>
<script src="pkg/yuirte/myyui.js"></script>




<script type="text/javascript">
	function submitform() {
		myEditor.saveHTML();
		var html = myEditor.get('element').value;
		$("#content").val(html);

		var form = document.getElementById("myform");
		form.submit();
	}
</script>


</head>

<body  class="yui-skin-sam" >
	<div style="width:100%; height:17px; background:url(images/topbg.png) repeat-x; margin-top:8px;"></div>
	<div id="container">
		<table width="1000" border="0"  cellpadding="0" border="0" style="margin:20px auto 0;">
              <tr>
                    <td width="239" align="left"><img src="images/nsi_header.png" height="70"></td>
                    <td>&nbsp;</td>
              </tr>
        </table>
		<%@ include file="/banner.jsp"%>
		<%@ include file="/menuPart.jsp"%>
        
		<h2 id="listTit">您的位置>園區規定資訊</h2>
		<div id="listCon">
		<form:form id="myform" method="POST" commandName="pro">

			<a href="providesList.htm" class="reIcon">回一覽表</a> | <a href="javascript:submitform()" class="adIcon">確定儲存</a>
<br><br>




<!--			<div>
				<div class="header">園區規定資訊</div>

				<div>-->
					<table border='1' cellpadding="0" cellspacing="0" class="listTable" WIDTH="98%">
						<tr>
							<th WIDTH="25%" bgcolor=#CCCCCC>標題：</th>
							<td WIDTH="75%"><form:input path="theme" size="80" />&nbsp;
							</td>
						</tr>
						<tr>
							<th>內容：</th>
							<td><form:hidden path="content" /> <textarea name="msgpost"
									id="msgpost" cols="45" rows="10"></textarea> <form:errors
									path="content" cssClass="error" /></td>
						</tr>
						
						<!-- 
						<tr>
							<td>發佈的時間：</td>
							<td><form:input path="times" size="80" />&nbsp;</td>
						</tr>
						<tr>
							<td>發佈人：</td>
							<td><form:input path="announcePerson" size="80" />&nbsp;</td>
						</tr>
						-->
					</table>
				</div>
			</div>

		</form:form>
		</div>


	</div>
	<!--container ends here-->
<%@ include file="/footer.jsp"%>
</body>
</html> 
