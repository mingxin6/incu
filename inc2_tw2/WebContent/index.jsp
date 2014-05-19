<%@ include file="/include.jsp"%>



<c:set var="language" value="${pageContext.request.locale.language}"
	scope="session" />
<c:set var="country" value="${pageContext.request.locale.country}"
	scope="session" />
<c:set var="myLocal" value="${pageContext.request.locale}"
	scope="session" />


<c:if test="${myLocal == 'zh_TW'}">
	<c:redirect url="/login.htm" />
</c:if>

<c:if test="${myLocal == 'zh_CN'}">
	<c:redirect url="/login_CN2.htm" />
</c:if>


