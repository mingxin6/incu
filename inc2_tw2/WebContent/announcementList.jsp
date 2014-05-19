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


		<h2 id="listTit">您的位置><span>活動管理</span></h2>
		
        <div id="listCon">
            <c:if test="${user.userAuth.managerMenu}">
                <a href="announcementAdd.htm" class="noticeBtn">新 增 活 動</a>
            </c:if>
            
            <c:if test="${IsShow}">
                
                    <table width="1228" height="122" border="1" cellpadding="0" cellspacing="0" class="temTable">
                        <tr>
                            <th align="center">編號</th>
                            <th align="center">標題</th>
                            
                            <!-- 
                            <td align="center">公告類型</td>
                            <td align="center">發佈人</td>
                           -->
                            
                            <th align="center">時間</td>
                            
                            <!-- 
                            <c:if test="${user.userAuth.managerMenu}">
                            <th align="center">公告狀態</th>
                            <th align="center" colspan="4">管理</th>
                            </c:if>
                             -->
                        </tr>
    
                        <c:forEach items="${announcementList}" var="obj">
                            <tr>
                                <td align="center">${obj.seq}</td>
                                <td align="left"><a
                                    href="announcementView.htm?aid=${obj.aid}">${obj.title}</a></td>
                                <!-- 
                                <td align="center">${obj.type}</td>
                                
                                <td align="center">${obj.createName}</td>
                               -->
                                <td align="center">${obj.createDate}</td>
                                <!-- 
                                <c:if test="${user.userAuth.managerMenu}">
                                    <td align="center">${obj.status}</td>
                                    <td align="center"><a
                                    href="announcementEdit.htm?aid=${obj.aid}" class="editBtn">修改</a></td>
                                </c:if>
                                 -->
                            </tr>
                        </c:forEach>
                    </table>
            </c:if>
            
            <c:if test="${!IsShow}">
                <table border=0>
                    <tr>
                        <td align="center">暫無公告</td>
                    </tr>
                </table>
            </c:if>
        </div>
	</div>
	<!--container ends here--><%@ include file="/footer.jsp"%>
</body>
</html>
