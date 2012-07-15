<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Awareness Test</title>
<style type="text/css">
 #m_div 
 {
    width:600px;
    height:600px;
    position:absolute;
    top:50%;
    left:50%;
    margin-left:-300px;
    margin-top:-300px;
 }

 #his tr
 {
 	text-align: center;
 }
</head>
</style>
<body onload='fillRandom()'>

<div id='m_div' align='center'>  <!-- margin: 0; padding: 0; -->

	<h3>Awareness Test</h3>
	<span id='test_span'>
			<label id='val1'>!</label>+<label id='val2'>!</label><label>=</label>
		<br/><br/>
			<!-- <label>Result</label-->
			<input id='resVal' placeholder='Enter Sum & Enter' onkeydown='if(event.keyCode==13){CheckVal();}' autofocus/>
			<!--<button onclick='CheckVal()' value='Check'>Check</button-->
		<br/><br/>
		<label id='res'></label>
	</span>
	
	<br/><br/><br/>
	
	<span id="work_input_div" style="display:none" onclick=""> 

		<label id='resFinal'></label><br/><br/>
		Working for <input id="working_for" placeholder='mins ?' onkeydown='if(event.keyCode==13){insertToLocStore();}'/> 
		<button onclick='insertToLocStore()'>Save</button> 
		<br/><br/><br/>
	</span>

	<h3 style='padding:20px'> Awareness History </h3>
	<table id='his' RULES=ALL cellpadding=5px FRAME=BOX>
		<thead style='font-weight:bold'><tr>
			<td>CompletionTime(secs)</td>
			<td>WorkingFor(mins)</td>
			<td>DateStamp</td>
		</thead>
	</table>

	<input type='hidden' type="button" value="Start count!" onclick="doTimer()"/>
	<input type='hidden' type="text" id="txt"/>
	<input type='hidden' type="button" value="Stop count!" onclick="stopCount()"/>
	
</div>

<!--  Javascript includes -->
<script type='text/javascript' src='/js/jquery-1.7.1.js'></script>

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
			$('#res').html('Wrong ! Fast.. Try again.. ');	
			$('#resVal').select();								
		}

		if (cnt ==3 )
		{ 
			stopCount();
			$("#resVal").attr("disabled", "disabled");
			$('#val1').html('!');
			$('#val2').html('!');
			$('#res').html(cnt-1+' tests Done in '+c+' secs !');
			$('#resFinal').html(cnt-1+' tests Done in '+c+' secs !');
			//addToTable(c,30,new Date()+"");
			$('#test_span').hide()
			$("#work_input_div").show();
			$('#working_for').focus();
		}
	}

	function fillRandom()
	{
		$('#val1').html(10 + Math.floor(Math.random()*10)+1);
		$('#val2').html(10 + Math.floor(Math.random()*10)+1);

		$('#resVal').val("");

	}
	var timer_id ;
	function secCount()
	{
		document.getElementById('txt').value=c;
		c=c+1;
		timer_id=setTimeout("secCount()",1000);
	}
	var timer_is_on=0 ,c=0;

	function doTimer()
	{
	if (!timer_is_on)
	  {
		  timer_is_on=1;
		  secCount();
	  }
	}

	function stopCount()
	{
		clearTimeout(timer_id);
		timer_is_on=0;
	}
	
	function addToTable(v1,v2,v3){
	 $('table#his').prepend(
             $('<tr>')
                     .append($('<td>').text(v1),
                             $('<td>').text(v2),
                             $('<td>').text(v3))
            );
	 
	 };

	insertToLocStore = function(f1)
	{

		//f1 = ['30 sec','20 min','30/02/2011'];

		f1 = [c,$("#working_for").val(),new Date().toString()];

		if ( typeof(localStorage.test) == 'undefined' )
		   localStorage.test = JSON.stringify([f1]);
		else
		{
			var t1 = JSON.parse(localStorage.test);
			t1.push(f1);
			localStorage.test = JSON.stringify(t1);
		}

		getDataFromLocStore();

		$('#work_input_div').html("Thank You for saving your Awareness score. Comeback after some time when you feel tired & refresh the page to take new test")
	}

	getDataFromLocStore = function() {
		$('#his tbody').remove();

		if(typeof(localStorage.test)!="undefined")
		{	var t = JSON.parse(localStorage.test);
			for(i=0;i<t.length;i++)
			{
				var v = new Array();
				for(j=0;j<t[i].length;j++)
				{
					console.log(t[i][j]);
					v[j] = t[i][j] ;
				}	
				addToTable(v[0],v[1],v[2]);
			}
		}
	}

 	echo = function(d){
 		console.log(d.toString());
 	}
	$(function()
	{
		//initialisation 
		getDataFromLocStore();
	});

</script>
</body>
</html>