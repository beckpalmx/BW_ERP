<%@page import="com.bw.DB.D_product_milling_detail_2DAO"%>
<%@page import="com.bw.bean.DataBeanD_product_milling_detail_2"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.bw.Util.ThaiUtil"%>
<html>
    <head>
        <title></title>
        <META Http-Equiv="Cache-Control" Content="no-cache">
        <META Http-Equiv="Pragma" Content="no-cache">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../CSS/MENU.css" rel="stylesheet" type="text/css">
        <link href="../CSS/BT.css" rel="stylesheet" type="text/css">  <link href="../CSS/component.css" rel="stylesheet" type="text/css"> 
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
        <script type="text/javascript" src="../JS/calculator.js"></script>
        <script type="text/javascript" src="../JS/js_BW_Calculator/JS_Time.js"></script>
        <link rel="stylesheet" media="all" type="text/css" href="../CSS/ui-lightness/jquery-ui-1.8.17.custom.css" />
        <link rel="stylesheet" media="all" type="text/css" href="../CSS/timepicker.css" />
        <script type="text/javascript">
            function goAdd(){
                var arrayChk = new Array;
                arrayChk[0]  = "chkNull";
                if(ChkParameter(arrayChk))
                {
                    if(ChkDate(getId("A_date_from").value, getId("A_date_to").value)){
                        alert("กรุณาตรวจสอบวันที่");
                    }else{
                        var strID = getIDElements('input', 'A_');
                        strID += getIDElements('input', 'I_');
                        strID += getIDElements('textarea', 'A_');
                        strID = strID.substr(0, strID.length-1);
                        if(Count_Date2(getId("A_date_from").value, getId("A_date_to").value) == 0){
                            if(parseFloat(document.getElementById("A_time_from").value) > parseFloat(document.getElementById("A_time_to").value)){
                                alert("กรุณาตรวจสอบเวลา");
                                document.getElementById("A_time_from").focus();
                            }else{
                                var output  = difference_date_and_time(getId("A_date_from").value, getId("A_time_from").value, getId("A_date_to").value, getId("A_time_to").value);
                                getId("A_total_time").value = output == undefined ?"":output;
                                getSave_Detail(URLsend(strID,'../JSP/BW_CS_Detail_030_32.jsp'), "../SHOWDETAILSCREEN/BW_CS_Show030_32.jsp?doc_id=", "show2", getId("A_doc_id").value);
                            }
                        }else{
                            var output  = difference_date_and_time(getId("A_date_from").value, getId("A_time_from").value, getId("A_date_to").value, getId("A_time_to").value);
                            getId("A_total_time").value = output == undefined ?"":output;//Time_Difference2("A_date_from", "A_date_to", "A_time_from", "A_time_to");
                            //alert(strID);
                            getSave_Detail(URLsend(strID,'../JSP/BW_CS_Detail_030_32.jsp'), "../SHOWDETAILSCREEN/BW_CS_Show030_32.jsp?doc_id=", "show2", getId("A_doc_id").value);
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
                    if(ChkDate(getId("A_date_from").value, getId("A_date_to").value)){
                        alert("กรุณาตรวจสอบวันที่");
                    }else{
                        var strID = getIDElements('input', 'A_');
                        strID += getIDElements('input', 'U_');
                        strID += getIDElements('textarea', 'A_');
                        strID = strID.substr(0, strID.length-1);
                        if(Count_Date2(getId("A_date_from").value, getId("A_date_to").value) == 0){
                            if(parseFloat(document.getElementById("A_time_from").value) > parseFloat(document.getElementById("A_time_to").value)){
                                alert("กรุณาตรวจสอบเวลา");
                                document.getElementById("A_time_from").focus();
                            }else{
                                var output  = difference_date_and_time(getId("A_date_from").value, getId("A_time_from").value, getId("A_date_to").value, getId("A_time_to").value);
                                getId("A_total_time").value = output == undefined ?"":output;
                                //getId("A_total_time").value = Time_Difference2("A_date_from", "A_date_to", "A_time_from", "A_time_to");
                                //alert(strID);
                                getSave_Detail(URLsend(strID,'../JSP/BW_CS_Detail_030_32.jsp'), "../SHOWDETAILSCREEN/BW_CS_Show030_32.jsp?doc_id=", "show2", getId("A_doc_id").value);
                            }
                        }else{
                            var output  = difference_date_and_time(getId("A_date_from").value, getId("A_time_from").value, getId("A_date_to").value, getId("A_time_to").value);
                            getId("A_total_time").value = output == undefined ?"":output;
                            getSave_Detail(URLsend(strID,'../JSP/BW_CS_Detail_030_32.jsp'), "../SHOWDETAILSCREEN/BW_CS_Show030_32.jsp?doc_id=", "show2", getId("A_doc_id").value);
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
            DataBeanD_product_milling_detail_2 objBean;
            D_product_milling_detail_2DAO objdb;
            String line_no, doc_id, I_status, U_status,
                    date_from, time_from, date_to, time_to, total_time, remark;
        %>
        <%
            line_no = "";
            doc_id = "";
            I_status = "";
            U_status = "";
            date_from = "";
            time_from = "";
            date_to = "";
            time_to = "";
            total_time = "";
            remark = "";
            en = new ThaiUtil();
            objBean = new DataBeanD_product_milling_detail_2();
            objdb = new D_product_milling_detail_2DAO();
            if (request.getQueryString().indexOf("line_no_") != -1) {
                U_status = "2";
                line_no = request.getQueryString().substring(8, request.getQueryString().indexOf("="));
                doc_id = request.getParameter("A_doc_id");
                objBean = objdb.Return_Edit(doc_id, line_no);
                date_from = objBean.getDate_from();
                time_from = objBean.getTime_from();
                date_to = objBean.getDate_to();
                time_to = objBean.getTime_to();
                total_time = objBean.getTotal_time();
                remark = objBean.getRemark() == null ? "" : objBean.getRemark();

            } else {
                doc_id = request.getParameter("A_doc_id");
                I_status = request.getParameter("A_status");
            }
        %>
        <input name="username" type="hidden" id="username" value="<%=request.getParameter("A_username")%>" size="30" readonly/>
        <input type="hidden" id="A_doc_id" name="A_doc_id" value="<%=request.getParameter("A_doc_id")%>">
        <input type="hidden" id="A_line_no" name="A_line_no" value="<%=line_no%>">
        <input type="hidden" id="I_status" name="I_status" value="<%=I_status%>">
        <input type="hidden" id="U_status" name="U_status" value="<%=U_status%>">
        <input type="hidden" id="chkNull" name="chkNull" value="A_date_from,A_time_from,A_date_to,A_time_to">
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
                                <td class="columnlabel">เริ่มโม่มันวันที่</td>
                                <td class="columnobject"><input type="text" name="A_date_from" id="A_date_from" value="<%=date_from%>" size="10">
                                    &nbsp;<a id='date_1'><img name='IMAGE2' src='../IMAGES/BUTTON/MAIN/CALENDAR20.png' border='0' align='absmiddle'></a><script type='text/javascript'>Calendar.setup({inputField:'A_date_from',ifFormat:'%d-%m-%Y',showsTime:false,button:'date_1',singleClick:true,step:1});</script>
                                </td>
                            </tr>
                            <tr>
                                <td class="columnlabel">เริ่มโม่มันเวลา</td>
                                <td class="columnobject"><input type="text" name="A_time_from" id="A_time_from" value="<%=time_from%>" size="10" onkeypress="Time_picker(this.id)" onblur="Check_Time_Value(this)"></td>
                            </tr>
                            <tr>
                                <td class="columnlabel">โม่มันถึงวันที่</td>
                                <td class="columnobject"><input type="text" name="A_date_to" id="A_date_to" value="<%=date_to%>" size="10">
                                    &nbsp;<a id='date_2'><img name='IMAGE2' src='../IMAGES/BUTTON/MAIN/CALENDAR20.png' border='0' align='absmiddle'></a><script type='text/javascript'>Calendar.setup({inputField:'A_date_to',ifFormat:'%d-%m-%Y',showsTime:false,button:'date_2',singleClick:true,step:1});</script>
                                </td>
                            </tr>
                            <tr>
                                <td class="columnlabel">โม่มันถึงเวลา</td>
                                <td class="columnobject"><input type="text" name="A_time_to" id="A_time_to" value="<%=time_to%>" size="10" onkeypress="Time_picker(this.id)" onblur="Check_Time_Value(this)"></td>
                            </tr>
                            <tr>
                                <td class="columnlabel">จำนวนชั่วโมง</td>
                                <td class="columnobject"><input type="text" name="A_total_time" id="A_total_time" value="<%=total_time%>" size="10">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="columnlabel">หมายเหตุ&nbsp;</td>
                                <td class="columnobject"><textarea name="A_remark" id="A_remark"  cols="45" rows="5"><%=remark%></textarea></td>
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
