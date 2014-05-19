<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>


<!DOCTYPE html  
PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">  
<html>  
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link type="text/css" href="pkg/jquery/mu.css" rel="stylesheet" />
<link rel="stylesheet" href="css/listsheet.css" />
<script type="text/javascript" src="pkg/jquery/jquery.js"></script>
<link href="pkg/menu/p7exp.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="pkg/menu/p7exp.js"></script>
<script type="text/javascript" >
	function toDownload(filename){
		$("#filename").val(filename);	
		$("#downform").submit();		
	}
</script>



<title>文件下載</title>  
</head> 

<body>   
	<div id="container">
	

		<%@ include file="/banner.jsp"%>
		<%@ include file="/menuPart.jsp"%>
		
	  
		<br />	
		
		<c:if test="${tempType=='a_'}">
		<a href="activityList.htm" class="reIcon">回一覽表</a>
		</c:if>
		
		<c:if test="${tempType=='sr_'}">
		<a href="sharedResourcesList.htm">回一覽表</a>
		</c:if>
		<br /><br />
	
	<div id="listCon">	
	<div class="collapse-wrapper">
    				    	
	<form:form id="downform" method="POST" action="./filedownload.htm" commandName="downloadFile">
	 	<form:hidden path="filename" />
	 	<form:hidden path="type"  value="${type}" />
	 	
	</form:form>
				<div class="header">
					<div class="collapse-toggle">	
					<div id="message"></div> 『 ${strTitle}&nbsp;文件下載』
					</div>
				</div>
				<div class="collapse-box">
					<c:if test="${IsShow}">
					<table border='1' WIDTH="100%">
					
			 <c:forEach items="${uploadedfilelist}" var="obj" varStatus="varstatus">
			 	<c:if test="${varstatus.count%5==1}">
					<tr>
				</c:if>				
						<td align="center"><a onclick="toDownload('${obj.filename}')" href="#">${obj.realname}</a></td>
				<c:if test="${varstatus.count%5==0}">
					</tr>
				</c:if>	
				</c:forEach>				   
			   
		    </table>
	</c:if>
		<c:if test="${!IsShow}">
			暫無相關下載
		</c:if>
	</div>
    </div>
</div>  

</body> 
</html>  
