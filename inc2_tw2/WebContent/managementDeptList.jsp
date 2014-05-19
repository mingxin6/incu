<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" href="pkg/jquery/mu.css" rel="stylesheet" />
<link rel="stylesheet" href="css/listsheet.css" />
<script type="text/javascript" src="pkg/jquery/jquery.js"></script>
<link href="pkg/menu/p7exp.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="pkg/menu/p7exp.js"></script>

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

		<h2 id="listTit">您的位置>園區資訊><span>部門資訊設定</span></h2>
		<div id="listCon">
			<a href="managementDeptAdd.htm" class="addBtn">新 增 部 門</a>
		
			<table width="1228" height="122" border="1" cellpadding="0" cellspacing="0" class="temTable">
				<tr>
					<th align="center">編號</th>
					<th align="center">部門</th>
					<th align="center">主要職責</th>
					<th align="center">連絡人</th>
					<th align="center">聯繫電話</th>
					<th align="center">管理</th>
				
				</tr>
			<c:if test="${IsShow}">
				<c:forEach items="${managementDeptList}" var="obj">
					<tr>
						<td align="center">${obj.seq}</td>
						<td align="left">${obj.department}</td>
						<td align="left">${obj.duty}</td>
						<td align="center">${obj.contacts}</td>
						<td align="center">${obj.tel}</td>
						<td align="center"><a href="managementDeptEdit.htm?mdid=${obj.mdid}" class="editBtn">修改</a></td>
					
					</tr>
				</c:forEach>
</c:if>
<c:if test="${!IsShow}">
			<tr>
				<td align="center" colspan="6">暫無部門資訊</td>
			</tr>
</c:if>
			</table>

		</div>
    </div>
	<!--container ends here--><%@ include file="/footer.jsp"%>
</body>
</html> 
