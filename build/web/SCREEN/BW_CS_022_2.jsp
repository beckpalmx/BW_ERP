<%@page import="com.bw.bean.DataBean_Screen_Report"%>
<%@page import="com.bw.Util.HeaderScreen_Report"%>
<%@page import="com.bw.Util.UtiDatabase"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="windows-874"%>
<%@page import="com.bw.bean.DataBean_Screen_Process"%>
<%@page import="com.bw.bean.UserBean"%>
<%@page import="com.bw.Util.HeaderScreen_Process"%>
<html>
    <%!    String path, lookup, doc_eff_date, doc_no;
    %>
    <head>
        <script language="javascript" src="../JS/myAjaxFramework.js"></script>
        <META Http-Equiv="Cache-Control" Content="no-cache">
        <META Http-Equiv="Pragma" Content="no-cache">
        <link rel="stylesheet" type="text/css" media="all" href="../JS/jscalendar/skins/aqua/aqua.css" title="Aua" />
        <script type="text/javascript" src="../JS/jscalendar/calendar.js"></script>
        <script type='text/javascript' src='../JS/jscalendar/lang/calendar-th.js'></script>
        <script type="text/javascript" src="../JS/jscalendar/calendar-setup.js"></script>
        <!-- <script type="text/javascript" src="../JS/jquery/jquery-1.7.1.min.js"></script>
         <script type="text/javascript" src="../JS/jquery/jquery-ui-1.8.17.custom.min.js"></script>
         <script type="text/javascript" src="../JS/jquery/jquery-ui-timepicker-addon.js"></script>
         <script type="text/javascript" src="../JS/jquery/jquery-ui-sliderAccess.js"></script>
         <script type="text/javascript" src="../JS/TimeFramwork.js"></script>-->
        <link rel="stylesheet" media="all" type="text/css" href="../CSS/ui-lightness/jquery-ui-1.8.17.custom.css" />
        <link rel="stylesheet" media="all" type="text/css" href="../CSS/timepicker.css" />
        <script type="text/javascript">

            function time_picker(input) {
                $(input).timepicker({showSecond: true,
                    timeFormat: 'hh:mm:ss'/*,hourGrid: 2,
                     minuteGrid: 10,secondGrid:5*/});
            }
            function Calculator_AVG() {
                var div = 0;
                var value_avg = 0;
                var strID = "";
                strID = getIDElements("input", "A_percent_");
                strID = strID.replace("A_percent_avg,", "");
                strID = strID.substr(0, strID.length - 1);
                var mem_value = strID.split(",");
                for (var i = 0; i < mem_value.length; i++) {
                    if (getId(mem_value[i]).value != "" && getId(mem_value[i]).value != "0") {
                        value_avg = value_avg + parseFloat(getId(mem_value[i]).value);
                        div += 1;
                    }
                }

                getId("A_percent_avg").value = (value_avg / div).toFixed(2);
            }
            function add()
            {
                return_amount_tapioca();
                var strID = "";
                strID = getIDElements('input', 'A_');
                strID += getIDElements('select', 'A_');
                strID += getIDElements('textarea', 'A_');
                strID = strID.substr(0, strID.length - 1);
                //alert(strID);
                confirmDialogSave(URLsend('chkNull,' + strID, '../JSP/BW_CS_022.jsp'));
                //location.replace('BW_CS_022.jsp')
            }
            function del() {
                confirmDialogDelete(URLsend('A_doc_id,D_status', '../JSP/BW_CS_022.jsp'));
            }
            function cancle()
            {
                cancelAction();
            }
            function Openproduct()
            {
                openBrWindow('Vproduct&stadment=and+pgroup_id+=+\'G001\'', 22, '../SEARCHSCREEN/Search_Config2.jsp');
            }
            function Opendoc_id()
            {
                openBrWindow('Vd_rawmatt_receive&stadment=and+complete_flag+<>+\'Y\'', 22, '../SEARCHSCREEN/Search_Config2.jsp');
            }
            function Chknull() {
                if (document.getElementById('doc_id').value == '') {
                    alert('กรุณาใส่ข้อมูลเลขที่เอกสาร');
                } else
                    document.report.submit();
            }
            function cal_total_weight() {
                if (isNaN((parseFloat(getId("A_car_in_weight").value) - parseFloat(getId("A_car_out_weight").value).toFixed(2)))) {
                    getId("A_total_weight").value = "0.00";
                } else {
                    getId("A_total_weight").value = (parseFloat(getId("A_car_in_weight").value) - parseFloat(getId("A_car_out_weight").value)).toFixed(2);
                }
                if (getId("A_total_weight").value != "" && getId("A_deduct_weight").value != "") {
                    getId("A_balance_weight").value = (parseFloat(getId("A_total_weight").value) - parseFloat(getId("A_deduct_weight").value)).toFixed(2);
                }
                if (getId("A_balance_weight").value != "" && getId("A_price_accept").value != "") {
                    getId("A_total_payment").value = (parseFloat(getId("A_balance_weight").value) * parseFloat(getId("A_price_accept").value)).toFixed(2);
                }
                if (getId("A_total_payment").value != "" && getId("A_amount_deduct").value != "") {
                    getId("A_amount_payment").value = (parseFloat(getId("A_total_payment").value) - parseFloat(getId("A_amount_deduct").value)).toFixed(2);
                }

            }
            function cal_deduct_weight() {
                var value_deduct_weight = 0;
                value_deduct_weight += getId("A_soil_deduct").value != "" ? parseFloat(getId("A_soil_deduct").value) : 0;
                value_deduct_weight += getId("A_contamination_deduct").value != "" ? parseFloat(getId("A_contamination_deduct").value) : 0;
                value_deduct_weight += getId("A_other_deduct").value != "" ? parseFloat(getId("A_other_deduct").value) : 0;
                getId("A_deduct_weight").value = value_deduct_weight.toFixed(2);
                if (getId("A_total_weight").value != "" && getId("A_deduct_weight").value != "") {
                    getId("A_balance_weight").value = (parseFloat(getId("A_total_weight").value) - parseFloat(getId("A_deduct_weight").value)).toFixed(2);
                }
                if (getId("A_balance_weight").value != "" && getId("A_price_accept").value != "") {
                    getId("A_total_payment").value = (parseFloat(getId("A_balance_weight").value) * parseFloat(getId("A_price_accept").value)).toFixed(2);
                }
                if (getId("A_total_payment").value != "" && getId("A_amount_deduct").value != "" && getId("A_brake_income").value != "") {
                    getId("A_amount_payment").value = ((parseFloat(getId("A_total_payment").value) + parseFloat(getId("A_brake_income").value)) - parseFloat(getId("A_amount_deduct").value)).toFixed(2);
                }
            }
            function cal_per_ref() {
                var arrayId = ("A_doc_date,A_supplyer_type,A_pc_ref,A_percent_avg").split(",");
                var matstr = "";
                var flag = false;
                for (var i = 0; i < arrayId.length; i++) {
                    if (getId(arrayId[i]).value != "" || arrayId[i] == "A_pc_ref") {
                        if (arrayId[i] == "A_pc_ref") {
                            getId(arrayId[i]).value = (getId(arrayId[i]).value == "" ? "34" : getId(arrayId[i]).value);
                            matstr += "&" + arrayId[i] + "=" + getId(arrayId[i]).value;
                        } else {
                            matstr += "&" + arrayId[i] + "=" + getId(arrayId[i]).value;
                        }
                        flag = true;
                    } else {
                        alert("กรุณากรอกข้อมูลให้ครบ");
                        getId(arrayId[i]).focus();
                        flag = false;
                        break;
                    }
                }
                if (flag == true) {
                    //alert(matstr);
                    getData_d_rawmatt_receive('../JSP/BW_CS_022.jsp?status_calculator=5' + matstr, 'A_price_ref,A_price_accept,A_per_cent_tapioca');
                }

            }
            function return_amount_tapioca() {
                var cal = ((parseFloat(getId("A_balance_weight").value).toFixed(2) * (parseFloat(getId("A_per_cent_tapioca").value).toFixed(2))) / 100).toFixed(0);
                getId("A_amount_tapioca").value = isNaN((parseFloat(getId("A_balance_weight").value).toFixed(2) * parseFloat(getId("A_per_cent_tapioca").value).toFixed(2))) ? 0 : cal;
            }
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-874" />
        <link href="../CSS/MENU.css" rel="stylesheet" type="text/css">
        <link href="../CSS/BT.css" rel="stylesheet" type="text/css">
        <title>Insert title here</title>
    </head>
    <body >
        <form name="report" method="post" action="../JSP/CS_REPORT.jsp" target="_blank">
            <%
                UserBean userbean = (UserBean) session.getAttribute("user");
                UtiDatabase objuti = new UtiDatabase();
                DataBean_Screen_Process objs_p = new DataBean_Screen_Process();
                HeaderScreen_Process h_p = new HeaderScreen_Process();
                objs_p = h_p.selectheaderscreen_process(objs_p, "BW_CS_022");
                // _______________________________________________________________report
                DataBean_Screen_Report objr_p = new DataBean_Screen_Report();
                HeaderScreen_Report r_p = new HeaderScreen_Report();
                objr_p = r_p.Fn_Report(objr_p, "S501");
                path = objr_p.getPath();
                lookup = objr_p.getLookup();
                doc_eff_date = objr_p.getDoc_eff_date();
                doc_no = objr_p.getDoc_no();
                        //_______________________________________________________________report
%>
            <div id="toolTipLayer" style="position:absolute; visibility: hidden"></div>
            <input name="username" type="hidden" id="username" value="<%=userbean.getUsername()%>" size="30" readonly/>
            <input name="D_status" type="hidden" id="D_status" value="3">
            <!-- เป็นการ Delete ข้อมูลทั้งหมด -->
            <input type="hidden" id="status_cal" value="4" >
            <input name="chkNull" type="hidden" id="chkNull" value="A_doc_id,A_doc_date">
            <!---------------------------------------------------report----------------------------->
            <input type="hidden" id="report_code" name="report_code"  value="<%=path%>">
            <input type="hidden" id="type_report" name="type_report" value="2">
            <input type="hidden" id="lookup" name="lookup" value="<%=lookup%>">
            <input type="hidden" id="doc_eff_date" name="doc_eff_date" value="<%=doc_eff_date%>">
            <input type="hidden" id="doc_no" name="doc_no" value="<%=doc_no%>">
            <div align="center">

                <table  cellpadding="0"  cellspacing="0">

                    <tr>
                        <td class="ftopleft"></td>
                        <td  class="ftopcenter" colspan="2">ใบแจ้งการผลิต(BW_CS_031)&nbsp;</td>
                        <td class="ftopright"></td>
                    </tr>
                    <tr >
                        <td class="fcenterleft"></td>
                        <td  colspan="2" class="fcentercenter">
                            <div align="center">
                                <table  cellpadding="0" cellspacing="0" >
                                    <tr>
                                        <td colspan="2" align="right"><b>หมายเลขเอกสาร : <%=doc_no%> </b></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="right"><b>วันที่มีผลบังคับใช้ : <%=doc_eff_date%> </b></td>
                                    </tr>
                                    <tr>
                                        <td width="170" class="columnlabel"><b><!--<input type="button" id="runid" name="runid" value="เลขที่ใบชั่งฯ/รับฯ" onclick="AjaxRun_id('A_doc_id', '../JSP/BW_CS_022.jsp?status_runid=4')">-->
                                                เลขที่ใบชั่งฯ/รับฯ*</b>&nbsp;</td>
                                        <td width="587" colspan="3" class="columnobject">
                                            <input name='A_doc_id' type='text' id="A_doc_id" value='' size='12' />
                                            &nbsp;<a href='#' onClick="Opendoc_id()"><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE1' width='20' height='20' border='0' align='middle' ></a>&nbsp;&nbsp;
                                            วันที่เอกสาร*&nbsp;
                                            <input name='A_doc_date' type='text' id="A_doc_date" value='' size='10' readonly="readonly"/>
                                            &nbsp;<a id='date_1'><img name='IMAGE2' src='../IMAGES/BUTTON/MAIN/CALENDAR20.png' border='0' align='absmiddle'></a><script type='text/javascript'>Calendar.setup({inputField: 'A_doc_date', ifFormat: '%d-%m-%Y', showsTime: false, button: 'date_1', singleClick: true, step: 1});</script>
                                            &nbsp;&nbsp;เวลา*&nbsp;<input name='A_doc_time' type='text' id="A_doc_time" value='' size='10' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="columnlabel">ทะเบียนรถ*</td>
                                        <td colspan="3" class="columnobject"><input name="A_car_no" type="text" id="A_car_no"></td>
                                    </tr>
                                    <tr>
                                        <td class="columnlabel">ชื่อผู้ขาย*&nbsp;</td>
                                        <td colspan="3" class="columnobject">
                                            <input name='A_supplier_id' type='text' id="A_supplier_id" value='' size='10' readonly="readonly"/>
                                            &nbsp;<a href='#' onClick="openBrWindow('Vsupplier', 22, '../SEARCHSCREEN/Serch_Config.jsp');" ><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE3' width='20' height='20' border='0' align='middle' ></a>&nbsp;&nbsp;&nbsp;<input name='supplier_id_desc' type='text' id="supplier_id_desc" value='' size='20' readonly="readonly" />&nbsp;&nbsp;&nbsp;&nbsp;ประเภทลูกค้า
                                                <%=objuti.ShowSelectBox("select supply_type_id,name_t from m_supplyer_type where delete_flag = 'N'  order by runno", "supply_type_id", "name_t", "A_supplyer_type")%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="columnlabel"><p>วันที่รถเข้า</p></td>
                                        <td colspan="3" class="columnobject"><input name='A_car_date_in ' type='text' id="A_car_date_in" value='' size='10' readonly="readonly"/>
                                            &nbsp;<!--<a id='date_2'><img name='IMAGE2' src='../IMAGES/BUTTON/MAIN/CALENDAR20.png' border='0' align='absmiddle'></a><script type='text/javascript'>Calendar.setup({inputField:'A_car_date_in',ifFormat:'%d-%m-%Y',showsTime:false,button:'date_2',singleClick:true,step:1});</script>-->&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;เวลา
                                            <input type="text" name="A_car_time_in" id="A_car_time_in"  maxlength="5" onfocus="getId('A_car_date_in').value = getId('A_doc_date').value;"></td>
                                    </tr>
                                    <tr>
                                        <td class="columnlabel">วันที่รถออก</td>
                                        <td colspan="3" class="columnobject"><input name='A_car_date_out' type='text' id="A_car_date_out" value='' size='10' readonly="readonly"/>
                                            &nbsp;<!--<a id='date_3'><img name='IMAGE2' src='../IMAGES/BUTTON/MAIN/CALENDAR20.png' border='0' align='absmiddle'></a><script type='text/javascript'>Calendar.setup({inputField:'A_car_date_out',ifFormat:'%d-%m-%Y',showsTime:false,button:'date_3',singleClick:true,step:1});</script>-->&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;เวลา
                                            <input type="text" name="A_car_time_out" id="A_car_time_out"  maxlength="5" onfocus="getId('A_car_date_out').value = getId('A_doc_date').value;" onblur="getId('A_doc_date').value = getId(this.id).value"></td>
                                    </tr>
                                    <tr>
                                        <td class="columnlabel">ชนิดพันธุ์มัน*&nbsp;</td>
                                        <td colspan="3" class="columnobject"><%=objuti.ShowSelectBox("select cassava_type_id,name_t from m_cassava_type where delete_flag = 'N' order by runno", "cassava_type_id", "name_t", "A_potato_type")%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="columnlabel">เปอร์เซนต์มันสด</td>
                                        <td colspan="3" class="columnobject">
                                            <table width="96%" border="0">
                                                <tr>
                                                    <td width="25%"><p>ครั้งที่ 1
                                                            <input name="A_percent_1" type="text" id="A_percent_1" size="8" onBlur="Calculator_AVG();" onKeyUp="IsNuber(this.value, this)">
                                                            %</p></td>
                                                    <td width="26%"><p>ครั้งที่ 2
                                                            <input name="A_percent_2" type="text" id="A_percent_2" size="8" onBlur="Calculator_AVG();" onKeyUp="IsNuber(this.value, this)">
                                                            %</p></td>
                                                    <td width="27%"><p>ครั้งที่   3
                                                            <input name="A_percent_3" type="text" id="A_percent_3" size="8" onBlur="Calculator_AVG();" onKeyUp="IsNuber(this.value, this)">
                                                            %</p></td>
                                                    <td width="22%"><p>ครั้งที่   4
                                                            <input name="A_percent_4" type="text" id="A_percent_4" size="8" onBlur="Calculator_AVG();" onKeyUp="IsNuber(this.value, this)">
                                                            %</p></td>
                                                </tr>
                                                <tr>
                                                    <td><p>ครั้งที่ 5
                                                            <input name="A_percent_5" type="text" id="A_percent_5" size="8 " onBlur="Calculator_AVG();" onKeyUp="IsNuber(this.value, this)">
                                                            %</p></td>
                                                    <td><p>ครั้งที่ 6
                                                            <input name="A_percent_6" type="text" id="A_percent_6" size="8" onBlur="Calculator_AVG();" onKeyUp="IsNuber(this.value, this)">
                                                            %</p></td>
                                                    <td><p>ครั้งที่ 7
                                                            <input name="A_percent_7" type="text" id="A_percent_7" size="8" onBlur="Calculator_AVG();" onKeyUp="IsNuber(this.value, this)">
                                                            %</p></td>
                                                    <td><p>ครั้งที่ 8
                                                            <input name="A_percent_8" type="text" id="A_percent_8" size="8" onBlur="Calculator_AVG();" onKeyUp="IsNuber(this.value, this)">
                                                            %</p></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan='2' class='blankspace'><br>
                                            <div align="center">
                                                <a href="javascript:;" onClick="cancle()"><img alt="" class="imgtransparent" src="../IMAGES/BTN_CANCEL_90.png" width="80" height="30" border="0"></a>
                                                <a href="javascript:;" onClick="AddHeader()"><img alt="" class="imgtransparent" src="../IMAGES/BTN_SAVE_90.png" width="80" height="30" border="0"></a>
                                                <a href="javascript:;" onClick="Delete()"><img alt="" class="imgtransparent" src="../IMAGES/BTN_DEL_90.png" width="80" height="30" border="0"></a>
                                                <a href="javascript:;"  onclick="Chknull()"><img alt="พิมพ์เอกสาร" class="imgtransparent" src="../IMAGES/BTN_PRINT_90.png" width="80" height="30" border="0"></a>                                        </div>
                                            <br>                                  </td>
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
            </div>
        </form>
    </body>
</html>