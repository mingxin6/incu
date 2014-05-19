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
	
	<div id="container">
		
		<%@ include file="/banner2.jsp"%>
		<%@ include file="/menuPart.jsp"%>

		<h2 id="listTit">您的位置>活動/通知><span>交流活動設定</span></h2>
		
        <div id="listCon">
            <a href="activityEdit.htm" class="addCom">新 增 交 流 活 動</a>
    
          <table width="1228" height="123" border="1" cellpadding="0" cellspacing="0" class="temTable">
                    <tr>
                        <th width="60" height="31" align="center">編號</th>
                        <th width="160" align="center">主題</th>
                        <th width="170" align="center">主辦方</th>
                        <th width="100" align="center">講師</th>
                        <th width="130" align="center">講師介紹</th>
                        <th width="100" align="center">備註</th>
                        <th align="center" colspan="3">管理</th>
                    
                    </tr>
                <c:if test="${IsShow}">
                    <c:forEach items="${activityList}" var="obj">
                        <tr>
                            <td align="center">${obj.seq}</td>
                            <td align="center">${obj.theme}</td>
                            <td align="center">${obj.sponsor}</td>
                            <td align="center">${obj.lecturer}</td>
                            <td align="center">${obj.lecturerintro}</td>
                            <td align="center">${obj.remarks}</td>
                            
                            <td width="100" align="center"><a href="activityEdit.htm?aid=${obj.aid}" class="btnEdit">修 改</a></td>
                            <td width="140" align="center"><a href="actVisitorAdd.htm?actid=${obj.aid}" class="btnInformation">管理來賓資訊</a></td>
                            <td width="140" align="center"><a href="filedownload.htm?action=${obj.theme}&type=a_${obj.aid}" class="btnDownload">相關資料下載</a></td>
                            
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
	<!--container ends here-->
</body>
</html>
