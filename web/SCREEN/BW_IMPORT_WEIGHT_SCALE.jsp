<%-- 
    Document   : BW_IMPORT_WEIGHT_SCALE
    Created on : Sep 16, 2014, 4:07:54 PM
    Author     : beckpalmx
--%>
<!DOCTYPE HTML>
<%@page import="com.bw.Util.HeaderScreen_Report_Param"%>
<%@page import="com.bw.bean.ReportParamBean"%>
<%@page import="com.bw.Util.HeaderScreen_Report"%>
<%@page import="com.bw.bean.DataBean_Screen_Report"%>
<%@page import="com.bw.Util.UtiDatabase"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.bw.bean.DataBean_Screen_Process"%>
<%@page import="com.bw.Util.HeaderScreen_Process"%>
<%@page import="com.bw.bean.UserBean"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <%!    String path, lookup, doc_eff_date, doc_no;
    %>
    <%
        lookup = (String) request.getParameter("lookup");
        path = (String) request.getParameter("report_code");

        //doc_eff_date = (String) request.getParameter("doc_eff_date");
        //doc_no = (String) request.getParameter("doc_no");
        // _______________________________________________________________report
        DataBean_Screen_Report objr_p = new DataBean_Screen_Report();
        HeaderScreen_Report_Param r_p = new HeaderScreen_Report_Param();
        UserBean userbean = (UserBean) session.getAttribute("user");
        objr_p = r_p.Fn_Report(objr_p, path);
        //path = objr_p.getPath();
        lookup = objr_p.getLookup();
        doc_eff_date = objr_p.getDoc_eff_date();
        doc_no = objr_p.getDoc_no();
        UtiDatabase objuti = new UtiDatabase();
        //_______________________________________________________________report       

    %>
    <head>
        <title></title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../CSS/MENU.css" rel="stylesheet" type="text/css">
        <link href="../CSS/BT.css" rel="stylesheet" type="text/css">  
        <link href="../CSS/component.css" rel="stylesheet" type="text/css"> 
        <link rel="stylesheet" type="text/css" media="all" href="../JS/jscalendar/skins/aqua/aqua.css" title="Aua" />
        <link href="../CSS/cgc_button.css" rel="stylesheet" type="text/css">
        <script language="javascript" src="../JS/myAjaxFramework.js"></script>
        <script type="text/javascript" src="../JS/jscalendar/calendar.js"></script>
        <script type='text/javascript' src='../JS/jscalendar/lang/calendar-th.js'></script>
        <script type="text/javascript" src="../JS/jscalendar/calendar-setup.js"></script>       


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
            var my_window = null;
            var t;
            function openBrown(tableID, SentToShow)
            {
                t = "Search_Report.jsp?table=" + tableID + "&sentdataToshow=" + SentToShow;
                if (my_window === null)
                    my_window = window.open(t, '', 'status=1,width=560,height=500');
                else {
                    closepopup();
                    my_window = window.open(t, '', 'status=1,width=560,height=500');
                }
            }
            function Chknull() {
                document.report.submit();
            }
            function load() {
                //AjaxRun_id('doc_date_to', '../JSP/CS_util.jsp?runer_id=1')
                //getId("doc_date_to").value  = AjaxRun_id('doc_date_to', '../JSP/CS_util.jsp?runer_id=1');
                getId("doc_date_to").value = MyCurrentDate('tha');
            }
            function summit_data() {
                var IDsend = "";

                getId("date_from_format").value = getId("doc_date_from").value !== "" ? format_Date(getId("doc_date_from").value) : "";
                getId("date_to_format").value = getId("doc_date_to").value !== "" ? format_Date(getId("doc_date_to").value) : "";

                IDsend = "testc,doc_date_from,doc_date_to,date_from_format,date_to_format,A_username,process_for";
                //getsaveProcess(URLsend('testc', "../JSP/CS_PROCESS_TRANSACTION.jsp"), 'report');
                getsaveApprove2(URLsend(IDsend, "../JSP/BW_IMPORT_WEIGHT_SCALE.jsp"), "report");
            }
        </script>        

        <script>
            function addDate() {
                date = new Date();
                var month = date.getMonth() + 1;
                var day = date.getDate();
                var year = date.getFullYear() + 543;

                if (day < 10) {
                    day = '0' + day;
                }

                if (month < 10) {
                    month = '0' + month;
                }


                document.getElementById('doc_date_from').value = '01' + '-' + month + '-' + year;

                if (document.getElementById('doc_date_to').value === '') {
                    document.getElementById('doc_date_to').value = day + '-' + month + '-' + year;
                }
            }
        </script>
    </head>

    <body onload="addDate();">
        <!--form name="report" method="post" action="../JSP/CS_REPORT.jsp" target="_blank"-->
        <input name="A_username" type="hidden" id="A_username" value="<%=userbean.getUsername()%>" size="30" readonly/>            
        <input type="hidden" id="process_for" name="process_for" value="CASAVA">            
        <input type="hidden" name="report_code" value="<%=path%>">
        <input type="hidden" name="type_report" value="5">
        <input type="hidden" name="lookup" value="<%=lookup%>">
        <input type="hidden" name="doc_eff_date" value="<%=doc_eff_date%>">
        <input type="hidden" name="doc_no" value="<%=doc_no%>">
        <input type="hidden" name="date_from_format" id="date_from_format" value="">
        <input type="hidden" name="date_to_format" id ="date_to_format" value="">        
        <input type="hidden" id="testc">  

        <div class="container">
            <div class="panel panel-primary">
                <div class="panel-heading"> <span class="glyphicon glyphicon-task"></span>&nbsp;
                    <b>ดึงข้อมูลชั่งน้ำหนักหัวมันสำปะหลัง (BW_IMPORT_WEIGHT_SCALE)</b>
                </div>                        
                <div class="panel-footer">                    
                    <div align="left">
                        <table  cellpadding="0" cellspacing="0" >
                            <tr>
                                <td colspan="2"  class="blankspace"></td>
                            </tr>
                            <tr>
                                <td class='columnlabel1'><b>วันที่เริ่มต้น</b></td><td class='columnobject'><input name='doc_date_from' class='inputs' type="text" id="doc_date_from" value="" readonly/>
                                    &nbsp;<a id='date_1'><img name='IMAGE2' src='../IMAGES/BUTTON/MAIN/CALENDAR20.png' border='0' align='absmiddle'></a><script type='text/javascript'>Calendar.setup({inputField: 'doc_date_from', ifFormat: '%d-%m-%Y', showsTime: false, button: 'date_1', singleClick: true, step: 1});</script>&nbsp;&nbsp;
                                    <b>ถึง</b>
                                    <input name='doc_date_to' class='inputs' type="text" id="doc_date_to" value="" />
                                    &nbsp;<a id='date_2'><img name='IMAGE2' src='../IMAGES/BUTTON/MAIN/CALENDAR20.png' border='0' align='absmiddle'></a><script type='text/javascript'>Calendar.setup({inputField: 'doc_date_to', ifFormat: '%d-%m-%Y', showsTime: false, button: 'date_2', singleClick: true, step: 1});</script></td>
                            </tr>
                            <tr>
                                <td colspan='2'><b>&nbsp;</b></td>
                            </tr>
                            <tr>
                                <td class="columnlabel1">&nbsp;</td>
                                <td class="columnobject"><textarea class='text_inputs' name='report' id="report" cols="50" rows="5"></textarea></td>
                            </tr>
                            <tr>
                                <td colspan='2' class='blankspace' align="right">
                                    <!--input type="button" name="bwButton" value=" Process Transaction  " onClick="summit_data()"/-->  
                                    <input type ="submit" class="cgcButton" style="width:120px;height: 30px;"  value ="ประมวลผล" onclick="summit_data()"></td>
                            </tr>
                            <tr>
                                <td colspan='2' class='blankspace' ></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

