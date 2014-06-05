<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>

<c:set var="name"
	value="org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE" />
<c:set var="mylang" value="${sessionScope[name]}" />


<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
}

.bannerWrapper {
	position: left;
	width: 1280px;
	margin: 0 auto;
	width: 1280px;
}

.main-b-bg {
	background-image: url(images_jellyfish/bg2.jpg);
	background-repeat: no-repeat;
	/*width: 1280px;*/
	height: 260px;
	position: relative;
}

.bannertop {
	height: 70px;
}

.bannertoplogo {
	/* float: right; */
	position: absolute;
	top: 50px;
	left: 110px;
	z-index: 99;
}
</style>

<style type="text/css">
.mybreadcrumb {
	position: absolute;
	bottom: 0px;
	right: 0px;
	/* 	background-color: black; */
	/*background-color:#23FFF7;*/
}

.mybreadcrumb table td {
	padding-right: 10px;
	vertical-align: middle;
	font-family: DFKai-SB;
	font-size: 16px;
	color: rgb(255, 224, 221);
	/* 	font-weight:bold; */
}
</style>

<div class="bannertoplogo">
	<c:choose>
		<c:when test="${mylang=='zh_TW'}">
			<img src="images/nsi_header.png" height="100">
		</c:when>
		<c:when test="${mylang=='zh_CN'}">
			<img src="images/logo_CN2.png" height="100">
		</c:when>
		<c:otherwise>
			<img src="images/nsi_header.png" height="100">
		</c:otherwise>
	</c:choose>
</div>
<div class="clear"></div>

<div class="bannerWrapper">
	<div class="main-b-bg">

		<div class="mybreadcrumb">
			<table>
				<tr>
					<td>您好, ${user.userName} <c:if
							test="${user.userComp!=user.userName}">
							<br />${user.userComp}</c:if></td>
					<td>
						<!-- 					<img src="images_mu/here_white.png" height="21px" /> -->
						<span style="font-family: arial;">@</span>
					</td>
					<td><script type='text/javascript'>
						document.write(document.title);
					</script></td>
				</tr>
			</table>
		</div>






		<%@ include file="/menuPart.jsp"%>
	</div>
</div>





<script type='text/javascript'>
	$(document).ready(function() {
		var tempheight = $(".contentdiv").height();
		if (tempheight < 680) {
			$(".contentdiv").height(400 + tempheight);

		}
	});
</script>



