<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<link rel="stylesheet" type="text/css" href="pkg/yuirte/skin.css">
<link rel="stylesheet" href="css/listsheet.css" />
<link type="text/css" href="pkg/jquery/mu.css" rel="stylesheet" />
<script type="text/javascript" src="pkg/jquery/jquery.js"></script>
<link href="pkg/menu/p7exp.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="pkg/menu/p7exp.js"></script>
<script type="text/javascript">
</script>

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

	function deluf(ufid) {
		var tempid= ufid.substr(1);
		$.post("filedelete.htm", { ufid: tempid },
  				 function(data){
    		 $("#"+ufid).remove();
    	    if($("#uploadlist").html().trim()==""){
  		 	$("#uploadlist").append("<span id=\"uploadblank\">暫無相關資料</span>");
  		 	};
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
		<c:if test="${activity.isnew}">
			<h2 id="listTit">您的位置>新增交流活動資訊</h2>
		</c:if>
		<c:if test="${!activity.isnew}">
			<h2 id="listTit">您的位置>修改交流活動資訊</h2>
		</c:if>
		
        <div id="listCon">
		<form:form id="myform" method="POST" commandName="activity">
		
			<form:errors path="*" cssClass="errorblock" element="div" />
			
			<a href="activityList.htm" class="reIcon">回一覽表</a> | <a href="javascript:submitform()" class="adIcon">確定儲存</a>
            
			<div class="collapse-wrapper">
				<div class="header">
					<a href="#" class="collapse-toggle">交流活動資訊</a>
				</div>
				<div class="collapse-box">
				
					<form:hidden path="isnew"/>
			<c:if test="${activity.isnew}">
				<form:hidden path="aid"/>
			</c:if>
					<table border='1' cellpadding="0" cellspacing="0" class="listTable" WIDTH="100%">
						<tr>
							<th><span class="tipneed">*</span>活動主題：</th>
							<td><form:input path="theme" size="80" id="title"/>&nbsp;
							<form:errors path="theme" cssClass="error" /></td>
						</tr>
						<tr>
							<th><span class="tipneed">*</span>主辦方：</th>
							<td><form:input path="sponsor" size="80" />&nbsp;
							<form:errors path="sponsor" cssClass="error" />
							</td>
						</tr>
						<tr>
							<th><span class="tipneed">*</span>講師：</th>
							<td><form:input path="lecturer" size="80" />&nbsp;
							<form:errors path="lecturer" cssClass="error" />
							</td>
						</tr>
						<tr>
								<th >&nbsp;<a href="javascript:(function cc(){window.open('fileupload.htm?type=a_${activity.aid}','uploadwindow','height=260,width=480,top=100,left=400,scrollbars=no, toolbar=no,menubar=no,resizable=no,location=no, status=no');})()">相關資料上傳</a>：
							
							
							
							</th><td >
								[
									<span id="uploadlist">
								<c:if test="${IsShow}">
									<c:forEach items="${uploadedfilelist}" var="obj" >
										<span id="d${obj.ufid}">
										&nbsp;
										${obj.realname}|<a onClick="deluf('d${obj.ufid}')" href="#">刪除</a>
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
							<th><span class="tipneed">*</span>講師介紹：</th>

							<td><textarea name="msgpost" id="msgpost" cols="80" rows="10" >
									${activity.lecturerintro}
								</textarea>
								
							&nbsp;
							
							<form:hidden path="lecturerintro" id="lecturerintro" />
							<form:errors path="lecturerintro" cssClass="error" />
		
							</td>
						</tr>
						<tr>
							<th>備註：</th>
							<td><form:textarea path="remarks" cols="80" rows="10" />&nbsp;
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

</body>
</html>

