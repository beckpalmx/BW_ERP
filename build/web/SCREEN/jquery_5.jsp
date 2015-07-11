<html>
<head>
<title>ThaiCreate.Com jQuery Tutorials</title>
<script type="text/javascript" src="jquery-1.6.4.js"></script>
<script type="text/javascript">
$(document).ready(function(){

	$("#btn1").click(function(){

			$.post("jQuerypost.jsp", { 
			data1: $("#txt1").val(), 
			data2: $("#txt2").val()}, 
				function(result){
					$("#div1").html(result);
				}
			);

		});
	});
</script>
</head>
<body>
<input type="text" id="txt1">
<input type="text" id="txt2">
<div id="div1"></div>
<input type="button" id="btn1" value="Load">
</body>
</html>