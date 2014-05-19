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
				上傳文件
			</h2>


			<form enctype="multipart/form-data"
				action="<c:url value="uploadsAdd.htm" />"
				method="post">
				<input type="file" name="file1" />
				<input type="hidden" name="alais" />
				<br />
			
				<input type="submit" value="上傳" />
			</form>




		</div>
<%@ include file="/footer.jsp"%>
	</body>
</html> 
