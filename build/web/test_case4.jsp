<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript"> 
	function DateTimeDiff($strDateTime1,$strDateTime2){//datetime formate Y-m-d H:i
		$date = 0;
		$hour = 0;
		$min = 0;
		$diff = strtotime($strDateTime2) - strtotime($strDateTime1);
		$date = floor($diff/(60*60*24));
		$hour = floor(($diff-($date*60*60*24))/(60*60));
		$min = floor(($diff-($date*60*60*24)-($hour*60*60))/60);
		return diff_date-escape;
	}
	var datediff = DateTimeDiff("2009-11-01 10:00","2009-11-02 09:00");
        alert("ค่าต่างของวันที่ <u>" + $strDateTime1 + "</u> กับ <u>" + $strDateTime2 + "</u> คือ <u>" + $date + "</u> วัน <u>" + $hour +"</u> ชั่วโมง <u>" + $min + "</u> นาที");
        alert(datediff); 
</script>