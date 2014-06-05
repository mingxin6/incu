<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/include.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>會議室登記</title>

<link type="text/css" href="pkg/jquery/mu.css" rel="stylesheet" />
<link rel="stylesheet" href="css/list_sheet.css">

<link rel="stylesheet" href="css/mainstructure.css" />
<link rel="stylesheet" href="css/maincontent.css" />


<!-- jQuery -->
<script type="text/javascript" src="pkg/jquery/jquery-1.4.2.min.js"></script>
<script type="text/javascript"
	src="pkg/jquery/jquery-ui-1.8.6.custom.min.js"></script>

<!-- <script type="text/javascript" src="pkg/jquery/jquery-ui-1.10.3.custom.min.js"></script> -->

<script type="text/javascript" src="js/jquery-ui-timepicker-addon.js"></script>

<script type="text/javascript"
	src="pkg/fullcal/css/jquery-ui-timepicker-addon.js"></script>
<!-- <link type="text/css" href="pkg/jquery/jquery-ui.css" rel="stylesheet" /> -->
<!-- <script type="text/javascript" src="pkg/jquery/jquery.js"></script> -->
<!-- <script type="text/javascript" src="pkg/jquery/jquery.min_1.9.1.js"></script> -->
<!-- <script type="text/javascript" src="pkg/jquery/jquery-ui.js"></script> -->


<link rel="stylesheet" href="css/redmond/jquery-ui-1.8.1.custom.css" />

<!-- FullCalender -->
<link rel='stylesheet' type='text/css'
	href='pkg/fullcal/css/fullcalendar.css' />
<script type='text/javascript' src='pkg/fullcal/fullcalendar.js'></script>

<!-- Menu -->
<link href="pkg/menu/p7exp.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="pkg/menu/p7exp.js"></script>

<script type='text/javascript'>
	$(document).ready(function() {

		$("#start").timepicker({
			dateFormat : 'yy-mm-dd',
			timeFormat : 'hh:mm',
			hourMin : 0,
			hourMax : 24,
			hourGrid : 2,
			minuteGrid : 15
		});
		$("#end").timepicker({
			dateFormat : 'yy-mm-dd',
			timeFormat : 'hh:mm',
			hourMin : 0,
			hourMax : 24,
			hourGrid : 2,
			minuteGrid : 15
		});

		// 		$("#addhelper").hide();

		var date = new Date();
		var d = date.getDate();
		var m = date.getMonth();
		var y = date.getFullYear();

		var viewStart;
		var viewEnd;
		var myMeetingRoomNo = $('#meetingRoomSelect option').eq(0).val();

		var source = new Array();
		//source[0] = 'http://127.0.0.1:8082/fc/fcc?start=ppooo';
		source[0] = '/inc2_tw2/fcc?start=' + viewStart + '&end=' + viewEnd + '&meetingRoomNo=' + myMeetingRoomNo;

		var newSource = new Array();
		newSource[0] = source[0];

		//======================================================================
		$('#calendar').fullCalendar({

			eventSources : [ source[0] ],

			theme : true,

			header : {
				left : 'prev,next today',
				center : 'title',
				//right : 'month,agendaWeek,agendaDay'
				//right : 'month'
				right : ''
			},

			monthNames : [ "一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月" ],
			monthNamesShort : [ "一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月" ],
			dayNames : [ "周日", "周一", "周二", "周三", "周四", "周五", "周六" ],
			dayNamesShort : [ "周日", "周一", "周二", "周三", "周四", "周五", "周六" ],
			today : [ "今天" ],

			firstDay : 1,

			buttonText : {
				today : '本月',
				month : '月',
				week : '周',
				day : '日',
				prev : '上一月',
				next : '下一月'
			},

			//Triggered when the calendar loads 
			//and every time a different date-range is displayed.
			viewDisplay : function(view) {
				viewStart = $.fullCalendar.formatDate(view.start, "yyyy-MM-dd HH:mm:ss");
				//alert("viewStart＝"+viewStart);
				viewEnd = $.fullCalendar.formatDate(view.end, "yyyy-MM-dd HH:mm:ss");
			},

			editable : false,//判断该日程能否拖动
			//eventStartEditable : false,
			//eventDurationEditable : false;

			//Triggered when the user clicks on a day.
			dayClick : function(date, allDay, jsEvent, view) {
				var selectdate = $.fullCalendar.formatDate(date, "yyyy-MM-dd");//选择当前日期的时间转换

				//$("#end").datetimepicker('setDate', selectdate);//给时间空间赋值

				$("#reservebox").dialog({
					autoOpen : false,
					//height : 450,
					width : 400,
					title : '<s:message code="meeting.room.date" text="會議日期" />' + " : " + selectdate,
					modal : true,
					position : "center",
					draggable : true,
					beforeClose : function(event, ui) {
						//$.validationEngine.closePrompt("#meeting");
						//$.validationEngine.closePrompt("#start");
						//$.validationEngine.closePrompt("#end");
					},
					timeFormat : 'HH:mm{ - HH:mm}',

					buttons : {
						"儲存" : function() {
							var startdatestr = selectdate + " " + $("#start").val(); //开始时间
							var enddatestr = selectdate + " " + $("#end").val(); //结束时间
							var mytitle = $("#title").val(); //标题
							var myComp = $("#myComp").val(); //
							var myName = $("#myName").val(); //
							var myPhone = $("#myPhone").val(); //

							var id2;
							//var startdate = $.fullCalendar.parseDate(selectdate + "T" + startdatestr);//时间和日期拼接
							//var startdate = $.fullCalendar.parseDate(startdatestr);//时间和日期拼接
							//var enddate = $.fullCalendar.parseDate(enddatestr);
							var schdata = {
								title : mytitle,
								meetingRoomNo : myMeetingRoomNo,
								start : startdatestr,
								end : enddatestr,
								theComp : myComp,
								theName : myName,
								thePhone : myPhone
							};

							//將新數據存到後台
							$.ajax({
								type : "POST", //使用post方法访问后台
								url : "/inc2_tw2/nm",
								data : schdata, //要发送的数据
								success : function(data) {
									var ret = jQuery.parseJSON(data);
									if (ret.result == "AddOk") {
										//alert(ret.id);
										id2 = ret.id;
										var schdata2 = {
											title : mytitle,
											meetingRoomNo : myMeetingRoomNo,
											start : startdatestr,
											end : enddatestr,
											theComp : myComp,
											theName : myName,
											thePhone : myPhone,
											id : id2
										};
										$('#calendar').fullCalendar('renderEvent', schdata2, true);
									} else {
										alert(ret.msg);
									}

									//---------------------------
									$("#start").val(''); //开始时间
									$("#end").val(''); //结束时间
									$("#title").val(''); //标题
									$("#myComp").val('');
									$("#myName").val('');
									$("#myPhone").val('');
								}
							});

							$(this).dialog("close");
						},
						"關閉" : function() {
							$(this).dialog("close");
						}

					}
				});//reservebox dialog def ends

				$("#reservebox").dialog("open");
				return false;
			},

			//Triggered when the user clicks an event.
			eventClick : function(event) {
				
				
				
				var fstart = $.fullCalendar.formatDate(event.start, "HH:mm");
				var fend = $.fullCalendar.formatDate(event.end, "HH:mm");
				//  var schdata = { sid: event.sid, deleted: 1, uid: event.uid };
				var selectdate = $.fullCalendar.formatDate(event.start, "yyyy-MM-dd");

				

				if (event.myStatus == "PASSED") {//若是今天之前的event,不能刪除
					$("#titlexx").text(event.title);
					$("#startxx").text(fstart);
					$("#endxx").text(fend);
					$("#myCompxx").text(event.compName);
					$("#myNamexx").text(event.person);
					$("#myPhonexx").text(event.phone);
					$("#reserveInfoPassed").dialog({
						autoOpen : false,
						//height : 450,
						width : 400,
						title : '<s:message code="meeting.room.date" text="會議日期" />' + " : " + selectdate,
						modal : true,
						position : "center",
						draggable : true,
						beforeClose : function(event, ui) {
							$("#titlexx").text("");
							$("#startxx").text("");
							$("#endxx").text("");
							$("#myCompxx").text("");
							$("#myNamexx").text("");
							$("#myPhonexx").text("");
						},

						timeFormat : 'HH:mm{ - HH:mm}',

						buttons : {
							"關閉" : function() {
								$(this).dialog("close");
							}
						}
					});
					$("#reserveInfoPassed").dialog("open");
				} else {
					$("#titlex").text(event.title);
					$("#startx").text(fstart);
					$("#endx").text(fend);			
					$("#myCompx").text(event.compName);
					$("#myPhonex").text(event.phone);
					$("#reserveInfo").dialog({
						autoOpen : false,
						//height : 450,
						width : 400,
						title : '<s:message code="meeting.room.date" text="會議日期" />' + " : " + selectdate,
						modal : true,
						position : "center",
						draggable : true,
						beforeClose : function(event, ui) {
							$("#titlex").text("");
							$("#startx").text("");
							$("#endx").text("");
							$("#myCompx").text("");
							$("#myNamex").text("");
							$("#myPhonex").text("");
						},

						timeFormat : 'HH:mm{ - HH:mm}',

						buttons : {
							"删除" : function() {
								var aa = window.confirm("警告：确定要删除记录，删除后无法恢复！");
								if (aa) {
									var para = {
										id : event.id,
										name : $("#myNamex").val()
									};

									$.ajax({
										type : "POST",
										url : "/inc2_tw2/dm",
										data : para, //要发送的数据
										success : function(data) {
											var deleteStatus = jQuery.parseJSON(data);
											if (deleteStatus.result == "deleteOk") {
												$('#calendar').fullCalendar('removeEvents', event.id);
											} else {
												alert(deleteStatus.result);
											}
										}
									});
								}
								$(this).dialog("close");
							},

							"關閉" : function() {
								$(this).dialog("close");
							}
						}
					});

					$("#reserveInfo").dialog("open");
				}
				return false;
			},

			//Triggered when event fetching starts/stops
			loading : function(bool) {
				if (bool)
					$('#loading').show();
				else
					$('#loading').hide();
			},

			//Triggered after an event has been placed on the calendar in its final position.
			eventAfterRender : function(event, element, view) {
				var fstart = $.fullCalendar.formatDate(event.start, "HH:mm");
				var fend = $.fullCalendar.formatDate(event.end, "HH:mm");
				if (view.name == "month") {//按月份
					var evtcontent = '<div class="fc-event-vert"><a>';
					evtcontent = evtcontent + '<span class="fc-event-titlebg">' + fstart + " - " + fend + '</span>';
					//evtcontent = evtcontent + "<br>";
					//evtcontent = evtcontent + '<span class="fc-event-titlebg">' + event.title + '</span>';
					element.html(evtcontent);
				} else if (view.name == "agendaWeek") {//按周
					var evtcontent = '<a>';
					evtcontent = evtcontent + '<span class="fc-event-time">' + fstart + "-" + fend + '</span>';
					evtcontent = evtcontent + '<span>' + event.fullname + '</span>';
					element.html(evtcontent);
				} else if (view.name == "agendaDay") {//按日
					var evtcontent = '<a>';
					evtcontent = evtcontent + '<span class="fc-event-time">' + fstart + " - " + fend + '</span>';
					//evtcontent = evtcontent + '<span>Room: ' + event.confname + '</span>';
					//evtcontent = evtcontent + '<span>Host: ' + event.fullname + '</span>';
					//evtcontent = evtcontent + '<span>Topic: ' + event.topic + '</span>';
					//evtcontent = evtcontent + '</a><span class="ui-icon ui-icon-arrow-2-n-s"><div class="ui-resizable-handle ui-resizable-s"></div></span>';
					element.html(evtcontent);
				}
				//alert(event.id+","+event.compName);
				//alert(JSON.stringify(event));
			},

			//Triggered when the user mouses over an event.
			eventMouseover : function(calEvent, jsEvent, view) {
				var fstart = $.fullCalendar.formatDate(calEvent.start, "yyyy/MM/dd HH:mm");
				var fend = $.fullCalendar.formatDate(calEvent.end, "yyyy/MM/dd HH:mm");
				$(this).attr('title', fstart + " - " + fend + " " + "标题" + " : " + calEvent.title);
				$(this).css('font-weight', 'normal');
				$(this).tooltip({
					effect : 'toggle',
					cancelDefault : true
				});
			}

		//events: "http://www.cnblogs.com/sr/AccessDate.ashx"
		//events : []
		});

		//======================================================================

		//$("#calendar .fc-header-left table td:eq(0)").before('<td><div class="meetingRoomSelectDiv"><select id="meetingRoomSelect"><option value="M1" selected="selected">M1</option><option value="M2">M2</option><option value="M3">M3</option><option value="M4">M4</option></select></div></td>');

		//goto date function
		if ($.browser.msie) {
			$("#calendar .fc-header-right table td:eq(0)").before('<td><div class="ui-state-default ui-corner-left ui-corner-right" style="border-right:0px;padding:1px 3px 2px;" ><input type="text" id="selecteddate" size="10" style="padding:0px;"></div></td><td><div class="ui-state-default ui-corner-left ui-corner-right"><a><span id="selectdate" class="ui-icon ui-icon-search">goto</span></a></div></td><td><span class="fc-header-space"></span></td>');
		} else {
			$("#calendar .fc-header-right table td:eq(0)").before('<td><div class="ui-state-default ui-corner-left ui-corner-right" style="border-right:0px;padding:3px 2px 4px;" ><input type="text" id="selecteddate" size="10" style="padding:0px;"></div></td><td><div class="ui-state-default ui-corner-left ui-corner-right"><a><span id="selectdate" class="ui-icon ui-icon-search">goto</span></a></div></td><td><span class="fc-header-space"></span></td>');
		}

		$("#selecteddate").datepicker({
			dateFormat : 'yy-mm-dd',
			beforeShow : function(input, instant) {
				setTimeout(function() {
					$('#ui-datepicker-div').css("z-index", 15);
				}, 100);
			}
		});

		$("#selectdate").click(function() {
			var selectdstr = $("#selecteddate").val();
			var selectdate = $.fullCalendar.parseDate(selectdstr, "yyyy-mm-dd");
			$('#calendar').fullCalendar('gotoDate', selectdate.getFullYear(), selectdate.getMonth(), selectdate.getDate());
		});

		// conference function
		//$("#calendar .fc-header-left table td:eq(0)").before('<td><div class="ui-state-default ui-corner-left ui-corner-right" id="selectmeeting"><a><span id="selectdate" class="ui-icon ui-icon-search" style="float: left;padding-left: 5px; padding-top:1px"></span>meeting room</a></div></td><td><span class="fc-header-space"></span></td>');

		$('#meetingRoomSelect').change(function() {
			$("#calendar").fullCalendar('removeEvents');
			myMeetingRoomNo = $(this).attr('value');

			newSource[0] = '/inc2_tw2/fcc?start=' + viewStart + '&end=' + viewEnd + '&meetingRoomNo=' + myMeetingRoomNo;

			$('#calendar').fullCalendar('removeEventSource', source[0]);
			//$('#calendar').fullCalendar('refetchEvents');

			$('#calendar').fullCalendar('addEventSource', newSource[0]);
			//$('#calendar').fullCalendar('refetchEvents');

			source[0] = newSource[0];
		});

	});
</script>


<style type='text/css'>
.rowElem span {
	text-align: left;
}

.ui-widget input {
	border: solid;
}

.ui-datepicker {
	width: 23em;
	padding: .2em .2em 0;
	font-size: 70%;
	display: none;
}

#calendar {
	width: 960px;
	margin: 0 auto;
}

#loading {
	top: 0px;
	right: 0px;
}

.tooltip {
	padding-bottom: 25px;
	padding-left: 25px;
	width: 100px !important;
	padding-right: 25px;
	display: none;
	background: #999;
	height: 70px;
	color: red;
	font-size: 12px;
	padding-top: 25px;
	z-order: 10;
}

.ui-timepicker-div .ui-widget-header {
	margin-bottom: 8px;
}

.ui-timepicker-div dl {
	text-align: left;
}

.ui-timepicker-div dl dt {
	height: 25px;
	margin-bottom: -25px;
}

.ui-timepicker-div dl dd {
	margin: 0 10px 10px 65px;
}

.ui-timepicker-div td {
	font-size: 90%;
}

.ui-tpicker-grid-label {
	background: none;
	border: none;
	margin: 0;
	padding: 0;
}

.ui-timepicker-rtl {
	direction: rtl;
}

.ui-timepicker-rtl dl {
	text-align: right;
}

.ui-timepicker-rtl dl dd {
	margin: 0 65px 10px 10px;
}
</style>
</head>
<body>
	<div id="container">

		<%@ include file="/banner2.jsp"%>
		<%@ include file="/menuPart.jsp"%>

		<h2 id="listTit">
			<span><s:message code="meetingRoom.order" text="會議室登記" /></span>
		</h2>


		<div id="wrap">

			<div class="meetingRoomSelectDiv">
				<select id="meetingRoomSelect">
					<c:forEach items="${meetingRooms}" var="mr">
						<option value="${mr.meetingRoomNo}">${mr.meetingRoomNo}</option>
					</c:forEach>
				</select>
			</div>

			<br>

			<div id='calendar'></div>
			<div id="reserveinfo" title="Details">
				<div id="revtitle"></div>
				<div id="revdesc"></div>
			</div>
			<div style="display: none" id="reservebox"
				title="Reserve meeting room">
				<form id="reserveformID" method="post">
					<div class="sysdesc">&nbsp;</div>
					<div class="rowElem">
						<label> 标题:</label> <input id="title" name="start">
					</div>
					<div class="rowElem">
						<label> 开始时间:</label> <input id="start" name="start">
					</div>
					<div class="rowElem">
						<label> 结束时间:</label> <input id="end" name="end">
					</div>
					<div class="rowElem">
						<label> 公司:</label> <input id="myComp" name="myComp">
					</div>
					<div class="rowElem">
						<label> 姓名:</label> <input id="myName" name="myName">
					</div>
					<div class="rowElem">
						<label> 聯繫電話:</label> <input id="myPhone" name="myPhone">
					</div>
					<!-- 					<div id="addhelper" class="ui-widget"> -->
					<!-- 						<div -->
					<!-- 							style="padding-bottom: 5px; padding-left: 5px; padding-right: 5px; padding-top: 5px" -->
					<!-- 							class="ui-state-error ui-corner-all"> -->
					<!-- 							<div id="addresult"></div> -->
					<!-- 						</div> -->
					<!-- 					</div> -->
				</form>
			</div>

			<div style="display: none" id="reserveInfo"
				title="Reserve meeting room Info">
				<div class="sysdesc">&nbsp;</div>
				<div class="rowElem">
					<label> 标题:</label> <span id="titlex">
				</div>
				<div class="rowElem">
					<label> 开始时间:</label> <span id="startx">
				</div>
				<div class="rowElem">
					<label> 结束时间:</label> <span id="endx">
				</div>
				<div class="rowElem">
					<label> 公司:</label> <span id="myCompx">
				</div>
				<div class="rowElem">
					<label> 姓名:</label> <input id="myNamex">
				</div>
				<div class="rowElem">
					<label> 聯繫電話:</label> <span id="myPhonex">
				</div>
			</div>
		</div>

		<div style="display: none" id="reserveInfoPassed"
			title="Reserve meeting room Info">
			<div class="sysdesc">&nbsp;</div>
			<div class="rowElem">
				<label> 标题:</label> <span id="titlexx">
			</div>
			<div class="rowElem">
				<label> 开始时间:</label> <span id="startxx">
			</div>
			<div class="rowElem">
				<label> 结束时间:</label> <span id="endxx">
			</div>
			<div class="rowElem">
				<label> 公司:</label> <span id="myCompxx">
			</div>
			<div class="rowElem">
				<label> 姓名:</label> <span id="myNamexx">
			</div>
			<div class="rowElem">
				<label> 聯繫電話:</label> <span id="myPhonexx">
			</div>
		</div>
	</div>

	</div>
	<!--container ends here--><%@ include file="/footer.jsp"%>
</body>
</html>