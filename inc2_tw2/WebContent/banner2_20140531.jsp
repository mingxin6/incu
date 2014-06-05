<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>


<c:set var="name"
	value="org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE" />
<c:set var="mylang" value="${sessionScope[name]}" />

<div
	style="width: 100%; height: 17px; background: url(images/topbg.png) repeat-x; margin-top: 8px;"></div>

<table width="1000" border="0" cellpadding="0" border="0"
	style="margin: 20px auto 0;">
	<tr>
		<td width="239" align="left"><c:choose>
				<c:when test="${mylang=='zh_TW'}">
					<img src="images/nsi_header.png" height="70">
				</c:when>
				<c:when test="${mylang=='zh_CN'}">
					<img src="images/logo_CN2.png" height="70">
				</c:when>
				<c:otherwise>
					<img src="images/nsi_header.png" height="70">
				</c:otherwise>
			</c:choose></td>
		<td>&nbsp;</td>
	</tr>
</table>

<div id="banner">
	<div id="userinfo">

		<c:set var="forward.request_uri"
			value="${requestScope['javax.servlet.forward.request_uri']}" />


		<c:if test="${empty pageContext.request.queryString}">
			<a href="?language=zh_TW">繁體</a>|<a href="?language=zh_CN">简体</a>
		</c:if>



		<c:if test="${not empty pageContext.request.queryString}">
			<c:if
				test="${ fn:contains(pageContext.request.queryString, 'language=')}">

				<c:set var="qString"
					value="${fn:substring(pageContext.request.queryString, 0, fn:indexOf(pageContext.request.queryString, 'language='))}" />

				<c:if test="${empty qString}">
					<a href="?language=zh_TW">繁體</a>|<a href="?language=zh_CN">简体</a>
				</c:if>


				<c:if test="${not empty qString}">
					<c:set var="qString"
						value="${fn:substring(pageContext.request.queryString, 0, fn:indexOf(pageContext.request.queryString, '&language='))}" />
					<a href="${forward.request_uri}?${qString}&language=zh_TW">繁體</a>|	<a
						href="${forward.request_uri}?${qString}&language=zh_CN">简体</a>
				</c:if>
			</c:if>


			<c:if
				test="${not fn:contains(pageContext.request.queryString, 'language=')}">
				<a
					href="${forward.request_uri}?${pageContext.request.queryString}&language=zh_TW">繁體</a>|
				<a
					href="${forward.request_uri}?${pageContext.request.queryString}&language=zh_CN">简体</a>
			</c:if>

		</c:if>

		<%--
		<h3>
			welcome.springmvc :
			<s:message code="welcome.springmvc" text="default text" />
		</h3>

		Current Locale : ${pageContext.response.locale} 
		--%>

		<br> 您好, ${user.userName}
		<c:if test="${user.userComp!=user.userName}">
			<br />${user.userComp}
		</c:if>




	</div>
	<br class="clearit">


	<%-- 

		<%@ page
      errorPage="ErrorPage.jsp"
      import="java.io.*"
      import="java.util.*"
%>
		<%
   Enumeration enames;
   Map map;
   String title;

   // Print the request headers

   map = new TreeMap();
   enames = request.getHeaderNames();
   while (enames.hasMoreElements()) {
      String name = (String) enames.nextElement();
      String value = request.getHeader(name);
      map.put(name, value);
   }
   out.println(createTable(map, "Request Headers"));

   // Print the session attributes

   map = new TreeMap();
   enames = session.getAttributeNames();
   while (enames.hasMoreElements()) {
      String name = (String) enames.nextElement();
      String value = "" + session.getAttribute(name);
      map.put(name, value);
   }
   out.println(createTable(map, "Session Attributes"));

%>



<%!
   private static String createTable(Map map, String title)
   {
      StringBuffer sb = new StringBuffer();

      // Generate the header lines

      sb.append("<table border='1' cellpadding='3'>");
      sb.append("<tr>");
      sb.append("<th colspan='2'>");
      sb.append(title);
      sb.append("</th>");
      sb.append("</tr>");

      // Generate the table rows

      Iterator imap = map.entrySet().iterator();
      while (imap.hasNext()) {
         Map.Entry entry = (Map.Entry) imap.next();
         String key = (String) entry.getKey();
         String value = (String) entry.getValue();
         sb.append("<tr>");
         sb.append("<td>");
         sb.append(key);
         sb.append("</td>");
         sb.append("<td>");
         sb.append(value);
         sb.append("</td>");
         sb.append("</tr>");
      }

      // Generate the footer lines

      sb.append("</table><p></p>");

      // Return the generated HTML

      return sb.toString();
   }
%>
--%>

</div>

<script type='text/javascript'>
	$(document).ready(function() {
		var tempheight = $("#container").height();
		if (tempheight < 680) {
			$("#container").height(400 + tempheight);

		}
	});
</script>