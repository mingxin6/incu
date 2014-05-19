<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link type="text/css" href="pkg/jquery/mu.css" rel="stylesheet" />
		<link rel="stylesheet" href="css/list_sheet.css">
		<script type="text/javascript" src="pkg/jquery/jquery.js">
</script>
		<link href="pkg/menu/p7exp.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="pkg/menu/p7exp.js">
</script>

	</head>

	<body>

		<div id="container">

			<%@ include file="/banner2.jsp"%>
			<%@ include file="/menuPart.jsp"%>


			<h2 id="listTit">
				<span><s:message code="menuPart.todo" text="待辦事項" />
				</span>
			</h2>

			<div id="listCon">
				<ul>
					<li>
						<a href="reviewPaperList.htm?tab1=true""><s:message
								code="todo.wait.review" arguments="${acceptedCompanies}"
								htmlEscape="false" text="等待審查的企業" /> </a>
					</li>
					<li>
						<a href="reviewPaperList.htm?tab2=true"><s:message
								code="todo.review.not.closed" arguments="${unFinishedReview}"
								htmlEscape="false" text="尚未結案的審查案" /> </a>
					</li>
					<li>
						<a href="compWaitList_B.htm"><s:message
								code="todo.wait.transfer" arguments="${waitTransferList}"
								htmlEscape="false" text="審查通過, 待進駐的企業" /> </a>
					</li>
					<li>
						<a href="talkNotesMyListAM.htm"><s:message
								code="todo.unFinished.AM" arguments="${unFinishedAM}"
								htmlEscape="false" text="尚未結案的 AM 申請" /> </a>
					</li>
					<li>
						<a href="talkNotesMyListPM.htm"><s:message
								code="todo.unFinished.PM" arguments="${unFinishedPM}"
								htmlEscape="false" text="尚未結案的 PM 申請" /> </a>
					</li>
					<li>
						<a href="talkNotesMyListTeacher.htm"><s:message
								code="todo.unFinished.Teacher" arguments="${unFinishedTeacher}"
								htmlEscape="false" text="尚未結案的業師申請" /> </a>
					</li>
				</ul>
			</div>

		</div>
		<!--container ends here--><%@ include file="/footer.jsp"%>
	</body>
</html>
