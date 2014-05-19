﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link type="text/css" href="pkg/jquery/mu.css" rel="stylesheet" />
		<link rel="stylesheet" href="css/listsheet.css" />
		<script type="text/javascript" src="pkg/jquery/jquery.js">
</script>


		<link href="pkg/menu/p7exp.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="pkg/menu/p7exp.js">
</script>


		<!--以下js是切换3F/4F/5F的平面图-->
		<script type="text/javascript" src="pkg/jquery/jquery-1.10.2.min.js">
</script>

		<script type="text/javascript">
$(function() {
	$('.conWrap h2 .button li').mouseover(
			function(e) {
				$(this).addClass('current').siblings().removeClass();
				$('.conWrap .pict li').eq($(this).index()).addClass('current')
						.siblings().removeClass();
				$('.conWrap h2 .beizhu li').eq($(this).index()).addClass(
						'current').siblings().removeClass();
			});
	$('.conWrap table p').hover(
			function() {

				$(this).attr(
						"title",
						$(this).html().replace("<br>", "合约起讫:").replace("<br>",
								"-"));
				//$(this).style.width="";
			}, function() {

				//$(this).style.width="48px";		
		});

})
</script>


		<style>
#threeF table tr td { /*background-color:rgba(255,0,255,0.5);*/
	/*border: 1px solid red;*/
	border-collapse: collapse;
	padding: 15 0 0 0;
	text-align: center;
	vertical-align: top;
	height: 120px;
}
</style>


	</head>

	<body>

		<div id="container">


			<%@ include file="/banner2.jsp"%>

			<%@ include file="/menuPart.jsp"%>
			<div class="conWrap">
				<h2>
					<ul class="button">
						<li class="current">
							3F
						</li>
						<li>
							4F
						</li>
						<li>
							5F
						</li>
						<!--<span class="current"><p>3F</p><p style="font-size: 16px;">${floorMap['3F'].remark}</p></span>
                <span><p>4F</p><p style="font-size: 16px;">${floorMap['4F'].remark}</p></span>
                <span><p>5F</p><p style="font-size: 16px;">${floorMap['5F'].remark}</p></span>-->
					</ul>
					<ol class="beizhu">
						<li class="current">
							${floorMap['3F'].remark}
						</li>
						<li>
							${floorMap['4F'].remark}
						</li>
						<li>
							${floorMap['5F'].remark}
						</li>
					</ol>
				</h2>

				<ul class="pict">
					<li class="current" id="threeF">
						<table width="1000" border="0" class="floorTB"
							style="margin-top: 10px;">
							<tr align="center" valign="bottom">
								<td width="80" height="30" class="odd">

									<a href="compDetailView.htm?compID=${compMap['316'].uid}"
										target="blank">${compMap['316'].compShortName}</a>
								</td>
								<td width="66" class="even">

									<a href="compDetailView.htm?compID=${compMap['315'].uid}"
										target="blank">${compMap['315'].compShortName}</a>
								</td>
								<td width="66">

									<a href="compDetailView.htm?compID=${compMap['314'].uid}"
										target="blank">${compMap['314'].compShortName}</a>
								</td>
								<td width="66">

									<a href="compDetailView.htm?compID=${compMap['313'].uid}"
										target="blank">${compMap['313'].compShortName}</a>
								</td>
								<td width="66">

									<a href="compDetailView.htm?compID=${compMap['312'].uid}"
										target="blank">${compMap['312'].compShortName}</a>
								</td>
								<td width="82">

									<a href="compDetailView.htm?compID=${compMap['311'].uid}"
										target="blank">${compMap['311'].compShortName}</a>
								</td>
								<td width="158">
									&nbsp;

								</td>
								<td width="80">

									<a href="compDetailView.htm?compID=${compMap['321'].uid}"
										target="blank">${compMap['321'].compShortName}</a>
								</td>
								<td width="66">

									<a href="compDetailView.htm?compID=${compMap['389'].uid}"
										target="blank">${compMap['389'].compShortName}</a>
								</td>
								<td width="66">

									<a href="compDetailView.htm?compID=${compMap['322'].uid}"
										target="blank">${compMap['322'].compShortName}</a>
								</td>
								<td width="72">

									<a href="compDetailView.htm?compID=${compMap['323'].uid}"
										target="blank">${compMap['323'].compShortName}</a>
								</td>
								<td width="58">

									<a href="compDetailView.htm?compID=${compMap['324'].uid}"
										target="blank">${compMap['324'].compShortName}</a>
								</td>
								<td width="80">

									<a href="compDetailView.htm?compID=${compMap['325'].uid}"
										target="blank">${compMap['325'].compShortName}</a>
								</td>
							</tr>

							<%-- 
							<tr align="center" valign="bottom">
								<td height="30">
									${compMap['316'].roomArea}坪
								</td>
								<td>
									${compMap['315'].roomArea}坪
								</td>
								<td>
									${compMap['314'].roomArea}坪
								</td>
								<td>
									${compMap['313'].roomArea}坪
								</td>
								<td>
									${compMap['312'].roomArea}坪
								</td>
								<td>
									${compMap['311'].roomArea}坪
								</td>
								<td>
									&nbsp;
								</td>
								<td>
									${compMap['321'].roomArea}坪
								</td>
								<td>
									${compMap['389'].roomArea}坪
								</td>
								<td>
									${compMap['322'].roomArea}坪
								</td>
								<td>
									${compMap['323'].roomArea}坪
								</td>
								<td>
									${compMap['324'].roomArea}坪
								</td>
								<td>
									${compMap['325'].roomArea}坪
								</td>
							</tr>
							<tr align="center" valign="bottom">
								<td height="28">
									&nbsp;
								</td>
								<td>
									&nbsp;
								</td>
								<td>
									&nbsp;
								</td>
								<td width="59">
									&nbsp;
								</td>
								<td width="64">
									&nbsp;
								</td>
								<td>
									&nbsp;
								</td>
								<td>
									&nbsp;
								</td>
								<td>
									&nbsp;
								</td>
								<td>
									&nbsp;
								</td>
								<td>
									&nbsp;
								</td>
								<td>
									&nbsp;
								</td>
								<td>
									&nbsp;
								</td>
								<td width="60">
									&nbsp;
								</td>
								<td width="1">
									&nbsp;
								</td>
								<td width="5">
									&nbsp;
								</td>
							</tr>
							<tr align="center" valign="bottom">
								<td height="30">
									<p>
										<br />
										${compMap['316'].contractStartDate}
										<br />
										${compMap['316'].contractEndDate}
									</p>
								</td>
								<td>
									<p>
										<br />
										${compMap['315'].contractStartDate}
										<br />
										${compMap['315'].contractEndDate}
									</p>
								</td>
								<td>
									<p>
										<br />
										${compMap['314'].contractStartDate}
										<br />
										${compMap['314'].contractEndDate}
									</p>
								</td>
								<td>
									<p>
										<br />
										${compMap['313'].contractStartDate}
										<br />
										${compMap['313'].contractEndDate}
									</p>
								</td>
								<td>
									<p>
										<br />
										${compMap['312'].contractStartDate}
										<br />
										${compMap['312'].contractEndDate}
									</p>
								</td>
								<td>
									<p>
										<br />
										${compMap['311'].contractStartDate}
										<br />
										${compMap['311'].contractEndDate}
									</p>
								</td>
								<td>
									&nbsp;
								</td>
								<td>
									<p>
										<br />
										${compMap['321'].contractStartDate}
										<br />
										${compMap['321'].contractEndDate}
									</p>
								</td>
								<td>
									<p>
										<br />
										${compMap['389'].contractStartDate}
										<br />
										${compMap['389'].contractEndDate}
									</p>
								</td>
								<td>
									<p>
										<br />
										${compMap['322'].contractStartDate}
										<br />
										${compMap['322'].contractEndDate}
									</p>
								</td>
								<td>
									<p>
										<br />
										${compMap['323'].contractStartDate}
										<br />
										${compMap['323'].contractEndDate}
									</p>
								</td>
								<td>
									<p>
										<br />
										${compMap['324'].contractStartDate}
										<br />
										${compMap['324'].contractEndDate}
									</p>
								</td>
								<td>
									<p>
										<br />
										${compMap['325'].contractStartDate}
										<br />
										${compMap['325'].contractEndDate}
									</p>
								</td>

							</tr>
							--%>
						</table>

						<table width="1000" border="0"
							style="margin-top: 40px; font-size: 9px;" class="floorTB">
							<tr align="center" valign="bottom" height="30">
								<td width="46">

									<a href="compDetailView.htm?compID=${compMap['338'].uid}"
										target="blank">${compMap['338'].compShortName}</a>
								</td>
								<td width="50">

									<a href="compDetailView.htm?compID=${compMap['337'].uid}"
										target="blank">${compMap['337'].compShortName}</a>
								</td>
								<td width="60">

									<a href="compDetailView.htm?compID=${compMap['336'].uid}"
										target="blank">${compMap['336'].compShortName}</a>
								</td>
								<td width="60">

									<a href="compDetailView.htm?compID=${compMap['335'].uid}"
										target="blank">${compMap['335'].compShortName}</a>
								</td>
								<td width="46">

									<a href="compDetailView.htm?compID=${compMap['334'].uid}"
										target="blank">${compMap['334'].compShortName}</a>
								</td>
								<td width="84">

									<a href="compDetailView.htm?compID=${compMap['333'].uid}"
										target="blank">${compMap['333'].compShortName}</a>
								</td>
								<td width="48">
									${compMap['331'].compShortName}
									<br>
									<br>
									<br>
									${compMap['332'].compShortName}
								</td>
								<td width="36">
									${compMap['330'].compShortName}
								</td>
								<td width="160">
									&nbsp;
								</td>
								<td width="36">
									${compMap['340'].compShortName}
								</td>
								<td width="60">
									${compMap['341'].compShortName}
									<br>
									<br>
									<br>
									${compMap['342'].compShortName}
								</td>
								<td width="70">

									<a href="compDetailView.htm?compID=${compMap['343'].uid}"
										target="blank">${compMap['343'].compShortName}</a>
								</td>
								<td width="56">

									<a href="compDetailView.htm?compID=${compMap['388'].uid}"
										target="blank">${compMap['388'].compShortName}</a>
								</td>
								<td width="56">

									<a href="compDetailView.htm?compID=${compMap['345'].uid}"
										target="blank">${compMap['345'].compShortName}</a>
								</td>
								<td width="56">

									<a href="compDetailView.htm?compID=${compMap['346'].uid}"
										target="blank">${compMap['346'].compShortName}</a>
								</td>
								<td width="56">

									<a href="compDetailView.htm?compID=${compMap['347'].uid}"
										target="blank">${compMap['347'].compShortName}</a>
								</td>
								<td width="46">

									<a href="compDetailView.htm?compID=${compMap['348'].uid}"
										target="blank">${compMap['348'].compShortName}</a>
								</td>
							</tr>
							<%-- 
							<tr>
								<td height="20">
									${compMap['338'].roomArea}坪
								</td>
								<td>
									${compMap['337'].roomArea}坪
								</td>
								<td>
									${compMap['336'].roomArea}坪
								</td>
								<td>
									${compMap['335'].roomArea}坪
								</td>
								<td>
									${compMap['334'].roomArea}坪
								</td>
								<td>
									${compMap['333'].roomArea}坪
								</td>
								<td>
									&nbsp;
								</td>
								<td>
									${compMap['343'].roomArea}坪
								</td>
								<td>
									${compMap['388'].roomArea}坪
								</td>
								<td>
									${compMap['345'].roomArea}坪
								</td>
								<td>
									${compMap['346'].roomArea}坪
								</td>
								<td>
									${compMap['347'].roomArea}坪
								</td>
								<td>
									${compMap['348'].roomArea}坪
								</td>
							</tr>
							<tr>
								<td height="70">
									<p>
										<br />
										${compMap['338'].contractStartDate}
										<br />
										${compMap['338'].contractEndDate}
									</p>
								</td>
								<td>
									<p>
										<br />
										${compMap['337'].contractStartDate}
										<br />
										${compMap['337'].contractEndDate}
									</p>
								</td>
								<td>
									<p>
										<br />
										${compMap['336'].contractStartDate}
										<br />
										${compMap['336'].contractEndDate}
									</p>
								</td>
								<td>
									<p>
										<br />
										${compMap['335'].contractStartDate}
										<br />
										${compMap['335'].contractEndDate}
									</p>
								</td>
								<td>
									<p>
										<br />
										${compMap['334'].contractStartDate}
										<br />
										${compMap['334'].contractEndDate}
									</p>
								</td>
								<td>
									<p>
										<br />
										${compMap['333'].contractStartDate}
										<br />
										${compMap['333'].contractEndDate}
									</p>
								</td>
								<td>
									&nbsp;
								</td>
								<td>
									<p>
										<br />
										${compMap['343'].contractStartDate}
										<br />
										${compMap['343'].contractEndDate}
									</p>
								</td>
								<td>
									<p>
										<br />
										${compMap['388'].contractStartDate}
										<br />
										${compMap['388'].contractEndDate}
									</p>
								</td>
								<td>
									<p>
										<br />
										${compMap['345'].contractStartDate}
										<br />
										${compMap['345'].contractEndDate}
									</p>
								</td>
								<td>
									<p>
										<br />
										${compMap['346'].contractStartDate}
										<br />
										${compMap['346'].contractEndDate}
									</p>
								</td>
								<td>
									<p>
										<br />
										${compMap['347'].contractStartDate}
										<br />
										${compMap['347'].contractEndDate}
									</p>
								</td>
								<td>
									<p>
										<br />
										${compMap['348'].contractStartDate}
										<br />
										${compMap['348'].contractEndDate}
									</p>
								</td>
							</tr>
							--%>
						</table>

						<table width="1000" border="0" style="margin-top: 20px;"
							class="floorTB">
							<tr>
								<td width="101" height="29" align="center" valign="middle">

									<a href="compDetailView.htm?compID=${compMap['354'].uid}"
										target="blank">${compMap['354'].compShortName}</a>
								</td>
								<td width="103" align="center" valign="middle">

									<a href="compDetailView.htm?compID=${compMap['353'].uid}"
										target="blank">${compMap['353'].compShortName}</a>
								</td>
								<td width="100" align="center" valign="middle">

									<a href="compDetailView.htm?compID=${compMap['352'].uid}"
										target="blank">${compMap['352'].compShortName}</a>
								</td>
								<td width="80" align="center" valign="middle">

									<a href="compDetailView.htm?compID=${compMap['351'].uid}"
										target="blank">${compMap['351'].compShortName}</a>
								</td>
								<td width="36" align="center" valign="middle">
									${compMap['350'].compShortName}
								</td>
								<td width="140" align="center" valign="middle">
									&nbsp;
								</td>
								<td width="36" align="center" valign="middle">
									${compMap['360'].compShortName}
								</td>
								<td width="84" align="center" valign="middle">

									<a href="compDetailView.htm?compID=${compMap['361'].uid}"
										target="blank">${compMap['361'].compShortName}</a>
								</td>
								<td width="100" align="center" valign="middle">

									<a href="compDetailView.htm?compID=${compMap['362'].uid}"
										target="blank">${compMap['362'].compShortName}</a>
								</td>
								<td width="99" align="center" valign="middle">

									<a href="compDetailView.htm?compID=${compMap['363'].uid}"
										target="blank">${compMap['363'].compShortName}</a>
								</td>
								<td width="100" align="center" valign="middle">

									<a href="compDetailView.htm?compID=${compMap['364'].uid}"
										target="blank">${compMap['364'].compShortName}</a>
								</td>
							</tr>
							<%-- 
							<tr>
								<td height="18" align="center" valign="middle">
									${compMap['354'].roomArea}坪
								</td>
								<td align="center" valign="middle">
									${compMap['353'].roomArea}坪
								</td>
								<td align="center" valign="middle">
									${compMap['352'].roomArea}坪
								</td>
								<td align="center" valign="middle">
									${compMap['351'].roomArea}坪
								</td>
								<td align="center" valign="middle">
									&nbsp;
								</td>
								<td align="center" valign="middle">
									${compMap['361'].roomArea}坪
								</td>
								<td align="center" valign="middle">
									${compMap['362'].roomArea}坪
								</td>
								<td align="center" valign="middle">
									${compMap['363'].roomArea}坪
								</td>
								<td align="center" valign="middle">
									${compMap['364'].roomArea}坪
								</td>
							</tr>
							<tr>
								<td align="center" valign="middle">
									<p>
										&nbsp;
									</p>
									<p>
										&nbsp;
									</p>
									<p>
										<br />
										${compMap['354'].contractStartDate}
										<br />
										${compMap['354'].contractEndDate}
									</p>
								</td>
								<td align="center" valign="middle">
									<p>
										&nbsp;
									</p>
									<p>
										&nbsp;
									</p>
									<p>
										<br />
										${compMap['353'].contractStartDate}
										<br />
										${compMap['353'].contractEndDate}
									</p>
								</td>
								<td align="center" valign="middle">
									<p>
										&nbsp;
									</p>
									<p>
										&nbsp;
									</p>
									<p>
										<br />
										${compMap['352'].contractStartDate}
										<br />
										${compMap['352'].contractEndDate}
									</p>
								</td>
								<td align="center" valign="middle">
									<p>
										&nbsp;
									</p>
									<p>
										&nbsp;
									</p>
									<p>
										<br />
										${compMap['351'].contractStartDate}
										<br />
										${compMap['351'].contractEndDate}
									</p>
								</td>
								<td align="center" valign="middle">
									&nbsp;
								</td>

								<td align="center" valign="middle">
									<p>
										&nbsp;
									</p>
									<p>
										&nbsp;
									</p>
									<p>
										<br />
										${compMap['361'].contractStartDate}
										<br />
										${compMap['361'].contractEndDate}
									</p>
								</td>
								<td align="center" valign="middle">
									<p>
										&nbsp;
									</p>
									<p>
										&nbsp;
									</p>
									<p>
										<br />
										${compMap['362'].contractStartDate}
										<br />
										${compMap['362'].contractEndDate}
									</p>
								</td>
								<td align="center" valign="middle">
									<p>
										&nbsp;
									</p>
									<p>
										&nbsp;
									</p>
									<p>
										<br />
										${compMap['363'].contractStartDate}
										<br />
										${compMap['363'].contractEndDate}
									</p>
								</td>
								<td align="center" valign="middle">
									<p>
										&nbsp;
									</p>
									<p>
										&nbsp;
									</p>
									<p>
										<br />
										${compMap['364'].contractStartDate}
										<br />
										${compMap['364'].contractEndDate}
									</p>
								</td>
							</tr>
							--%>
						</table>
					</li>
					<li id="fourF">
						<table width="992" border="0"
							style="margin-top: 10px; font-size: 9px;">
							<tr align="center" valign="bottom" height="30">
								<td width="65" height="40">

									<a href="compDetailView.htm?compID=${compMap['416'].uid}"
										target="blank">${compMap['416'].compShortName}</a>
								</td>
								<td width="62">

									<a href="compDetailView.htm?compID=${compMap['415'].uid}"
										target="blank">${compMap['415'].compShortName}</a>
								</td>
								<td width="63">

									<a href="compDetailView.htm?compID=${compMap['414'].uid}"
										target="blank">${compMap['414'].compShortName}</a>
								</td>
								<td>

									<a href="compDetailView.htm?compID=${compMap['413'].uid}"
										target="blank">${compMap['413'].compShortName}</a>
								</td>
								<td width="61">

									<a href="compDetailView.htm?compID=${compMap['412'].uid}"
										target="blank">${compMap['412'].compShortName}</a>
								</td>
								<td width="77">

									<a href="compDetailView.htm?compID=${compMap['411'].uid}"
										target="blank">${compMap['411'].compShortName}</a>
								</td>
								<td width="557">
									&nbsp;

								</td>
							</tr>
							<!--<tr align="center" valign="bottom">
								<td height="30">
									${compMap['416'].roomArea}坪
								</td>
								<td>
									${compMap['415'].roomArea}坪
								</td>
								<td>
									${compMap['414'].roomArea}坪
								</td>
								<td>
									${compMap['413'].roomArea}坪
								</td>
								<td>
									${compMap['412'].roomArea}坪
								</td>
								<td>
									${compMap['411'].roomArea}坪
								</td>
								<td>&nbsp;
									
								</td>
							</tr>
							<tr align="center" valign="bottom">
								<td height="28">&nbsp;
									
								</td>
								<td>&nbsp;
									
								</td>
								<td>&nbsp;
									
								</td>
								<td width="58">&nbsp;
									
								</td>
								<td width="61">&nbsp;
									
								</td>
								<td>&nbsp;
									
								</td>
								<td>&nbsp;
									
								</td>
								<td width="15">&nbsp;
									
								</td>
							</tr>
							<tr align="center" valign="bottom">
								<!--<td height="66">
									<p>
										<br />
										${compMap['416'].contractStartDate}
										<br />
										${compMap['416'].contractEndDate}
									</p>
								</td>
								<td>
									<p>
										<br />
										${compMap['415'].contractStartDate}
										<br />
										${compMap['415'].contractEndDate}
									</p>
								</td>
								<td>
									<p>
										<br />
										${compMap['414'].contractStartDate}
										<br />
										${compMap['414'].contractEndDate}
									</p>
								</td>
								<td>
									<p>
										<br />
										${compMap['413'].contractStartDate}
										<br />
										${compMap['413'].contractEndDate}
									</p>
								</td>
								<td>
									<p>
										<br />
										${compMap['412'].contractStartDate}
										<br />
										${compMap['412'].contractEndDate}
									</p>
								</td>
								<td>
									<p>
										<br />
										${compMap['411'].contractStartDate}
										<br />
										${compMap['411'].contractEndDate}
									</p>
								</td>
								<td>&nbsp;
									
								</td>
							</tr>-->
						</table>

						<table width="992" border="0"
							style="margin-top: 160px; font-size: 9px;">
							<tr>
								<td width="64" height="32">

									<a href="compDetailView.htm?compID=${compMap['437'].uid}"
										target="blank">${compMap['437'].compShortName}</a>
								</td>
								<td width="70">

									<a href="compDetailView.htm?compID=${compMap['436'].uid}"
										target="blank">${compMap['436'].compShortName}</a>
								</td>
								<td width="56">

									<a href="compDetailView.htm?compID=${compMap['435'].uid}"
										target="blank">${compMap['435'].compShortName}</a>
								</td>
								<td width="70">

									<a href="compDetailView.htm?compID=${compMap['466'].uid}"
										target="blank">${compMap['466'].compShortName}</a>
								</td>
								<td width="70">

									<a href="compDetailView.htm?compID=${compMap['433'].uid}"
										target="blank">${compMap['433'].compShortName}</a>
								</td>
								<td width="48">
									${compMap['431'].compShortName}
									<br>
									<br>
									<br>
									<br>
									${compMap['432'].compShortName}
								</td>
								<td width="36">
									${compMap['430'].compShortName}

								</td>
								<td width="590">
									&nbsp;

								</td>
							</tr>
							<!--<tr>
								<td height="20">
									${compMap['437'].roomArea}坪
								</td>
								<td>
									${compMap['436'].roomArea}坪
								</td>
								<td>
									${compMap['435'].roomArea}坪
								</td>
								<td>
									${compMap['466'].roomArea}坪
								</td>
								<td>
									${compMap['433'].roomArea}坪
								</td>
								<td>&nbsp;
									
								</td>
								<td>&nbsp;
									
								</td>
							</tr>-->
							<!--<tr>
								<td height="76">
									<p>
										<br />
										${compMap['437'].contractStartDate}
										<br />
										${compMap['437'].contractEndDate}
									</p>
								</td>
								<td>
									<p>
										<br />
										${compMap['436'].contractStartDate}
										<br />
										${compMap['436'].contractEndDate}
									</p>
								</td>
								<td>
									<p>
										<br />
										${compMap['435'].contractStartDate}
										<br />
										${compMap['435'].contractEndDate}
									</p>
								</td>
								<td>
									<p>
										<br />
										${compMap['466'].contractStartDate}
										<br />
										${compMap['466'].contractEndDate}
									</p>
								</td>
								<td>
									<p>
										<br />
										${compMap['433'].contractStartDate}
										<br />
										${compMap['433'].contractEndDate}
									</p>
								</td>
								<td>&nbsp;
									
								</td>
								<td>&nbsp;
									
								</td>
							</tr>-->
						</table>

						<table width="991" border="0" style="margin-top: 70px;">
							<tr>
								<td width="100" height="44" align="center" valign="middle">

									<a href="compDetailView.htm?compID=${compMap['455'].uid}"
										target="blank">${compMap['455'].compShortName}</a>
								</td>
								<td width="120" align="center" valign="middle">

									<a href="compDetailView.htm?compID=${compMap['454'].uid}"
										target="blank">${compMap['454'].compShortName}</a>
								</td>
								<td width="105" align="center" valign="middle">

									<a href="compDetailView.htm?compID=${compMap['453'].uid}"
										target="blank">${compMap['453'].compShortName}</a>
								</td>
								<td width="56" align="center" valign="middle">

									<a href="compDetailView.htm?compID=${compMap['452'].uid}"
										target="blank">${compMap['452'].compShortName}</a>
								</td>
								<td width="36" align="center" valign="middle">

									<a href="compDetailView.htm?compID=${compMap['451'].uid}"
										target="blank">${compMap['451'].compShortName}</a>
								</td>
								<td width="20" align="center" valign="middle">
									${compMap['450'].compShortName}
								</td>
								<td width="660" align="center" valign="middle">
									&nbsp;

								</td>
							</tr>
							<!--<tr>
								<td height="20" align="center" valign="middle">
									${compMap['455'].roomArea}坪
								</td>
								<td align="center" valign="middle">
									${compMap['454'].roomArea}坪
								</td>
								<td align="center" valign="middle">
									${compMap['453'].roomArea}坪
								</td>
								<td align="center" valign="middle">
									${compMap['452'].roomArea}坪
								</td>
								<td align="center" valign="middle">
									${compMap['451'].roomArea}坪
								</td>
								<td align="center" valign="middle">&nbsp;
									
								</td>
							</tr>-->
							<!--<tr>
								<td align="center" valign="middle">
									<p>&nbsp;
										
									</p>
									<p>&nbsp;
										
									</p>
									<p>
										<br />
										${compMap['455'].contractStartDate}
										<br />
										${compMap['455'].contractEndDate}
									</p>
								</td>
								<td align="center" valign="middle">
									<p>&nbsp;
										
									</p>
									<p>&nbsp;
										
									</p>
									<p>
										<br />
										${compMap['454'].contractStartDate}
										<br />
										${compMap['454'].contractEndDate}
									</p>
								</td>
								<td align="center" valign="middle">
									<p>&nbsp;
										
									</p>
									<p>&nbsp;
										
									</p>
									<p>
										<br />
										${compMap['453'].contractStartDate}
										<br />
										${compMap['453'].contractEndDate}
									</p>
								</td>
								<td align="center" valign="middle">
									<p>&nbsp;
										
									</p>
									<p>&nbsp;
										
									</p>
									<p>
										<br />
										${compMap['452'].contractStartDate}
										<br />
										${compMap['452'].contractEndDate}
									</p>
								</td>
								<td align="center" valign="middle">
									<p>&nbsp;
										
									</p>
									<p>&nbsp;
										
									</p>
									<p>
										<br />
										${compMap['451'].contractStartDate}
										<br />
										${compMap['451'].contractEndDate}
									</p>
								</td>
								<td align="center" valign="middle">&nbsp;
									
								</td>
							</tr>-->
						</table>
					</li>

					<li id="fiveF">
						<table width="1000" border="0" style="margin-top: 10px;">
							<tr align="center" valign="bottom">
								<td width="70" height="30">

									<a href="compDetailView.htm?compID=${compMap['516'].uid}"
										target="blank">${compMap['516'].compShortName}</a>
								</td>
								<td width="60">

									<a href="compDetailView.htm?compID=${compMap['515'].uid}"
										target="blank">${compMap['515'].compShortName}</a>
								</td>
								<td width="60">

									<a href="compDetailView.htm?compID=${compMap['514'].uid}"
										target="blank">${compMap['514'].compShortName}</a>
								</td>
								<td width="60">

									<a href="compDetailView.htm?compID=${compMap['513'].uid}"
										target="blank">${compMap['513'].compShortName}</a>
								</td>
								<td width="60">

									<a href="compDetailView.htm?compID=${compMap['512'].uid}"
										target="blank">${compMap['512'].compShortName}</a>
								</td>
								<td width="50">

									<a href="compDetailView.htm?compID=${compMap['511'].uid}"
										target="blank">${compMap['511'].compShortName}</a>
								</td>
								<td width="180">
									&nbsp;

								</td>
								<td width="50">

									<a href="compDetailView.htm?compID=${compMap['521'].uid}"
										target="blank">${compMap['521'].compShortName}</a>
								</td>
								<td width="60">

									<a href="compDetailView.htm?compID=${compMap['522'].uid}"
										target="blank">${compMap['522'].compShortName}</a>
								</td>
								<td width="60">

									<a href="compDetailView.htm?compID=${compMap['523'].uid}"
										target="blank">${compMap['523'].compShortName}</a>
								</td>
								<td width="60">

									<a href="compDetailView.htm?compID=${compMap['524'].uid}"
										target="blank">${compMap['524'].compShortName}</a>
								</td>
								<td width="60">

									<a href="compDetailView.htm?compID=${compMap['525'].uid}"
										target="blank">${compMap['525'].compShortName}</a>
								</td>
								<td width="66">

									<a href="compDetailView.htm?compID=${compMap['526'].uid}"
										target="blank">${compMap['526'].compShortName}</a>
								</td>
							</tr>
							<!--<tr align="center" valign="bottom">
								<td height="36">
									${compMap['516'].roomArea}坪
								</td>
								<td>
									${compMap['515'].roomArea}坪
								</td>
								<td>
									${compMap['514'].roomArea}坪
								</td>
								<td>
									${compMap['513'].roomArea}坪
								</td>
								<td>
									${compMap['512'].roomArea}坪
								</td>
								<td>
									${compMap['511'].roomArea}坪
								</td>
								<td>&nbsp;
									
								</td>
								<td>
									${compMap['521'].roomArea}坪
								</td>
								<td>
									${compMap['522'].roomArea}坪
								</td>
								<td>
									${compMap['523'].roomArea}坪
								</td>
								<td>
									${compMap['524'].roomArea}坪
								</td>
								<td>
									${compMap['525'].roomArea}坪
								</td>
								<td>
									${compMap['526'].roomArea}坪
								</td>
							</tr>
							<tr align="center" valign="bottom">
								<td height="28">&nbsp;
									
								</td>
								<td>&nbsp;
									
								</td>
								<td>&nbsp;
									
								</td>
								<td width="59">&nbsp;
									
								</td>
								<td width="64">&nbsp;
									
								</td>
								<td>&nbsp;
									
								</td>
								<td>&nbsp;
									
								</td>
								<td>&nbsp;
									
								</td>
								<td>&nbsp;
									
								</td>
								<td>&nbsp;
									
								</td>
								<td>&nbsp;
									
								</td>
								<td>&nbsp;
									
								</td>
								<td width="60">&nbsp;
									
								</td>
								<td width="1">&nbsp;
									
								</td>
								<td width="5">&nbsp;
									
								</td>
							</tr>
							<tr align="center" valign="bottom">
								<td>
									<p>
										<br />
										${compMap['516'].contractStartDate}
										<br />
										${compMap['516'].contractEndDate}
									</p>
								</td>
								<td>
									<p>
										<br />
										${compMap['515'].contractStartDate}
										<br />
										${compMap['515'].contractEndDate}
									</p>
								</td>
								<td>
									<p>
										<br />
										${compMap['514'].contractStartDate}
										<br />
										${compMap['514'].contractEndDate}
									</p>
								</td>
								<td>
									<p>
										<br />
										${compMap['513'].contractStartDate}
										<br />
										${compMap['513'].contractEndDate}
									</p>
								</td>
								<td>
									<p>
										<br />
										${compMap['512'].contractStartDate}
										<br />
										${compMap['512'].contractEndDate}
									</p>
								</td>
								<td>
									<p>
										<br />
										${compMap['511'].contractStartDate}
										<br />
										${compMap['511'].contractEndDate}
									</p>
								</td>
								<td></td>
								<td>
									<p>
										<br />
										${compMap['521'].contractStartDate}
										<br />
										${compMap['521'].contractEndDate}
									</p>
								</td>
								<td>
									<p>
										<br />
										${compMap['522'].contractStartDate}
										<br />
										${compMap['522'].contractEndDate}
									</p>
								</td>
								<td>
									<p>
										<br />
										${compMap['523'].contractStartDate}
										<br />
										${compMap['523'].contractEndDate}
									</p>
								</td>
								<td>
									<p>
										<br />
										${compMap['524'].contractStartDate}
										<br />
										${compMap['524'].contractEndDate}
									</p>
								</td>
								<td>
									<p>
										<br />
										${compMap['525'].contractStartDate}
										<br />
										${compMap['525'].contractEndDate}
									</p>
								</td>
								<td>
									<p>
										<br />
										${compMap['526'].contractStartDate}
										<br />
										${compMap['526'].contractEndDate}
									</p>
								</td>
							</tr>-->
						</table>

						<table width="1000" border="0"
							style="margin-top: 145px; font-size: 9px;">
							<tr>
								<td width="60">

									<a href="compDetailView.htm?compID=${compMap['538'].uid}"
										target="blank">${compMap['538'].compShortName}</a>
								</td>
								<td width="60">

									<a href="compDetailView.htm?compID=${compMap['537'].uid}"
										target="blank">${compMap['537'].compShortName}</a>
								</td>
								<td width="60">

									<a href="compDetailView.htm?compID=${compMap['536'].uid}"
										target="blank">${compMap['536'].compShortName}</a>
								</td>
								<td width="60">

									<a href="compDetailView.htm?compID=${compMap['535'].uid}"
										target="blank">${compMap['535'].compShortName}</a>
								</td>
								<td width="60">

									<a href="compDetailView.htm?compID=${compMap['566'].uid}"
										target="blank">${compMap['566'].compShortName}</a>
								</td>
								<td width="90">

									<a href="compDetailView.htm?compID=${compMap['533'].uid}"
										target="blank">${compMap['533'].compShortName}</a>
								</td>
								<td width="60">
									${compMap['531'].compShortName}
									<br>
									<br>
									<br>
									${compMap['532'].compShortName}
								</td>
								<td width="36">
									${compMap['530'].compShortName}
								</td>
								<td width="180">
									&nbsp;
								</td>
								<td width="36">
									${compMap['540'].compShortName}
								</td>
								<td width="60">
									${compMap['541'].compShortName}
									<br>
									<br>
									<br>
									${compMap['542'].compShortName}
								</td>
								<td width="76">

									<a href="compDetailView.htm?compID=${compMap['543'].uid}"
										target="blank">${compMap['543'].compShortName}</a>
								</td>
								<td width="53">

									<a href="compDetailView.htm?compID=${compMap['588'].uid}"
										target="blank">${compMap['588'].compShortName}</a>
								</td>
								<td width="60">

									<a href="compDetailView.htm?compID=${compMap['545'].uid}"
										target="blank">${compMap['545'].compShortName}</a>
								</td>
								<td width="66">

									<a href="compDetailView.htm?compID=${compMap['546'].uid}"
										target="blank">${compMap['546'].compShortName}</a>
								</td>
								<td width="50">

									<a href="compDetailView.htm?compID=${compMap['547'].uid}"
										target="blank">${compMap['547'].compShortName}</a>
								</td>
								<td width="56">

									<a href="compDetailView.htm?compID=${compMap['548'].uid}"
										target="blank">${compMap['548'].compShortName}</a>
								</td>
							</tr>
							<!--<tr>
								<td height="20">
									${compMap['538'].roomArea}坪
								</td>
								<td>
									${compMap['537'].roomArea}坪
								</td>
								<td>
									${compMap['536'].roomArea}坪
								</td>
								<td>
									${compMap['535'].roomArea}坪
								</td>
								<td>
									${compMap['566'].roomArea}坪
								</td>
								<td>
									${compMap['533'].roomArea}坪
								</td>
								<td>&nbsp;
									
								</td>
								<td>
									${compMap['543'].roomArea}坪
								</td>
								<td>
									${compMap['588'].roomArea}坪
								</td>
								<td>
									${compMap['545'].roomArea}坪
								</td>
								<td>
									${compMap['546'].roomArea}坪
								</td>
								<td>
									${compMap['547'].roomArea}坪
								</td>
								<td>
									${compMap['548'].roomArea}坪
								</td>
							</tr>
							<tr>
								<td height="70">
									<p>
										<br />
										${compMap['538'].contractStartDate}
										<br />
										${compMap['538'].contractEndDate}
									</p>
								</td>
								<td>
									<p>
										<br />
										${compMap['537'].contractStartDate}
										<br />
										${compMap['537'].contractEndDate}
									</p>
								</td>
								<td>
									<p>
										<br />
										${compMap['536'].contractStartDate}
										<br />
										${compMap['536'].contractEndDate}
									</p>
								</td>
								<td>
									<p>
										<br />
										${compMap['535'].contractStartDate}
										<br />
										${compMap['535'].contractEndDate}
									</p>
								</td>
								<td>
									<p>
										<br />
										${compMap['566'].contractStartDate}
										<br />
										${compMap['566'].contractEndDate}
									</p>
								</td>
								<td>
									<p>
										<br />
										${compMap['533'].contractStartDate}
										<br />
										${compMap['533'].contractEndDate}
									</p>
								</td>
								<td>&nbsp;
									
								</td>
								<td>
									<p>
										<br />
										${compMap['543'].contractStartDate}
										<br />
										${compMap['543'].contractEndDate}
									</p>
								</td>
								<td>
									<p>
										<br />
										${compMap['588'].contractStartDate}
										<br />
										${compMap['588'].contractEndDate}
									</p>
								</td>
								<td>
									<p>
										<br />
										${compMap['545'].contractStartDate}
										<br />
										${compMap['545'].contractEndDate}
									</p>
								</td>
								<td>
									<p>
										<br />
										${compMap['546'].contractStartDate}
										<br />
										${compMap['546'].contractEndDate}
									</p>
								</td>
								<td>
									<p>
										<br />
										${compMap['547'].contractStartDate}
										<br />
										${compMap['547'].contractEndDate}
									</p>
								</td>
								<td>
									<p>
										<br />
										${compMap['548'].contractStartDate}
										<br />
										${compMap['548'].contractEndDate}
									</p>
								</td>
							</tr>-->
						</table>

						<table width="1000" border="0" style="margin-top: 80px;">
							<tr>
								<td width="101" height="29" align="center" valign="middle">

									<a href="compDetailView.htm?compID=${compMap['554'].uid}"
										target="blank">${compMap['554'].compShortName}</a>
								</td>
								<td width="103" align="center" valign="middle">

									<a href="compDetailView.htm?compID=${compMap['553'].uid}"
										target="blank">${compMap['553'].compShortName}</a>
								</td>
								<td width="100" align="center" valign="middle">

									<a href="compDetailView.htm?compID=${compMap['552'].uid}"
										target="blank">${compMap['552'].compShortName}</a>
								</td>
								<td width="80" align="center" valign="middle">

									<a href="compDetailView.htm?compID=${compMap['551'].uid}"
										target="blank">${compMap['551'].compShortName}</a>
								</td>
								<td width="30" align="center" valign="middle">
									${compMap['550'].compShortName}
								</td>
								<td width="140" align="center" valign="middle">
									&nbsp;
								</td>
								<td width="30" align="center" valign="middle">
									${compMap['560'].compShortName}
								</td>
								<td width="84" align="center" valign="middle">

									<a href="compDetailView.htm?compID=${compMap['561'].uid}"
										target="blank">${compMap['561'].compShortName}</a>
								</td>
								<td width="100" align="center" valign="middle">

									<a href="compDetailView.htm?compID=${compMap['562'].uid}"
										target="blank">${compMap['562'].compShortName}</a>
								</td>
								<td width="99" align="center" valign="middle">

									<a href="compDetailView.htm?compID=${compMap['563'].uid}"
										target="blank">${compMap['563'].compShortName}</a>
								</td>
								<td width="100" align="center" valign="middle">

									<a href="compDetailView.htm?compID=${compMap['564'].uid}"
										target="blank">${compMap['564'].compShortName}</a>
								</td>
							</tr>
							<!--<tr>
								<td height="18" align="center" valign="middle">
									${compMap['554'].roomArea}坪
								</td>
								<td align="center" valign="middle">
									${compMap['553'].roomArea}坪
								</td>
								<td align="center" valign="middle">
									${compMap['552'].roomArea}坪
								</td>
								<td align="center" valign="middle">
									${compMap['551'].roomArea}坪
								</td>
								<td align="center" valign="middle">&nbsp;
									
								</td>
								<td align="center" valign="middle">
									${compMap['561'].roomArea}坪
								</td>
								<td align="center" valign="middle">
									${compMap['562'].roomArea}坪
								</td>
								<td align="center" valign="middle">
									${compMap['563'].roomArea}坪
								</td>
								<td align="center" valign="middle">
									${compMap['564'].roomArea}坪
								</td>
							</tr>
							<tr>
								<td align="center" valign="middle">
									<p>&nbsp;
										
									</p>
									<p>&nbsp;
										
									</p>
									<p>
										<br />
										${compMap['554'].contractStartDate}
										<br />
										${compMap['554'].contractEndDate}
									</p>
								</td>
								<td align="center" valign="middle">
									<p>&nbsp;
										
									</p>
									<p>&nbsp;
										
									</p>
									<p>
										<br />
										${compMap['553'].contractStartDate}
										<br />
										${compMap['553'].contractEndDate}
									</p>
								</td>
								<td align="center" valign="middle">
									<p>&nbsp;
										
									</p>
									<p>&nbsp;
										
									</p>
									<p>
										<br />
										${compMap['552'].contractStartDate}
										<br />
										${compMap['552'].contractEndDate}
									</p>
								</td>
								<td align="center" valign="middle">
									<p>&nbsp;
										
									</p>
									<p>&nbsp;
										
									</p>
									<p>
										<br />
										${compMap['551'].contractStartDate}
										<br />
										${compMap['551'].contractEndDate}
									</p>
								</td>
								<td align="center" valign="middle">&nbsp;
									
								</td>
								<td align="center" valign="middle">
									<p>&nbsp;
										
									</p>
									<p>&nbsp;
										
									</p>
									<p>
										<br />
										${compMap['561'].contractStartDate}
										<br />
										${compMap['561'].contractEndDate}
									</p>
								</td>
								<td align="center" valign="middle">
									<p>&nbsp;
										
									</p>
									<p>&nbsp;
										
									</p>
									<p>
										<br />
										${compMap['562'].contractStartDate}
										<br />
										${compMap['562'].contractEndDate}
									</p>
								</td>
								<td align="center" valign="middle">
									<p>&nbsp;
										
									</p>
									<p>&nbsp;
										
									</p>
									<p>
										<br />
										${compMap['563'].contractStartDate}
										<br />
										${compMap['563'].contractEndDate}
									</p>
								</td>
								<td align="center" valign="middle">
									<p>&nbsp;
										
									</p>
									<p>&nbsp;
										
									</p>
									<p>
										<br />
										${compMap['564'].contractStartDate}
										<br />
										${compMap['564'].contractEndDate}
									</p>
								</td>
							</tr>-->
						</table>
					</li>
				</ul>

			</div>
			<div class="conclu">
				<ol>
					<li>
						<span sytle="color:blue;"><s:message
								code="movin.comp.count" arguments="${movinCompanyCount}"
								htmlEscape="false" text="進駐家數" /> </span>
						<br>

						<span sytle="color:blue;"><s:message
								code="movin.comp.ratio" arguments="${roomUsedRatio}"
								htmlEscape="false" text="進駐率" /> </span>
					</li>
					<li class="linetw">

						<span sytle="color:blue;"><s:message
								code="consulting.count" arguments="${talkNoteCount}"
								htmlEscape="false" text="輔導紀錄" /> </span>
						<br />
					</li>
					<li class="lineth">

						<span sytle="color:blue;"><s:message
								code="account.receivable.ratio" arguments="${talkNoteCount}"
								htmlEscape="false" text="應收款完成率" /> </span>

						<br>
						86%
					</li>
					<li class="linefo">

						<a href="todo.htm"><span style="color: white;"><s:message
									code="todo.count" arguments="${toDoTaskCount}"
									htmlEscape="false" text="待辦" /> </span> </a>



						<br>

						<span sytle="color:blue;"><s:message
								code="applying.Company.Count"
								arguments="${applyingCompanyCount}" htmlEscape="false"
								text="洽談家數" /> </span>


					</li>
				</ol>
			</div>
		</div>

		<!--container ends here-->
		<%@ include file="/footer.jsp"%>
	</body>
</html>
