<%@page import="com.bw.DB.D_product_report_daily_stop_millingDAO"%>
<%@page import="com.bw.bean.DataBeanD_product_report_daily_detail_stop_milling"%>
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
            function goAdd() {
                var arrayChk = new Array;
                arrayChk[0] = "chkNull";
                if (ChkParameter(arrayChk))
                {
                    if (ChkDate(getId("A_sm_from_date").value, getId("A_sm_to_date").value)) {
                        alert("กรุณาตรวจสอบวันที่");
                    } else {
                        var strID = getIDElements('input', 'A_');
                        strID += getIDElements('input', 'I_');
                        strID += getIDElements('textarea', 'A_');
                        strID = strID.substr(0, strID.length - 1);
                        if (Count_Date2(getId("A_sm_from_date").value, getId("A_sm_to_date").value) == 0) {
                            if (parseFloat(document.getElementById("A_sm_from_time").value) > parseFloat(document.getElementById("A_sm_to_time").value)) {
                                alert("กรุณาตรวจสอบเวลา");
                                document.getElementById("A_sm_to_time").focus();
                            } else {
                                getId("A_sm_stop_hour").value = Time_Difference2("A_sm_from_date", "A_sm_to_date", "A_sm_from_time", "A_sm_to_time");
                                //alert(strID);
                                getSave_Detail(URLsend(strID, '../JSP/BW_CS_Detail_033_1.jsp'), "../SHOWDETAILSCREEN/BW_CS_Show033_1.jsp?doc_id=", "show", getId("A_doc_id").value);
                            }
                        } else {
                            getId("A_sm_stop_hour").value = Time_Difference2("A_sm_from_date", "A_sm_to_date", "A_sm_from_time", "A_sm_to_time");
                            //alert(strID);
                            getSave_Detail(URLsend(strID, '../JSP/BW_CS_Detail_033_1.jsp'), "../SHOWDETAILSCREEN/BW_CS_Show033_1.jsp?doc_id=", "show", getId("A_doc_id").value);
                        }

                    }
                }
            }
            function goEdit()
            {
                var arrayChk = new Array;
                arrayChk[0] = "chkNull";
                //alert("Edit : ");
                if (ChkParameter(arrayChk))
                {
                    if (ChkDate(getId("A_sm_from_date").value, getId("A_sm_to_date").value)) {
                        alert("กรุณาตรวจสอบวันที่");
                    } else {
                        var strID = getIDElements('input', 'A_');
                        strID += getIDElements('input', 'U_');
                        strID += getIDElements('textarea', 'A_');
                        strID = strID.substr(0, strID.length - 1);
                        if (Count_Date2(getId("A_sm_from_date").value, getId("A_sm_to_date").value) == 0) {
                            if (parseFloat(getId("A_sm_from_time").value) > parseFloat(getId("A_sm_to_time").value)) {
                                alert("กรุณาตรวจสอบเวลา");
                                document.getElementById("A_sm_to_time").focus();
                            } else {
                                getId("A_sm_stop_hour").value = Time_Difference2("A_sm_from_date", "A_sm_to_date", "A_sm_from_time", "A_sm_to_time");
                                //alert("1 > " + strID);
                                getSave_Detail(URLsend(strID, '../JSP/BW_CS_Detail_033_1.jsp'), "../SHOWDETAILSCREEN/BW_CS_Show033_1.jsp?doc_id=", "show", getId("A_doc_id").value);
                            }
                        } else {
                            getId("A_sm_stop_hour").value = Time_Difference2("A_sm_from_date", "A_sm_to_date", "A_sm_from_time", "A_sm_to_time");
                            //alert("2 > " + strID);
                            getSave_Detail(URLsend(strID, '../JSP/BW_CS_Detail_033_1.jsp'), "../SHOWDETAILSCREEN/BW_CS_Show033_1.jsp?doc_id=", "show", getId("A_doc_id").value);
                        }

                    }
                }
            }
            function goBack()
            {
                window.close();
            }

            function cal_total() {

                if (isNaN((parseFloat(getId("A_kw_end").value) - parseFloat(getId("A_kw_start").value).toFixed(2)))) {
                    getId("A_kw_rest").value = 0;
                } else
                    var n = (parseFloat(getId("A_kw_end").value).toFixed(2) - parseFloat(getId("A_kw_start").value).toFixed(2));
                var result = Math.floor(n * 100) / 100;
                getId("A_kw_rest").value = result;
            }

        </script>
    </head>
    <body>
        <%!            ThaiUtil en;
            DataBeanD_product_report_daily_detail_stop_milling objBean;
            D_product_report_daily_stop_millingDAO objdb;
            String line_no, doc_id, I_status, U_status,
                    sm_from_date, sm_from_time, sm_to_date, sm_to_time, sm_stop_hour, kw_start, kw_end, kw_rest;
        %>
        <%
            line_no = "";
            doc_id = "";
            I_status = "";
            U_status = "";
            sm_from_date = "";
            sm_from_time = "";
            sm_to_date = "";
            sm_to_time = "";
            sm_stop_hour = "";
            kw_start = "";
            kw_end = "";
            kw_rest = "";
            en = new ThaiUtil();
            objBean = new DataBeanD_product_report_daily_detail_stop_milling();
            objdb = new D_product_report_daily_stop_millingDAO();
            if (request.getQueryString().indexOf("line_no_") != -1) {
                U_status = "2";
                line_no = request.getQueryString().substring(8, request.getQueryString().indexOf("="));
                doc_id = request.getParameter("A_doc_id");
                objBean = objdb.Return_Edit(doc_id, line_no);
                sm_from_date = objBean.getSm_from_date();
                sm_from_time = objBean.getSm_from_time();
                sm_to_date = objBean.getSm_to_date();
                sm_to_time = objBean.getSm_to_time();
                sm_stop_hour = objBean.getSm_stop_hour();
                kw_start = objBean.getKw_start();
                kw_end = objBean.getKw_end();
                kw_rest = objBean.getKw_rest();
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
        <input type="hidden" id="chkNull" name="chkNull" value="A_sm_from_date">
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
                                <td class="columnlabel">จากวันที่</td>
                                <td class="columnobject"><input name="A_sm_from_date" type="text" id="A_sm_from_date" size="10" value="<%=sm_from_date%>">
                                    &nbsp;<a id='date_1'><img name='IMAGE2' src='../IMAGES/BUTTON/MAIN/CALENDAR20.png' border='0' align='absmiddle'></a><script type='text/javascript'>Calendar.setup({inputField: 'A_sm_from_date', ifFormat: '%d-%m-%Y', showsTime: false, button: 'date_1', singleClick: true, step: 1});</script>
                                    &nbsp;&nbsp;จากเวลา
                                    <input name="A_sm_from_time" type="text" id="A_sm_from_time" size="10" value="<%=sm_from_time%>" onkeypress="Time_picker(this.id)" onblur="Check_Time_Value(this)"></td>
                            </tr>
                            <tr>
                                <td class="columnlabel">ถึงวันที่&nbsp;</td>
                                <td class="columnobject"><input name='A_sm_to_date' type='text' id="A_sm_to_date" value='<%=sm_to_date%>' size='10' />
                                    &nbsp;<a id='date_2'><img name='IMAGE2' src='../IMAGES/BUTTON/MAIN/CALENDAR20.png' border='0' align='absmiddle'></a><script type='text/javascript'>Calendar.setup({inputField: 'A_sm_to_date', ifFormat: '%d-%m-%Y', showsTime: false, button: 'date_2', singleClick: true, step: 1});</script>
                                    &nbsp;&nbsp;ถึงเวลา
                                    <input name="A_sm_to_time" type="text" id="A_sm_to_time" size="10" value="<%=sm_to_time%>">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="columnlabel">จำนวนชั่วโมง*</td>
                                <td class="columnobject"><input name="A_sm_stop_hour" type="text" id="A_sm_stop_hour" size="10" value="<%=sm_stop_hour%>" ></td>
                            </tr>
                            <tr>
                                <td class="columnlabel">กิโลวัตต์ที่เริ่ม*&nbsp;</td>
                                <td class="columnobject">
                                    <input name='A_kw_start' type='text' id="A_kw_start" value='<%=kw_start%>' size='10' onblur="cal_total();"/>
                                    &nbsp;&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="columnlabel">กิโลวัตต์ที่สิ้นสุด*&nbsp;</td>
                                <td class="columnobject"><input name='A_kw_end' type='text' id="A_kw_end" value='<%=kw_end%>' size='10' onblur="cal_total();"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="columnlabel">กิโลวัตต์รวม</td>
                                <td class="columnobject"><input name="A_kw_rest" type="text" id="A_kw_rest" size="10" value="<%=kw_rest%>">
                                    <input type="button" class="cgcButton_9" id="btnet_weight_payment" value="คำนวณ" onclick="cal_total()">                                        
                                </td>
                            </tr>
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
                                <td colspan='2' class='blankspace'></td>
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
