<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link type="text/css" href="pkg/jquery/mu.css" rel="stylesheet" />
		<script type="text/javascript" src="pkg/jquery/jquery.js"></script>
		<script type="text/javascript" src="pkg/jquery/jQuery.autoCollapser.js"></script>

		<link href="pkg/menu/p7exp.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="pkg/menu/p7exp.js"></script>

		<script type="text/javascript" charset="utf-8" src="editor_config.js"></script>
		<script type="text/javascript" charset="utf-8" src="editor_all.js"></script>


		<style type="text/css">
.clear {
	clear: both;
}
</style>
	</head>

	<body >

		<div id="container">

			<%@ include file="/banner.jsp"%>
			<%@ include file="/menuPart.jsp"%>

			<h2>
				下載檔案 
			</h2>
			<table border=1>
			<tr>
				<td align="center" width="4%">編號</td>
				<td align="center" width="10%">檔案名</td>
				<td align="center" width="20%">操作</td>
			</tr>

		
			
			<c:forEach items="${uplist}" var="comp">
				<tr>
					<td align="center">${comp.id}</td>
					<td align="center"><span style="font-size: 16">${comp.fileName}</span></td>
					<td align="center"><span style="font-size: 16"><a href="downLoads.htm?sName=${comp.storeName}">下載</a></span></td>
				</tr>
			</c:forEach>
		</table>
		</div>
	</body>
</html>
