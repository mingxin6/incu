<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link type="text/css" href="pkg/jquery/mu.css" rel="stylesheet" />
		<link rel="stylesheet" href="css/listsheet.css" />
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

			<div id="listCon">
				<ul class="detail">
				  <li><s:message code="compnew.contractid"  text="合約編號" /><br>${comp.contractNumber}</li>
				  <li>AM<br>${comp.amName}</li>
				  <li>PM<br>${comp.pmName}</li>
				</ul>
				<ul class="detail">
				  <li><s:message code="compnew.contractbetween"  text="合約期間" /><br><s:message code="compnew.contractb"  text="起" />${comp.contractStartDate2}<br><s:message code="compnew.contracte"  text="迄" />${comp.contractEndDate2}</li>
				  <li><a href="requestListAM.htm">AM申請</a><br>共${teachercnt}件<br>進行中${teachercnt2}件</li>
				  <li><a href="requestListPM.htm">PM申請</a><br>共${amcnt}件<br>進行中${amcnt2}件</li>
				  <li><a href="requestListTeacher.htm">業師申請</a><br>共${pmcnt }件<br>進行中${pmcnt2 }件</li>
				</ul>
				<ul class="detail">
				  <li><s:message code="compnew.compwebsite"  text="企業網址" /><br><a href="${comp.compWebURL}" target="_blank">${comp.compWebURL}</a></li>
				  <li><s:message code="compdetailview.room"  text="進駐培育間" /><br>${comp.room}</li>
				  <li><s:message code="compnew.deposit2"  text="施工保證金" /><br>${comp.bond}</li>
				  <li><s:message code="compnew.deposit"  text="押金" /><br>${comp.deposit}</li>
				</ul>
				<ul class="detail">
				  <li><s:message code="compdetailview.area"  text="簽約坪數" /><br>${comp.roomArea}</li>
				  <li><s:message code="parking.no" text="停車位號碼" /><br>${parkinglot}</li>
				  <li><s:message code="parking.bike.no" text="機車停車位號碼" /><br>${parkinglotbike}</li>
				  <li><s:message code="securiycard.no" text="門禁卡號碼" /><br>${securitycard}</li>
				</ul>
			</div>
		</div>
		<!--container ends here--><%@ include file="/footer.jsp"%>
	</body>
</html>
