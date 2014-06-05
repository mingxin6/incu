<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>

<div class="hellodiv">
	<table>
		<tr>
			<td><a href="adminMain.htm"><img src="images_mu/home.png"
					height="30px"
					title='<s:message
							code="menuPart.s1" text="首頁" />' /></a></td>
			<td><c:set var="forward.request_uri"
					value="${requestScope['javax.servlet.forward.request_uri']}" /> <c:if
					test="${empty pageContext.request.queryString}">
					<a href="?language=zh_TW">繁體</a>|<a href="?language=zh_CN">简体</a>
				</c:if> <c:if test="${not empty pageContext.request.queryString}">
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
				
				
<%-- 				<br /> 您好, ${user.userName} <c:if --%>
<%-- 					test="${user.userComp!=user.userName}"> --%>
<%-- 					<br />${user.userComp} --%>
<%-- 		</c:if> --%>
		
		</td>

			<td><a href="login.htm"><img src="images_mu/exit.png"
					height="20px"
					title='<s:message
							code="menuPart.logout" text="登出" />' /></a></td>
		</tr>
	</table>
</div>