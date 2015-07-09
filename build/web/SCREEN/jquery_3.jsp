<html>
<head>
<title>ThaiCreate.Com jQuery Tutorials</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#txt3").hide();

	$("#btn1").click(function(){
		$("#txt3").show();
		$("#txt3").val(parseFloat($("#txt1").val())+parseFloat($("#txt2").val()));
	});

	$("#btn2").click(function(){
		$("#txt3").hide();
		$("#txt1").val('');
		$("#txt2").val('');
		$("#txt3").val('');
	});

});
</script>
</head>
<body>
<input type="text" id="txt1"> + <input type="text" id="txt2"> = <input type="text" id="txt3">
<input type="button" id="btn1" value="Click">
<input type="button" id="btn2" value="Clear">
</body>
</html>
