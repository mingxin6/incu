<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" href="pkg/jquery/mu.css" rel="stylesheet" />
<link rel="stylesheet" href="css/listsheet.css" />


<!--=== jQuery ===-->
<link type="text/css" href="pkg/jquery/jquery-ui.css" rel="stylesheet" />
<!-- 
<script type="text/javascript" src="pkg/jquery/jquery.js"></script>
-->
<script type="text/javascript" src="pkg/jquery/jquery.min_1.9.1.js"></script>
<script type="text/javascript" src="pkg/jquery/jquery-ui.js"></script>


<!--=== date time picker===-->
		<link href="pkg/jquery/jquery-ui-timepicker-addon.css" type="text/css" />
        <link href="pkg/jquery/demos.css" rel="stylesheet" type="text/css" />
        <script src="pkg/jquery/jquery-ui-timepicker-addon.js" type="text/javascript"></script>
        <!--中文-->
        <script src="pkg/jquery/jquery.ui.datepicker-zh-CN.js.js" type="text/javascript" ></script>
        <script src="pkg/jquery/jquery-ui-timepicker-zh-CN.js" type="text/javascript"></script>
        
<!--=== Collapser ===-->
<script type="text/javascript" src="pkg/jquery/jQuery.autoCollapser.js"></script>

<!--=== menu ===-->
<link href="pkg/menu/p7exp.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="pkg/menu/p7exp.js"></script>

<script type="text/javascript">
	function submitform() {
		var form = document.getElementById("myform");
		form.submit();
	}
</script>


<script>
	$(document).ready(function() {
		
		$('#srdid').change(function(event) {
			var $srcid = $("select#srdid").val();

			//alert("--->"+$srcid);

			if($srcid==""){
				//alert("vvv");
				$("#srcdesc").html("");
				return;
			}
			
			/*
			$.get('GetResourceInformation', {
				srcid : $srcid
			}, function(responseJson) {
				
				
				var $select = $('#states');
				$select.find('option').remove();
				$.each(responseJson, function(key, value) {
					$('<option>').val(key).text(value).appendTo($select);
				});
				
				
			});
			*/
			 
			
			$.ajax({
	            type: "GET",
	            url: "GetResourceInformation?srcid="+$srcid,
	           // data: $srcid,
	           // dataType: "text",
	           dataType: "json",
	            
	            //if received a response from the server
	            success: function( data, textStatus, jqXHR) {
	            	
	            	//alert(data);
	            	//alert(data.success);
	                //our country code was correct so we have some information to display
	                 if(data.success){
	                	 
	                    // $("#srcdesc").html("");
	                     $("#srcdesc").html(data.srcInfo.remarks);
	                 } 
	                 //display error message
	                 else {
	                     $("#srcdesc").html("<div><b>Resource is Invalid!</b></div>");
	                 }
	            },
	            
	            //If there was no resonse from the server
	            error: function(jqXHR, textStatus, errorThrown){
	                 console.log("Something really bad happened " + textStatus);
	                  $("#srcdesc").html(jqXHR.responseText);
	            },
	            
	            
	            //capture the request before it was sent to server
	            /*
	            beforeSend: function(jqXHR, settings){
	                //adding some Dummy data to the request
	                settings.data += "&dummyData=whatever";
	                //disable the button until we get the response
	                $('#myButton').attr("disabled", true);
	            },
	            */
	            
	            //this is called after the response or error functions are finsihed
	            //so that we can take some action
	            /*
	            complete: function(jqXHR, textStatus){
	                //enable the button 
	                $('#myButton').attr("disabled", false);
	            }*/
	  
	        });        
			//-----------------------------------------------------------------
		});
		
		
		
		
		$('#need_date_start').datetimepicker({
            timeFormat: "HH:mm",
            dateFormat: "yy-mm-dd"
        });
		
		$('#need_date_end').datetimepicker({
            timeFormat: "HH:mm",
            dateFormat: "yy-mm-dd"
        });
		
	});
</script>

</head>

<body >

	<div id="container">

		<%@ include file="/banner.jsp"%>
		<%@ include file="/menuPart.jsp"%>

		<h2 id="listTit">您的位置>${strCategorize}申請</h2>
		
        <div id="listCon">
		<form:form id="myform" method="POST" commandName="userServiceResourceAccept">
		
			<form:errors path="*" cssClass="errorblock" element="div" />
			
			<a href="userServiceResourceAcceptList.htm?categorize=${strCategorizeID}" class="reIcon">回一覽表</a> | <a href="javascript:submitform()" class="adIcon">確定儲存</a>
			
			<div class="collapse-wrapper">
				<div class="header">
					<a href="#" class="collapse-toggle">${strCategorize}信息</a>
				</div>
				<div class="collapse-box">
					<table border='1' cellpadding="0" cellspacing="0" class="listTable" WIDTH="100%">
						<tr>
							<th WIDTH="30%">${strCategorize}項目：</th>
							<td WIDTH="70%">
							<form:select path="srdid">
								<form:options items="${srdLists}" />
							</form:select>
							<form:errors path="srdid" cssClass="error" /></td>
						</tr>
						<tr>
							<th>聯絡人：</th>
							<td><form:input path="contacts" size="80" />&nbsp;
							<form:errors path="contacts" cssClass="error" /></td>
						</tr>
						<tr>
							<th>聯絡電話：</th>
							<td><form:input path="tel" size="80" />&nbsp;
							<form:errors path="tel" cssClass="error" /></td>
						</tr>
						<tr>
							<th>需求期間：</th>
							<td><form:input path="need_date_start" size="35" />&nbsp;
							<form:errors path="need_date_start" cssClass="error" />-
							<form:input path="need_date_end" size="35" />&nbsp;
							<form:errors path="need_date_end" cssClass="error" /></td>
						</tr>
						<tr>
							<th>備註：</th>
							<td><form:input path="remarks" size="80" />&nbsp;
							<form:errors path="remarks" cssClass="error" /></td>
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
