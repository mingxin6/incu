<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" href="pkg/jquery/mu.css" rel="stylesheet" />
<link rel="stylesheet" href="css/listsheet.css" />
<script type="text/javascript" src="pkg/jquery/jquery-1.9.1.js"></script>
<link href="pkg/menu/p7exp.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="pkg/menu/p7exp.js"></script>

<script src="pkg/jquery/jquery-ui.js"></script>
<link rel="stylesheet" href="pkg/jquery/jquery-ui.css" />
<link rel="stylesheet" href="style.css" />

<script type="text/javascript">
	function submitform() {
		var form = document.getElementById("myform");
		form.submit();
	}
</script>
<script>
	function myConfirm() {
		$("#dialog-confirm").dialog({
			resizable : false,
			height : 220,
			modal : true,
			buttons : {
				"確定" : function() {
					
					$(this).dialog("close");
					var form = document.getElementById("myform");
					form.submit();
				},
				"取消" : function() {
					
					$(this).dialog("close");
				}
			}
		});
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


		<h2 id="listTit">您的位置>填寫月報表</h2>

		<div id="listCon">
        	<div class="temCon">
			<form:form id="myform" method="POST" commandName="monthlyReport">

			<form:errors path="*" cssClass="errorblock" element="div" />

			<table>
				<tr>
					<td>年:</td>
					<td><form:select path="year" class="sely">
							<form:options items="${years}" />
						</form:select></td>
					<td>月:</td>
					<td><form:select path="month" class="sely">
							<form:options items="${months}" />
						</form:select></td>

					<td><a href="javascript:myConfirm()" class="suIcon">&nbsp;&nbsp;&nbsp;&nbsp;提&nbsp;&nbsp;交</a></td>

				</tr>
			</table>
            </div>
			<div id="dialog-confirm" title="請確定?">
				<p>
					<span class="ui-icon ui-icon-alert"
						style="float: left; margin: 0 7px 0px 0;"></span>注意:提交後不能再修改資料!
				</p>
			</div>
			<br>

			<form:hidden path="compName" />
			<form:hidden path="compId" />

			<!-- xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx -->

			<table border="1" cellpadding="0" cellspacing="0" class="listTable" WIDTH="98%">
				<tr>

					<th rowspan="2" valign="middle">銷售額(萬元)</th>
					<th colspan="4" align="center">申請智慧財產權數</th>

					<th rowspan="2" valign="middle">軟體產品(件)</th>
					<th rowspan="2" valign="middle">軟體著作權(件)</th>
					<th colspan="5" align="center">人員情況(人)</th>

				</tr>
				<tr>


					<th>發明<br>專利(件)
					</th>
					<th>實用/新型<br>專利(件)
					</th>
					<th>外觀<br>專利(件)
					</th>
					<th>積體電路<br>布圖(個)
					</th>


					<th>博士</th>
					<th>碩士</th>
					<th>本科</th>
					<th>大專</th>
					<th>總數</th>
				</tr>


				<tr>

					<td align="right"><form:input size="4" path="revenue" /></td>
					<td><form:input size="4" path="ip_invent" /></td>
					<td><form:input size="4" path="ip_newType" /></td>
					<td><form:input size="4" path="ip_look" /></td>
					<td><form:input size="4" path="icDrawing" /></td>
					<td><form:input size="4" path="softwareProd" /></td>
					<td><form:input size="4" path="softwareBook" /></td>
					<td><form:input size="4" path="phd" /></td>
					<td><form:input size="4" path="master" /></td>
					<td><form:input size="4" path="proMajor" /></td>
					<td><form:input size="4" path="bachelor" /></td>
					<td><form:input size="4" path="totalEmployee" /></td>

				</tr>
			</table>
			<br>

			&nbsp;&nbsp;備註:<br />
			&nbsp;&nbsp;<form:textarea cols="80" rows="20" path="remark" />

			</form:form>
        	
		</div>
	</div>
	<!--container ends here--><%@ include file="/footer.jsp"%>
</body>
</html> 
