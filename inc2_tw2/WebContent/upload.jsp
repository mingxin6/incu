<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>
  

<!DOCTYPE html  
PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">  
<html>  
<head>
<base target = "uploadtarget">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" href="pkg/jquery/mu.css" rel="stylesheet" />
<script type="text/javascript" src="pkg/jquery/jquery.js"></script>
<link href="pkg/menu/p7exp.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="pkg/menu/p7exp.js"></script>
<script type="text/javascript" >
	$(document).ready(function(){
		
		var titleStr = window.opener.$("#title").val();
		$("#titlespan").html(titleStr);
		$("#message").css("display","none");
				
		$("#toupload").click(function(){
						
						$("#toupload").slideDown("slow",function(){
  						
						$("#message").css({"color":"red","font-size":"200%"});
  						$("#message").text("文件上傳中，請稍候...");
						$("#message").show();
						$("#uploadform").submit();
				});
		
		}); 
 	});
</script>

<title>文件上傳</title>  
</head> 

<body>   
	<div id="container">


	<div class="collapse-wrapper" style="width: 420px;">
				<div class="header">
					<div class="collapse-toggle">	
					<div id="message"></div> 
					『 <span id="titlespan"></span>&nbsp;文件上傳』  
					</div>
				</div>
				<div class="collapse-box" style="width: 400px;">
				<form enctype="multipart/form-data"  method="post" id="uploadform" target="_self">  
		 			<input type="hidden" name="type" value="${strType}" />
			
					<table border='1' style="width: 400px;">
			 
			 <tr><td><span>文件一：</span></td><td><input type="file" name="file1" /> <br /></td></tr>
		     <tr><td><span>文件二：</span></td><td><input type="file" name="file2" /> <br /></td></tr>
		     <tr><td><span>文件三：</span></td><td><input type="file" name="file3" /> <br /></td></tr>
			 <tr><td></td><td align="center"> <input id="toupload" type="button" value="上傳" />  
		    </td></tr>
					   
			   
		    </table>
		</form>
	</div>
</div>  

</body> 
</html>   
