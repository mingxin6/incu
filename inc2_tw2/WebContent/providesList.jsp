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


		<h2 id="listTit">您的位置>園區資訊><span>園區管理規定</span></h2>
        
	    <div id="listCon">
        
            <c:if test="${user.userAuth.managerMenu}">
                <a href="providesAdd.htm" class="rulesBtn">發 佈 規 定</a>
    
            </c:if>
				<table width="1228" height="122" border="1" cellpadding="0" cellspacing="0" class="temTable">
					<tr>
						<th align="center">編號</th>
						<th align="center">標題</th>
						<!-- 
						<td align="center">內容</td>
						-->
						<th align="center">發佈時間</th>
						<!-- 
						<td align="center">發佈人</td>
						-->
						
						<c:if test="${user.userAuth.managerMenu}">
						<th align="center" colspan="4">管理</th>
						</c:if>
					</tr>

					<c:forEach items="${prolist}" var="obj">
						<tr>
							<td align="center">${obj.id}</td>
							<td align="left">
							<a href="providesView.htm?aid=${obj.id}">${obj.theme}</a></td>
							
							<!-- 
							<td align="left">${obj.content}</td>
							-->
							<td align="center">${obj.times}</td>
							
							<!-- 
							<td align="center">${obj.announcePerson}</td>
							-->
							<c:if test="${user.userAuth.managerMenu}">
								<td align="center"><a
								href="providesEdit.htm?aid=${obj.id}" class="editBtn">修改</a></td>
							</c:if>
						</tr>
					</c:forEach>
				</table>
    	    </div>
	</div>
	<!--container ends here--><%@ include file="/footer.jsp"%>
</body>
</html> 
