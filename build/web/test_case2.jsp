<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
function dateDiff() {
   var dtFrom = document.getElementById('txtFromDate').value;
   var dtTo = document.getElementById('txtToDate').value;
 
   var dt1 = new Date(dtFrom);
   var dt2 = new Date(dtTo);
   var diff = dt2.getTime() - dt1.getTime();
   var days = diff/(1000 * 60 * 60 * 24);
   alert(dt1 + ", " + dt2);
 
   alert(days);
   return false;
}
function isNumeric(val) {
   var ret = parseInt(val);
}
</script>
</head>
<body>
   <form id="frmMain" name="frmMain" method="POST">
       <label for="txtFromDate">From Date : </label>
       <input type="text" id="txtFromDate" name="txtFromDate" size="20" maxlength="10" value="03/25/2013"/><br/>
       <label for="txtToDate">To Date : </label>
       <input type="text" id="txtToDate" name="txtDate" size="20" maxlength="10" value="03/26/2013"/><br/>
       <button id="btnCheck" name="btnCheck" onClick="dateDiff();" type="button">Difference</button>
   </form>
</body>
</html>

