<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%!
    String path;
    String lookup;
%>
<%
    path = (String) request.getParameter("report_code");
    lookup = (String) request.getParameter("lookup");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CGC ERP</title>
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
        <script type="text/javascript">

            function openBrown(tableID) {
                //alert("../JSP/Search_Report.jsp?table="+getId(tableID).value+"");
                window.open("Search_Report.jsp?table=" + tableID);
            }

            function CheckDate() {
                var da1 = new Date(document.report.date_f.value);
                var da2 = new Date(document.report.date_t.value);
                var d1 = document.report.date_f.value;
                var d2 = document.report.date_t.value;
                if (da1 < da2 || d1 == '' || d2 == '') {
                    if (d1 != '' || d2 != '') {
                        if (d1 != '') {
                            if (d2 == '') {
                                alert("กรุณาใส่ข้อมูลวันที่สิ้นสุดการออกรายงาน");
                            } else {
                                document.report.date_form.value = d1;
                                document.report.date_to.value = d2;
                                document.report.submit();
                            }
                        } else if (d2 != '') {
                            if (d1 == '') {
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

            function PrintReport() {

                if (getId("date_f").value != "" && getId("date_t").value != "") {
                    document.report.date_form.value = format_Date(getId("date_f").value);//dateFormat(da1.format,'yyyy-mm-dd').tostring;
                    document.report.date_to.value = format_Date(getId("date_t").value);

                    document.report.submit();
                } else if (getId("date_f").value == "" && getId("date_t").value == "") {
                    document.report.submit();
                } else {
                    alert("กรุณาใส่วันที่ให้ครบ");
                }

            }


        </script>
    </head>
    <body onunload="closepopup()">
        <form name="report" method="post" action="../JSP/CS_REPORT.jsp" target="_blank">
            <input type="hidden" name="report_code" value="<%=path%>">
            <input type="hidden" name="type_report" value="3">
            <input type="hidden" name="lookup" value="<%=lookup%>">
            <input type="hidden" name="date_form" value="">
            <input type="hidden" name="date_to" value="">


            <table  cellpadding="0"  cellspacing="0">
                <tr>
                    <td class="ftopleft"></td>
                    <td  class="ftopcenter" colspan="2">รายงาน 3 (CS_REPORT_3)&nbsp;</td>
                    <td class="ftopright"></td>
                </tr>
                <tr >
                    <td class="fcenterleft"></td>
                    <td  colspan="2" class="fcentercenter">
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
                                <input name='param_f' type='hidden' id="param_f" value='' />
                                <input name='param_t' type='hidden' id="param_t" value='' />

                                <td class='columnlabel'>Date (dd-mm-yyyy) : &nbsp;</td><td class='columnobject'><input name='date_f' class='inputs' type="text" id="date_f" value='' readonly/>
                                    &nbsp;<a id='date_1' href="javascript:;"><img name='IMAGE4' src='../IMAGES/BUTTON/MAIN/CALENDAR20.png' border='0' align='absmiddle'></a>
                                    <script type='text/javascript'>Calendar.setup({inputField: 'date_f', ifFormat: '%d-%m-%Y', showsTime: false, button: 'date_1', singleClick: true, step: 1});</script>
                                    To &nbsp;<input name='date_t' class='inputs' type="text" id="date_t" value='' readonly/>
                                    &nbsp;<a id='date_2' href="javascript:;"><img name='IMAGE4' src='../IMAGES/BUTTON/MAIN/CALENDAR20.png' border='0' align='absmiddle'></a>
                                    <script type='text/javascript'>Calendar.setup({inputField: 'date_t', ifFormat: '%d-%m-%Y', showsTime: false, button: 'date_2', singleClick: true, step: 1});</script>
                                </td>
                                </tr>
                                <tr>
                                    <td colspan='2' class='blankspace' ></td>
                                </tr>

                                <tr>
                                    <td colspan='2' class='blankspace' align="right">
                                        <input type="button" class="cgcButton_11" name="myBut" value=" พิมพ์รายงาน  " onclick="PrintReport()
                                                        ;"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan='2' class='blankspace' ></td>
                                </tr>
                            </table>
                        </div></td>
                    <td class="fcenterright"></td>
                </tr>
                <tr bordercolor="0069B3">
                    <td class="ffootleft"></td>
                    <td  class="ffootcenter" colspan="2"></td>
                    <td class="ffootright"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
