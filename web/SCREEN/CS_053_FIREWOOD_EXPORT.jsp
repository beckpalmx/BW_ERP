<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.bw.Util.UtiDatabase"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <META Http-Equiv="Cache-Control" Content="no-cache">
        <META Http-Equiv="Pragma" Content="no-cache">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="../CSS/MENU.css" rel="stylesheet" type="text/css">
        <link href="../CSS/BT.css" rel="stylesheet" type="text/css">  <link href="../CSS/component.css" rel="stylesheet" type="text/css"> 
        <link href="../CSS/cgc_button.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" media="all" href="../JS/jscalendar/skins/aqua/aqua.css" title="Aua" />
        <script type="text/javascript" src="../JS/jscalendar/calendar.js"></script>
        <script type='text/javascript' src='../JS/jscalendar/lang/calendar-th.js'></script>
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
            function Cancelvalue() {
            }
            function Action_Export() {
                var chk_export_id = false, chk_doc_id = false, chk_doc_date = false;
                if (getId("date_from").value !== "" && getId("date_to").value === "" || getId("date_from").value === "" && getId("date_to").value !== "") {
                    alert("กรุณาเลือกวันที่ให้ครบ");
                } else if (getId("date_from").value !== "" && getId("date_to").value !== "") {
                    if (ChkDate(getId("date_from").value, getId("date_to").value)) {
                        alert("คุณใส่วันที่ไม่ถูกต้อง...กรุณาตรวจสอบอีกครั้ง");
                    } else {
                        getId("date_from_format").value = getId("date_from").value !== "" ? format_Date(getId("date_from").value) : "";
                        getId("date_to_format").value = getId("date_to").value !== "" ? format_Date(getId("date_to").value) : "";
                        chk_doc_date = true;
                    }
                } else {
                    chk_doc_date = true;
                }
                if (chk_doc_date) {
                    //alert("สำเร็จ");
                    document.exportfile.submit();
                }
            }
            function Open_Doc_id_from() {
                //alert(math_str_flag());
                (getId("export_id").value === "") ? alert("กรุณาเลือกรหัสที่ต้องการ Export") :
                        openBrWindow(getId("lookup_name").value + "&stadment=" + math_str_flag() + "&textinput=runno_from|doc_id_from", 53, "../JSP/Search_Detail.jsp");
            }
            function Open_Doc_id_to() {
                //alert(math_str_flag());
                (getId("export_id").value === "") ? alert("กรุณาเลือกรหัสที่ต้องการ Export") :
                        openBrWindow(getId("lookup_name").value + "&stadment=" + math_str_flag() + "&textinput=runno_to|doc_id_to", 53, "../JSP/Search_Detail.jsp");
            }
            function math_str_flag() {
                var return_str = "";
                var str_math = new Array;
                str_math[0] = getId("complete_flag").value !== "" ? "complete_flag+=+\'" + getId("complete_flag").value + "\'" : "";
                str_math[1] = getId("retro_flag").value !== "" ? "retro_flag+=+\'" + getId("retro_flag").value + "\'" : "";
                str_math[2] = getId("cancel_flag").value !== "" ? "cancel_flag+=+\'" + getId("cancel_flag").value + "\'" : "";
                //str_math[3] = getId("delete_flag").value != "" ?"delete_flag+=+\'"+getId("delete_flag").value+"\'":"";
                for (var i = 0; i < str_math.length; i++) {
                    return_str += str_math[i] !== "" ? "and+" + str_math[i] + "+" : "";
                }
                return return_str;
            }
        </script>
    </head>
    <body onUnload="closepopup()">
        <form name="exportfile" method="post" action="../JSP/CS_053_FIREWOOD_EXPORT.jsp" >
            <% UtiDatabase objuti = new UtiDatabase();%>
            <input type="hidden" name="type_report"  value="4">
            <input type="hidden" name="complete_flag" id="complete_flag"  value="">
            <input type="hidden" name="retro_flag" id="retro_flag"  value="">
            <input type="hidden" name="cancel_flag" id="cancel_flag"  value="">
            <input type="hidden" name="delete_flag" id="delete_flag"  value="">
            <input type="hidden" name="lookup_name" id="lookup_name"  value="">
            <input type="hidden" name="date_from_format" id="date_from_format" value="">
            <input type="hidden" name="date_to_format" id ="date_to_format" value="">

            <div class="container">
                <div class="panel panel-primary">
                    <div class="panel-heading"> <span class="glyphicon glyphicon-tasks"></span>&nbsp;
                        <b>Export ข้อมูลไม้ฟืน (CS_053_FIREWOOD_EXPOR)</b>
                    </div>                        
                    <div class="panel-footer">                                    
                        <div align="left">
                            <table  cellpadding="0" cellspacing="0" >
                                <tr>
                                    <td colspan="4"  class="blankspace"></td>
                                </tr>
                                <tr>
                                    <td colspan='4'><b>กำหนดเงื่อนไข <span class="ftopcenter">Export ข้อมูลไม้ฟืน</span></b></td>
                                </tr>
                                <tr>
                                    <td class='columnlabel1'>วันที่เอกสารเริ่มต้น :&nbsp;</td><td width="182" class='columnobject'><input name='date_from' class='inputs' class='inputs' type="text" id="date_from" value='' size="10" readonly="true"/>
                                        <a id='date_1' href="javascript:;"><img name='IMAGE4' src='../IMAGES/BUTTON/MAIN/CALENDAR20.png' border='0' align='absmiddle'></a>
                                    </td>
                                    <td width="150" class='columnlabel1'><script type='text/javascript'>Calendar.setup({inputField: 'date_from', ifFormat: '%d-%m-%Y', showsTime: false, button: 'date_1', singleClick: true, step: 1});</script>
                                        วันที่เอกสารสิ้นสุด :&nbsp;
                                    </td>
                                    <td width="267" class='columnobject'><input name='date_to' class='inputs' class='inputs' type="text" id="date_to" value='' size="10" readonly="true"/>
                                        &nbsp;<a id='date_2' href="javascript:;"><img name='IMAGE4' src='../IMAGES/BUTTON/MAIN/CALENDAR20.png' border='0' align='absmiddle'></a>
                                        <script type='text/javascript'>Calendar.setup({inputField: 'date_to', ifFormat: '%d-%m-%Y', showsTime: false, button: 'date_2', singleClick: true, step: 1});</script>
                                    </td>
                                </tr>           

                                <tr>
                                    <td class="columnlabel1">รหัสSupplier : &nbsp;</td>
                                    <td class="columnobject">
                                        <input class='inputs' class='inputs' type="text" name="supplier_id" size='10' value='' id="supplier_id"/>
                                        <a href='javascript:;'><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' width='20' height='20' border='0' align='middle' onClick="openBrWindow('vmsupplier', 16, 'Search_Config2.jsp')" ></a>                                        
                                        <input name="name_t" class='inputs' class='inputs' type="text" id="name_t" size="50">                                        
                                    </td>
                                </tr>                                

                                <tr>
                                    <td colspan='4' class='blankspace' ></td>
                                </tr>

                                <tr>
                                    <td colspan='4' class='blankspace' align="right">
                                        <input type="button" class="cgcButton_11" name="myBut" value=" Export Data  " onClick="Action_Export()"/>
                                        <input type="button" class="cgcButton_11"name="myBut" value=" ยกเลิก  " onClick="Cancelvalue()"/>                                     </td>
                                </tr>
                                <tr>
                                    <td colspan='4' class='blankspace' ></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </body>
</html>
