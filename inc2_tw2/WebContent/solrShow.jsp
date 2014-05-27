<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" href="pkg/jquery/mu.css" rel="stylesheet" />
<link rel="stylesheet" href="css/list_sheet.css">
<script type="text/javascript" src="pkg/jquery/jquery.js"></script>
<link href="pkg/menu/p7exp.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="pkg/menu/p7exp.js"></script>

<link rel="stylesheet" type="text/css" href="css/yuirte/skin.css">

<script type="text/javascript" src="jQuery.autoCollapser.js"></script>


<script type="text/javascript">
</script>

<script src="js/yuirte/yahoo-dom-event.js"></script>
<script src="js/yuirte/element-min.js"></script>
<!-- Needed for Menus, Buttons and Overlays used in the Toolbar -->
<script src="js/yuirte/container_core-min.js"></script>
<script src="js/yuirte/menu-min.js"></script>
<script src="js/yuirte/button-min.js"></script>
<!-- Source file for Rich Text Editor-->
<script src="js/yuirte/editor-min.js"></script>

<script src="js/yuirte/myyui.js"></script>
<script type="text/javascript">

	function deluf(ufid) {
		var tempid= ufid.substr(1);
		$.post("filedelete.htm", { ufid: tempid },
  				 function(data){
    		 $("#"+ufid).html("");
  		 });
		
	}

	function submitform() {
		myEditor.saveHTML();
		$("#lecturerintro").val(myEditor.get('element').value);
		$("#myform").submit();
	}

</script>

</head>

<body class="yui-skin-sam" >

	<div id="container">

		<%@ include file="/banner2.jsp"%>
		<%@ include file="/menuPart.jsp"%>

		<div>
		<c:forEach items="${re_list}" var="resultObject">
   			<div class="serCon">
   				<ul>
   					<li class="first">${resultObject.id+1}</li>
   					<li><a href="${resultObject.url}" target="_blank">${resultObject.title}</a></li>
   					<li><textarea name="" cols="192" rows="6">${resultObject.content}</textarea></li>
   				</ul>
   			</div>
   		</c:forEach>
   		</div>
   
	</div>
<!--container ends here-->
		<%@ include file="/footer.jsp"%>
	</body>
</html>

