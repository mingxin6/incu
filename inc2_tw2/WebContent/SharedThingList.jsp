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

		<c:if test="${type=='doc'}">
			<h2 id="listTit">您的位置>園區資訊><span>檔共用</span></h2>
		</c:if>

		<c:if test="${type=='form'}">
			<h2 id="listTit">您的位置>園區資訊><span>業務表單</span></h2>
		</c:if>

		<c:if test="${type=='equipment'}">
			<h2 id="listTit">您的位置>園區資訊><span>設備共用</span></h2>
		</c:if>
		<div id="listCon">
        
            <c:if test="${user.userAuth.managerMenu}">
                <a href="SharedThingAdd.htm?type=${type}"class="addIcon">添&nbsp;&nbsp;&nbsp;&nbsp;加</a>
            </c:if>
    
            <c:if test="${IsShow}">
    
                <table width="1228" height="122" border="1" cellpadding="0" cellspacing="0" class="temTable">
                    <tr>
                        <th align="center">編號</th>
                        <th align="center">標題</th>
                        <th align="center">發佈時間</th>
    
                        <c:if test="${user.userAuth.managerMenu}">
                            <th align="center">狀態</th>
                            <th align="center" colspan="4">管理</th>
                        </c:if>
    
                    </tr>
    
                    <c:forEach items="${sharedThingList}" var="obj">
                        <tr>
                            <td align="center">${obj.seq}</td>
                            <td align="left"><a
                                href="SharedThingView.htm?type=${type}&aid=${obj.aid}">${obj.title}</a></td>
    
                            <td align="center">${obj.createDate}</td>
    
                            <c:if test="${user.userAuth.managerMenu}">
                                <td align="center">${obj.status}</td>
                                <td align="center"><a
                                    href="SharedThingEdit.htm?type=${type}&aid=${obj.aid}" class="editBtn">修改</a></td>
                            </c:if>
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
