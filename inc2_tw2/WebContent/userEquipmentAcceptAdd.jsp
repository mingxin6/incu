<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" href="pkg/jquery/mu.css" rel="stylesheet" />
<script type="text/javascript" src="pkg/jquery/jquery.js"></script>
<script type="text/javascript" src="pkg/jquery/jQuery.autoCollapser.js"></script>

<link href="pkg/menu/p7exp.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="pkg/menu/p7exp.js"></script>

<script type="text/javascript">

	function submitform() {
s		$('#myform').submit();
	}
</script>

</head>

<body >

	<div id="container">

		<%@ include file="/banner.jsp"%>
		<%@ include file="/menuPart.jsp"%>

		<h2>新增設備申請</h2>

		<form:form id="myform" method="POST" commandName="equipmentAccept">
		
			<form:errors path="*" cssClass="errorblock" element="div" />
			
			<a href="javascript:submitform()">儲存返回</a>
			<br>
			<br>
			
			<div class="collapse-wrapper">
				<div class="header">
					<a href="#" class="collapse-toggle">租借設備申請</a>
				</div>
				<div class="collapse-box">
				
					<table border='1' WIDTH="100%">
						<tr>
							<td>設備：</td>
							<td><form:select path="edid">
								<form:options items="${edLists}" />
							</form:select>
							<form:errors path="edid" cssClass="error" /></td>
						</tr>
						<tr>
							<td>聯絡人：</td>
							<td><form:input path="contacts" size="80" />&nbsp;
							<form:errors path="contacts" cssClass="error" />
							</td>
						</tr>
						<tr>
							<td>聯絡電話：</td>
							<td><form:input path="tel" size="80" />&nbsp;
							<form:errors path="tel" cssClass="error" /></td>
						</tr>
						<tr>
							<td>需求期間：</td>
							<td><form:input path="need_date_start" size="35" />&nbsp;
							<form:errors path="need_date_start" cssClass="error" />-
							<form:input path="need_date_end" size="35" />&nbsp;
							<form:errors path="need_date_end" cssClass="error" /></td>
						</tr>
						<tr>
							<td>備註：</td>
							<td><form:input path="remarks" size="80" />&nbsp;
							<form:errors path="remarks" cssClass="error" /></td>
						</tr>

					</table>
				</div>
			</div>
			
		</form:form>
	<div id="container1">			<table border=1>
				<tr>
					<td align="center">編號</td>
					<td align="center">名稱</td>
					<td align="center">申請日期</td>
					<td align="center">需求期間</td>
					<td align="center">聯絡人</td>
					<td align="center">聯絡電話</td>
					<td align="center">狀態</td>
					<td align="center">備註</td>
					<td align="center">動作</td>
				</tr>
<c:if test="${IsShow}">
				<c:forEach items="${equipmentAcceptList}" var="obj">
					<tr>
						<td align="center">${obj.seq}</td>
						<td align="center">${obj.ed_name}</td>
						<td align="center">${obj.create_date}</td>
						<td align="center">${obj.need_date_start}-${obj.need_date_end}</td>
						<td align="center">${obj.contacts}</td>
						<td align="center">${obj.tel}</td>
						<td align="center">
							<c:if test="${obj.accept_status==0}">等待審核</c:if>
							<c:if test="${obj.accept_status==1}"><font color=green>申請通過</font></c:if>
							<c:if test="${obj.accept_status==2}"><font color=red>申請失敗</font></c:if>
							<c:if test="${obj.accept_status==3}"><font color=red>已刪除</font></c:if>
						</td>
						<td align="center">${obj.remarks}</td>
						<td align="center"><a href="userEquipmentAcceptAdd.htm?eaid=${obj.eaid}&categorize=-1">[修改]</a></td>
					</tr>
				</c:forEach>
</c:if>
<c:if test="${!IsShow}">
			<tr>
				<td align="center" colspan="9">暫無相關申請</td>
			</tr>
</c:if>
			</table>

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
	<!--container ends here--><%@ include file="/footer.jsp"%>

</body>
</html> 
