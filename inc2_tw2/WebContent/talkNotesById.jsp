<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link type="text/css" href="pkg/jquery/mu.css" rel="stylesheet" />
		<link rel="stylesheet" href="css/listsheet.css" />
		<script type="text/javascript" src="pkg/jquery/jquery.js">
</script>
		<script type="text/javascript"
			src="pkg/jquery/jQuery.autoCollapser.js">
</script>

		<link href="pkg/menu/p7exp.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="pkg/menu/p7exp.js">
</script>


	</head>

	<body>

		<div
			style="width: 100%; height: 17px; background: url(images/topbg.png) repeat-x; margin-top: 8px;"></div>
		<div id="container">
			<table width="1000" border="0" cellpadding="0" border="0"
				style="margin: 20px auto 0;">
				<tr>
					<td width="239" align="left">
						<img src="images/nsi_header.png" height="70">
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
			</table>
			<%@ include file="/banner.jsp"%>
			<%@ include file="/menuPart.jsp"%>



			<h2 id="listTit">
				您的位置> ${compName}>輔導記錄
			</h2>

			<div id="listCon">
				<a href="compList.htm" class="reIcon">回一覽表</a> |
				<a href="TalkNotesAdd.htm?compName=${compName}&compId=${compId}"
					class="adIcon">添加</a>
				<table width="1228" height="122" border="1" cellpadding="0"
					cellspacing="0" class="temTable">
					<tr>
						<th align="center" width="4%">
							編號
						</th>
						<th align="center" width="10%">
							主題
						</th>



						<th align="center" width="13%">
							時間
						</th>

						<!-- 
                    <th align="center" width="10%">地址</th>
                    <th align="center" width="13%">我方人員</th>
                    <th align="center" width="13%">客戶人員</th>
                    -->

					</tr>




					<c:forEach items="${tnlist}" var="comp">
						<tr>
							<td align="center">
								${comp.seq}
							</td>
							<td align="left">
								<span style="font-size: 16"><a
									href="TalkNotesView.htm?compName=${compName}&compId=${compId}&noteId=${comp.talkNoteId}">${comp.talkTheme}</a>
								</span>
							</td>

							<td align="left">
								<span style="font-size: 16">${comp.talkDateTime}</span>
							</td>
							<!-- 
                        <td align="center"><span style="font-size: 16">${comp.talkAddress}</span></td>
                        <td align="center"><span style="font-size: 16">${comp.myPersonincharge}</span></td>
                        <td align="center"><span style="font-size: 16">${comp.otherPersonincharge}</span></td>
    -->
						</tr>
					</c:forEach>
				</table>
			</div>
		</div><%@ include file="/footer.jsp"%>
	</body>
</html>
