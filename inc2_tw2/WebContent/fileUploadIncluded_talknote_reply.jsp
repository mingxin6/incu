<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<script>
$(document)
		.ready(function() {
			//add more file components if Add is clicked
				$('#addFile')
						.click(function() {
							//var fileIndex = $('#fileTable tr').children().length;
								$('#fileTable')
										.append(
												'<tr>'
														+ '<td>'
														+ '<input type="button" value="刪除" onClick="$(this).closest(\'tr\').remove();"/>'
														+ '</td>'
														+ '<td>'
														+ '<input type="file" name="files_reply" />'
														+ '</td></tr>');
							});

			});
</script>

<input id="addFile" type="button" value="增加上傳檔" class="upIcon" />

<table id="fileTable">
	<tr>
		<td>
			<input type="button" value="刪除"
				onClick="$(this).closest('tr').remove();" class="deIcon" />
		</td>
		<td>
			<input name="files_reply" type="file" />
		</td>
	</tr>
	<tr>
		<td>
			<input type="button" value="刪除"
				onClick="$(this).closest('tr').remove();" class="deIcon" />
		</td>
		<td>
			<input name="files_reply" type="file" />
		</td>
	</tr>
	<tr>
		<td>
			<input type="button" value="刪除"
				onClick="$(this).closest('tr').remove();" class="deIcon" />
		</td>
		<td>
			<input name="files_reply" type="file" />
		</td>
	</tr>
</table>


