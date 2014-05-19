<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" href="pkg/jquery/mu.css" rel="stylesheet" />
<link rel="stylesheet" href="css/listsheet.css" />
<script type="text/javascript" src="pkg/jquery/jquery.js"></script>
<script type="text/javascript" src="pkg/jquery/jQuery.autoCollapser.js"></script>

<link href="pkg/menu/p7exp.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="pkg/menu/p7exp.js"></script>


</head>

<body >

	<div id="container">

		<%@ include file="/banner.jsp"%>

		<%@ include file="/menuPart.jsp"%>
		
		
		
		<h2 id="listTit">您的位置>${compName}>洽談記錄表</h2>
		
        <div id="listCon">
        
		<a href="compList_B.htm" class="reIcon">回 一 覽 表</a> 
        
        <a href="TalkNotesAdd_B.htm?compName=${compName}&compId=${compId}" class="adIcon">添 加</a> 
		
        
			<table width="1228" height="122" border="1" cellpadding="0" cellspacing="0" class="temTable">
			<tr>
				<th align="center" width="4%">編號</th>
				<th align="center" width="10%">主題</th>
				<th align="center" width="10%">內容</th>
				<th align="center" width="13%">時間</th>
				<th align="center" width="10%">地址</th>
				<th align="center" width="13%">我方人員</th>
				<th align="center" width="13%">客戶人員</th>
				
			</tr>

		


			<c:forEach items="${tnlist}" var="comp">
				<tr>
					<td align="center">${comp.seq}</td>
					<td align="center"><span style="font-size: 16"><a
							href="TalkNotesView_B.htm?compName=${compName}&compId=${compId}&noteId=${comp.talkNoteId}">${comp.talkTheme}</a></span></td>
					<td align="left"><span style="font-size: 16">${comp.talkContent}</span></td>
					<td align="center"><span style="font-size: 16">${comp.talkDateTime}</span></td>
					<td align="center"><span style="font-size: 16">${comp.talkAddress}</span></td>
					<td align="center"><span style="font-size: 16">${comp.myPersonincharge}</span></td>
					<td align="center"><span style="font-size: 16">${comp.otherPersonincharge}</span></td>
					
				</tr>
			</c:forEach>
		</table>
      </div>
	</div><%@ include file="/footer.jsp"%>
</body>
</html> 
