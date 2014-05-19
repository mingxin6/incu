<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改通知公告</title>

<link type="text/css" href="pkg/jquery/mu.css" rel="stylesheet" />
<link rel="stylesheet" href="css/listsheet.css" />
<script type="text/javascript" src="pkg/jquery/jquery.js"></script>

<!-- 
<script type="text/javascript" src="pkg/jquery/jQuery.autoCollapser.js"></script>
-->

<!-- p7exp Menu -->
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
		//var editorContent = UE.getEditor('editor').getContent();
		//$("#message").val(editorContent);
		myEditor.saveHTML();
		var html = myEditor.get('element').value;
		$("#message").val(html);

		var form = document.getElementById("myform");
		form.submit();
	}
	
	function deleteFile(){
		$($(this).closest("tr"));
	}
	
</script>




<script>
	$(document)
			.ready(
					function() {
						//add more file components if Add is clicked
						$('#addFile').click(
							function() {
								//var fileIndex = $('#fileTable tr').children().length;
								$('#fileTable')
									.append(
										'<tr>'
										+'<td>'
										+'<input type="button" value="刪除" onClick="$(this).closest(\'tr\').remove();"/>'
										+'</td>'
										+'<td>'
										+'<input type="file" name="files" />'
										+ '</td></tr>');
							});
						
						
						

					}//ready function
					
				);
</script>

</head>
<body class="yui-skin-sam" >

	<div id="container">

		<%@ include file="/banner.jsp"%>
		<%@ include file="/menuPart.jsp"%>

		<h2 id="listTit">您的位置>${SharedThing.title}</h2>

		<div id="listCon">

		<form:form id="myform" method="POST" commandName="SharedThing"
			enctype="multipart/form-data"  acceptcharset="UTF-8" >
			
			
			<form:errors path="*" cssClass="errorblock" element="div" />

			<a href="SharedThingList.htm?type=${type}" class="formIcon">回列表</a> | <a
				href="javascript:submitform()" class="okIcon">確定儲存</a>


			<table border="1" cellpadding="0" cellspacing="0" class="listTable" WIDTH="98%">
				<tr>
					<th width="10%" WIDTH="25%" bgcolor=#CCCCCC>公告標題：</th>
					<td WIDTH="90%"><form:input path="title" size="80" />&nbsp; <form:errors
							path="title" cssClass="error" /></td>
				</tr>

				<tr>
				<th>公告內容：</th>
				<td>
					<form:hidden path="message" /> 
					<textarea name="msgpost"
						id="msgpost" cols="45" rows="10">${SharedThing.message}</textarea> 
					<form:errors path="message" cssClass="error" /></td>
				</tr>
				
				<tr>
					<th>文件下載：</th>
					<td id="docs">
					
					<c:forEach items="${SharedThing.fileInfo}" var="obj">
					
					
					
					<input type="checkbox" name="deleteCheck" value="${obj.modifiedFileName}" /> 刪除
					
					<a href="downLoadFile.htm?aid=${SharedThing.aid}&fName=${obj.originalFileName}&mName=${obj.modifiedFileName}">${obj.originalFileName}</a><br>
					</c:forEach></td>
				</tr>
			
				<tr>
					<th>公告狀態：</th>
					<td><form:select path="status">
							<form:options items="${statusCond}" />
						</form:select> &nbsp; <form:errors path="status" cssClass="error" /></td>
				</tr>
			</table>

			<input id="addFile" type="button" value="增加上傳檔"  class="upIcon"/>

			<table id="fileTable">
				<tr>
					<td><input type="button" value="刪 除" onClick="$(this).closest('tr').remove();" class="deIcon"/></td>
					<td><input name="files" type="file"/></td>
				</tr>
				<tr>
					<td><input type="button" value="刪 除" onClick="$(this).closest('tr').remove();" class="deIcon"/></td>
					<td><input name="files" type="file"/></td>
				</tr>
				<tr>
					<td><input type="button" value="刪 除" onClick="$(this).closest('tr').remove();" class="deIcon"/></td>
					<td><input name="files" type="file"/></td>
				</tr>
			</table>
			
			
			


		</form:form>
		</div>
	</div>
<%@ include file="/footer.jsp"%>
</body>
</html> 
