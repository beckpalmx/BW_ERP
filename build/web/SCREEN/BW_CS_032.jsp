<%@page import="com.bw.Util.HeaderScreen_Report"%>
<%@page import="com.bw.bean.DataBean_Screen_Report"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.bw.bean.DataBean_Screen_Process"%>
<%@page import="com.bw.Util.HeaderScreen_Process"%>
<%@page import="com.bw.Util.UtiDatabase"%>
<%@page import="com.bw.bean.UserBean"%>
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
            function ResetValue() {
                getId("A_random_chk").value = "N";
                getId("A_pass_chk").value = "N";
                getId("A_not_pass_chk").value = "N";
                getId("A_naocl_chk").value = "N";
                getId("A_withdraw_chk").value = "N";
                getId("A_random_chk").checked = false;
                getId("A_pass_chk").checked = false;
                getId("A_not_pass_chk").checked = false;
                getId("A_naocl_chk").checked = false;
                getId("A_withdraw_chk").checked = false;
                getId("status_cancle").value = "";
                getId("show").innerHTML = "";
                getId("show2").innerHTML = "";
                getId("status_cancle").value = "";
                getId("show_status_id").innerHTML = "";
            }
            function Chknull() {
                if (document.getElementById('doc_id').value === '') {
                    alert('กรุณาใส่ข้อมูลเลขที่เอกสาร');
                } else {
                    document.report.submit();
                }
            }
            function goAddChild()
            {
                var strId = "";
                var arryChk = new Array;
                var URL = new Array;
                arryChk[0] = "chkNull";
                if (ChkParameter(arryChk))
                {
                    strId = strId + "doc_id,status_a,username";
                    URL = URLsend(strId, "../SCREEN/CS_033.jsp");
                    window.open(URL[0]);
                }

            }
            function Open_Job_id() {
                if (getId("status_cancle").value === "") {
                    openBrWindow('vd_job_order_header&stadment=and+complete_flag+<>+\'Y\'', 302, 'Search_Doc_id.jsp');
                }
            }
            function cancle()
            {

                var SURL;
                var r = confirm("คุณต้องการยกเลิกข้อมูลทั้งหมดหรือไม่");
                if (r)
                {
                    if (getId("status_cancle").value === "1") {
                        cancelAction();
                        ResetValue();
                    } else {
                        cancelAction();
                        ResetValue();
                    }
                }

            }
            function ckall(Value)//ทำการกดปุ้ม check ทั้งหมดใช้หรือไม่
            {

                for (var i = 0; i < document.getElementsByName("ckbox").length; i++)
                {
                    document.getElementsByName("ckbox")[i].checked = Value;
                }

            }
            function goDelChild()
            {

                var Deleteflag = "";
                var SURL;
                if (getId("chk_all").checked)//จะทำการลบข้อมูลของ Detail ทั้งหมด ทึ่ตรงกับรหัส
                {
                    var r = confirm("คุณต้องการลบข้อมูลลายละเอียดของเอกสารนี้ใช่หรือไม่");
                    if (r) {
                        SURL = "../JSP/BW_CS_Detail_031.jsp?D_status=3&chk_all=1&username=" + getId("A_username").value;
                        SURL = SURL + "&A_doc_id=" + getId("A_doc_id").value;
                        Delete_Line_no(SURL);
                        getId("show2").innerHTML = "";
                        getId("chk_all").checked = false;
                    }
                }
                else//จะทำการลบข้อมูลเฉพาะ Datail ที่ทำการเลือกไว้
                {
                    SURL = "../JSP/BW_CS_Detail_031.jsp?D_status=3&ckbox=";
                    for (var i = 0; i < document.getElementsByName("ckbox").length; i++)
                    {
                        Deleteflag += (document.getElementsByName("ckbox")[i].checked) ? document.getElementsByName("ckbox")[i].value + "," : "";
                    }
                    Deleteflag = Deleteflag.substring(0, Deleteflag.length - 1);
                    if (Deleteflag !== "") {
                        SURL = SURL + Deleteflag + "&A_doc_id=" + getId("A_doc_id").value + "&username=" + getId("A_username").value;
                        Delete_Line_no(SURL);
                        showTableNonPopup("show2", "A_doc_id", "../SHOWDETAILSCREEN/BW_CS_Show031_Other.jsp?doc_id=");
                        setTimeout('showTableNonPopup("show", "A_doc_id", "../SHOWDETAILSCREEN/BW_CS_Show031_Other.jsp?doc_id=")', 1000);
                    } else {
                        showTableNonPopup("show", "A_doc_id", "../SHOWDETAILSCREEN/BW_CS_Show031_Spec.jsp?doc_id=");
                        showTableNonPopup("show2", "A_doc_id", "../SHOWDETAILSCREEN/BW_CS_Show031_Other.jsp?doc_id=");
                    }

                }
            }
            function OpenEdit(URLSend)
            {
                window.open(URLSend[0]);
            }
            function AddHeader()
            {

                var r = confirm("คุณต้องการบันทึกหรือไม่");
                if (r)
                {
                    if (getId("A_doc_id").value === "") {
                        alert("กรุณาป้อนเลขที่เอกสาร !!! โดยป้อนวันที่ , เวลา , Lot No ,หมายเลขกระสอบ แล้วกดปุ่มสร้างเลขที่เอกสาร");
                    } else {
                        var strID = "";
                        strID += getIDElements('input', 'I_');
                        strID += getIDElements('input', 'A_');
                        strID += getIDElements('select', 'A_');
                        strID += getIDElements('textarea', 'A_');
                        strID = strID.substr(0, strID.length - 1);
                        getSave(URLsend('chkNull,' + strID, '../JSP/BW_CS_032.jsp'));
                        ResetValue();
                    }
                }
            }
            function Delete()
            {
                var r = confirm("คุณต้องการลบข้อมูลทั้งหมดหรือไม่");
                if (r)
                {
                    getSave(URLsend('D_status,A_doc_id', '../JSP/BW_CS_032.jsp'));
                    ResetValue();
                }
            }
            function Unload()
            {
            }
            function chkValue(input, thisChk)
            {
                if (thisChk) {
                    getId(input).value = 'Y';
                    //alert(getId(input).value);
                } else {
                    getId(input).value = 'N';
                    //alert(getId(input).value);
                }
            }
            function chkValue2(casevalue)
            {
                switch (casevalue) {
                    case 1:
                        if (getId("A_pass_chk").checked) {
                            getId("A_pass_chk").value = 'Y';
                            getId("A_not_pass_chk").value = 'N';
                            getId("A_not_pass_chk").checked = false;
                            //alert(getId("A_pass_chk").value+'\n'+getId("A_not_pass_chk").value);
                        } else {
                            getId("A_pass_chk").value = 'N';
                            getId("A_not_pass_chk").value = 'N';
                            getId("A_pass_chk").checked = false;
                            getId("A_not_pass_chk").checked = false;
                        }
                        break;
                    case 2 :
                        if (getId("A_not_pass_chk").checked) {
                            getId("A_not_pass_chk").value = 'Y';
                            getId("A_pass_chk").value = 'N';
                            getId("A_pass_chk").checked = false;
                            //alert(getId("A_pass_chk").value+'\n'+getId("A_not_pass_chk").value);
                        } else {
                            getId("A_pass_chk").value = 'N';
                            getId("A_not_pass_chk").value = 'N';
                            getId("A_pass_chk").checked = false;
                            getId("A_not_pass_chk").checked = false;
                        }
                        break;
                }
            }
            //document.onkeydown = chkEvent
            function CheckValue(Spec_min_value, Spec_max_value, Value_value, Unit_value, check_box) {
                var value_input = parseFloat(getId(Value_value).value).toFixed(2);
                var min_value = parseFloat(getId(Spec_min_value).value).toFixed(2);
                var max_value = parseFloat(getId(Spec_max_value).value).toFixed(2);
                switch (getId(Unit_value).value) {
                    case "Min-Max":
                        if (Value_value === "A_value9") {
                            if (value_input >= min_value && value_input <= max_value) {
                                getId(check_box).checked = false;
                                getId(check_box).value = "N";
                            } else if (value_input < min_value) {
                                getId(check_box).checked = true;
                                getId(check_box).value = "L";//Low
                            } else if (value_input > max_value) {
                                getId(check_box).checked = true;
                                getId(check_box).value = "H";//Hight
                            }
                        } else {
                            if (value_input >= min_value && value_input <= max_value) {
                                getId(check_box).checked = false;
                                getId(check_box).value = "N";
                            } else {
                                getId(check_box).checked = true;
                                getId(check_box).value = "Y";
                            }
                        }
                        break;
                    case "Min":
                        if (value_input >= min_value && value_input >= max_value) {
                            getId(check_box).checked = false;
                            getId(check_box).value = "N";
                        } else {
                            getId(check_box).checked = true;
                            getId(check_box).value = "Y";
                        }
                        break;
                    case "Max":
                        if (value_input >= min_value && value_input <= max_value) {
                            getId(check_box).checked = false;
                            getId(check_box).value = "N";
                        } else {
                            getId(check_box).checked = true;
                            getId(check_box).value = "Y";
                        }
                        break;
                    default:
                        break;
                }

            }
            function check_status_doc_id() {
                var arryChk = new Array;
                arryChk[0] = "chkNull";
                if (ChkParameter(arryChk)) {
                    var mat_doc_id = getId("A_p_type").value + (format_date_id()) + getId("A_shift").value + "-" + (getId("A_bag_no").value.length === 1 ? "00" + getId("A_bag_no").value : getId("A_bag_no").value.length === 2 ? "0" + getId("A_bag_no").value : +getId("A_bag_no").value) + "/" + (getId("A_p_grade").value) + "-" + (getId("initial").value);
                    getId("A_doc_id").value = mat_doc_id;
                    getshow_status("show_status_id", "A_doc_id", "../JSP/BW_CS_032.jsp?Doc_id_check=4&A_doc_id=");
                }

                //showTableNonPopup("show_status_id", "A_doc_id", "../JSP/BW_CS_032.jsp?Doc_id_check=4&A_doc_id=");
            }
            function format_date_id() {
                var value_date = getId("A_doc_date").value.replace(/-/g, "");
                return value_date.substr(0, 4) + value_date.substr(6, 8);
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

                UserBean userbean = (UserBean) session.getAttribute("user");
                DataBean_Screen_Process objs_p = new DataBean_Screen_Process();
                HeaderScreen_Process h_p = new HeaderScreen_Process();
                UtiDatabase objuti = new UtiDatabase();
                objs_p = h_p.selectheaderscreen_detail(objs_p, "BW_CS_032");
                // _______________________________________________________________report
                DataBean_Screen_Report objr_p = new DataBean_Screen_Report();
                HeaderScreen_Report r_p = new HeaderScreen_Report();
                objr_p = r_p.Fn_Report(objr_p, "S507");
                path = objr_p.getPath();
                lookup = objr_p.getLookup();
                //doc_eff_date = objr_p.getDoc_eff_date();
                //doc_no = objr_p.getDoc_no();                
                doc_eff_date = objs_p.getIso_no();
                doc_no = objs_p.getEffective_date();                
                //_______________________________________________________________report
            %>
            <div id="toolTipLayer" style="position:absolute; visibility: hidden"></div>



            <input name="username" type="hidden" id="username" value="<%=userbean.getUsername()%>" size="30" readonly/>
            <input type="hidden" id="chkNull" value="A_doc_date,A_shift,A_lot_no,A_bag_no">
            <input type="hidden" id="I_status" value="1"><!-- เป็นการเพิ่มข้อมูลเข้าไป-->
            <input type="hidden" id="D_status" value="3"><!-- เป็นการ Delete ข้อมูลทั้งหมด -->
            <input type="hidden" id="status_cancle" value=""><!-- status_cancle = 1 คือค่าที่นำมา Edit แต่ถ้า ="" จะเป็นการ Insert -->
            <input type="hidden" id="child_ck" name="child_ck" value="">
            <!---------------------------------------------------report----------------------------->
            <input type="hidden" id="report_code" name="report_code"  value="<%=path%>">
            <input type="hidden" id="type_report" name="type_report" value="2">
            <input type="hidden" id="lookup" name="lookup" value="<%=lookup%>">
            <input type="hidden" id="doc_eff_date" name="doc_eff_date" value="<%=doc_eff_date%>">
            <input type="hidden" id="doc_no" name="doc_no" value="<%=doc_no%>">

            <div class="container">
                <div class="panel panel-primary">
                    <div class="panel-heading"> <span class="glyphicon glyphicon-pencil"></span>&nbsp;
                        <b>บันทึกใบแสดงผลิตภัณฑ์ (BW_CS_032)</b>
                    </div>                        
                    <div class="panel-footer">                           
                        <div align="center">
                            <table  cellpadding="0" cellspacing="0" >
                                <tr>
                                    <td colspan="2" align="right"><b>หมายเลขเอกสาร : <%=objs_p.getIso_no()%> </b></td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="right"><b>วันที่มีผลบังคับใช้ : <%=objs_p.getEffective_date()%> </b></td>
                                </tr>
                                <tr>
                                    <td class="columnlabel1"></td>
                                    <td class="columnobject"><div id="show_status_id" style="font-size: large;"></div></b></td>
                                </tr>
                                
                                
                                
                                <tr>
                                    <td width="150" class="columnlabel1"><input type="button" class="cgcButton_8" value="เลขที่เอกสาร" id="bt_run_id" onclick="check_status_doc_id()"></td>
                                    <td width="607" class="columnobject">
                                        <input name='A_doc_id' class='inputs' type="text" id="A_doc_id" value='' size='40'/>
                                        &nbsp;<a href='javascript:;' onClick="openBrWindow('vd_product_analysis_header&stadment=and+complete_flag+<>+\'Y\'', 32, 'Search_Doc_id.jsp');"><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE1' width='20' height='20' border='0' align='middle' ></a>&nbsp;&nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="columnlabel1">วันที่เอกสาร*&nbsp;</td>
                                    <td class="columnobject">
                                        <input name='A_doc_date' class='inputs' type="text" id="A_doc_date" value='' size='10' readonly />
                                        &nbsp;<a id='date_1' ><img name='IMAGE2' src='../IMAGES/BUTTON/MAIN/CALENDAR20.png' border='0' align='absmiddle'></a><script type='text/javascript'>Calendar.setup({inputField: 'A_doc_date', ifFormat: '%d-%m-%Y', showsTime: false, button: 'date_1', singleClick: true, step: 1});</script>
                                        &nbsp;&nbsp;เวลา<input name="A_doc_time" class='inputs' type="text" id="A_doc_time" size="10">
                                    </td>
                                <tr>
                                    <td class="columnlabel1">กะ                             </td>
                                    <td class="columnobject">
                                        <%=objuti.ShowSelectBox("select shift_id,name_t from mshift where shift_id in('A','B','A2','B2') order by runno", "shift_id", "name_t", "A_shift")%>&nbsp;&nbsp;
                                        ประเภทแป้ง&nbsp;&nbsp;
                                        <select class='select_cgc2' name="A_p_type" id="A_p_type">
                                            <option value="P">แป้งผลิต</option>
                                            <option value="R">แป้งถ่าย</option>
                                        </select>&nbsp;&nbsp;
                                        เกรดแป้ง&nbsp;&nbsp;
                                        <select class='select_cgc2' name="A_p_grade" id="A_p_grade">
                                            <option value="N">Native</option>
                                            <option value="H">Food grade</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="columnlabel1">ใบแจ้งผลิต</td>
                                    <td class="columnobject"><input name="A_production_id" class='inputs' type="text" id="A_production_id" size="20">
                                        &nbsp;<a href='javascript:;' onClick="Open_Job_id();"><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE1' width='20' height='20' border='0' align='middle' ></a>&nbsp;&nbsp;
                                        <input class='inputs' type="text" name="cust_name" id="cust_name" size="30">&nbsp;
                                        ชื่อย่อลูกค้า<input class='inputs' type="text" id="initial" name="initial" value="">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="columnlabel1">รหัสสินค้า</td>
                                    <td class="columnobject"><input name='A_product_lot_id' class='inputs' type="text" id="A_product_lot_id" value='' size='10'  />
                                        &nbsp;&nbsp;<input class='inputs' type="text" name="product_name" id="product_name" value=""></td>
                                </tr>
                                <tr>
                                    <td class="columnlabel1"><p>LOT.NO.</p></td>
                                    <td class="columnobject"><input name="A_lot_no" class='inputs' type="text" id="A_lot_no" size="10">
                                        &nbsp;&nbsp;<input name="A_size" class='inputs' type="text" id="A_size" size="20">กก.</td>
                                </tr>
                                <tr>
                                    <td class="columnlabel1">กระสอบที่</td>
                                    <td class="columnobject"><input name="A_bag_no" class='inputs' type="text" id="A_bag_no" size="10"></td>
                                </tr>
                                <tr>
                                    <td colspan='2' class='blankspace'></td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center">
                                        <div style="width:100%;">
                                            <table width="100%" align="center" border="0" cellpadding="0" cellspacing="1" class="inner">
                                                <tr>
                                                    <td colspan="6" class="h_multi">ข้อมูลการผลิต</td>
                                                </tr>
                                                <tr>
                                                    <td class="row3" width="3px"></td>
                                                    <td class="row3" width="7%">ลำดับที่&nbsp;</td>
                                                    <td class="row3" width="20%">ข้อมูลวัตถุดิบ</td>
                                                    <td class="row3" width="20%">Specification</td>
                                                    <td class="row3" width="20%">Value&nbsp;</td>
                                                    <td class="row3" width="20%">unit&nbsp;</td>
                                                    <td class="row3" width="10%">ไม่ผ่าน</td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div  id="show">
                                        </div></td>
                                </tr>
                                <tr>
                                    <td colspan='2' class='blankspace'></td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center">
                                        <div style="width:100%;">
                                            <table width="100%" align="center" border="0" cellpadding="0" cellspacing="1" class="inner">
                                                <tr>
                                                    <td colspan="3" class="h_multi">อื่นๆ&nbsp;&nbsp;Others</td>
                                                    <td colspan="3" class="btn_multi">
                                                    </td>
                                                </tr>
                                                <tr>                                                    
                                                    <td class="row3" width="18"></td>
                                                    <td class="row3" width="46">ลำดับที่&nbsp;</td>
                                                    <td class="row3" width="136">ข้อมูลวัตถุดิบ</td>
                                                    <td class="row3" width="136">Specification</td>
                                                    <td class="row3" width="132">Value&nbsp;</td>
                                                    <td class="row3" width="136">unit&nbsp;</td>
                                                    <td class="row3" width="69">ไม่ผ่าน</td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div style="width:100%; height: 150px; overflow: auto;" id="show2"></div>                    
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan='2' class='blankspace'></td>
                                </tr>
                                <tr>
                                    <td class="columnlabel1">หมายเหตุ&nbsp;</td>
                                    <td class="columnobject"><textarea class='text_inputs' name='A_remark' cols='80' rows='5' id="A_remark"></textarea></td>
                                </tr>
                                <!--tr>
                                    <td class="columnlabel1">&nbsp;</td>
                                    <td class="columnobject">
                                        <input type="checkbox" name="A_random_chk" id="A_random_chk" value="N" onClick="chkValue(this.id, this.checked);">
                                        ลูก/กระสอบ/เลท    ช.ม.</td>
                                </tr-->
                                <tr>
                                    <td class="columnlabel1">&nbsp;</td>
                                    <td class="columnobject">

                                        <div class="checkbox checkbox-primary">
                                            <input type="checkbox" name="A_random_chk" id="A_random_chk" value="N" onClick="chkValue(this.id, this.checked);">
                                            <label for="A_random_chk">ลูก/กระสอบ/เลท    ช.ม.</label>                                                                              
                                        </div>           
                                    </td>
                                </tr>

                                <!--tr>
                                    <td class="columnlabel1">ผลตรวจสอบ&nbsp;</td>
                                    <td class="columnobject">
                                        <input type="checkbox" name="A_pass_chk" id="A_pass_chk" value="N" onClick="chkValue2(1);">
                                        ผ่าน&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="checkbox" name="A_not_pass_chk" id="A_not_pass_chk" value="N" onClick="chkValue2(2);">
                                        ไม่ผ่าน</td>
                                </tr-->

                                <tr>
                                    <td class="columnlabel1">&nbsp;</td>
                                    <td class="columnobject">
                                        <div class="checkbox checkbox-primary">
                                            <input type="checkbox" name="A_pass_chk" id="A_pass_chk" value="N" onClick="chkValue2(1);">
                                            <label for="A_pass_chk">ผ่าน&nbsp;&nbsp;&nbsp;&nbsp;</label>&nbsp;&nbsp;
                                            <input type="checkbox" name="A_not_pass_chk" id="A_not_pass_chk" value="N" onClick="chkValue2(2);">
                                            <label for="A_not_pass_chk">ไม่ผ่าน</label>                                                  
                                        </div>           
                                    </td>
                                </tr>                                

                                <!--tr>
                                    <td class="columnlabel1">&nbsp;</td>
                                    <td class="columnobject"><input type="checkbox" name="A_naocl_chk" id="A_naocl_chk" value="N" onClick="chkValue(this.id, this.checked);">
                                        NaOCI                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="checkbox" name="A_withdraw_chk" id="A_withdraw_chk" value="N" onClick="chkValue(this.id, this.checked);">
                                        เบิกออก</td>
                                </tr-->

                                <tr>
                                    <td class="columnlabel1">&nbsp;</td>
                                    <td class="columnobject">
                                        <div class="checkbox checkbox-primary">
                                            <input type="checkbox" name="A_naocl_chk" id="A_naocl_chk" value="N" onClick="chkValue(this.id, this.checked);">
                                            <label for="A_naocl_chk">NaOCI&nbsp;&nbsp;&nbsp;&nbsp;</label>&nbsp;&nbsp;
                                            <input type="checkbox" name="A_withdraw_chk" id="A_withdraw_chk" value="N" onClick="chkValue(this.id, this.checked);">
                                            <label for="A_withdraw_chk">เบิกออก</label>                                                  
                                        </div>           
                                    </td>
                                </tr>                                         

                                <tr>
                                    <td class="columnlabel1"><p>ผู้ตรวจสอบ</p></td>
                                    <td class="columnobject"><input name='A_approver_id' class='inputs' type="text" id="A_approver_id" value='' size='10' readonly />
                                        &nbsp;<a href='javascript:;' onClick="openBrWindow('Vemployee', 32, 'Search_Config2.jsp')"><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE3' width='20' height='20' border='0' align='middle' ></a>&nbsp;&nbsp;&nbsp;
                                        <input name='approver_id_desc' class='inputs' type="text" id="approver_id_desc" value='' size='30' readonly/></td>
                                </tr>
                                <tr>
                                    <td class="columnlabel1">&nbsp;</td>
                                    <td class="columnobject">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan='2' class='blankspace'><br>
                                        <div align="center">
                                            <a href="javascript:;" onClick="cancle()"><img alt="" class="imgtransparent" src="../IMAGES/BTN_CANCEL_90.png" width="80" height="30" border="0"></a>
                                            <a href="javascript:;" onClick="AddHeader()"><img alt="" class="imgtransparent"  src="../IMAGES/BTN_SAVE_90.png" width="80" height="30" border="0"></a>
                                            <a href="javascript:;" onClick="Delete()"><img alt="" class="imgtransparent" src="../IMAGES/BTN_DEL_90.png" width="80" height="30" border="0"></a>
                                            <a href="javascript:;"  onclick="Chknull()"><img alt="พิมพ์เอกสาร" class="imgtransparent" src="../IMAGES/BTN_PRINT_90.png" width="80" height="30" border="0"></a>                                        </div>
                                        <br>                                  
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </body>
</html>

