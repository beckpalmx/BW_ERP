
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.bw.Util.UtiDatabase"%>
<%@page import="com.bw.Util.HeaderScreen_Report"%>
<%@page import="com.bw.bean.DataBean_Screen_Report"%>
<%@page import="com.bw.bean.UserBean"%>

<%!    String path, lookup, doc_eff_date, doc_no, sub_menu_id;
%>
<%
    lookup = (String) request.getParameter("lookup");
    path = (String) request.getParameter("report_code");

    DataBean_Screen_Report objr_p = new DataBean_Screen_Report();
    HeaderScreen_Report r_p = new HeaderScreen_Report();
    objr_p = r_p.Fn_Report(objr_p, path);
    sub_menu_id = objr_p.getSub_menu_id();
    doc_eff_date = objr_p.getDoc_eff_date();
    doc_no = objr_p.getDoc_no();
%>   
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BW ERP</title>
        <link href="../CSS/MENU.css" rel="stylesheet" type="text/css">
        <link href="../CSS/BT.css" rel="stylesheet" type="text/css">  <link href="../CSS/component.css" rel="stylesheet" type="text/css"> 
        <link href="../CSS/cgc_button.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" media="all" href="../JS/jscalendar/skins/aqua/aqua.css" title="Aua" />
        <!-- main calendar program -->
        <script type="text/javascript" src="../JS/jscalendar/calendar.js"></script>
        <!-- language for the calendar -->
        <script type='text/javascript' src='../JS/jscalendar/lang/calendar-th.js'></script>
        <!-- the following script defines the Calendar.setup helper function, which makes
               adding a calendar a matter of 1 or 2 lines of code. -->
        <script type="text/javascript" src="../JS/jscalendar/calendar-setup.js"></script>
        <script language="javascript" src="../JS/myAjaxFramework.js"></script>


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

            function openBrown(tableID) {
                //alert("../JSP/Search_Report.jsp?table="+getId(tableID).value+"");
                window.open("Search_Report.jsp?table=" + tableID);
            }
            < !--
                    var my_window = null;
            function MM_openBrWindow(theURL, winName, features) { //v2.0
                if (my_window === null) {
                    my_window = window.open(theURL, winName, features);
                } else {
                    closepopup();
                    my_window = window.open(theURL, winName, features);
                }
            }
            //-->

            function CheckDate() {
                var da1 = new Date(document.report.date_f.value);
                var da2 = new Date(document.report.date_t.value);
                var d1 = document.report.date_f.value;
                var d2 = document.report.date_t.value;
                if (da1 < da2 || d1 === '' || d2 === '') {
                    if (d1 !== '' || d2 !== '') {
                        if (d1 !== '') {
                            if (d2 === '') {
                                alert("กรุณาใส่ข้อมูลวันที่สิ้นสุดการออกรายงาน");
                            } else {
                                document.report.date_form.value = d1;
                                document.report.date_to.value = d2;
                                document.report.submit();
                            }
                        } else if (d2 !== '') {
                            if (d1 === '') {
                                alert("กรุณาใส่ข้อมูลวันที่เริ่มต้นการออกรายงาน");
                            } else {
                                document.report.date_form.value = d1;
                                document.report.date_to.value = d2;
                                document.report.submit();
                            }
                        }
                    } else {
                        document.report.submit();
                    }
                } else {
                    alert('กรุณาใส่วันที่ให้ถูกต้อง!!');
                }
            }
        </script>
    </head>
    <body onunload="closepopup()">
        <form name="report" method="post" action="../JSP/CS_REPORT.jsp" target="_blank">
            <input type="hidden" name="report_code" value="<%=path%>">
            <input type="hidden" name="type_report" value="4">            
            <input type="hidden" name="lookup" value="<%=lookup%>">
            <input type="hidden" name="sub_menu_id" value="<%=sub_menu_id%>">
            <input type="hidden" name="doc_eff_date" value="<%=doc_eff_date%>">
            <input type="hidden" name="doc_no" value="<%=doc_no%>">    
            <input type="hidden" name="date_form" value="">
            <input type="hidden" name="date_to" value="">
            <div class="container">
                <div class="panel panel-primary">
                    <div class="panel-heading"> <span class="glyphicon glyphicon-print"></span>&nbsp;
                        <b>รายงาน 4 (CS_REPORT_4)</b>
                    </div>                        
                    <div class="panel-footer">    
                        <div align="left">
                            <table  cellpadding="0" cellspacing="0" >
                                <tr>
                                    <td colspan="2"  class="blankspace"></td>
                                </tr>
                                <tr>
                                    <td colspan='2'><b>กำหนดเงื่อนไข การออกรายงาน</b></td>
                                </tr>
                                </tr>
                                <tr>
                                    <td class='columnlabel1'>Date (dd-mm-yyyy) : &nbsp;</td><td class='columnobject'><input name='date_f' class='inputs' type="text" id="date_f" value='' readonly/>
                                        &nbsp;<a id='date_1' href="javascript:;"><img name='IMAGE4' src='../IMAGES/BUTTON/MAIN/CALENDAR20.png' border='0' align='absmiddle'></a>
                                        <script type='text/javascript'>Calendar.setup({inputField: 'date_f', ifFormat: '%d-%m-%Y', showsTime: false, button: 'date_1', singleClick: true, step: 1});</script>
                                        To &nbsp;<input name='date_t' class='inputs' type="text" id="date_t" value='' disabled/>
                                        &nbsp;<a id='date_2' href="javascript:;"><img name='IMAGE4' src='../IMAGES/BUTTON/MAIN/CALENDAR20.png' border='0' align='absmiddle'></a>
                                        <script type='text/javascript'>Calendar.setup({inputField: 'date_t', ifFormat: '%d-%m-%Y', showsTime: false, button: 'date_2', singleClick: true, step: 1});</script>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan='2' class='blankspace' ></td>
                                </tr>

                                <tr>
                                    <td colspan='2' class='blankspace' align="right">
                                        <input type="button" class="cgcButton_11" name="myBut" value=" พิมพ์รายงาน  " onclick="CheckDate()"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan='2' class='blankspace' ></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </body>
</html>
