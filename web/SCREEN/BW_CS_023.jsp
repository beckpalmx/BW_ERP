<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.bw.Util.HeaderScreen_Report"%>
<%@page import="com.bw.bean.DataBean_Screen_Report"%>
<%@page import="com.bw.bean.DataBean_Screen_Process"%>
<%@page import="com.bw.Util.HeaderScreen_Process"%>
<%@page import="com.bw.bean.UserBean"%>
<html>
    <%!    String path, lookup, doc_eff_date, doc_no;
    %>
    <head>
        <META Http-Equiv="Cache-Control" Content="no-cache">
        <META Http-Equiv="Pragma" Content="no-cache">
        <script language="javascript" src="../JS/myAjaxFramework.js"></script>
        <link rel="stylesheet" type="text/css" media="all" href="../JS/jscalendar/skins/aqua/aqua.css" title="Aua" />
        <script type="text/javascript" src="../JS/jscalendar/calendar.js"></script>
        <script type='text/javascript' src='../JS/jscalendar/lang/calendar-th.js'></script>
        <script type="text/javascript" src="../JS/jscalendar/calendar-setup.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../CSS/MENU.css" rel="stylesheet" type="text/css">
        <link href="../CSS/BT.css" rel="stylesheet" type="text/css">  <link href="../CSS/component.css" rel="stylesheet" type="text/css"> 
        <link href="../CSS/cgc_button.css" rel="stylesheet" type="text/css">
        <title>Untitled Document</title>
        <script type="text/javascript">
            var zxcMaxYScroll = 1000;

            function zxcStopScroll() {
                //alert(window.pageYOffset);
                if (document.all) {
                    zxcWS = document.body.scrollTop;
                }
                else {
                    zxcWS = window.pageYOffset;
                }
                if (zxcWS > zxcMaxYScroll) {
                    window.scroll(0, zxcMaxYScroll);
                }
            }
            window.onscroll = zxcStopScroll
            function Chknull() {
                if (document.getElementById('A_doc_id').value == '') {
                    alert('กรุณาใส่ข้อมูลเลขที่เอกสาร');
                } else
                    document.report.submit();
            }
            function goAddChild(URLSend)
            {
                var arryChk = new Array;
                arryChk[0] = "chkNull"
                if (ChkParameter(arryChk))
                {
                    window.open(URLSend[0]);
                }

            }
            function cancle()
            {
                cancelAction();
                getId("status_cancle").value = "";
            }
            function Add()
            {
                var r = confirm("คุณต้องการบันทึกหรือไม่")
                if (r)
                {
                    if (getId("calculator").disabled == true) {
                        var strID = "";
                        strID = getIDElements('input', 'A_');
                        strID = strID.substr(0, strID.length - 1);
                        //alert(strID);
                        getSave(URLsend('chkNull,' + strID, '../JSP/BW_CS_023.jsp'));
                        getId("calculator").disabled = false;
                    } else {
                        alert("กรุณากดปุ่มคำนวณ");
                    }

                }
            }
            function Delete()
            {
                var r = confirm("คุณต้องการลบข้อมูลทั้งหมดหรือไม่")
                if (r)
                {
                    getSave(URLsend('A_doc_id,D_status', '../JSP/BW_CS_023.jsp'));

                }
            }
            function Unload()
            {
            }
            function OpenDoc_id()
            {
                openBrWindow('vd_rawmatt_report&stadment=and+complete_flag+<>+\'Y\'', 23, 'Search_Config2.jsp');
            }
            function Accounted_for(input_one, input_two) {
                var input_one = parseFloat(getId(input_one).value);
                var input_two = parseFloat(getId(input_two).value);
                return ((input_one * input_two) / 100).toFixed(2);
            }
            function Calculator_ALL() {
                var value_chk = true;
                var arraychk = ("A_amount_cassava_p,A_percent_tapioca_p,A_total_peel_fresh,A_percent_moisture,A_amount_soil_crust").split(",");
                for (var i = 0; i < arraychk.length; i++)
                {
                    if (getId(arraychk[i]).value == "") {
                        alert('ข้อมูลไม่ครบถ้วน');
                        getId(arraychk[i]).focus();
                        value_chk = false;
                        break;
                    }
                }
                if (value_chk) {
                    getId("A_peel_fresh_date").value = getId("A_cassava_date").value;
                    getId("A_soil_crust_date").value = getId("A_cassava_date").value;
                    //alert("A_cassava_date = " + getId("A_cassava_date").value);
                    //***********************************คำนวณข้อมูลจัดซื้อหัวมันสด*******************************
                    //getId('A_amount_tapioca_p').value = Accounted_for('A_amount_cassava_p', 'A_percent_tapioca_p');
                    //***********************************คำนวณข้อมูลเปลือกสด***********************************
                    var cal_1 = (parseFloat(getId('A_total_peel_fresh').value) - Accounted_for('A_total_peel_fresh', 'A_percent_moisture')).toFixed(2);
                    var res_cal_1 = [];
                    res_cal_1 = cal_1.split(".");
                    //alert("cal_1 = " + cal_1 + " res_cal_1 = " + res_cal_1[0]);
                    getId('A_amount_peel_fresh').value = res_cal_1[0];

                    //*********************************ข้อมูลเปลือกดิน********************************************
                    getId('A_total_cassava').value = ((parseFloat(getId('A_amount_cassava_p').value) - parseFloat(getId('A_amount_peel_fresh').value)) - parseFloat(getId('A_amount_soil_crust').value)).toFixed(2);
                    //********************************
                    getId('A_total_tapioca').value = Accounted_for('A_total_cassava', 'A_percent_tapioca_p');
                    getId("calculator").disabled = true;
                }
            }


            function Runing_Doc_id() {
                if (document.getElementById('A_doc_date').value == '') {
                    alert('กรุณาใส่วันที่เอกสาร');
                } else
                    //AjaxRun_id("A_doc_date", "../JSP/CS_117.jsp?runer_id=" + getId("A_doc_date").value);
                    //AjaxRun_id('A_doc_id', '../JSP/BW_CS_023.jsp?status_runid=5');
                    AjaxRun_id("A_doc_id", "../JSP/BW_CS_023.jsp?status_runid=" + getId("A_doc_date").value);
            }



        </script>

    </head>

    <body>
        <form name="report" method="post" action="../JSP/CS_REPORT.jsp" target="_blank">

            <%
                UserBean userbean = (UserBean) session.getAttribute("user");
                DataBean_Screen_Process objs_p = new DataBean_Screen_Process();
                HeaderScreen_Process h_p = new HeaderScreen_Process();
                objs_p = h_p.selectheaderscreen_process(objs_p, "BW_CS_023");
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
            <input name="username" type="hidden" id="username" value="<%=userbean.getUsername()%>" size="30" readonly/>
            <input type="hidden" name="chkNull" id="chkNull" value="A_doc_date,A_wh_in,A_wh_out,A_cassava_date,A_amount_cassava_a,A_percent_tapioca_a,A_amount_tapioca_a,A_peel_fresh_date,A_percent_moisture,A_total_peel_fresh,A_amount_peel_fresh,A_soil_crust_date,A_amount_soil_crust,A_total_cassava,A_total_tapioca,A_reporter_id,A_purchase_id,A_production_id">
            <input type="hidden" name="date_ck" id="date_ck"  value="">
            <input type="hidden" name="A_status" id="A_status" value="1"><!-- เป็นการเพิ่มข้อมูลเข้าไป-->
            <input type="hidden" name="D_status" id="D_status" value="3"><!-- เป็นการ Delete ข้อมูลทั้งหมด -->
            <input type="hidden" name="status_cancle" id="status_cancle" value=""><!-- status_cancle = 1 คือค่าที่นำมา Edit แต่ถ้า ="" จะเป็นการ Insert -->
            <input type="hidden" id="child_ck" name="child_ck" value="">
            <input type="hidden" id="status_calculator" value="4" >
            <!---------------------------------------------------report----------------------------->
            <input type="hidden" id="report_code" name="report_code"  value="<%=path%>">
            <input type="hidden" id="type_report" name="type_report" value="2">
            <input type="hidden" id="lookup" name="lookup" value="<%=lookup%>">
            <input type="hidden" id="doc_eff_date" name="doc_eff_date" value="<%=doc_eff_date%>">
            <input type="hidden" id="doc_no" name="doc_no" value="<%=doc_no%>">
            <div align="center">
                <table  cellpadding="0"  cellspacing="0">
                    <tr >
                        <td class="ftopleft"></td>
                        <td  class="ftopcenter" colspan="2">บันทึกรายงานวัตถุดิบ/กากสด/เปลือก
                            (BW_CS_023)&nbsp;</td>
                        <td class="ftopright"></td>
                    </tr>
                    <tr >
                        <td class="fcenterleft"></td>
                        <td  colspan="2" class="fcentercenter">
                            <div align="left">
                                <table  cellpadding="0" cellspacing="0" >
                                    <tr>
                                        <td colspan="2" align="right"><strong>หมายเลขเอกสาร :<%=objs_p.getIso_no()%> </strong></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="right"><strong>วันที่มีผลบังคับใช้ :<%=objs_p.getEffective_date()%></strong></td>
                                    </tr>
                                    <tr>
                                        <td class="columnlabel"><input type="button" class="cgcButton_8" id="runid" name="runid" value="เลขที่เอกสาร" onclick="Runing_Doc_id();"></td>
                                        <!--td class="columnlabel"><b>เลขที่เอกสาร&nbsp;</b></td-->
                                        <td class="columnobject">
                                            <input name='A_doc_id' type='text' id="A_doc_id" value='' size='12'  />
                                            &nbsp;<a href='#' onClick="OpenDoc_id()" ><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE1' width='20' height='20' border='0' align='middle' ></a>&nbsp;&nbsp;วันที่เอกสาร*&nbsp;
                                            <input name='A_doc_date' type='text' id="A_doc_date" value='' size='10' readonly="false" />
                                            &nbsp;<a id='date_1' ><img name='IMAGE2' src='../IMAGES/BUTTON/MAIN/CALENDAR20.png' border='0' align='absmiddle'></a><script type='text/javascript'>Calendar.setup({inputField: 'A_doc_date', ifFormat: '%d-%m-%Y', showsTime: false, button: 'date_1', singleClick: true, step: 1});</script>
                                            &nbsp;&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td height="72" class="columnlabel"></td>
                                        <td class="columnobject">
                                            <input name="A_wh_in" type="hidden" id="A_wh_in" value="<%=objs_p.getWarehouse_begin_id()%>" size="10" >
                                            <!--<input type="text" size="20"  id="wh_in_desc" name="wh_in_desc" value="">
                                            <a href='#' onClick="openBrWindow('Wh_bg&stadment=and+warehouse_id+=+\'<%=objs_p.getWarehouse_begin_id()%>\'', 23, 'Search_Config2.jsp');" ><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE3' width='20' height='20' border='0' align='middle' ></a> &nbsp;&nbsp;&nbsp;คลังรับ&nbsp;-->
                                            <input name="A_wh_out" type="hidden" id="A_wh_out" value="<%=objs_p.getWarehouse_end_id()%>" size="10">
                                            <!--<input type="text"  size="20"  id="wh_out_desc" name="wh_out_desc" value="">
                                            <a href='#' onClick="openBrWindow('Wh_en&stadment=and+warehouse_id+=+\'\'', 23, 'Search_Config2.jsp');" ><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE3' width='20' height='20' border='0' align='middle' ></a>--></td>
                                    </tr>
                                    <tr align="left">
                                        <td class="columnlabel"></td>
                                        <td class="columnobject"><input type="button" id="calculator" class="cgcButton_9" value="คำนวณทั้งหมด" onClick="Calculator_ALL()"></td>
                                    </tr>
                                    <tr>
                                        <td class="columnlabel">&nbsp;</td>
                                        <td class="columnobject"><table width="200" border="0">
                                                <tr>
                                                    <td width="37%"><b style="color: red">ข้อมูลจัดซื้อมันสด</b></td>
                                                    <td width="37%">&nbsp;</td>
                                                    <td width="26%">&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td><span class="columnlabel">วันที่ส่งหัวมันสด&nbsp;<input name='A_cassava_date' type='text' id="A_cassava_date" value='' size='10' readonly="false" />
                                                            &nbsp;<a id='date_2' ><img name='IMAGE2' src='../IMAGES/BUTTON/MAIN/CALENDAR20.png' border='0' align='absmiddle'></a><script type='text/javascript'>Calendar.setup({inputField: 'A_cassava_date', ifFormat: '%d-%m-%Y', showsTime: false, button: 'date_2', singleClick: true, step: 1});</script>
                                                            &nbsp;</span>&nbsp;</td>
                                                    <td align="right">&nbsp;เวลาตั้งแต่:<input type="text" id="A_doc_time_from" name="A_doc_time_from" size="10" value = '08.00'></td>
                                                    <td>&nbsp;ถึง<input type="text" id="A_doc_time_to" name="A_doc_time_to" size="10" value = '23.59'></td>
                                                </tr>
                                                <tr>
                                                    <td><input type="button" class="cgcButton_9" value="จำนวนหัวมันสด" onclick="getId('A_cassava_date').value != '' && getId('A_doc_time_from').value != '' && getId('A_doc_time_to').value != '' ? getData_d_rawmatt_receive('../JSP/BW_CS_023.jsp?status_calculator=4&A_cassava_date=' + getId('A_cassava_date').value + '&A_doc_time_from=' + getId('A_doc_time_from').value + '&A_doc_time_to=' + getId('A_doc_time_to').value, 'A_amount_cassava_a,A_percent_tapioca_a,A_amount_tapioca_a,A_amount_cassava_p,A_percent_tapioca_p,A_amount_tapioca_p') : alert('กรุณากรอกข้อมูลเกี่ยวกับวันและเวลาให้ครบ');">
                                                    </td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td>จำนวนหัวมันสด(บ/ช)
                                                        <input name="A_amount_cassava_a" type="text" id="A_amount_cassava_a" size="10" onFocus="getId('calculator').disabled = false;">
                                                        กก.</td>
                                                    <td>%แป้งซื้อเข้า
                                                        <input name="A_percent_tapioca_a" type="text" id="A_percent_tapioca_a" size="10" onFocus="getId('calculator').disabled = false;">
                                                        %</td>
                                                    <td>คิดเป็น
                                                        <input name="A_amount_tapioca_a" type="text" id="A_amount_tapioca_a" size="10" class="textboxtotal" readonly="false">กก.</td>
                                                </tr>
                                                <tr>
                                                    <td>จำนวนหัวมันสด(ผลิต)
                                                        <input name="A_amount_cassava_p" type="text" id="A_amount_cassava_p" size="10" onFocus="getId('calculator').disabled = false;">
                                                        กก.</td>
                                                    <td>%แป้งซื้อเข้า
                                                        <input name="A_percent_tapioca_p" type="text" id="A_percent_tapioca_p" size="10" onFocus="getId('calculator').disabled = false;">
                                                        %</td>
                                                    <td>คิดเป็น
                                                        <input name="A_amount_tapioca_p" type="text" id="A_amount_tapioca_p" size="10" class="textboxtotal" readonly="false">กก.</td>
                                                </tr>
                                            </table></td>
                                    </tr>
                                    <tr>
                                        <td class="columnlabel">&nbsp;</td>
                                        <td class="columnobject"><table width="200" border="0">
                                                <tr>
                                                    <td width="37%"><b style="color: #008000">ข้อมูลเปลือกสด</b></td>
                                                    <td width="37%">&nbsp;</td>
                                                    <td width="26%">&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td>ปริมาณวันที่
                                                        <input name="A_peel_fresh_date" type="text" id="A_peel_fresh_date" size="10" readonly="true">
                                                    </td>
                                                    <td><B>หักความชื้น%</B>
                                                        <input name="A_percent_moisture" type="text" id="A_percent_moisture" size="10" onFocus="getId('calculator').disabled = false;">
                                                        %.</td>
                                                    <td><B>จาก</B>
                                                        <input name="A_total_peel_fresh" type="text" id="A_total_peel_fresh" size="10" onFocus="getId('calculator').disabled = false;">
                                                        กก.</td>
                                                </tr>
                                                <tr>
                                                    <td><span class="columnlabel">จำนวน&nbsp;
                                                            <input name='A_amount_peel_fresh' type='text' id="A_amount_peel_fresh" value='' size='10' class="textboxtotal"/>
                                                            &nbsp;กก.</span></td>
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                </tr>

                                            </table></td>
                                    </tr>
                                    <tr>
                                        <td class="columnlabel">&nbsp;</td>
                                        <td class="columnobject"><table width="200" border="0">
                                                <tr>
                                                    <td><b style="color: saddlebrown">ข้อมูลเปลือกดิน</b></td>
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td>ปริมาณวันที่
                                                        <input name="A_soil_crust_date" type="text" id="A_soil_crust_date" size="10" readonly="true">
                                                    </td>
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td><span class="columnlabel"><B>จำนวน</B>&nbsp;
                                                            <input name='A_amount_soil_crust' type='text' id="A_amount_soil_crust" value='' size='10'  onfocus="getId('calculator').disabled = false;"/>
                                                            &nbsp;กก.</span></td>
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                </tr>

                                            </table></td>
                                    </tr>

                                    <tr>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>                                    

                                    <tr>
                                        <td class="columnlabel">&nbsp;</td>
                                        <td class="columnobject">จำนวนมันสุทธิ
                                            <input type="text" name="A_total_cassava" id="A_total_cassava" class="textboxtotal">
                                            กก.&nbsp;&nbsp;&nbsp;&nbsp;%แป้ง
                                            <input type="text" name="A_total_tapioca" id="A_total_tapioca" class="textboxtotal">
                                            กก.</td>
                                    </tr>
                                    <tr>
                                        <td class="columnlabel">&nbsp;</td>
                                        <td class="columnobject">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="columnlabel">ผู้จัดทำ</td>
                                        <td class="columnobject"><input name="A_reporter_id" type="text" id="A_reporter_id" size="15">
                                            <img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE3' width='20' height='20' border='0' align='middle' style="cursor: pointer;" onClick="openBrWindow('Vemployee', 23, 'Search_Config2.jsp');">
                                            <input name="reporter_id_desc" type="text" id="reporter_id_desc" size="30"></td>
                                    </tr>
                                    <tr>
                                        <td class="columnlabel"><p>หัวหน้าแผนกจัดซื้อวัตถุดิบ<br>และจัดส่ง</p></td>
                                        <td class="columnobject">
                                            <input name="A_purchase_id" type="text" id="A_purchase_id" size="15">
                                            <img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE3' width='20' height='20' border='0' align='middle' style="cursor: pointer;" onClick="openBrWindow('Vemployee1', 23, 'Search_Config2.jsp');">
                                            <input name="purchase_id_desc" type="text" id="purchase_id_desc" size="30"></td>
                                    </tr>
                                    <tr>
                                        <td class="columnlabel"><p>ผู้จัดการ/หน.แผนกผลิต</p></td>
                                        <td class="columnobject">
                                            <input name="A_production_id" type="text" id="A_production_id" size="15">
                                            <img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE3' width='20' height='20' border='0' align='middle' style="cursor: pointer;" onClick="openBrWindow('Vemployee2', 23, 'Search_Config2.jsp');">
                                            <input name="production_id_desc" type="text" id="production_id_desc" size="30"></td>
                                    </tr>
                                    <tr>
                                        <td height="27" colspan='2' class='blankspace'></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="center">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td colspan='2' class='blankspace'>
                                            <br>
                                            <div align="center">
                                                <a href="javascript:;" onClick="cancle()"><img alt=""  class="imgtransparent" src="../IMAGES/BTN_CANCEL_90.png" width="80" height="30" border="0"></a>
                                                <a href="javascript:;" onClick="Add()"><img alt=""   class="imgtransparent" src="../IMAGES/BTN_SAVE_90.png" width="80" height="30" border="0"></a>
                                                <a href="javascript:;" onClick="Delete()"><img alt=""  class="imgtransparent" src="../IMAGES/BTN_DEL_90.png" width="80" height="30" border="0"></a>
                                                <a href="javascript:;"  onclick="Chknull()"><img alt="พิมพ์เอกสาร" class="imgtransparent" src="../IMAGES/BTN_PRINT_90.png" width="80" height="30" border="0"></a></div>
                                            <br>                                </td>
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
