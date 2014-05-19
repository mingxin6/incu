<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" href="pkg/jquery/mu.css" rel="stylesheet" />
<link rel="stylesheet" href="css/listsheet.css" />

<link type="text/css" href="pkg/jquery/jquery-ui.css" rel="stylesheet" />
<!-- 
<script type="text/javascript" src="pkg/jquery/jquery.js"></script>
-->
<script type='text/javascript' src='pkg/fc/jquery/jquery-1.10.2.min.js'></script>
 <!--
<script type="text/javascript" src="pkg/jquery/jquery.min_1.9.1.js"></script>
-->
<script type="text/javascript" src="pkg/jquery/jquery-ui.js"></script>

<!--=== full calendar picker===-->
  <link rel='stylesheet' type='text/css' href='pkg/fc/fullcalendar/fullcalendar.css' />

<script type='text/javascript' src='pkg/fc/jquery/jquery-ui-1.10.3.custom.min.js'></script>
<script type='text/javascript' src='pkg/fc/fullcalendar/fullcalendar.min.js'></script>

<!--=== date time picker===-->
		<link href="pkg/jquery/jquery-ui-timepicker-addon.css" type="text/css" />
        <link href="pkg/jquery/demos.css" rel="stylesheet" type="text/css" />
        <script src="pkg/jquery/jquery-ui-timepicker-addon.js" type="text/javascript"></script>
        <!--中文-->
        <script src="pkg/jquery/jquery.ui.datepicker-zh-CN.js" type="text/javascript" ></script>
        <script src="pkg/jquery/jquery-ui-timepicker-zh-CN.js" type="text/javascript"></script>
  
<!--=== Collapser ===-->
<script type="text/javascript" src="pkg/jquery/jQuery.autoCollapser.js"></script>

<!--=== menu ===-->
<link href="pkg/menu/p7exp.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="pkg/menu/p7exp.js"></script>


<script type="text/javascript">
	function submitform() {
		
		//$("form").submit(function () {

		    // var matchStr = $('#matchStartDate').val() + ' ' +$('#matchStartTime').val();
		     //$('#MatchStartTime').val(matchStr);

		    // return true;
		  //});
		
		var form = document.getElementById("myform");
		form.submit();
	}
</script>

<script type='text/javascript' >
	
function getFullCalendar(tempSrdid) {
	$('#calendar').show();
    // page is now ready, initialize the calendar...
	 $('#calendar').fullCalendar( 'destroy' );
    $('#calendar').fullCalendar({
			header: { 
                left: 'prev,next today', 
                center: 'title', 
                right:''
            }, 
             editable: false,
              allDayDefault: false,
              height: 450,
            monthNames: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],   
            monthNamesShort: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],   
            dayNames: ["周日", "週一", "週二", "週三", "週四", "週五", "週六"],   
            dayNamesShort: ["周日", "週一", "週二", "週三", "週四", "週五", "週六"],   
            today: ["今天"],   
            //firstDay: 1,   
            buttonText:{ 
                prev:     '＜上一月', 
                next:     '下一月＞', 
                prevYear: '去年', 
                nextYear: '明年', 
                today:    '今天'
               
                }, 
					 
            currentTimezone: 'Asia/Beijing',
			eventSources: [
	
					// your event source
					{
						url: '/inc2/GetFullCalendar',
						type: 'POST',
						data: {
							srdid: tempSrdid
						},
						error: function() {
							alert('there was an error while fetching events!');
						},
						color: '#338fcc',   // a non-ajax option
						textColor: '#000000' // a non-ajax option
					}
	
		],
		eventRender: function(event, element) {
	        	
	           element.html("<div class=\"fc-event-inner\"   >"+event.eventText+"</div>");
	        
	        
	    }
	   
        // put your options and callbacks here
    });

}

</script>


<script>
	$(document).ready(function() {
	
		
        
        
		$("#srcdescmain").hide();
		
		$('#srdid').change(function(event) {
			
			$("#srcdescmain").show();
			
			var $srcid = $("select#srdid").val();
			getFullCalendar($srcid);
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
	            }
	  
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

		<h2 id="listTit">您的位置>${strCategorize}申請</h2>
		
        <div id="listCon">
		<form:form id="myform" method="POST"
			commandName="userServiceResourceAccept">

			<form:errors path="*" cssClass="errorblock" element="div" />

			<a
				href="userServiceResourceAcceptList.htm?categorize=${strCategorizeID}" class="reIcon">回一覽表</a> | <a
				href="javascript:submitform()" class="adIcon">確定儲存</a>

			<div class="collapse-wrapper">
				<div class="header">
					<a href="#" class="collapse-toggle">${strCategorize}信息</a>
				</div>
				<div class="collapse-box">
					<table border='1' cellpadding="0" cellspacing="0" class="listTable" WIDTH="100%">



						<!-- 一般服務專案選單 -->
						<tr>
							<th WIDTH="30%"><span class="tipneed">*</span>${strCategorize}項目：</th>
							<td WIDTH="70%"><form:select path="srdid">
									<form:options items="${srdLists}" />
								</form:select> <form:errors path="srdid" cssClass="error" /></td>
						</tr>








						<!-- 申請人信息 -->
						<tr>
							<th><span class="tipneed">*</span>聯絡人：</th>
							<td><form:input path="contacts" size="80" />&nbsp; <form:errors
									path="contacts" cssClass="error" /></td>
						</tr>
						<tr>
							<th><span class="tipneed">*</span>聯絡電話：</th>
							<td><form:input path="tel" size="80" />&nbsp; <form:errors
									path="tel" cssClass="error" /></td>
						</tr>
						<tr>
							<th><span class="tipneed">*</span>需求期間：</th>
							<td><span style="position: relative; z-index: 200;"><form:input path="need_date_start" size="35" /></span>&nbsp; 
							<form:errors
									path="need_date_start" cssClass="error" />
									
									- <span style="position: relative; z-index: 200;"><form:input
									path="need_date_end" size="35" /></span>&nbsp; 
									<form:errors
									path="need_date_end" cssClass="error" />
									
									
									</td>
						</tr>
						<tr>
							<th>備註：</th>
							<td><form:input path="remarks" size="80" />&nbsp; <form:errors
									path="remarks" cssClass="error" /></td>
						</tr>
					</table>
					
					

					<table id="srcdescmain" border='1' WIDTH="100%" style="margin:20px 0px" >
						<tr><td WIDTH="30%">具體資訊：</td><td WIDTH="70%">使用狀況：</td></tr>
						
						<tr><td id="srcdesc"></td><td ><div style="width:680px;margin:10px 60px; font:12px/20px arial,sans-serif;" id="calendar"> </div></td></tr>
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
