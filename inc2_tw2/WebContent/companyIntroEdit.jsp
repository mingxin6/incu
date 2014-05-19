<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" href="pkg/jquery/mu.css" rel="stylesheet" />
<link rel="stylesheet" href="css/listsheet.css" />
<script type="text/javascript" src="pkg/jquery/jquery.js"></script>
<script type="text/javascript" src="pkg/jquery/jQuery.autoCollapser.js"></script>

<link href="pkg/menu/p7exp.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="pkg/menu/p7exp.js"></script>

<script type="text/javascript">
	function submitform() {
		var form = document.getElementById("myform");
		form.submit();
	}
</script>

</head>

<body >
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

		<h2 id="listTit">您的位置>發佈企業介紹</h2>
		<div id="listCon">
		<form:form id="myform" method="POST" commandName="companyIntro">
		
			<form:errors path="*" cssClass="errorblock" element="div" />
			
			<a href="companyIntroList.htm" class="reIcon">回一覽表</a> | <a href="javascript:submitform()" class="adIcon">確定儲存</a>
			
			<div class="collapse-wrapper">
				<div class="header">
					<a href="#" class="collapse-toggle">企業業務介紹</a>
				</div>
				<div class="collapse-box">
					<table border='1' cellpadding="0" cellspacing="0" class="listTable" WIDTH="98%">
						<form:hidden path="ciid"/>
						<form:hidden path="compid"/>
						<form:hidden path="compname"/>
						<tr>
							<th>是否公開信息：</th>
							<td><form:select path="status">
									<form:options items="${statusCond}" />
								</form:select>&nbsp;
							</td>
						</tr>
						
						<tr>
							<th>企業業務介紹：</th>
							<td><form:textarea path="business" cols="80" rows="10" />&nbsp;
							</td>
						</tr>
					</table>
				</div>
			</div>
			
		</form:form>
		</div>
		<script>
			$('.collapse-wrapper').autoCollapser().on(
					'autoCollapser.toggle.start',
					function(event, data) {
						console.log("Collapser has started "
								+ (data.show ? 'expanding' : 'collasping'));
					}).on(
					'autoCollapser.toggle.after',
					function(event, data) {
						console.log("Collapser was successfully "
								+ (data.show ? 'expanded' : 'collasped'));
					});
		</script>

	</div>
	<!--container ends here-->
<%@ include file="/footer.jsp"%>
</body>
</html>
