<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Awareness Test</title>
<style type="text/css">
#m_div {
        width:600px;
                height:600px;
        position:absolute;
        top:50%;
        left:50%;
        margin-left:-300px;
        margin-top:-300px;

        }
</head>
</style>
<body onload='fillRandom()'>
<script type='text/javascript'>
var cnt = 1;
	function CheckVal()
	{

		if (cnt ==1 ) doTimer();

		var v1=parseInt($('#val1').html());
		var v2=parseInt($('#val2').html());
		
		var v3=parseInt($('#resVal').val());
		
		console.log("v1-"+v1+",v2-"+v2+",v3-"+v3);
		
		if((v1+v2)==v3)
		{
			$('#res').html('Right !');

			setTimeout(1000,fillRandom());
			cnt ++;
		}
		else
		{
			$('#res').html('Wrong !');	
			$('#resVal').select();								
		}

		if (cnt ==5 )
		{ 
			stopCount();
			$("#resVal").attr("disabled", "disabled");
			$('#val1').html('!');
			$('#val2').html('!');
			$('#res').html(cnt+' tests Done in '+c+' secs !');
		}
	}

	function fillRandom()
	{
		$('#val1').html(10 + Math.floor(Math.random()*10)+1);
		$('#val2').html(10 + Math.floor(Math.random()*10)+1);

		$('#resVal').val("");

	}

	function timedCount()
	{
		document.getElementById('txt').value=c;
		c=c+1;
		t=setTimeout("timedCount()",1000);
	}
	var timer_is_on=0 ,c=0;

	function doTimer()
	{
	if (!timer_is_on)
	  {
		  timer_is_on=1;
		  timedCount();
	  }
	}

	function stopCount()
	{
		clearTimeout(t);
		timer_is_on=0;
	}
	
	var rowTemplate = "<tr><td>{0}</td><td>SomePredefinedText {1}</td></tr>";
	var alternateRowTemplate = "<tr><td class='a'>{0}</td><td>SomewhatDifferent {1}</td></tr>";

	function addToTable(v1,v2){
	 $('table#his').append(
             $('<tr>')
                     .append($('<td>').text(v1),
                             $('<td>').text(v2))
            );
	 
	 };

</script>
<div id='m_div' align='center'>  <!-- margin: 0; padding: 0; -->
	<label id='val1'>!</label>+<label id='val2'>!</label>
	<br/><br/>
	<label>Result</label>
	<input id='resVal' onkeydown='if(event.keyCode==13){CheckVal();}' autofocus></input>
	<button onclick='CheckVal()' value='Check'>Check</button>
	<br/><br/>
	<label id='res'></label>

	<br/><br/><br/>
	
	<table id='his'></table>

	<input type='hidden' type="button" value="Start count!" onclick="doTimer()">
	<input type='hidden' type="text" id="txt">
	<input type='hidden' type="button" value="Stop count!" onclick="stopCount()">
	
</div>

<!--  Javascript includes -->
<script type='text/javascript' src='http://code.jquery.com/jquery-1.7.1.min.js'></script>
</body>
</html>