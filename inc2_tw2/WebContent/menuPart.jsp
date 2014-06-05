<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>


<link rel='stylesheet' type='text/css' href='pkg/cssmenu/styles.css' />
<!-- <script -->
<!-- 	src='http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js'></script> -->
<script type='text/javascript' src='pkg/cssmenu/menu_jquery.js'></script>

<style type="text/css">
#cssmenu {
	/* 	position: absolute; */
	float: right;
	height: 60px;
	/*background: #aef0ff;*/
/* 	width: 900px; */
	background: transparent;
	/* 	top: 70px; */
	/* 	left: 0px; */
	
}

#cssmenu ul {
	list-style: none;
	padding: 0;
	margin: 0;
	line-height: 1;
	/* 	-webkit-box-shadow: 5px 5px 5px 0px rgba(0, 0, 0, 0.75); */
	/* 	-moz-box-shadow: 5px 5px 5px 0px rgba(0, 0, 0, 0.75); */
	/* 	box-shadow: 5px 5px 5px 0px rgba(0, 0, 0, 0.75); */
}

#cssmenu>ul {
	position: relative;
	display: block;
	/*background: #aef0ff;;*/
	height: 32px;
	/*width: 100%;*/
	z-index: 500;
	float: left;
	-webkit-box-shadow: 10px 10px 5px 0px rgba(0, 0, 0, 0.75);
	-moz-box-shadow: 10px 10px 5px 0px rgba(0, 0, 0, 0.75);
	box-shadow: 10px 10px 5px 0px rgba(0, 0, 0, 0.75);
}

#cssmenu>ul>li {
	display: block;
	position: relative;
	float: left;
	margin: 0;
	padding: 0;
	height: 60px;
	/*background-color: #DEBA9A;*/
	/* 	border-top: 5px solid transparent; */
}

#cssmenu ul li a {
	display: table;
	/*     font-family: Helvetica, sans-serif; */
	text-decoration: none;
}

#cssmenu>ul>li>a>span {
	display: table-cell;
	/*height: 100%;*/
	vertical-align: middle;
	/*background-color: #1bbc3f;*/
	padding: 10px;
	border-right: 1px solid white;
}

#cssmenu>ul>li:nth-child(1)>a {
	/*display:table-cell;*/
	/*height: 100%;*/
	/*vertical-align: middle;*/
	background-color: #289FFF;
	/*padding: 10px;*/
}

#cssmenu>ul>li:nth-child(2)>a {
	background-color: #2591E8;
}

#cssmenu>ul>li:nth-child(3)>a {
	background-color: #2181CF;
}

#cssmenu>ul>li:nth-child(4)>a {
	background-color: #1D73B8;
}

#cssmenu>ul>li:nth-child(5)>a {
	background-color: #19619C;
}

#cssmenu>ul>li:nth-child(6)>a {
	background-color: #155385;
}

#cssmenu>ul>li:nth-child(7)>a {
	background-color: #124873;
}

#cssmenu>ul>li:nth-child(8)>a {
	background-color: #0F395C;
}

#cssmenu>ul>li:nth-child(9)>a {
	background-color: #0B2B45;
}

#cssmenu>ul>li:nth-child(10)>a {
	background-color: #061624;
}

#cssmenu>ul>li:nth-child(7)>a>span {
	border-right: 1px solid #d6ea37;
}
</style>

<c:if test="${user.isStaff}">
	<!-- 	<div id="myslidemenu" class="jqueryslidemenu"> -->
	<div id='cssmenu'>
		<!-- 孵化器管理者 -->
		<ul>

			<!-- 待辦事項 -->


			<li><a href="todo.htm"><span><s:message
							code="menuPart.todo" text="待辦事項" /></span> </a></li>

			<!-- 進駐管理 -->


			<li class="has-sub"><a href="#"><span><s:message
							code="menuPart.movin.management" text="進駐管理" /> </span></a>
				<ul>

					<li><a href="compList_B.htm"><span><s:message
									code="menuPart.movin.apply" text="進駐申請" /> </span></a></li>

					<li><a href="reviewPaperList.htm"><span><s:message
									code="menuPart.movin.review" text="審查管理" /> </span></a></li>
					<li><a href="compWaitList_B.htm"><span><s:message
									code="menuPart.movin.check" text="待轉進駐" /> </span></a></li>
					<li><a href="compList.htm"><span><s:message
									code="menuPart.movin.business" text="進駐企業" /> </span></a></li>

				</ul></li>

			<!-- 輔導管理 -->
			<li class="has-sub"><a href="#"><span><s:message
							code="menuPart.consult.management" text="輔導管理" /></span> </a>
				<ul>
					<li><a href="talkNotesList.htm"><s:message
								code="menuPart.consult.all" text="所有輔導紀錄" /> </a></li>
					<li><a href="talkNotesMyListTeacher.htm"><s:message
								code="menuPart.consult.teacher" text="業師輔導紀錄" /> </a></li>
					<li><a href="talkNotesMyListAM.htm"><s:message
								code="menuPart.consult.AM" text="我的 AM 輔導紀錄" /> </a></li>
					<li><a href="talkNotesMyListPM.htm"><s:message
								code="menuPart.consult.PM" text="我的 PM 輔導紀錄" /> </a></li>
					<li><a href="talkNotesMyListOther.htm"><s:message
								code="menuPart.consult.other" text="我的其他輔導紀錄" /> </a></li>
				</ul></li>


			<!-- 活動管理 -->
			<li><a href="activityRecList.htm"><span><s:message
							code="menuPart.activity" text="活動管理" /> </span></a></li>


			<!-- 會議室登記 -->
			<li><a href="meetingRoomOrder.htm"><span><s:message
							code="meetingRoom.order" text="會議室登記" /></span> </a></li>


			<!-- 育成資源 -->
			<li class="has-sub"><a href="#"><span><s:message
							code="incubate.resource" text="育成資源" /> </span></a>
				<ul>
					<li><a href="teacherList.htm"><span><s:message
									code="incubate.resource.teacher" text="輔導業師" /> </span></a></li>
					<li><a href="reviewerList.htm"><span><s:message
									code="incubate.resource.reviewer" text="審查委員" /> </span></a></li>
					<li><a href="staffList.htm"><span><s:message
									code="incubate.resource.staff" text="中心人員" /> </span></a></li>
					<li><a href="outsourceList.htm"><span><s:message
									code="outsource.management" text="採購管理" /> </span></a></li>
					<li><a href="roomList.htm"><span><s:message
									code="room.management" text="培育間管理" /> </span></a></li>
					<li><a href="parkingLotList.htm"><span><s:message
									code="parkingCar.management" text="汽車停車位管理" /> </span></a></li>
					<li><a href="parkingLotBikeList.htm"><span><s:message
									code="parkingBike.management" text="機車停車位管理" /> </span></a></li>
					<li><a href="securityCardList.htm"><span><s:message
									code="securityCard.management" text="門禁卡管理" /> </span></a></li>
					<li><a href="meetingRoomList.htm"><span><s:message
									code="meetingRoom.management" text="會議室管理" /> </span></a></li>
				</ul></li>


			<%-- 			<li><a href="solrj_search.htm"><span><s:message --%>
			<%-- 							code="menuPart.solrj" text="加值服務" /> </span></a></li> --%>



			<!-- 系統設定 -->
			<li class="has-sub"><a href="#"><span><s:message
							code="menuPart.system.setting" text="系統設定" /> </span></a>
				<ul>
					<li><a href="administratorList.htm"><s:message
								code="menuPart.system.manager" text="系統管理者設定" /> </a></li>
					<li><a href="tagList.htm"><s:message code="menuPart.tag"
								text="Tag 設定" /> </a></li>
					<li><a href="changePwd.htm"><s:message
								code="menuPart.change.pwd" text="變更密碼" /> </a></li>
				</ul></li>

		</ul>


		<br class="clearit">
	</div>
</c:if>

<c:if test="${user.isBusiness}">
	<!-- 企業 -->
	<!-- 	<div id="myslidemenu" class="jqueryslidemenu"> -->
	<div id='cssmenu'>
		<ul>
			<li class="pic_a"></li>
			<li><a href="businessMain.htm"><span><s:message
							code="menuPart.s1" text="首頁" /></span></a></li>
			<li><a href="compDetailView.htm"><span><s:message
							code="menuPart.my.business.info" text="我的信息" /> </span></a></li>

			<li><a class="trigger" href="#"><span><s:message
							code="menuPart.service.apply" text="服務申請" /> </span></a>
				<ul>
					<li><a href="requestListTeacher.htm"><span><s:message
									code="menuPart.service.teacher" text="業師服務" /> </span></a></li>
					<li><a href="requestListAM.htm"><span><s:message
									code="menuPart.service.AM" text="AM 服務" /> </span></a></li>
					<li><a href="requestListPM.htm"><span><s:message
									code="menuPart.service.PM" text="PM 服務" /> </span></a></li>
				</ul></li>
			<li><a href="solrj_search.htm"><span><s:message
							code="menuPart.solrj" text="加值服務" /> </span></a></li>

			<li><a class="trigger" href="#"><span><s:message
							code="menuPart.system.setting" text="系統設定" /> </span></a>
				<ul>
					<li><a href="changePwd.htm"><span><s:message
									code="menuPart.change.pwd" text="變更密碼" /> </span></a></li>
				</ul></li>
			<li><a href="login.htm"><span><s:message
							code="menuPart.logout" text="登出" /> </span></a></li>
		</ul>
		<br class="clearit">
	</div>
</c:if>


<c:if test="${user.isAdmin}">
	<!-- 系統管理者 -->
	<!-- 	<div id="myslidemenu" class="jqueryslidemenu"> -->
	<div id='cssmenu'>
		<ul>

			<li><a href="login.htm"><span><s:message
							code="menuPart.logout" text="登出" /> </span></a></li>
		</ul>
		<br class="clearit">
	</div>
</c:if>
