<%@page import="com.bw.Util.HeaderScreen_Report"%>
<%@page import="com.bw.bean.DataBean_Screen_Report"%>
<%@page import="com.bw.bean.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.bw.bean.DataBean_Screen_Process"%>

<%@page import="com.bw.Util.HeaderScreen_Process"%>
<html>
    <%!    String path, lookup, doc_eff_date, doc_no;
    %>
    <head>
        <META Http-Equiv="Cache-Control" Content="no-cache">
        <META Http-Equiv="Pragma" Content="no-cache">
        <script language="javascript" src="../JS/myAjaxFramework.js"></script>
        <script language="javascript" src="../JS/engine.js"></script>
        <!-- calendar stylesheet -->
        <link rel="stylesheet" type="text/css" media="all" href="../JS/jscalendar/skins/aqua/aqua.css" title="Aua" />
        <link type="text/css" href="../CSS/ui-lightness/jquery-ui-1.8.17.custom.css" rel="stylesheet" />
        <!-- main calendar program -->
        <script type="text/javascript" src="../JS/jscalendar/calendar.js"></script>
        <!-- language for the calendar -->
        <script type='text/javascript' src='../JS/jscalendar/lang/calendar-th.js'></script>
        <!-- the following script defines the Calendar.setup helper function, which makes
               adding a calendar a matter of 1 or 2 lines of code. -->
        <script type="text/javascript" src="../JS/jscalendar/calendar-setup.js"></script>
        <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>        
        <script type="text/javascript" src="../JS/TimeFramwork.js"></script>
        <script type="text/javascript" src="../JS/calculator.js"></script>
        <script type="text/javascript" src="../JS/js_BW_Calculator/JS_Time.js"></script>        


        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../CSS/MENU.css" rel="stylesheet" type="text/css">
        <link href="../CSS/BT.css" rel="stylesheet" type="text/css">  
        <link href="../CSS/component.css" rel="stylesheet" type="text/css"> 
        <link href="../CSS/cgc_button.css" rel="stylesheet" type="text/css">        
        <link href="../CSS/bw_button.css" rel="stylesheet" type="text/css">  


        <link rel="stylesheet" href="../JS/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="../JS/bootstrap/css/bootstrap-theme.min.css">

        <script src="../JS/jquery/jquery-2.1.4.js"></script>
        <script src="../JS/bootstrap/js/bootstrap.min.js"></script>                           

        <link rel="stylesheet" href="../CSS/checkbox/awesome-bootstrap-checkbox.css"/>   

        <script src="../JS/alertify/alertify.js"></script>        

        <link rel="stylesheet" href="../CSS/alertify/alertify.core.css" />

        <link rel="stylesheet" href="../CSS/alertify/alertify.default.css">

        <link rel="stylesheet" href="../FONTS/css/font-awesome.css" />                


        <script type="text/javascript">

            jQuery.noConflict();

            function Calculator_Epower_unit() {
                if (getId("A_epower_milling_from").value !== "" && getId("A_epower_milling_to").value !== "") {
                    getId("A_epower_unit").value = (parseFloat(getId("A_epower_milling_to").value) - parseFloat(getId("A_epower_milling_from").value)).toFixed(3);
                } else {
                    getId("A_epower_unit").value = "0.000";
                }
            }
            function Calculator_starch() {
                if (getId("A_starch_bal").value !== "" && getId("A_qty_tank").value !== "") {
                    getId("A_starch_bal_x_qty_tank").value = (parseFloat(getId("A_starch_bal").value) * parseFloat(getId("A_qty_tank").value)).toFixed(0);
                    getId("A_qty_litr").value = (parseFloat(getId("A_starch_bal").value) * 2200).toFixed(2);
                } else {
                    getId("A_starch_bal_x_qty_tank").value = "";
                    getId("A_qty_litr").value = "";
                }
            }
            function Calculator_Time(date_from, date_to, time_from, time_to, output_diff) {
                if (ChkDate(getId(date_from).value, getId(date_to).value)) {
                    alert("กรุณาตรวจสอบวันที่");
                } else {
                    var output = difference_date_and_time(getId(date_from).value, getId(time_from).value, getId(date_to).value, getId(time_to).value);
                    getId(output_diff).value = output === undefined ? "" : output;
                }
            }

            function Calculator_Time_A(date_from, date_to, time_from, time_to, output_diff) {
                if (ChkDate(getId(date_from).value, getId(date_to).value)) {
                    alert("กรุณาตรวจสอบวันที่");
                } else {
                    if (Count_Date2(getId(date_from).value, getId(date_to).value) === 0) {
                        if (parseFloat(document.getElementById(time_from).value) > parseFloat(document.getElementById(time_to).value)) {
                            alert("กรุณาตรวจสอบเวลา");
                            document.getElementById(time_from).focus();
                        } else {
                            getId(output_diff).value = Time_Difference2(date_from, date_to, time_from, time_to);
                        }
                    } else {
                        //alert("test");
                        getId(output_diff).value = Time_Difference2(date_from, date_to, time_from, time_to);
                    }
                }
            }

            function goAddChild(URLSend)
            {
                var arryChk = new Array;
                arryChk[0] = "chkNull";
                if (ChkParameter(arryChk))
                {
                    window.open(URLSend[0]);
                }

            }
            function cancle()
            {

                var SURL;
                var r = confirm("คุณต้องการยกเลิกข้อมูลทั้งหมดหรือไม่");
                if (r)
                {
                    if (getId("status_cancle").value === "1")
                    {
                        cancelAction();
                        getId("show").innerHTML = "";
                        getId("show1").innerHTML = "";
                        getId("show2").innerHTML = "";
                        getId("show3").innerHTML = "";
                        getId("show4").innerHTML = "";
                        getId("status_cancle").value = "";
                        getId("child_ck").value = "";
                    }
                    else {
                        cancelAction();
                        getId("show").innerHTML = "";
                        getId("show1").innerHTML = "";
                        getId("show2").innerHTML = "";
                        getId("show3").innerHTML = "";
                        getId("show4").innerHTML = "";
                        getId("status_cancle").value = "";
                        getId("child_ck").value = "";
                    }
                    //getId("doc_id").disabled = false;
                }

            }
            function ckall(Value, Namecheckbox)//ทำการกดปุ้ม check ทั้งหมดใช้หรือไม่
            {

                for (var i = 0; i < document.getElementsByName(Namecheckbox).length; i++)
                {
                    document.getElementsByName(Namecheckbox)[i].checked = Value;
                }

            }

            function Display_Detail() {
                //alert("OK");
                showTableNonPopup("show3", "A_doc_id", "../SHOWDETAILSCREEN/BW_CS_Show033_4.jsp?doc_id=");
            }

            function goDelChild(number_page_action, number_page_show, checkboxAll_name, checkboxlinename, div_id)
            {
                var Deleteflag = "";
                var SURL;
                if (getId(checkboxAll_name).checked)//จะทำการลบข้อมูลของ Detail ทั้งหมด ทึ่ตรงกับรหัส
                {
                    var r = confirm("คุณต้องการลบข้อมูลลายละเอียดของเอกสารนี้ใช่หรือไม่");
                    if (r) {
                        SURL = "../JSP/BW_CS_Detail_0" + number_page_action + ".jsp?D_status=3&chk_all=1&username=" + getId("A_username").value;
                        SURL = SURL + "&A_doc_id=" + getId("A_doc_id").value;
                        Delete_Line_no(SURL);
                        getId("show").innerHTML = "";
                        getId(checkboxAll_name).checked = false;
                    }
                }
                else//จะทำการลบข้อมูลเฉพาะ Datail ที่ทำการเลือกไว้
                {
                    SURL = "../JSP/BW_CS_Detail_0" + number_page_action + ".jsp?D_status=3&ckbox=";
                    for (var i = 0; i < document.getElementsByName(checkboxlinename).length; i++)
                    {
                        Deleteflag += (document.getElementsByName(checkboxlinename)[i].checked) ? document.getElementsByName(checkboxlinename)[i].value + "," : "";
                    }
                    Deleteflag = Deleteflag.substring(0, Deleteflag.length - 1);
                    if (Deleteflag !== "") {
                        SURL = SURL + Deleteflag + "&A_doc_id=" + getId("A_doc_id").value + "&username=" + getId("A_username").value;
                        Delete_Line_no(SURL);
                        showTableNonPopup(div_id, "A_doc_id", "../SHOWDETAILSCREEN/" + number_page_show + ".jsp?doc_id=");
                        //var screenshow = "../SHOWDETAILSCREEN/"+number_page_show+".jsp?doc_id=";
                        //setTimeout(showTableNonPopup(div_id, "A_doc_id", screenshow), 1000);
                    } else {
                        showTableNonPopup(div_id, "A_doc_id", "../SHOWDETAILSCREEN/" + number_page_show + ".jsp?doc_id=");
                    }

                }
            }
            function OpenEdit(URLSend)
            {
                window.open(URLSend[0]);
            }
            function AddHeader()
            {
                var strID = "";
                strID = getIDElements('input', 'I_');
                strID = getIDElements('input', 'A_');
                strID = strID.substr(0, strID.length - 1);
                //alert(strID);
                getSave(URLsend('chkNull,' + strID, '../JSP/BW_CS_033.jsp'));
                //window.location.replace('BW_CS_033.jsp')

                getId("show").innerHTML = "";
                getId("show1").innerHTML = "";
                getId("show2").innerHTML = "";
                getId("show3").innerHTML = "";
                getId("show4").innerHTML = "";
            }
            function Delete()
            {
                if (confirm("คุณต้องการยกเลิกข้อมูลทั้งหมดหรือไม่")) {
                    getSave(URLsend('chkNull,D_status,A_doc_id', '../JSP/BW_CS_033.jsp'));
                }
            }
            function Chk_insert_value(checkbox_name, text_name) {
                if (getId(checkbox_name).checked) {
                    getId(checkbox_name).value = "Y";
                    getId(text_name).disabled = false;
                } else {
                    getId(checkbox_name).value = "N";
                    getId(text_name).disabled = true;
                    getId(text_name).value = "";
                }
            }
            function Chknull() {
                if (document.getElementById('A_doc_id').value === '') {
                    alert('กรุณาใส่ข้อมูลเลขที่เอกสาร');
                } else {
                    document.report.submit();
                }
            }
            function Checkvalue(thisvalue) {
                if (thisvalue) {
                    getId("job_id_complete").value = "Y";
                    alert("เอกสารนี้สมบูรณ์เรียบร้อยแล้ว");
                    getId("remark").disabled = false;
                } else {
                    getId("job_id_complete").value = "N";
                    getId("remark").value = "";
                    getId("remark").disabled = true;
                }
            }
            function Checkvalue2(thisvalue) {
                if (thisvalue) {
                    getId("job_id_end").value = "Y";
                    alert("ทำการจบใบแจ้งการผลิต");
                } else {
                    getId("job_id_end").value = "N";
                }
            }
            function Runid(output_value, input_value) {
                if (getId(input_value).value === "") {
                    AjaxRun_id('A_doc_id', '../JSP/BW_CS_033.jsp?status_runid=5');
                } else {
                    Format_Date(output_value, getId(input_value).value);
                    AjaxRun_id('A_doc_id', '../JSP/BW_CS_033.jsp?status_runid=5&A_doc_id=' + getId(output_value).value);
                }
            }
            function getCalculator() {
                //alert("getId('A_cassava_date').value = " + getId('A_cassava_date').value);
                if (getId('A_cassava_date').value !== '' && getId('A_cassava_date2').value !== '') {
                    getData_d_rawmatt_receive('../JSP/BW_CS_033.jsp?status_calculator=4&A_cassava_date=' + getId('A_cassava_date').value + '&A_cassava_date2=' + getId('A_cassava_date2').value, 'A_amount_cassava,A_percent_tapioca,A_amount_tapioca,A_fresh_skin,A_soil_skin,A_total_cassava,A_percent_tapioca1,A_amount_tapioca1');
                    getId("A_cassava_prd_date").value = getId('A_cassava_date').value;
                    getId("A_cassava_prd_date2").value = getId('A_cassava_date2').value;
                } else {
                    alert('กรุณาเลือกวันที่ส่งหัวมันสด');
                }
            }

            function send_print(report_code) {
                //alert("getId('A_doc_id').value = " + getId('A_doc_id').value);
                getId("doc_id").value = getId('A_doc_id').value;
                //alert("getId('doc_id').value = " + getId('doc_id').value);
                getId("report_code").value = report_code;
                //getId("doc_no").value = getId('doc_no').value;
                //getId("doc_eff_date").value = getId('doc_eff_date').value;
                document.report.submit();
            }

        </script>

        <title>Insert title here</title>
    </head>
    <body >
        <div align="left">
            <div  id="imgLoading" style="display: none" align="center" ><img src="../IMAGES/spinner.gif">กำลังประมวลผล...กรุณารอสักครู่</div>
            <div  id="showpage" style="display: '' ">
                <form name="report" method="post" action="../JSP/CS_REPORT.jsp" target="_blank">
                    <%
                        UserBean userbean = (UserBean) session.getAttribute("user");
                        DataBean_Screen_Process objs_p = new DataBean_Screen_Process();
                        HeaderScreen_Process h_p = new HeaderScreen_Process();
                        objs_p = h_p.selectheaderscreen_detail(objs_p, "BW_CS_033");
                        // _______________________________________________________________report
                        DataBean_Screen_Report objr_p = new DataBean_Screen_Report();
                        HeaderScreen_Report r_p = new HeaderScreen_Report();
                        objr_p = r_p.Fn_Report(objr_p, "S310");
                        path = objr_p.getPath();
                        lookup = objr_p.getLookup();
                        doc_eff_date = objr_p.getDoc_eff_date();
                        doc_no = objr_p.getDoc_no();
                        request.getParameter("doc_id");
                        System.out.println("doc_eff_date = " + doc_eff_date + "  |  " + "doc_no = " + doc_no);
                        //_______________________________________________________________report
                    %>
                    <input name="A_username" type="hidden" id="A_username" value="<%=userbean.getUsername()%>" size="30" readonly/>
                    <input type="hidden" id="chkNull" value="A_doc_date,A_cassava_date,A_cassava_date2,A_amount_cassava">
                    <input type="hidden" id="I_status" value="1"><!-- เป็นการเพิ่มข้อมูลเข้าไป-->
                    <input type="hidden" id="D_status" value="3"><!-- เป็นการ Delete ข้อมูลทั้งหมด -->
                    <input type="hidden" id="status_cancle" value=""><!-- status_cancle = 1 คือค่าที่นำมา Edit แต่ถ้า ="" จะเป็นการ Insert -->
                    <input type="hidden" id="child_ck" name="child_ck" value="A_doc_date">
                    <!---------------------------------------------------report----------------------------->
                    <input type="hidden" id="report_code" name="report_code"  value="<%=path%>">
                    <input type="hidden" id="type_report" name="type_report" value="2">
                    <input type="hidden" id="lookup" name="lookup" value="<%=lookup%>">
                    <input type="hidden" id="doc_eff_date" name="doc_eff_date" value="<%=doc_eff_date%>">
                    <input type="hidden" id="doc_no" name="doc_no" value="<%=doc_no%>">
                    <input type="hidden" id="doc_id" name="doc_no" value="">

                    <div class="container">
                        <div class="panel panel-primary">
                            <div class="panel-heading"> <span class="glyphicon glyphicon-tasks"></span>&nbsp;
                                <b>รายงานผลิตแป้งประจำวัน (BW_CS_033)</b>
                            </div>                        
                            <div class="panel-footer">                        
                                <div align="left">
                                    <table  cellpadding="0" cellspacing="0" >
                                        <tr>
                                            <td colspan="2" align="right"><b>หมายเลขเอกสาร : <%=doc_eff_date%></b></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" align="right"><b>วันที่มีผลบังคับใช้ : <%=doc_no%></b></td>
                                        </tr>
                                        <a name="top"></a>
                                        <tr>
                                            <td width="150" class="columnlabel1"><b>เลขที่เอกสาร</b></td>
                                            <td width="607" class="columnobject">
                                                <input name='A_doc_id' class='inputs' type="text" id="A_doc_id" value='' size='25' readonly/>
                                                &nbsp;<a href='#' onClick="openBrWindow('vd_product_report_daily_header&stadment=and+complete_flag+<>+\'Y\'', 33, 'Search_Doc_id_33.jsp');"><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE1' width='20' height='20' border='0' align='middle' ></a>&nbsp;&nbsp;
                                                วันที่เอกสาร*&nbsp;
                                                <input name='A_doc_date' class='inputs' type="text" id="A_doc_date" value='' size='10' />
                                                &nbsp;<a id='date_1'><img name='IMAGE2' src='../IMAGES/BUTTON/MAIN/CALENDAR20.png' border='0' align='absmiddle'></a><script type='text/javascript'>Calendar.setup({inputField: 'A_doc_date', ifFormat: '%d-%m-%Y', showsTime: false, button: 'date_1', singleClick: true, step: 1});</script>&nbsp;&nbsp;                                
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="columnlabel1">วันที่ส่งหัวมันสด&nbsp;ตั้งแต่</td>
                                            <td class="columnobject"><input name='A_cassava_date' class='inputs' type="text" id="A_cassava_date" value='' size='10' />
                                                &nbsp;<a id='date_2'><img name='IMAGE2' src='../IMAGES/BUTTON/MAIN/CALENDAR20.png' border='0' align='absmiddle'></a><script type='text/javascript'>Calendar.setup({inputField: 'A_cassava_date', ifFormat: '%d-%m-%Y', showsTime: false, button: 'date_2', singleClick: true, step: 1});</script>&nbsp;&nbsp;ถึง&nbsp;
                                                <input name='A_cassava_date2' class='inputs' type="text" id="A_cassava_date2" value='' size='10' />
                                                &nbsp;<a id='date_2_2'><img name='IMAGE2' src='../IMAGES/BUTTON/MAIN/CALENDAR20.png' border='0' align='absmiddle'></a><script type='text/javascript'>Calendar.setup({inputField: 'A_cassava_date2', ifFormat: '%d-%m-%Y', showsTime: false, button: 'date_2_2', singleClick: true, step: 1});</script>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="columnlabel1"><input type="button" class="cgcButton_9" value="มีจำนวน" onClick="getCalculator();"></td>
                                            <td class="columnobject"><input name='A_amount_cassava' class='inputs' type="text" id="A_amount_cassava" value='' size='10' />
                                                ตัน&nbsp;&nbsp;&nbsp;%ซื้อ
                                                <input name='A_percent_tapioca' class='inputs' type="text" id="A_percent_tapioca" value='' size='10'  />
                                                %&nbsp;&nbsp;&nbsp;แป้งที่ควรจะได้
                                                <input name='A_amount_tapioca' class='inputs' type="text" id="A_amount_tapioca" value='' size='10' />
                                                ตัน</td>
                                        </tr>
                                        <tr>
                                            <td class="columnlabel1">หักเปลือกสด</td>
                                            <td class="columnobject"><input name='A_fresh_skin' class='inputs' type="text" id="A_fresh_skin" value='' size='10' />
                                                ตัน&nbsp;&nbsp;&nbsp;หักเปลือกดิน
                                                <input name='A_soil_skin' class='inputs' type="text" id="A_soil_skin" value='' size='10' />
                                                ตัน</td>
                                        </tr>
                                        <tr>
                                            <td class="columnlabel1">จำนวนมันหลังจากหักเปลือก</td>
                                            <td class="columnobject"><input name='A_total_cassava' class='inputs' type="text" id="A_total_cassava" value='' size='10' />
                                                ตัน&nbsp;&nbsp;&nbsp;%
                                                <input name='A_percent_tapioca1' class='inputs' type="text" id="A_percent_tapioca1" value='' size='10' />
                                                %&nbsp;&nbsp;&nbsp;แป้งที่ควรจะได้
                                                <input name='A_amount_tapioca1' class='inputs' type="text" id="A_amount_tapioca1" value='' size='10' />
                                                ตัน</td>
                                        </tr>

                                        <tr>
                                            <td class="columnlabel1">&nbsp;</td>
                                            <td class="columnobject">&nbsp;</td>
                                        </tr>

                                        <tr>
                                            <td colspan='2' class='blankspace'>                                        
                                                <div align="center">
                                                    <b>พิมพ์รายงาน</b>
                                                    <!--input type='button' class="cgcButton_2" name='but1' value='  เพิ่ม  ' onClick="getId('A_doc_id').value == '' ? alert('กรุณาเลือกเอกสารก่อน') : goAddChild(URLsend('A_doc_id,I_status,A_username', 'BW_CS_Detail_033_1.jsp'));"/>
                                                    <input type='button' class="cgcButton_2" name='but1' value='  เพิ่ม  ' onClick="getId('A_doc_id').value == '' ? alert('กรุณาเลือกเอกสารก่อน') : goAddChild(URLsend('A_doc_id,I_status,A_username', 'BW_CS_Detail_033_1.jsp'));"/>
                                                    <input type='button' class="cgcButton_2" name='but1' value='  เพิ่ม  ' onClick="getId('A_doc_id').value == '' ? alert('กรุณาเลือกเอกสารก่อน') : goAddChild(URLsend('A_doc_id,I_status,A_username', 'BW_CS_Detail_033_1.jsp'));"/>
                                                    <input type='button' class="cgcButton_2" name='but1' value='  เพิ่ม  ' onClick="getId('A_doc_id').value == '' ? alert('กรุณาเลือกเอกสารก่อน') : goAddChild(URLsend('A_doc_id,I_status,A_username', 'BW_CS_Detail_033_1.jsp'));"/-->
                                                    <!--input type='button' class="cgcButton_2" input id='tapioca_cut1' name='tapioca_cut1' value='  ตัดมัน 1  '/-->
                                                    <input type='button' class="cgcButton_2" name='but1' value='  ตัดมัน 1  ' onClick="getId('A_doc_id').value === '' ? alert('กรุณาเลือกเอกสารก่อน') : send_print('BWRP_605');"/>
                                                    <input type='button' class="cgcButton_2" name='but2' value='  ตัดมัน 2  ' onClick="getId('A_doc_id').value === '' ? alert('กรุณาเลือกเอกสารก่อน') : send_print('BWRP_605_1');"/>
                                                </div>
                                            </td>
                                        </tr>                                        
                                        <tr>
                                            <td colspan="2" align="left">
                                                <div id="tabs">
                                                    <ul>
                                                        <li><a href="#tabs-1" onClick="showTableNonPopup('show', 'A_doc_id', '../SHOWDETAILSCREEN/BW_CS_Show033_1.jsp?doc_id=');">หยุดโม่</a></li>
                                                        <li><a href="#tabs-2" onClick="showTableNonPopup('show1', 'A_doc_id', '../SHOWDETAILSCREEN/BW_CS_Show033_2.jsp?doc_id=');">หยุดอบ</a></li>
                                                        <li><a href="#tabs-3" onClick="showTableNonPopup('show2', 'A_doc_id', '../SHOWDETAILSCREEN/BW_CS_Show033_3.jsp?doc_id=');">รายการเบิกแป้ง</a></li>
                                                        <li><a href="#tabs-4" onClick="showTableNonPopup('show3', 'A_doc_id', '../SHOWDETAILSCREEN/BW_CS_Show033_4.jsp?doc_id=');">รายการผลผลิตที่อบได้</a></li>
                                                        <li><a href="#tabs-5" onClick="showTableNonPopup('show4', 'A_doc_id', '../SHOWDETAILSCREEN/BW_CS_Show033_5.jsp?doc_id=');">น้ำแป้ง</a></li>
                                                    </ul>
                                                    <div id="tabs-1">
                                                        <div align="left" style="width: 100%;"> <table  cellpadding="0"  cellspacing="0"><tr>
                                                                <tr>
                                                                    <td class="columnlabel1">เริ่มโม่มันวันที่&nbsp;</td>
                                                                    <td class="columnobject"><input name='A_start_m_date' class='inputs' type="text" id="A_start_m_date" value='' size='10' />
                                                                        &nbsp;<a id='date_3'><img name='IMAGE2' src='../IMAGES/BUTTON/MAIN/CALENDAR20.png' border='0' align='absmiddle'></a><script type='text/javascript'>Calendar.setup({inputField: 'A_start_m_date', ifFormat: '%d-%m-%Y', showsTime: false, button: 'date_3', singleClick: true, step: 1});</script>&nbsp;&nbsp;เวลา
                                                                        <input name="A_start_m_time" class='inputs' type="text" id="A_start_m_time" size="10" onkeypress="Time_picker(this.id)">
                                                                        &nbsp;&nbsp;ถึงวันที่
                                                                        <input name='A_end_m_date' class='inputs' type="text" id="A_end_m_date" value='' size='10' />
                                                                        &nbsp;<a id='date_4'><img name='IMAGE2' src='../IMAGES/BUTTON/MAIN/CALENDAR20.png' border='0' align='absmiddle'></a><script type='text/javascript'>Calendar.setup({inputField: 'A_end_m_date', ifFormat: '%d-%m-%Y', showsTime: false, button: 'date_4', singleClick: true, step: 1});</script>&nbsp;&nbsp;เวลา
                                                                        <input name="A_end_m_time" class='inputs' type="text" id="A_end_m_time" size="10" onkeypress="Time_picker(this.id)">
                                                                        &nbsp;&nbsp;<input class="cgcButton_7" type="button" value=" = " id="cal_time1" onclick="Calculator_Time_A('A_start_m_date', 'A_end_m_date', 'A_start_m_time', 'A_end_m_time', 'A_m_time')">
                                                                        <input name="A_m_time" class='inputs' type="text" id="A_m_time" size="10" readonly>
                                                                        ซม.</td>
                                                                </tr>

                                                                <!-- ******************  Double ************************* -->
                                                                <tr>
                                                                    <td colspan="2" align="center">&nbsp;</td>
                                                                </tr></table></div>
                                                        <div align="center" style="width:100%;"><table width="100%" align="center" border="0" cellpadding="0" cellspacing="1" class="inner">
                                                                <tr>
                                                                    <td colspan="5" class="h_multi">หยุดโม่</td>
                                                                    <td colspan="5" class="btn_multi">
                                                                        <a href="#top">กลับด้านบน</a>
                                                                        <input type='button' class="cgcButton_4" name='but1' value='  เพิ่ม  ' onClick="getId('status_cancle').value == '' ? alert('กรุณาบันทึกเอกสารก่อน') : goAddChild(URLsend('A_doc_id,I_status,A_username', 'BW_CS_Detail_033_1.jsp'));"/>
                                                                        <input type='button' class="cgcButton_3" name='but2' value='  ลบ  ' onClick="goDelChild('33_1', 'BW_CS_Show033_1', 'chk_all1', 'ckbox_1', 'show')"/>                                        </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="row3" width="3%"><input name="chk_all1" type="checkbox" id="chk_all1" onClick="javascript:ckall(this.checked, 'ckbox_1');" value="chk_all"/></td>
                                                                    <td class="row3" width="6%">ครั้งที่&nbsp;</td>
                                                                    <td class="row3" width="9%">จากวันที่&nbsp;</td>
                                                                    <td class="row3" width="9%">จากเวลา&nbsp;</td>
                                                                    <td class="row3" width="9%">ถึงวันที่&nbsp;</td>
                                                                    <td class="row3" width="9%">ถึงเวลา&nbsp;</td>
                                                                    <td class="row3" width="10%">จำนวนชัวโมง&nbsp;</td>
                                                                    <td class="row3" width="15%">กิโลวัตต์ที่เริ่ม&nbsp;</td>
                                                                    <td class="row3" width="15%">กิโลวัตต์สิ้นสุด&nbsp;</td>
                                                                    <td class="row3" width="15%">กิโลวัตต์รวม&nbsp;</td>
                                                                    <!--<td class="row3" width="10%">กะ&nbsp;</td>-->
                                                                </tr>
                                                            </table>
                                                            <div style="width:100%; height: 150px; overflow: auto;" id="show" align="center">                                    </div><div align="center"> <table  cellpadding="0"  cellspacing="0"><tr>
                                                                        <td colspan="2" align="right" >หยุดโม่เป็นเวลารวม
                                                                            <input name="total_stop_milling_hour" class='inputs' type="text" id="A_total_stop_milling_hour" size="15">
                                                                            ชม.&nbsp;&nbsp;
                                                                            <input name="total_stop_kw" class='inputs' type="text" id="A_total_stop_kw" size="15">
                                                                            &nbsp;</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="columnlabel1">ใช้เวลาโม่เป็นเวลา</td>
                                                                        <td class="columnobject"><input name="A_total_milling_time" class='inputs' type="text" id="A_total_milling_time" size="15">
                                                                            ชม.&nbsp;&nbsp;&nbsp;อัตราการโม่มันต่อชั่วโมง
                                                                            <input name="A_milling_ratio" class='inputs' type="text" id="A_milling_ratio" size="15">
                                                                            ตัน/ชม.</td>
                                                                    </tr>

                                                                    <!-- ******************  Double ************************* -->
                                                                    <tr>
                                                                        <td colspan="2" align="center">&nbsp;</td>
                                                                    </tr></table></div> </div>
                                                    </div>
                                                    <div id="tabs-2" ><div align="left" style="width: 100%;"> <table  cellpadding="0"  cellspacing="0"><tr>
                                                                <tr>
                                                                    <td class="columnlabel1">เริ่มอบมันวันที่&nbsp;</td>
                                                                    <td class="columnobject"><input name='A_start_r_date' class='inputs' type="text" id="A_start_r_date" value='' size='10' />
                                                                        &nbsp;<a id='date_5'><img name='IMAGE2' src='../IMAGES/BUTTON/MAIN/CALENDAR20.png' border='0' align='absmiddle'></a><script type='text/javascript'>Calendar.setup({inputField: 'A_start_r_date', ifFormat: '%d-%m-%Y', showsTime: false, button: 'date_5', singleClick: true, step: 1});</script>&nbsp;&nbsp;เวลา
                                                                        <input name="A_start_r_time" class='inputs' type="text" id="A_start_r_time" size="10" onkeypress="Time_picker(this.id)">
                                                                        &nbsp;&nbsp;ถึงวันที่
                                                                        <input name='A_end_r_date' class='inputs' type="text" id="A_end_r_date" value='' size='10' />
                                                                        &nbsp;<a id='date_6'><img name='IMAGE2' src='../IMAGES/BUTTON/MAIN/CALENDAR20.png' border='0' align='absmiddle'></a><script type='text/javascript'>Calendar.setup({inputField: 'A_end_r_date', ifFormat: '%d-%m-%Y', showsTime: false, button: 'date_6', singleClick: true, step: 1});</script>&nbsp;&nbsp;เวลา
                                                                        <input name="A_end_r_time" class='inputs' type="text" id="A_end_r_time" size="10" onkeypress="Time_picker(this.id)">
                                                                        &nbsp;&nbsp;<input type="button" class="cgcButton_7" value=" = " id="cal_time1" onclick="Calculator_Time_A('A_start_r_date', 'A_end_r_date', 'A_start_r_time', 'A_end_r_time', 'A_r_time')">
                                                                        <input name="A_r_time" class='inputs' type="text" id="A_r_time" size="10"></td>
                                                                </tr>

                                                                <!-- ******************  Double ************************* -->
                                                                <tr>
                                                                    <td colspan="2" align="center">&nbsp;</td>
                                                                </tr></table></div>
                                                        <div align="center" style="width: 100%;"><table width="100%" align="center" border="0" cellpadding="0" cellspacing="1" class="inner">

                                                                <tr>
                                                                    <td colspan="5" class="h_multi">หยุดอบ</td>
                                                                    <td colspan="6" class="btn_multi">
                                                                        <a href="#top">กลับด้านบน</a>
                                                                        <input type='button' class="cgcButton_4" name='but6' value='  เพิ่ม  ' onClick="getId('status_cancle').value == '' ? alert('กรุณาบันทึกเอกสารก่อน') : goAddChild(URLsend('A_doc_id,I_status,A_username', 'BW_CS_Detail_033_2.jsp'));"/>
                                                                        <input type='button' class="cgcButton_3" name='but6' value='  ลบ  ' onClick="goDelChild('33_2', 'BW_CS_Show033_2', 'chk_all2', 'ckbox_2', 'show1')"/>                                      </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="row3" width="3%"><input name="chk_all2" type="checkbox" id="chk_all2" onClick="javascript:ckall(this.checked, 'ckbox_2');" value="chk_all2"/></td>
                                                                    <td class="row3" width="7%">ครั้งที่</td>
                                                                    <td class="row3" width="15%">จากวันที่&nbsp;</td>
                                                                    <td class="row3" width="15%">จากเวลา&nbsp;</td>
                                                                    <td class="row3" width="15%">ถึงวันที่</td>
                                                                    <td class="row3" width="15%">ถึงเวลา&nbsp;</td>
                                                                    <td class="row3" width="30%">จำนวนชั่วโมง&nbsp;</td>
                                                                </tr>
                                                            </table>
                                                            <div style="width:100%; height: 150px; overflow: auto;" id="show1" align="center">                                    </div><div align="center"> <table  cellpadding="0"  cellspacing="0"><tr>
                                                                        <td colspan="2" align="right">หยุดอบเป็นเวลารวม
                                                                            <input name="total_stop_roast_hour" class='inputs' type="text" id="total_stop_roast_hour" size="15">
                                                                            ชม.</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="columnlabel1">ใช่เวลาอบเป็นเวลา</td>
                                                                        <td class="columnobject"><input name="A_total_roast_time" class='inputs' type="text" id="A_total_roast_time" size="15">
                                                                            ชม.</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="columnlabel1">ใช้ไฟในการโม่</td>
                                                                        <td class="columnobject"><input name="A_epower_milling_from" class='inputs' type="text" id="A_epower_milling_from" size="15" onblur="Calculator_Epower_unit()">
                                                                            &nbsp;&nbsp;&nbsp;ถึง
                                                                            <input name="A_epower_milling_to" class='inputs' type="text" id="A_epower_milling_to" size="15" onblur="Calculator_Epower_unit()">
                                                                            &nbsp;=&nbsp;
                                                                            <input name="A_epower_unit" class='inputs' type="text" id="A_epower_unit" size="15" readonly>
                                                                            หน่วย</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="columnlabel1">ใช้น้ำ</td>
                                                                        <td class="columnobject"><input name="A_water_use" class='inputs' type="text" id="A_water_use" size="15">
                                                                            คิว&nbsp;&nbsp;&nbsp;&nbsp;กิโลวัตต์ที่ใช้จริง
                                                                            <input name="A_kw_use" class='inputs' type="text" id="A_kw_use" size="15" readonly>
                                                                            หน่วย</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="columnlabel1">ปริมาณน้ำ/ตันแป้ง</td>
                                                                        <td class="columnobject"><input name="A_water_per_tapioca" class='inputs' type="text" id="A_water_per_tapioca" size="15" readonly>
                                                                            m<sup>3</sup>/hr</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="columnlabel1">ปริมาณไฟ/ตันแป้ง</td>
                                                                        <td class="columnobject"><input name="A_kw_per_tapioca" class='inputs' type="text" id="A_kw_per_tapioca" size="15" readonly>
                                                                            กิโลวัตต์/ตันแป้ง</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="columnlabel1">&nbsp;</td>
                                                                        <td class="columnobject">&nbsp;</td>
                                                                    </tr></table></div> </div>
                                                    </div>
                                                    <div id="tabs-3" ><div align="center" style="width: 100%;"><table width="100%" align="center" border="0" cellpadding="0" cellspacing="1" class="inner">
                                                                <tr>
                                                                    <td colspan="5" class="h_multi">รายการเบิกแป้ง</td>
                                                                    <td colspan="6" class="btn_multi">
                                                                        <a href="#top">กลับด้านบน</a>
                                                                        <input type='button' class="cgcButton_4" name='but5' value='  เพิ่ม  ' onClick="getId('status_cancle').value === '' ? alert('กรุณาบันทึกเอกสารก่อน') : goAddChild(URLsend('A_doc_id,I_status,A_username', 'BW_CS_Detail_033_3.jsp'));"/>
                                                                        <input type='button' class="cgcButton_3" name='but5' value='  ลบ  ' onClick="goDelChild('33_3', 'BW_CS_Show033_3', 'chk_all3', 'ckbox_3', 'show2')"/>                                      </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="row3" width="3%"><input name="chk_all3" type="checkbox" id="chk_all3" onClick="javascript:ckall(this.checked, 'ckbox_3');" value="chk_all2"/></td>
                                                                    <td class="row3" width="7%">ลำดับ&nbsp;</td>
                                                                    <td class="row3" width="20%">รายการเบิกแป้ง</td>
                                                                    <td class="row3" width="15%">น้ำหนักบรรจุ(กก.)&nbsp;</td>
                                                                    <td class="row3" width="15%">จำนวน(ก/ส)</td>
                                                                    <td class="row3" width="15%">น้ำหนัก(ตัน)&nbsp;</td>
                                                                    <td class="row3" width="25%">หมายเหตุ&nbsp;</td>

                                                                </tr>
                                                            </table>
                                                            <div style="width:100%; height: 150px; overflow: auto;" id="show2" align="center"></div>
                                                            <div align="center"> <table  cellpadding="0"  cellspacing="0">
                                                                    <tr>
                                                                        <td colspan="2" align="right">รวม
                                                                            <input name="total_raw_weight" class='inputs' type="text" id="total_raw_weight" size="15"></td>
                                                                    </tr></table></div> </div></div>
                                                    <div id="tabs-4" ><div align="center" style="width: 100%"><table width="100%" align="center" border="0" cellpadding="0" cellspacing="1" class="inner">
                                                                <tr>
                                                                    <td colspan="5" class="h_multi">รายการผลผลิตที่อบได้</td>
                                                                    <td colspan="6" class="btn_multi">
                                                                        <a href="#top">กลับด้านบน</a>
                                                                        <input type='button' class="cgcButton_4" name='but3' value='  เพิ่ม  ' onClick="getId('status_cancle').value === '' ? alert('กรุณาบันทึกเอกสารก่อน') : goAddChild(URLsend('A_doc_id,I_status,A_username', 'BW_CS_Detail_033_4.jsp'));"/>
                                                                        <input type='button' class="cgcButton_3" name='but3' value='  ลบ  ' onClick="goDelChild('33_4', 'BW_CS_Show033_4', 'chk_all4', 'ckbox_4', 'show3')"/>
                                                                        <!--input type='button' class="cgcButton_7" name='but7' value='  แสดง  ' onClick="Display_Detail();"/-->
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="row3" width="3%"><input name="chk_all4" type="checkbox" id="chk_all4" onClick="javascript:ckall(this.checked, 'ckbox_4');" value="chk_all4"/></td>
                                                                    <td class="row3" width="7%">ลำดับ&nbsp;</td>
                                                                    <td class="row3" width="20%">รายการผลผลิตที่อบได้</td>
                                                                    <td class="row3" width="15%">น้ำหนักบรรจุ(กก.)&nbsp;</td>
                                                                    <td class="row3" width="15%">จำนวน(ก/ส)</td>
                                                                    <td class="row3" width="15%">น้ำหนัก(ตัน)&nbsp;</td>
                                                                    <td class="row3" width="25%">หมายเหตุ&nbsp;</td>
                                                                </tr>
                                                            </table>
                                                            <div style="width:100%; height: 150px; overflow: auto;" id="show3" align="center"></div>
                                                            <div align="center"> <table  cellpadding="0"  cellspacing="0">
                                                                    <tr>
                                                                        <td colspan="2" align="right">รวม
                                                                            <input name="total_prd_weight" class='inputs' type="text" id="total_prd_weight" size="15"></td>
                                                                    </tr>
                                                                </table></div>
                                                        </div></div>
                                                    <div id="tabs-5" >
                                                        <div align="center"> <table  cellpadding="0"  cellspacing="0">

                                                                <tr>
                                                                    <td class="columnlabel1">ตัดมันน้ำแป้งของวันที่&nbsp;</td>
                                                                    <td class="columnobject">
                                                                        <input name="A_starch_date_from" class='inputs' type="text" id="A_starch_date_from" size="15">&nbsp;<a id='date_7'><img name='IMAGE2' src='../IMAGES/BUTTON/MAIN/CALENDAR20.png' border='0' align='absmiddle'></a><script type='text/javascript'>Calendar.setup({inputField: 'A_starch_date_from', ifFormat: '%d-%m-%Y', showsTime: false, button: 'date_7', singleClick: true, step: 1});</script>&nbsp;&nbsp;-
                                                                        <input name="A_starch_date_to" class='inputs' type="text" id="A_starch_date_to" size="15">&nbsp;<a id='date_8'><img name='IMAGE2' src='../IMAGES/BUTTON/MAIN/CALENDAR20.png' border='0' align='absmiddle'></a><script type='text/javascript'>Calendar.setup({inputField: 'A_starch_date_to', ifFormat: '%d-%m-%Y', showsTime: false, button: 'date_8', singleClick: true, step: 1});</script>&nbsp;&nbsp;
                                                                        เหลือ<input class="cgcButton_7" type="button" value="ยอดยกมา" onClick="(getId('A_starch_date_from').value !== '' || getId('A_starch_date_to').value != '') ? getData_d_rawmatt_receive('../JSP/BW_CS_033.jsp?status_calculator2=6&A_starch_date_from=' + getId('A_starch_date_from').value + '&A_starch_date_to=' + getId('A_starch_date_to').value + '', 'A_starch_balance') : alert('กรุณาเลือกวันที่ตัดมันน้ำแป้ง');">
                                                                        <input name="A_starch_balance" class='inputs' type="text" id="A_starch_balance" size="15"></td>
                                                                </tr>
                                                            </table></div>
                                                        <div align="center" style="width: 100%;"><table width="100%" align="center" border="0" cellpadding="0" cellspacing="1" class="inner">
                                                                <tr>
                                                                    <td colspan="3" class="h_multi">น้ำแป้ง</td>
                                                                    <td colspan="4" class="btn_multi">
                                                                        <a href="#top">กลับด้านบน</a>
                                                                        <input type='button' class="cgcButton_4" name='but7' value='  เพิ่ม  ' onClick="getId('status_cancle').value === '' ? alert('กรุณาบันทึกเอกสารก่อน') : goAddChild(URLsend('A_doc_id,I_status,A_username', 'BW_CS_Detail_033_5.jsp'));"/>
                                                                        <input type='button' class="cgcButton_3" name='but7' value='  ลบ  ' onClick="goDelChild('33_5', 'BW_CS_Show033_5', 'chk_all5', 'ckbox_5', 'show4')"/>                                      </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="row3" width="3%"><input name="chk_all5" type="checkbox" id="chk_all5" onClick="javascript:ckall(this.checked, 'ckbox_5');" value="chk_all5"/></td>
                                                                    <td class="row3" width="7%">ลำดับที่</td>
                                                                    <td class="row3" width="10%">ถังที่</td>
                                                                    <td class="row3" width="20%">จำนวน(ลิตร)</td>
                                                                    <td class="row3" width="15%">ค่าBe'</td>
                                                                    <td class="row3" width="15%">ค่าS.G.</td>
                                                                    <td class="row3" width="40%">รวมแป้งแห้ง</td>
                                                                </tr>
                                                            </table>
                                                            <div style="width:100%; height: 150px; overflow: auto;" id="show4" align="center"></div>
                                                            <div align="center"> <table  cellpadding="0"  cellspacing="0">
                                                                    <tr>
                                                                        <td colspan="2" align="right">รวมแป้งแห้ง
                                                                            <input name="total_starch_weight" class='inputs' type="text" id="total_starch_weight" size="15">
                                                                            ตัน</td>
                                                                    </tr></table></div> </div></div>
                                                </div></td>
                                        </tr>

                                        <tr>
                                            <td colspan="2" align="center">&nbsp;</td>
                                        </tr>

                                        <tr>
                                            <td class="columnlabel1"><b>ผลผลิตรวมมันของวันที่</b></td>
                                            <td class="columnobject">
                                                <input name="A_cassava_prd_date" class='inputs' type="text" id="A_cassava_prd_date" size="15" onblur="getId('A_cassava_prd_date').value = getId('A_cassava_date').value">&nbsp;<a id='date_9'><img name='IMAGE2' src='../IMAGES/BUTTON/MAIN/CALENDAR20.png' border='0' align='absmiddle'></a><script type='text/javascript'>Calendar.setup({inputField: 'A_cassava_prd_date', ifFormat: '%d-%m-%Y', showsTime: false, button: 'date_9', singleClick: true, step: 1});</script>&nbsp;-&nbsp;
                                                <input name="A_cassava_prd_date2" class='inputs' type="text" id="A_cassava_prd_date2" size="15">&nbsp;<a id='date_10'><img name='IMAGE2' src='../IMAGES/BUTTON/MAIN/CALENDAR20.png' border='0' align='absmiddle'></a><script type='text/javascript'>Calendar.setup({inputField: 'A_cassava_prd_date2', ifFormat: '%d-%m-%Y', showsTime: false, button: 'date_10', singleClick: true, step: 1});</script>&nbsp;&nbsp;
                                                &nbsp;=&nbsp;
                                                <input name="A_qty_prd" class='inputs' type="text" id="A_qty_prd" size="15">
                                                ตัน</td>
                                        </tr>
                                        <tr>
                                            <td class="columnlabel1">คิดเป็น   % ผลผลิตที่ได้จริง</td>
                                            <td class="columnobject"><input name="A_percent_prd" class='inputs' type="text" id="A_percent_prd" size="15">
                                                %</td>
                                        </tr>
                                        <tr>
                                            <td class="columnlabel1">คิดผลต่าง   % ชื้อกับ % ผลผลิต</td>
                                            <td class="columnobject"><input name="A_percent_diff" class='inputs' type="text" id="A_percent_diff" size="15">
                                                %</td>
                                        </tr>
                                        <tr>
                                            <td class="columnlabel1">%   yield ที่ได้</td>
                                            <td class="columnobject"><input name="A_percent_yield" class='inputs' type="text" id="A_percent_yield" size="15">
                                                %&nbsp;&nbsp;&nbsp;&nbsp;หรือ
                                                <input name="A_yield_val" class='inputs' type="text" id="A_yield_val" size="15"></td>
                                        </tr>
                                        <tr>
                                            <td class="columnlabel1"><b>คิดจากมันที่หักเปลือกแล้ว</b></td>
                                            <td class="columnobject">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="columnlabel1">คิดเป็น   % ผลผลิตที่ได้จริง</td>
                                            <td class="columnobject"><input name="A_percent_prd1" class='inputs' type="text" id="A_percent_prd1" size="15">
                                                %</td>
                                        </tr>
                                        <tr>
                                            <td class="columnlabel1">คิดผลต่าง   % ชื้อกับ % ผลผลิต</td>
                                            <td class="columnobject"><input name="A_percent_diff1" class='inputs' type="text" id="A_percent_diff1" size="15">
                                                %</td>
                                        </tr>
                                        <tr>
                                            <td class="columnlabel1">%   yield ที่ได้</td>
                                            <td class="columnobject"><input name="A_percent_yield1" class='inputs' type="text" id="A_percent_yield1" size="15">
                                                %&nbsp;&nbsp;&nbsp;&nbsp;หรือ
                                                <input name="A_yield_val1" class='inputs' type="text" id="A_yield_val1" size="15"></td>
                                        </tr>
                                        <tr>
                                            <td class="columnlabel1">&nbsp;</td>
                                            <td class="columnobject">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="columnlabel1">ผู้รายงาน</td>
                                            <td class="columnobject"><input name="A_reporter_id" class='inputs' type="text" id="A_reporter_id" size="15">&nbsp;<a onclick="openBrWindow('Vemployee', 22, 'Search_Config2.jsp');" href="#"><img width="20" height="20" align="middle" border="0" name="IMAGE3" alt="ค้นหา" src="../IMAGES/BUTTON/MAIN/SEARCH20.png"/></a><input name="reporter_id_desc" class='inputs' type="text" id="reporter_id_desc" size="30"/></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" align="center">&nbsp;</td>
                                        </tr>
                                        <!-- ***************************************************** -->
                                        <tr>
                                            <td colspan='2' class='blankspace'>
                                                <br>
                                        <center><a href="#top">กลับด้านบน</a></center>
                                        <div align="center">
                                            <a href="javascript:;" onClick="cancle()"><img alt="" class="imgtransparent" src="../IMAGES/BTN_CANCEL_90.png" width="80" height="30" border="0"></a>
                                            <a href="javascript:;" onClick="AddHeader()"><img alt="" class="imgtransparent" src="../IMAGES/BTN_SAVE_90.png" width="80" height="30" border="0"></a>
                                            <a href="javascript:;" onClick="Delete()"><img alt="" class="imgtransparent" src="../IMAGES/BTN_DEL_90.png" width="80" height="30" border="0"></a>
                                            <!--a href="javascript:;"  onclick="Chknull()"><img alt="พิมพ์เอกสาร" class="imgtransparent" src="../IMAGES/BTN_PRINT_90.png" width="80" height="30" border="0"></a></div-->
                                            <br>                                </td>
                                            </tr>
                                            </table>
                                        </div>
                                </div>
                            </div>
                        </div>
                </form>
            </div>
        </div>
    </body>
</html>
