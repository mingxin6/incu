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

		<h2 id="listTit">您的位置>系統設定>服務資料設定><span>${strCategorize}設定</span></h2>
        
		<div id="listCon">
            <a href="serviceResourceDataAdd.htm?categorize=${strCategorizeID}" class="addIcon">新增${strCategorize}</a>
    
                <table width="1228" height="122" border="1" cellpadding="0" cellspacing="0" class="temTable">
                    <tr>
                        <th width="5%" align="center">編號</th>
                        <th  width="20%" align="center">名稱</th>
                        
                        <!-- 
                        <td align="center">收費訊息</td>
                        -->
                        
                        <th  width="5%" align="center">狀態</th>
                        <th  width="60%" align="center">備註</th>
                        <th  width="10%" align="center" colspan="4">管理</th>
                        
                    </tr>
    <c:if test="${IsShow}">
                    <c:forEach items="${serviceResourceDataList}" var="obj">
                        <tr>
                            <td align="center">${obj.seq}</td>
                            <td align="center">${obj.name}</td>
                            <!-- 
                            <td align="center">${obj.money}</td>-->
                            <td align="center">${obj.status}</td>
                            <td align="left">${obj.remarks}</td>
                            <td align="center"><a href="serviceResourceDataEdit.htm?srdid=${obj.srdid}" class="editBtn">修改</a></td>
                        </tr>
                    </c:forEach>
    </c:if>
    <c:if test="${!IsShow}">
                <tr>
                    <td align="center" colspan="6">暫無${strCategorize}</td>
                </tr>
    </c:if>
                </table>
		</div>
	</div>
	<!--container ends here--><%@ include file="/footer.jsp"%>
</body>
</html> 