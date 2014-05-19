<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div  id="footer" style="margin-top:20px; width:100%; height:60px; padding-top:10px; background:#141a30 url(images/footer.jpg) repeat-x;">
	<table width="1000" border="0" cellspacing="0" cellpadding="0" style="margin:0 auto; font-size:12px; color:#fff;">
          <tr>
                <td width="200">
                	<div style="padding-left:45px">指導單位</div>
                    <div><img width="190" height="36" src="images/logo_ss.png"></div>
                </td>
                <td width="200">
                	<div style="padding-left:45px">執行單位</div>
                    <div><img height="35" src="images/logo-III.png"></div>
                </td>
                <td>
                	<div style="padding-top:10px">
                    	Copyright © 2013 by SME Entrepreneurship and Innovation Service Center . All Rights Reserved.<br>
						<a target="_blank" href="http://nsi.ites-incubator.net/PrivacyStatement_III.pdf" style="font-size:12px; color:#fff;">隱私權與網站資訊使用聲明</a>
					</div>
                </td>
          </tr>
    </table>
</div>	
<script type="text/javascript">
	function footerload(){
	var tempheight = $("#container").height();
		if(tempheight<680)
		{
			$("#container").height(400+tempheight);

		}
	};
	
	footerload();
</script> 
