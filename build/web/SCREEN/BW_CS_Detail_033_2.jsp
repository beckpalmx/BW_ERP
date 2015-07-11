<%@page import="com.bw.DB.D_product_report_daily_detail_stop_roastDAO"%>
<%@page import="com.bw.bean.DataBeanD_product_report_daily_stop_roast"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.bw.Util.ThaiUtil"%>
<%
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", -1);
%>
<html>
    <head>
        <title></title>
        <META Http-Equiv="Cache-Control" Content="no-cache">
        <META Http-Equiv="Pragma" Content="no-cache">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../CSS/MENU.css" rel="stylesheet" type="text/css">
        <link href="../CSS/BT.css" rel="stylesheet" type="text/css">
        <link href="../CSS/cgc_button.css" rel="stylesheet" type="text/css">        
        <script type="text/javascript" src="../JS/myAjaxFramework.js"></script>
        <link rel="stylesheet" type="text/css" media="all" href="../JS/jscalendar/skins/aqua/aqua.css" title="Aua" />
        <script type="text/javascript" src="../JS/jscalendar/calendar.js"></script>
        <script type='text/javascript' src='../JS/jscalendar/lang/calendar-th.js'></script>
        <script type="text/javascript" src="../JS/jscalendar/calendar-setup.js"></script>
        <script type="text/javascript" src="../JS/jquery/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="../JS/jquery/jquery-ui-1.8.17.custom.min.js"></script>
        <script type="text/javascript" src="../JS/jquery/jquery-ui-timepicker-addon.js"></script>
        <script type="text/javascript" src="../JS/jquery/jquery-ui-sliderAccess.js"></script>
        <script type="text/javascript" src="../JS/TimeFramwork.js"></script>
        <script type="text/javascript" src="../JS/js_BW_Calculator/JS_Time.js"></script>
        <link rel="stylesheet" media="all" type="text/css" href="../CSS/ui-lightness/jquery-ui-1.8.17.custom.css" />
        <link rel="stylesheet" media="all" type="text/css" href="../CSS/timepicker.css" />
        <script type="text/javascript">
            function goAdd(){
                var arrayChk = new Array;
                arrayChk[0]  = "chkNull";
                if(ChkParameter(arrayChk))
                {
                    if(ChkDate(getId("A_sr_from_date").value, getId("A_sr_to_date").value)){
                        alert("กรุณาตรวจสอบวันที่");
                    }else{
                        var strID = getIDElements('input', 'A_');
                        strID += getIDElements('input', 'I_');
                        strID += getIDElements('textarea', 'A_');
                        strID = strID.substr(0, strID.length-1);
                        if(Count_Date2(getId("A_sr_from_date").value, getId("A_sr_to_date").value) == 0){
                            if(parseFloat(document.getElementById("A_sr_from_time").value) > parseFloat(document.getElementById("A_sr_to_time").value)){
                                alert("กรุณาตรวจสอบเวลา");
                                document.getElementById("A_sr_from_time").focus();
                            }else{
                                getId("A_sr_stop_hour").value = Time_Difference2("A_sr_from_date", "A_sr_to_date", "A_sr_from_time", "A_sr_to_time");
                                //alert(strID);
                                getSave_Detail(URLsend(strID,'../JSP/BW_CS_Detail_033_2.jsp'), "../SHOWDETAILSCREEN/BW_CS_Show033_2.jsp?doc_id=", "show1", getId("A_doc_id").value);
                            }
                        }else{
                            getId("A_sr_stop_hour").value = Time_Difference2("A_sr_from_date", "A_sr_to_date", "A_sr_from_time", "A_sr_to_time");
                           // alert(strID);
                            getSave_Detail(URLsend(strID,'../JSP/BW_CS_Detail_033_2.jsp'), "../SHOWDETAILSCREEN/BW_CS_Show033_2.jsp?doc_id=", "show1", getId("A_doc_id").value);
                        }

                    }
                }
            }
            function goEdit()
            {

                var arrayChk = new Array;
                arrayChk[0]  = "chkNull";
                if(ChkParameter(arrayChk))
                {
                    if(ChkDate(getId("A_sr_from_date").value, getId("A_sr_to_date").value)){
                        alert("กรุณาตรวจสอบวันที่");
                    }else{
                        var strID = getIDElements('input', 'A_');
                        strID += getIDElements('input', 'U_');
                        strID += getIDElements('textarea', 'A_');
                        strID = strID.substr(0, strID.length-1);
                        if(Count_Date2(getId("A_sr_from_date").value, getId("A_sr_to_date").value) == 0){
                            if(parseFloat(document.getElementById("A_sr_from_time").value) > parseFloat(document.getElementById("A_sr_to_time").value)){
                                alert("กรุณาตรวจสอบเวลา");
                                document.getElementById("A_sr_from_time").focus();
                            }else{
                                getId("A_sr_stop_hour").value = Time_Difference2("A_sr_from_date", "A_sr_to_date", "A_sr_from_time", "A_sr_to_time");
                                //alert(strID);
                                getSave_Detail(URLsend(strID,'../JSP/BW_CS_Detail_033_2.jsp'), "../SHOWDETAILSCREEN/BW_CS_Show033_2.jsp?doc_id=", "show1", getId("A_doc_id").value);
                            }
                        }else{
                            getId("A_sr_stop_hour").value = Time_Difference2("A_sr_from_date", "A_sr_to_date", "A_sr_from_time", "A_sr_to_time");
                            //alert(strID);
                            getSave_Detail(URLsend(strID,'../JSP/BW_CS_Detail_033_2.jsp'), "../SHOWDETAILSCREEN/BW_CS_Show033_2.jsp?doc_id=", "show1", getId("A_doc_id").value);
                        }

                    }
                }
            }
            function goBack()
            {
                window.close();
            }
        </script>
    </head>
    <body>
        <%!            ThaiUtil en;
            DataBeanD_product_report_daily_stop_roast objBean;
            D_product_report_daily_detail_stop_roastDAO objdb;
            String line_no, doc_id, I_status, U_status,
                    sr_from_date, sr_from_time, sr_to_date, sr_to_time, sr_stop_hour;
        %>
        <%
                    line_no = "";
                    doc_id = "";
                    I_status = "";
                    U_status = "";
                    sr_from_date = "";
                    sr_from_time = "";
                    sr_to_date = "";
                    sr_to_time = "";
                    sr_stop_hour = "";
                    en = new ThaiUtil();
                    objBean = new DataBeanD_product_report_daily_stop_roast();
                    objdb = new D_product_report_daily_detail_stop_roastDAO();
                    if (request.getQueryString().indexOf("line_no_") != -1) {
                        U_status = "2";
                        line_no = request.getQueryString().substring(8, request.getQueryString().indexOf("="));
                        doc_id = request.getParameter("A_doc_id");
                        objBean = objdb.Return_Edit(doc_id, line_no);
                        sr_from_date = objBean.getSr_from_date();
                        sr_from_time = objBean.getSr_from_time();
                        sr_to_date = objBean.getSr_to_date();
                        sr_to_time = objBean.getSr_to_time();
                        sr_stop_hour = objBean.getSr_stop_hour();
                    } else {
                        doc_id = request.getParameter("A_doc_id");
                        I_status = request.getParameter("I_status");
                    }
        %>
        <input name="username" type="hidden" id="username" value="<%=request.getParameter("A_username")%>" size="30" readonly/>
        <input type="hidden" id="A_doc_id" name="A_doc_id" value="<%=request.getParameter("A_doc_id")%>">
        <input type="hidden" id="A_line_no" name="A_line_no" value="<%=line_no%>">
        <input type="hidden" id="I_status" name="I_status" value="<%=I_status%>">
        <input type="hidden" id="U_status" name="U_status" value="<%=U_status%>">
        <input type="hidden" id="chkNull" name="chkNull" value="A_sr_from_date">
        <table  cellpadding="0"  cellspacing="0" align="center">
            <tr >
                <td class="ftopleft"></td>
                <td  class="ftopcenter" colspan="2">&nbsp;</td>
                <td class="ftopright"></td>
            </tr>
            <tr >
                <td class="fcenterleft"></td>
                <td  colspan="2" class="fcentercenter">
                    <div align="center">
                        <table  cellpadding="0" cellspacing="0" >
                            <tr>
                                <td colspan="2"  class="blankspace"></td>
                            </tr>
                            <tr>
                                <td class="columnlabel">จากวันที่*</td>
                                <td class="columnobject"><input name="A_sr_from_date" type="text" id="A_sr_from_date" size="10" value="<%=sr_from_date%>">
                                    &nbsp;<a id='date_1'><img name='IMAGE2' src='../IMAGES/BUTTON/MAIN/CALENDAR20.png' border='0' align='absmiddle'></a><script type='text/javascript'>Calendar.setup({inputField:'A_sr_from_date',ifFormat:'%d-%m-%Y',showsTime:false,button:'date_1',singleClick:true,step:1});</script>
                                    &nbsp;&nbsp;จากเวลา
                                    <input name="A_sr_from_time" type="text" id="A_sr_from_time" size="10" value="<%=sr_from_time%>"></td>
                            </tr>
                            <tr>
                                <td class="columnlabel">ถึงวันที่*&nbsp;</td>
                                <td class="columnobject"><input name='A_sr_to_date' type='text' id="A_sr_to_date" value='<%=sr_to_date%>' size='10' />
                                    &nbsp;<a id='date_2'><img name='IMAGE2' src='../IMAGES/BUTTON/MAIN/CALENDAR20.png' border='0' align='absmiddle'></a><script type='text/javascript'>Calendar.setup({inputField:'A_sr_to_date',ifFormat:'%d-%m-%Y',showsTime:false,button:'date_2',singleClick:true,step:1});</script>
                                    &nbsp;&nbsp;ถึงเวลา
                                    &nbsp;&nbsp;
                                    <input name="A_sr_to_time" type="text" id="A_sr_to_time" size="10" value="<%=sr_to_time%>"></td>
                            </tr>
                            <tr>
                                <td class="columnlabel">จำนวนชั่วโมง*</td>
                                <td class="columnobject"><input name="A_sr_stop_hour" type="text" id="A_sr_stop_hour" size="10" value="<%=sr_stop_hour%>"></td>
                            </tr>

                            <tr>
                                <td colspan='2'  align="right">
                                    <%
                                                if (request.getParameter("I_status") != null) {
                                    %>
                                    <input type="button" class="cgcButton_5" name="button1" value="ตกลง" onClick="javascript:goAdd();"/>&nbsp;&nbsp;
                                    <%} else {
                                    %>
                                    <input type="button" class="cgcButton_5" name="button1" value="แก้ไข" onClick="javascript:goEdit();"/>&nbsp;&nbsp;
                                    <%}
                                    %>
                                    <input type="button" class="cgcButton_5" name="button2" value="ยกเลิก" onClick="goBack()"/>                                </td>
                            </tr>

                            <tr>
                                <td colspan='2' class='blankspace'>                                </td>
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

    </body>
</html>
