    <%@ page language="java" contentType="text/html; charset=UTF-8"
             pageEncoding="UTF-8" %>
        <%@ include  file="/include.jsp" %>

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

        <%@ include file="/banner2.jsp" %>
        <%@ include file="/menuPart.jsp" %>


        <h2 id="listTit">
        <span>會員名錄</span>
        </h2>

        <div id="listCon">

        <c:if test="${user.isStaff}">
        <a href="memberAdd.htm" class="addBtn">新 增會員</a>
        </c:if>


        <table width="90%" border=1 class="listTable" cellpadding="0"
        cellspacing="0">
        <tr>
        <th align="center" width="35%">
        公司名稱
        </th>
        <th align="center" width="15%">
        姓名
        </th>
        <th align="center" width="20%">
        郵箱
        </th>
        <th align="center" width="20%">
        電話
        </th>
        <%--
                                <th align="center" width="20%">
                                    職稱
                                </th>
                                --%>
        <th align="center" width="10%">
        狀態
        </th>
        </tr>

        <c:forEach items="${memberList}" var="member">
        <tr>
        <td align="left">
        <span style="font-size: 14">${member.unit}</span>
        </td>

        <td align="left">
        <span style="font-size: 14"><a
        href="memberView.htm?uid=${member.uid}">${member.name}</a> </span>
        </td>

        <td align="left">
        <span style="font-size: 14">${member.email}</span>
        </td>

        <td align="left">
        <span style="font-size: 14">${member.phone}</span>
        </td>

        <%--

                                    <td align="left">
                                        <span style="font-size: 14">${member.title}</span>
                                    </td>
                                    --%>

        <td align="left">
        <span style="font-size: 14">${member.status}</span>
        </td>
        </tr>

        </c:forEach>
        </table>

        </div>

        </div>
        <!--container ends here-->
        <%@ include file="/footer.jsp" %>
        </body>
        </html>
