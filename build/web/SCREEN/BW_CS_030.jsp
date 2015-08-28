<%@page import="javax.swing.JOptionPane"%>
<%@page import="com.bw.bean.DataBeanD_production_header"%>
<%@page import="com.bw.DB.D_production_headerDAO"%>
<%@page import="com.bw.Util.HeaderScreen_Report"%>
<%@page import="com.bw.bean.DataBean_Screen_Report"%>
<%@page import="com.bw.Util.UtiDatabase"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.bw.bean.DataBean_Screen_Process"%>
<%@page import="com.bw.Util.HeaderScreen_Process"%>
<%@page import="com.bw.bean.UserBean"%>
<html>
    <%
        response.setHeader("Cache-Control", "no-cache");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", -1);
    %>
    <%!    String path, lookup, doc_eff_date, doc_no,
                doc_id, doc_date, roast_qty, pack_qty, date_1, date_2, date_3, date_4,
                percent_p1, percent_p2, percent_p3, percent_p4,
                percent_y1, percent_y2, percent_y3, percent_y4,
                reporter_id, checker_id, approver_id, date_5, date_6, date_7, date_8;

    %>
    <head>
        <META Http-Equiv="Cache-Control" Content="no-cache">
        <META Http-Equiv="Pragma" Content="no-cache">
        <script language="javascript" src="../JS/myAjaxFramework.js"></script>
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
        <script type="text/javascript" src="../JS/jscalendar/calendar-setup.js"></script>
        <script type="text/javascript" src="../JS/jquery/jquery-1.6.2.min.js"></script>
        <script type="text/javascript" src="../JS/jquery/jquery-ui-1.8.17.custom.min.js"></script>

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

            function Chknull() {
                if (document.getElementById('A_doc_id').value === '') {
                    alert('กรุณาใส่ข้อมูลเลขที่เอกสาร');
                } else {
                    document.report.submit();
                }
            }

            function send_print() {
                if (document.getElementById('A_doc_id').value === '') {
                    alert('กรุณาใส่ข้อมูลเลขที่เอกสาร');
                } else {

                    //getId("doc_id").value = A_doc_id;
                    getId("report_code").value = "BWRP_600";
                    //getId("doc_no").value = getId('doc_no').value;
                    //getId("doc_eff_date").value = getId('doc_eff_date').value;
                    document.report.submit();
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
                        /* cancelAction();
                         getId("status_cancle").value = "";
                         getId("child_ck").value = "";
                         getId("show").innerHTML = "";
                         getId("doc_id").disabled = false;*/
                        location.replace("BW_CS_030.jsp");
                    }
                    location.replace("BW_CS_030.jsp");

                }

            }
            function ckall(Value)//ทำการกดปุ้ม check ทั้งหมดใช้หรือไม่
            {

                for (var i = 0; i < document.getElementsByName("ckbox").length; i++)
                {
                    document.getElementsByName("ckbox")[i].checked = Value;
                }

            }
            function OpenEdit(URLSend)
            {
                window.open(URLSend[0]);
            }
            function add()
            {
                var strID = "";
                strID = getIDElements('input', 'A_');
                strID = strID.substr(0, strID.length - 1);
                //alert(strID);
                confirmDialogSave(URLsend('chkNull,' + strID, '../JSP/BW_CS_030.jsp'));
                getId("status_cancle").value = "";
            }
            function del() {
                confirmDialogDelete(URLsend('A_doc_id,D_status', '../JSP/BW_CS_030.jsp'));
                getId("status_cancle").value = "";
            }
            function Unload()
            {

                if (getId("doc_id").disabled === true && getId("status_cancle").value !== "1" && getId("total_weight_chk").value === "0") {
                    var r = confirm("คุณได้ทำการเปลี่ยนหน้าคุณต้องการบันทึกข้อมูลทั้งหมดใช่หรือไม่");
                    if (r === true) {
                        getSave(URLsend('chkNull,doc_id,doc_date,time_from,time_to,runner_id,runner_id_desc,shift,burn_no,wh_in,wh_out,total_weight', '../JSP/CS_027.jsp'));
                    }

                    else {
                        var SURL = "../JSP/CS_028.jsp?status_d=3&chk_all=1";
                        SURL = SURL + "&doc_id=" + getId("doc_id").value;
                        Delete_Line_no(SURL);
                    }
                }
                else if (getId("doc_id").disabled === true && getId("status_cancle").value === "1" && getId("total_weight_chk").value !== getId("total_weight").value) {
                    getSave(URLsend('chkNull,doc_id,doc_date,time_from,time_to,runner_id,runner_id_desc,shift,burn_no,wh_in,wh_out,total_weight', '../JSP/CS_027.jsp'));
                }
            }
            function OpenDoc_id()
            {
                openBrWindow('vd_production_header&stadment=and+complete_flag+=+\'N\'', 30, 'Search_Config2.jsp');
                //getId("status_cancle").value = "1";
            }
            function sub_Screen(page_number) {
                if (getId("A_doc_id").value !== "") {
                    location.replace(page_number + '.jsp?A_doc_id=' + getId('A_doc_id').value + "&A_doc_date=" + getId('A_doc_date').value + "");
                } else {
                    alert("กรุณาเลือกเอกสาร");
                }
            }

        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../CSS/MENU.css" rel="stylesheet" type="text/css">
        <link href="../CSS/BT.css" rel="stylesheet" type="text/css">  <link href="../CSS/component.css" rel="stylesheet" type="text/css"> 
        <link href="../CSS/cgc_button.css" rel="stylesheet" type="text/css">        
        <title>Insert title here</title>
    </head>
    <body >
        <form name="report" method="post" action="../JSP/CS_REPORT.jsp" target="_blank">
            <%
                //JOptionPane.showConfirmDialog(null, request.getQueryString());
                UserBean userbean = (UserBean) session.getAttribute("user");
                DataBean_Screen_Process objs_p = new DataBean_Screen_Process();
                HeaderScreen_Process h_p = new HeaderScreen_Process();
                objs_p = h_p.selectheaderscreen_process(objs_p, "BW_CS_030");
                UtiDatabase objuti = new UtiDatabase();
                // _______________________________________________________________report
                DataBean_Screen_Report objr_p = new DataBean_Screen_Report();
                HeaderScreen_Report r_p = new HeaderScreen_Report();
                objr_p = r_p.Fn_Report(objr_p, "S311");
                path = objr_p.getPath();
                lookup = objr_p.getLookup();
                doc_eff_date = objr_p.getDoc_eff_date();
                doc_no = objr_p.getDoc_no();
                //_______________________________________________________________report
                if (request.getParameter("A_doc_id") != null) {
                    D_production_headerDAO objedit = new D_production_headerDAO();
                    DataBeanD_production_header pojo_bean = new DataBeanD_production_header();
                    pojo_bean = objedit.Return_Edit(request.getParameter("A_doc_id"));
                    doc_id = pojo_bean.getDoc_id();
                    doc_date = pojo_bean.getDoc_date();
                    roast_qty = pojo_bean.getRoast_qty();
                    pack_qty = pojo_bean.getPack_qty();
                    date_1 = pojo_bean.getDate_1();
                    date_2 = pojo_bean.getDate_2();
                    date_3 = pojo_bean.getDate_3();
                    date_4 = pojo_bean.getDate_4();
                    date_5 = pojo_bean.getDate_5();
                    date_6 = pojo_bean.getDate_6();
                    date_7 = pojo_bean.getDate_7();
                    date_8 = pojo_bean.getDate_8();
                    percent_p1 = pojo_bean.getPercent_p1();
                    percent_p2 = pojo_bean.getPercent_p2();
                    percent_p3 = pojo_bean.getPercent_p3();
                    percent_p4 = pojo_bean.getPercent_p4();
                    percent_y1 = pojo_bean.getPercent_y1();
                    percent_y2 = pojo_bean.getPercent_y2();
                    percent_y3 = pojo_bean.getPercent_y3();
                    percent_y4 = pojo_bean.getPercent_y4();
                    reporter_id = pojo_bean.getReporter_id();
                    checker_id = pojo_bean.getChecker_id();
                    approver_id = pojo_bean.getApprove_id();
                    roast_qty = pojo_bean.getRoast_qty();

                } else {
                    doc_id = "";
                    doc_date = "";
                    roast_qty = "";
                    pack_qty = "";
                    date_1 = "";
                    date_2 = "";
                    date_3 = "";
                    date_4 = "";
                    date_5 = "";
                    date_6 = "";
                    date_7 = "";
                    date_8 = "";
                    percent_p1 = "";
                    percent_p2 = "";
                    percent_p3 = "";
                    percent_p4 = "";
                    percent_y1 = "";
                    percent_y2 = "";
                    percent_y3 = "";
                    percent_y4 = "";
                    reporter_id = "";
                    checker_id = "";
                    approver_id = "";
                }
            %>

            <input name="username" type="hidden" id="username" value="<%=userbean.getUsername()%>" size="30" readonly/>
            <input type="hidden" id="date_ck" name="date_ck" value="">
            <input type="hidden" id="child_ck" name="child_ck" value="">
            <input type="hidden" id="chkNull" value="A_doc_date">
            <input type="hidden" id="I_status" value="1"><!-- เป็นการเพิ่มข้อมูลเข้าไป-->
            <input type="hidden" id="D_status" value="3"><!-- เป็นการ Delete ข้อมูลทั้งหมด -->
            <input type="hidden" id="status_cancle" value="<%=request.getParameter("status_cancle") != null ? request.getParameter("status_cancle") : ""%>"><!-- status_cancle = 1 คือค่าที่นำมา Edit แต่ถ้า ="" จะเป็นการ Insert -->
            <!---------------------------------------------------report----------------------------->
            <input type="hidden" id="report_code" name="report_code"  value="<%=path%>">
            <input type="hidden" id="type_report" name="type_report" value="2">
            <input type="hidden" id="lookup" name="lookup" value="<%=lookup%>">
            <input type="hidden" id="doc_eff_date" name="doc_eff_date" value="<%=doc_eff_date%>">
            <input type="hidden" id="doc_no" name="doc_no" value="<%=doc_no%>">

            <div class="container">
                <div class="panel panel-primary">
                    <div class="panel-heading"> <span class="glyphicon glyphicon-tasks"></span>&nbsp;
                        <b>รายงานการผลิตแป้งประจำวันII (BW_CS_030)</b>
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
                                <tr>

                                    <td width="150" class="columnlabel1"><b>เลขที่เอกสาร*</b>&nbsp;</td>
                                    <td width="607" class="columnobject">
                                        <input name='A_doc_id' class='inputs' type="text" id="A_doc_id" value='<%=doc_id%>' size='20' readonly/>
                                        &nbsp;<a href='#' onClick="OpenDoc_id()"  ><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE1' width='20' height='20' border='0' align='middle' ></a>&nbsp;&nbsp;
                                        วันที่เอกสาร*&nbsp;
                                        <input name='A_doc_date' class='inputs' type="text" id="A_doc_date" value='<%=doc_date%>' size='10' readonly="readonly"/>
                                        &nbsp;<a id='date_1'><img name='IMAGE2' src='../IMAGES/BUTTON/MAIN/CALENDAR20.png' border='0' align='absmiddle'></a><script type='text/javascript'>Calendar.setup({inputField: 'A_doc_date', ifFormat: '%d-%m-%Y', showsTime: false, button: 'date_1', singleClick: true, step: 1});</script></td>
                                </tr>
                                <tr>
                                    <td class="columnlabel1">
                                        <input type="button"  class="cgcButton_9"  id="bt1" onClick="sub_Screen('BW_CS_Detail_030_1');" value=" รายงานการอบแป้ง "/></td>
                                    <td class="columnobject">ยอดรวมผลผลิตที่ได้
                                        <input class='inputs' type="text" name="A_roast_qty" id="A_roast_qty" value="<%=roast_qty%>">
                                        ตัน</td>
                                </tr>
                                <tr>
                                    <td class="columnlabel1"><input type="button"  class="cgcButton_9" id="bt1" onClick="sub_Screen('BW_CS_Detail_030_2');" value="รายงานการถ่ายแป้ง"/></td>
                                    <td class="columnobject">ยอดรวมผลผลิตที่ได้
                                        <input class='inputs' type="text" name="A_pack_qty" id="A_pack_qty" value ="<%=pack_qty%>">
                                        ตัน</td>
                                </tr>
                                <tr>
                                    <td class="columnlabel1"><input type="button" class="cgcButton_9" id="bt1" onClick="sub_Screen('BW_CS_Detail_030_3');" value="  รายงานการโม่มัน  "/></td>
                                    <td class="columnobject">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="columnlabel1">&nbsp;</td>
                                    <td class="columnobject">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan='2' class='blankspace'></td>
                                </tr>
                                <tr>
                                    <td height="200" colspan="2" align="center">
                                        <div style="width:100%;">
                                            <table width="100%" align="center" border="0" cellpadding="0" cellspacing="1" class="inner">
                                                <tr>
                                                    <td colspan="4" class="h_multi">รายงานการตัดมัน</td>
                                                    <td colspan="5" class="btn_multi">&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="row3">&nbsp;</td>
                                                    <td class="row3">ลำดับ</td>
                                                    <td class="row3">ตัดมันวันที่&nbsp;</td>
                                                    <td class="row3">%ผลิต</td>
                                                    <td class="row3">%Yield</td>
                                                </tr>
                                                <tr>
                                                    <td class="row3">&nbsp;</td>
                                                    <td class="row3">1<input type="button" class="cgcButton_8" value=" ดึงข้อมูล " id="bt_1" onClick="(getId('A_date_1').value != '' || getId('A_date_5').value != '') ? getData_d_rawmatt_receive('../JSP/BW_CS_030.jsp?status_calculator=4&A_date_from=' + getId('A_date_1').value + '&A_date_to=' + getId('A_date_5').value + '', 'A_percent_p1,A_percent_y1') : alert('กรุณาเลือกวันที่ตัดมันน้ำแป้ง 1');"></td>
                                                    <td class="row3">
                                                        <input name="A_date_1" class='inputs' type="text" id="A_date_1" size="10" value="<%=date_1%>">
                                                        &nbsp;<a id='date_2'><img name='IMAGE2' src='../IMAGES/BUTTON/MAIN/CALENDAR20.png' border='0' align='absmiddle'></a><script type='text/javascript'>Calendar.setup({inputField: 'A_date_1', ifFormat: '%d-%m-%Y', showsTime: false, button: 'date_2', singleClick: true, step: 1});</script>
                                                        -
                                                        <input name="A_date_5" class='inputs' type="text" id="A_date_5" size="10" value="<%=date_5%>">
                                                        <a id='date_6'><img name='IMAGE2' src='../IMAGES/BUTTON/MAIN/CALENDAR20.png' border='0' align='absmiddle'></a><script type='text/javascript'>Calendar.setup({inputField: 'A_date_5', ifFormat: '%d-%m-%Y', showsTime: false, button: 'date_6', singleClick: true, step: 1});</script>
                                                    </td>
                                                    <td class="row3"><input name="A_percent_p1" class='inputs' type="text" id="A_percent_p1" size="10" value="<%=percent_p1%>"></td>
                                                    <td class="row3"><input name="A_percent_y1" class='inputs' type="text" id="A_percent_y1" size="10" value="<%=percent_y1%>"></td>
                                                </tr>
                                                <tr>
                                                    <td class="row3">&nbsp;</td>
                                                    <td class="row3">2<input type="button" class="cgcButton_8" value=" ดึงข้อมูล " id="bt_1" onClick="(getId('A_date_2').value != '' || getId('A_date_6').value != '') ? getData_d_rawmatt_receive('../JSP/BW_CS_030.jsp?status_calculator=4&A_date_from=' + getId('A_date_2').value + '&A_date_to=' + getId('A_date_6').value + '', 'A_percent_p2,A_percent_y2') : alert('กรุณาเลือกวันที่ตัดมันน้ำแป้ง 2');"></td>
                                                    <td class="row3">
                                                        <input name="A_date_2" class='inputs' type="text" id="A_date_2" size="10" value="<%=date_2%>">
                                                        &nbsp;<a id='date_3'><img name='IMAGE2' src='../IMAGES/BUTTON/MAIN/CALENDAR20.png' border='0' align='absmiddle'></a><script type='text/javascript'>Calendar.setup({inputField: 'A_date_2', ifFormat: '%d-%m-%Y', showsTime: false, button: 'date_3', singleClick: true, step: 1});</script>
                                                        -
                                                        <input name="A_date_6" class='inputs' type="text" id="A_date_6" size="10" value="<%=date_6%>">
                                                        <a id='date_7'><img name='IMAGE2' src='../IMAGES/BUTTON/MAIN/CALENDAR20.png' border='0' align='absmiddle'></a><script type='text/javascript'>Calendar.setup({inputField: 'A_date_6', ifFormat: '%d-%m-%Y', showsTime: false, button: 'date_7', singleClick: true, step: 1});</script>
                                                    </td>
                                                    <td class="row3"><input name="A_percent_p2" class='inputs' type="text" id="A_percent_p2" size="10" value="<%=percent_p2%>"></td>
                                                    <td class="row3"><input name="A_percent_y2" class='inputs' type="text" id="A_percent_y2" size="10" value="<%=percent_y2%>"></td>
                                                </tr>
                                                <tr>
                                                    <td class="row3">&nbsp;</td>
                                                    <td class="row3">3<input type="button" class="cgcButton_8" value=" ดึงข้อมูล " id="bt_1" onClick="(getId('A_date_3').value != '' || getId('A_date_7').value != '') ? getData_d_rawmatt_receive('../JSP/BW_CS_030.jsp?status_calculator=4&A_date_from=' + getId('A_date_3').value + '&A_date_to=' + getId('A_date_7').value + '', 'A_percent_p3,A_percent_y3') : alert('กรุณาเลือกวันที่ตัดมันน้ำแป้ง 3');"></td>
                                                    <td class="row3">
                                                        <input name="A_date_3" class='inputs' type="text" id="A_date_3" size="10" value="<%=date_3%>">
                                                        &nbsp;<a id='date_4'><img name='IMAGE2' src='../IMAGES/BUTTON/MAIN/CALENDAR20.png' border='0' align='absmiddle'></a><script type='text/javascript'>Calendar.setup({inputField: 'A_date_3', ifFormat: '%d-%m-%Y', showsTime: false, button: 'date_4', singleClick: true, step: 1});</script>
                                                        -
                                                        <input name="A_date_7" class='inputs' type="text" id="A_date_7" size="10" value="<%=date_7%>">
                                                        <a id='date_8'><img name='IMAGE2' src='../IMAGES/BUTTON/MAIN/CALENDAR20.png' border='0' align='absmiddle'></a><script type='text/javascript'>Calendar.setup({inputField: 'A_date_7', ifFormat: '%d-%m-%Y', showsTime: false, button: 'date_8', singleClick: true, step: 1});</script>
                                                    </td>
                                                    <td class="row3"><input name="A_percent_p3" class='inputs' type="text" id="A_percent_p3" size="10" value="<%=percent_p3%>"></td>
                                                    <td class="row3"><input name="A_percent_y3" class='inputs' type="text" id="A_percent_y3" size="10" value="<%=percent_y3%>"></td>
                                                </tr>
                                                <tr>
                                                    <td class="row3">&nbsp;</td>
                                                    <td class="row3">4<input type="button" class="cgcButton_8" value=" ดึงข้อมูล " id="bt_1" onClick="(getId('A_date_4').value != '' || getId('A_date_8').value != '') ? getData_d_rawmatt_receive('../JSP/BW_CS_030.jsp?status_calculator=4&A_date_from=' + getId('A_date_4').value + '&A_date_to=' + getId('A_date_8').value + '', 'A_percent_p4,A_percent_y4') : alert('กรุณาเลือกวันที่ตัดมันน้ำแป้ง 4');"></td>
                                                    <td class="row3">
                                                        <input name="A_date_4" class='inputs' type="text" id="A_date_4" size="10" value="<%=date_4%>">
                                                        &nbsp;<a id='date_5'><img name='IMAGE2' src='../IMAGES/BUTTON/MAIN/CALENDAR20.png' border='0' align='absmiddle'></a><script type='text/javascript'>Calendar.setup({inputField: 'A_date_4', ifFormat: '%d-%m-%Y', showsTime: false, button: 'date_5', singleClick: true, step: 1});</script>
                                                        -
                                                        <input name="A_date_8" class='inputs' type="text" id="A_date_8" size="10" value="<%=date_8%>">
                                                        <a id='date_9'><img name='IMAGE2' src='../IMAGES/BUTTON/MAIN/CALENDAR20.png' border='0' align='absmiddle'></a><script type='text/javascript'>Calendar.setup({inputField: 'A_date_8', ifFormat: '%d-%m-%Y', showsTime: false, button: 'date_9', singleClick: true, step: 1});</script>
                                                    </td>
                                                    <td class="row3"><input name="A_percent_p4" class='inputs' type="text" id="A_percent_p4" size="10" value="<%=percent_p4%>"></td>
                                                    <td class="row3"><input name="A_percent_y4" class='inputs' type="text" id="A_percent_y4" size="10" value="<%=percent_y4%>"></td>
                                                </tr>
                                            </table>
                                        </div>                               </td>
                                </tr>
                                <tr>
                                    <td class="columnlabel1">&nbsp;</td>
                                    <td class="columnobject">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="columnlabel1">ผู้รายงาน</td>
                                    <td class="columnobject"><input name='A_reporter_id' class='inputs' type="text" id="A_reporter_id" value='<%=reporter_id%>' size='10' readonly="readonly" />
                                        &nbsp;&nbsp;&nbsp;<a href='#' onClick="openBrWindow('Vemployee&stadment=and+emp_id+in(\'55045\')', 30, 'Search_Config2.jsp');"><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE3' width='20' height='20' border='0' align='middle' ></a>&nbsp;&nbsp;&nbsp;
                                        <input name='reporter_id_desc' class='inputs' type="text" id="reporter_id_desc" value='' size='30' readonly="readonly" />                              </td>
                                </tr>
                                <tr>
                                    <td class="columnlabel1">ผู้ตรวจสอบ</td>
                                    <td class="columnobject"><input name="A_checker_id" class='inputs' type="text" id="A_checker_id" value='<%=checker_id%>' size='10' readonly="readonly" />
                                        &nbsp;&nbsp;&nbsp;<a href='#' onClick="openBrWindow('Vemployee1&stadment=and+emp_id+in(\'33011\',\'45093\')', 30, 'Search_Config2.jsp');"><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE3' width='20' height='20' border='0' align='middle' ></a>&nbsp;&nbsp;&nbsp;
                                        <input name='checker_id_desc' class='inputs' type="text" id="checker_id_desc" value='' size='30' readonly="readonly" />                              </td>
                                </tr>
                                <tr>
                                    <td class="columnlabel1">ผู้ตรวจสอบ                                 </td>
                                    <td class="columnobject"><input name='A_approver_id' class='inputs' type="text" id="A_approver_id" value='<%=approver_id%>' size='10' readonly="readonly" />
                                        &nbsp;&nbsp;&nbsp;<a href='#' onClick="openBrWindow('Vemployee2&stadment=and+emp_id+in(\'42035\')', 30, 'Search_Config2.jsp');"><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE3' width='20' height='20' border='0' align='middle' ></a>&nbsp;&nbsp;&nbsp;
                                        <input name='approver_id_desc' class='inputs' type="text" id="approver_id_desc" value='' size='30' readonly="readonly" /></td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="right"></td>
                                </tr>
                                <tr>
                                    <td colspan='2' class='blankspace'>
                                        <br>
                                        <div align="center">
                                            <a href="javascript:;" onClick="cancle()"><img alt="" class="imgtransparent" src="../IMAGES/BTN_CANCEL_90.png" width="80" height="30" border="0"></a>
                                            <a href="javascript:;" onClick="add()"><img alt="" class="imgtransparent" src="../IMAGES/BTN_SAVE_90.png" width="80" height="30" border="0"></a>
                                            <a href="javascript:;" onClick="del()"><img alt="" class="imgtransparent" src="../IMAGES/BTN_DEL_90.png" width="80" height="30" border="0"></a>
                                            <a href="javascript:;"  onclick="send_print()"><img alt="พิมพ์เอกสาร" class="imgtransparent" src="../IMAGES/BTN_PRINT_90.png" width="80" height="30" border="0"></a></div>
                                        <br>                                </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </body>
</html>