<html>
<head>
<title>Test Case</title>
</head>
<body>
<form name="frmMain" action="" method="post">
<script language="JavaScript">
		
		function jsTimeDiff(strDateTime1,strDateTime2){
			datetime1 = new Date(strDateTime1);
			datetime2 = new Date(strDateTime2);
			var one_day = 1000*60;
			var defDate = (datetime2.getTime() - datetime1.getTime()) / one_day

			return defDate;
		}

		document.write("Time Diff 1 = " + jsTimeDiff("12 Apr 2015 09:30:20","13 Apr 2015 10:30:20")+" Minutes<br>"); // DD MM YYYY
		document.write("Time Diff 2 = " + jsTimeDiff("12 Apr 2015 09:30:00","12 Apr 2015 12:00:00")+" Minutes<br>"); // MM/DD/YYYY
		document.write("<hr>")

</script>
</form>
</body>
</html>
