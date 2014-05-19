<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" href="pkg/jquery/mu.css" rel="stylesheet" />
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

		<%@ include file="/banner.jsp"%>
		<%@ include file="/menuPart.jsp"%>

		<h2>新增交流活動資訊</h2>

		<form:form id="myform" method="POST" commandName="activity">
		
			<form:errors path="*" cssClass="errorblock" element="div" />
			
			<a href="activityList.htm">回一覽表</a>| <a href="javascript:submitform()">確定儲存</a>
			<br>
			<br>
			
			<div class="collapse-wrapper">
				<div class="header">
					<a href="#" class="collapse-toggle">交流活動資訊</a>
				</div>
				<div class="collapse-box">
					<table border='1' WIDTH="100%">
						<tr>
							<td>活動主題：</td>
							<td><form:input path="theme" size="80" id="title"/>&nbsp;
							<form:errors path="theme" cssClass="error" /></td>
						</tr>
						<tr>
							<td>主辦方：</td>
							<td><form:input path="sponsor" size="80" />&nbsp;
							<form:errors path="sponsor" cssClass="error" />
							</td>
						</tr>
						<tr>
							<td>講師：</td>
							<td><form:input path="lecturer" size="80" />&nbsp;
							<form:errors path="lecturer" cssClass="error" />
							</td>
						</tr>
						<tr>
							<td >&nbsp;<a href="javascript:(function cc(){window.open('fileupload.htm?action=${activity.theme}&type=a_${activity.aid}','uploadwindow','height=260,width=480,top=100,left=400,scrollbars=no, toolbar=no,menubar=no,resizable=no,location=no, status=no');})()">相關資料上傳</a>：
							</td>
							<td >
								[
									<span id="uploadlist">
								<c:if test="${IsShow}">
									<c:forEach items="${uploadedfilelist}" var="obj" >
										<span id="d${obj.ufid}">
										&nbsp;
										${obj.realname}|<a onclick="deluf('d${obj.ufid}')" href="#">刪除</a>
										&nbsp;
										</span>
									</c:forEach>
								</c:if>
									</span>
								<c:if test="${!IsShow}">
									<span id="uploadblank">暫無相關資料</span>
								</c:if>
									
								
							
							
								]
							</td>
						</tr>
						<tr>
							<td>講師介紹：</td>

							<td><textarea name="msgpost" id="msgpost" cols="80" rows="10" >
									${activity.lecturerintro}
								</textarea>
								
							&nbsp;
							
							<form:hidden path="lecturerintro" id="lecturerintro" />
							<form:errors path="lecturerintro" cssClass="error" />
		
							</td>
						</tr>
						<tr>
							<td>備註：</td>
							<td><form:textarea path="remarks" cols="80" rows="10" />&nbsp;
							</td>
						</tr>
					</table>
				</div>
			</div>
			
		</form:form>

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

</body>
</html>

