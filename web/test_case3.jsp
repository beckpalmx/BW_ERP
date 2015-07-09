<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
function DateTimeDiff(date1,date2){
	var d =new Date();
	var date1_toarray =new Array();
	var date2_toarray=new Array();
	date1_toarray =date1.split(/[- :]/g);
	date2_toarray=date2.split(/[- :]/g);
	d.setYear(date2_toarray[0]-date1_toarray[0]);
	d.setMonth(date2_toarray[1]-date1_toarray[1]);
	d.setDate(date2_toarray[2]-date1_toarray[2]);
	d.setHours(date2_toarray[3]-date1_toarray[3]);
	d.setMinutes(date2_toarray[4]-date1_toarray[4]);

	var diff_date =d.getDate();
	var diff_hours =d.getHours();
	var diff_minutes =d.getMinutes();

	d.setYear(date1_toarray[0]);
	d.setMonth(date1_toarray[1]-1);  // month 0-11   format month of php to month of javascript = month of php minus 1
	d.setDate(date1_toarray[2]);
	var day1 =d.getDay();
	// 0 -  sunday  เนื่องจากจาวาสคริปนับวัน 0-6  php 1-7  ต้องแปลงวันอาทิตย์ให้เป็นเลข 7 จะได้ตรงกับโค้ด php
	day1 =(day1 ==0)?7:day1;

	var escape =parseInt((diff_date/7)*2);
	var mod=diff_date%7;
	if(mod !=0){
		if(day1 ==6 ) escape++;
		if(day1==7)escape++;
		if(day1 ==6 && mod>1)escape++;
		if(day1+mod>5 && day1<6)escape++;
		if(day1+mod>6 && day1<6)escape++;
	}
	return diff_date-escape;
	}
	//var date1 = "2015-01-31 10:00";
        //var date2 = "2015-01-31 11:00";
	var date1 = "2009-11-14 01:00";
        var date2 = "2009-11-22 11:00";        
        
        var diff=DateTimeDiff(date1,date2);
        
	alert("Date Diff : "+diff);
</script>
