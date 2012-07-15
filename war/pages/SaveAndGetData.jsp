<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Save And Get Data</title>
</head>
<body>
<script src='/js/jquery-1.7.1.js'></script>
<div align="center">
	<h3>Demo of Save & Get Data from NoSql DB</h3>
	<table >
		<tr><td>Enter Data and Press "Save"</td><td><textarea id="saveVal"></textarea></td><td><button onclick='saveData()'>Save</button></td></tr>
		<tr><td>Press "Get" to get the data</td><td> <textarea id="getVal"></textarea></td><td><button onclick='getData()'>Get</button></td></tr>
	</table>
</div>
	
<div id='status' style="text-align:center;padding-top:40px"></div>

<div>
<h4>How it works ?</h4>
<ol>
	<li>On hitting SAVE, ajax POST call is triggred to Servlet, which returns JSON data</li>
	<li>On hitting GET, ajax GET call is triggred to get JSON data</li>
</ol>
</div>
<script type="text/javascript">
getData = function()
{
	$.get("http://localhost:8892/data?value=k1",function(d){
		console.log(d); 
		$('#getVal').val(d.k1)
		$('#status').text("Message Obtained");
	})	
}
saveData = function()
{
	$.post("http://localhost:8892/data?value="+$('#saveVal').val(),function(d){
		console.log(d);
		$('#status').text("Message Saved");
		})
}

</script>
</body>
</html>