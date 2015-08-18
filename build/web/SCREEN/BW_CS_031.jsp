<%@page import="com.bw.Util.HeaderScreen_Report"%>
<%@page import="com.bw.bean.DataBean_Screen_Report"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.bw.bean.DataBean_Screen_Process"%>
<%@page import="com.bw.Util.HeaderScreen_Process"%>
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
        <script type="text/javascript">
            function ResetValue() {
                getId("maxline").value = "0";
                getId("A_base_plate").value = "1";
                getId("A_base_plate_qty").disabled = true;
                getId("A_base_plate_qty").value = "";
                getId("A_wrap_on_pallet").disabled = true;
                getId("A_wrap_on_pallet").value = "";
                getId("A_pallet_qty").disabled = true;
                getId("A_pallet_qty").value = "";
                getId("base_plate1").checked = true;
                getId("base_plate2").checked = false;
                getId("base_plate3").checked = false;
                getId("show").innerHTML = "";
                getId("show2").innerHTML = "";
                getId("status_cancle").value == "";
            }
            function Chknull() {
                if (document.getElementById('doc_id').value == '') {
                    alert('กรุณาใส่ข้อมูลเลขที่เอกสาร');
                } else
                    document.report.submit();
            }
            function goAddChild()
            {


                if (getId("status_cancle").value == "1") {
                    var arryChk = new Array;
                    var URL = new Array;
                    arryChk[0] = "chkNull";
                    if (ChkParameter(arryChk))
                    {

                        URL = URLsend("I_status,A_doc_id,A_username", "../SCREEN/BW_CS_Detail_031.jsp")
                        window.open(URL[0]);
                    }
                } else {
                    alert("กรุณาบันทึกหัวเอกสาร");
                }

            }
            function cancle()
            {
                location.replace("BW_CS_031.jsp");
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
                    var r = confirm("คุณต้องการลบข้อมูลลายละเอียดของเอกสารนี้ใช่หรือไม่")
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
                    if (Deleteflag != "") {
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
                var r = confirm("คุณต้องการบันทึกหรือไม่")
                if (r)
                {
                    var strID = "";
                    strID += getIDElements('input', 'I_');
                    strID += getIDElements('input', 'A_');
                    strID += getIDElements('select', 'A_');
                    strID += getIDElements('textarea', 'A_');
                    strID = strID.substr(0, strID.length - 1);
                    //alert(strID);
                    getSave(URLsend('chkNull,' + strID, '../JSP/BW_CS_031.jsp'));
                    ResetValue();
                }
            }
            function Delete()
            {
                if (confirm("คุณต้องการบันทึกหรือไม่"))
                {
                    getSave(URLsend('A_doc_id,D_status', '../JSP/BW_CS_031.jsp'));
                    ResetValue();
                }
            }
            function Unload()
            {
            }
            function chkValue(input)
            {
                switch (input) {
                    case 1:
                        getId("A_base_plate").value = 1;
                        getId("A_base_plate_qty").disabled = true;
                        getId("A_base_plate_qty").value = "";
                        getId("A_wrap_on_pallet").disabled = true;
                        getId("A_wrap_on_pallet").value = "";
                        getId("A_pallet_qty").disabled = true;
                        getId("A_pallet_qty").value = "";
                        getId("base_plate2").checked = false;
                        getId("base_plate3").checked = false;
                        break;
                    case 2:
                        getId("A_base_plate").value = 2;
                        getId("A_base_plate_qty").disabled = false;
                        getId("A_base_plate_qty").value = "";
                        getId("A_wrap_on_pallet").disabled = true;
                        getId("A_wrap_on_pallet").value = "";
                        getId("A_pallet_qty").disabled = true;
                        getId("A_pallet_qty").value = "";
                        getId("base_plate1").checked = false;
                        getId("base_plate3").checked = false;
                        break;
                    case 3:
                        getId("A_base_plate").value = 3;
                        getId("A_base_plate_qty").disabled = true;
                        getId("A_base_plate_qty").value = "";
                        getId("A_wrap_on_pallet").disabled = false;
                        getId("A_wrap_on_pallet").value = "";
                        getId("A_pallet_qty").disabled = false;
                        getId("A_pallet_qty").value = "";
                        getId("base_plate1").checked = false;
                        getId("base_plate2").checked = false;
                        break;
                    default:
                        break;
                }
            }

            //document.onkeydown = chkEvent
            function chkEvent() {
            }
            function CreateNewRow()
            {
                var intLine = parseInt(getId("maxline").value);
                intLine++;
                var theTable = document.getElementById("tbdetail");
                var newRow = theTable.insertRow(theTable.rows.length);
                newRow.id = newRow.uniqueID;
                var item1 = 1;
                var newCell;
                //*** Column 1 ***//
                newCell = newRow.insertCell(0)
                newCell.id = newCell.uniqueID
                newCell.setAttribute("width", "3px");
                newCell.setAttribute("class", "forborder");
                newCell.innerHTML = "<td ><input type = 'checkbox' id = 'ckbox_" + (intLine + 12) + "' name = 'ckbox'></td>"
                newCell = newRow.insertCell(1)
                newCell.setAttribute("width", "7%");
                newCell.setAttribute("class", "forborder");
                newCell.innerHTML = "<td>" + (intLine + 12) + "&nbsp;</td>"
                newCell = newRow.insertCell(2)
                newCell.setAttribute("width", "25%");
                newCell.setAttribute("class", "forborder");
                newCell.innerHTML = "<td><INPUT TYPE=\"text\" SIZE=\"20\" NAME=\"param" + (intLine + 12) + "\" ID=\"param" + (intLine + 12) + "\" VALUE=\"\" ></td>"
                newCell = newRow.insertCell(3)
                newCell.setAttribute("width", "25%");
                newCell.setAttribute("class", "forborder");
                newCell.innerHTML = "<td><INPUT TYPE=\"text\" SIZE=\"20\" NAME=\"method" + (intLine + 12) + "\" ID=\"method" + (intLine + 12) + "\" VALUE=\"\" ></td>"
                newCell = newRow.insertCell(4)
                newCell.setAttribute("width", "20%");
                newCell.setAttribute("class", "forborder");
                newCell.innerHTML = "<td><INPUT TYPE=\"text\" SIZE=\"20\" NAME=\"spec" + (intLine + 12) + "\" ID=\"spec" + (intLine + 12) + "\" VALUE=\"\" ></td>"
                newCell = newRow.insertCell(5)
                newCell.setAttribute("width", "20%");
                newCell.setAttribute("class", "forborder");
                newCell.innerHTML = "<td><INPUT TYPE=\"text\" SIZE=\"20\" NAME=\"add_desc" + (intLine + 12) + "\" ID=\"add_desc" + (intLine + 12) + "\" VALUE=\"\" ></td>"
                getId("maxline").value = intLine;
            }
            function RemoveRow()
            {
                var intLine = parseInt(getId("maxline").value);
                if (parseInt(intLine) > 0)
                {
                    var theTable = (document.all) ? document.all.tbExp : document.getElementById("tbdetail");
                    var theTableBody = theTable.tBodies[0];
                    theTableBody.deleteRow(intLine - 1);
                    intLine--;
                    getId("maxline").value = intLine;
                }
            }
            function click_runid() {
                if (getId("status_cancle").value == "" && getId("A_doc_date").value != "") {
                    AjaxRun_id('A_doc_id', '../JSP/BW_CS_031.jsp?status_runid=4&A_doc_date=' + getId('A_doc_date').value);
                } else if (getId("status_cancle").value == "" && getId("A_doc_date").value == "") {
                    alert("กรุณาเลือกวันที่");
                } else {
                    alert("ไม่สามารถเปลี่ยนแปลงเลขที่เอกสารได้เนื่องจากเป็นเอกสารที่นำมาแก้ไข");
                }
            }

            function chk_runid() {
                if (getId("A_doc_date").value == "") {
                    alert("กรุณาเลือกวันที่");
                } else {
                    AjaxRun_id('A_doc_id', '../JSP/BW_CS_031.jsp?status_runid=4&A_doc_date=' + getId('A_doc_date').value);
                }
            }


        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../CSS/MENU.css" rel="stylesheet" type="text/css">
        <link href="../CSS/BT.css" rel="stylesheet" type="text/css">  <link href="../CSS/component.css" rel="stylesheet" type="text/css"> 
        <link href="../CSS/cgc_button.css" rel="stylesheet" type="text/css">        
        <title>Insert title here</title>
    </head>
    <body onkeyup="chkEvent()">
        <form name="report" method="post" action="../JSP/CS_REPORT.jsp" target="_blank">
            <%

                UserBean userbean = (UserBean) session.getAttribute("user");
                DataBean_Screen_Process objs_p = new DataBean_Screen_Process();
                HeaderScreen_Process h_p = new HeaderScreen_Process();
                objs_p = h_p.selectheaderscreen_process(objs_p, "CS_032");
                // _______________________________________________________________report
                DataBean_Screen_Report objr_p = new DataBean_Screen_Report();
                HeaderScreen_Report r_p = new HeaderScreen_Report();
                objr_p = r_p.Fn_Report(objr_p, "S507");
                path = objr_p.getPath();
                lookup = objr_p.getLookup();
                doc_eff_date = objr_p.getDoc_eff_date();
                doc_no = objr_p.getDoc_no();
                //_______________________________________________________________report
            %>
            <div id="toolTipLayer" style="position:absolute; visibility: hidden"></div>


            <input type="hidden" name="maxline" value="0" id="maxline">
            <input name="A_username" type="hidden" id="A_username" value="<%=userbean.getUsername()%>" size="30" readonly/>
            <input type="hidden" id="chkNull" value="A_doc_id">
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
                                        <td colspan="2" align="right"><b>หมายเลขเอกสาร : <%=objs_p.getIso_no()%> </b></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="right"><b>วันที่มีผลบังคับใช้ : <%=objs_p.getEffective_date()%> </b></td>
                                    </tr>
                                    <tr>
                                        <td width="150" class="columnlabel"><input type="button" class="cgcButton_8" id="runid" name="runid" value="เลขที่เอกสาร" onclick="chk_runid();">&nbsp;</td>
                                        <td width="607" class="columnobject">
                                            <input name='A_doc_id' type='text' id="A_doc_id" value='' size='20' />
                                            &nbsp;<a href='javascript:;' onClick="openBrWindow('vd_job_order_header&stadment=and+complete_flag+<>+\'Y\'', 31, 'Search_Doc_id.jsp');"><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE1' width='20' height='20' border='0' align='middle' ></a>&nbsp;&nbsp;
                                            วันที่เอกสาร*&nbsp;
                                            <input name='A_doc_date' type='text' id="A_doc_date" value='' size='10' readonly />
                                            &nbsp;<a id='date_1' ><img name='IMAGE2' src='../IMAGES/BUTTON/MAIN/CALENDAR20.png' border='0' align='absmiddle'></a><script type='text/javascript'>Calendar.setup({inputField: 'A_doc_date', ifFormat: '%d-%m-%Y', showsTime: false, button: 'date_1', singleClick: true, step: 1});</script>&nbsp;&nbsp;	          	
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="columnlabel">เลขที่ใบสั่งซื้อ*&nbsp;</td>
                                        <td class="columnobject"><input name='A_po_no' type='text' id="A_po_no" value='' size='10' />
                                            &nbsp;&nbsp;กำหนดส่งมอบ*&nbsp;
                                            <input name='A_send_date_from' type='text' id="A_send_date_from" value='' size='10' readonly />
                                            &nbsp;<a id='date_2' ><img name='IMAGE2' src='../IMAGES/BUTTON/MAIN/CALENDAR20.png' border='0' align='absmiddle'></a><script type='text/javascript'>Calendar.setup({inputField: 'A_send_date_from', ifFormat: '%d-%m-%Y', showsTime: false, button: 'date_2', singleClick: true, step: 1});</script>&nbsp;&nbsp;<input name='A_send_date_to' type='text' id="A_send_date_to" value='' size='10' readonly />
                                            &nbsp;<a id='date_3' ><img name='IMAGE2' src='../IMAGES/BUTTON/MAIN/CALENDAR20.png' border='0' align='absmiddle'></a><script type='text/javascript'>Calendar.setup({inputField: 'A_send_date_to', ifFormat: '%d-%m-%Y', showsTime: false, button: 'date_3', singleClick: true, step: 1});</script>&nbsp;&nbsp;	          	</td>
                                    </tr>
                                    <tr>
                                        <td class="columnlabel">ชื่อลูกค้า*&nbsp;</td>
                                        <td class="columnobject">
                                            <input name='A_cust_id' type='text' id="A_cust_id" value='' size='10' readonly />
                                            &nbsp;<a href='javascript:;' onClick="openBrWindow('Vcustomer', 31, 'Search_Config2.jsp')"><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE3' width='20' height='20' border='0' align='middle' ></a>&nbsp;&nbsp;
                                            <input name='cust_id_desc' type='text' id="cust_id_desc" value='' size='30' readonly/>&nbsp;&nbsp;
                                            ชื่อย่อลูกค้า<input type="text" id="A_initial" name="A_initial" value="" >
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="columnlabel">กำหนดเป็น LOT NO*&nbsp;</td>
                                        <td class="columnobject"><input name='A_lot_no' type='text' id="A_lot_no" value='' size='10' />                                  &nbsp;&nbsp;&nbsp;&nbsp;บันทึกคำขอซื้อลูกค้าเลขที่
                                            <input type="text" name="A_po_cust" id="A_po_cust"></td>
                                    </tr>
                                    <tr>
                                        <td class="columnlabel">เงื่อนไขการชำระเงิน</td>
                                        <td class="columnobject"><input name='A_payment_condition' type='text' id="A_payment_condition" value='' size='10' />&nbsp;&nbsp;&nbsp;&nbsp;
                                            คำสั่งพิเศษ
                                            <input type="text" name="A_spc_order" id="A_spc_order"></td>
                                    </tr>
                                    <tr>
                                        <td class="columnlabel">ชื่อผลิตภัณฑ์</td>
                                        <td class="columnobject"><input name='A_product_id' type='text' id="A_product_id" value='' size='10' readonly />
                                            &nbsp;<a href='javascript:;' onClick="openBrWindow('vproduct', 31, 'Search_Config2.jsp')"><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE3' width='20' height='20' border='0' align='middle' ></a>&nbsp;&nbsp;&nbsp;<input name='product_id_desc' type='text' id="product_id_desc" value='' size='30' readonly/>&nbsp;
                                            น้ำหนักบรรจุ
                                            <input name="A_weight_content" type="text" id="A_weight_content" size="15">
                                            กก.</td>
                                    </tr>
                                    <tr>
                                        <td class="columnlabel"><p>จำนวนแจ้งผลิต</p></td>
                                        <td class="columnobject"><input type="text" name="A_prd_qty" id="A_prd_qty">
                                            เมตริกตัน&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;จำนวนกระสอบ
                                            <input name="A_bag_qty" type="text" id="A_bag_qty" size="15">
                                            ใบ</td>
                                    </tr>
                                    <tr>
                                        <td class="columnlabel"><p>ภาชนะบรรจุ</p></td>
                                        <td class="columnobject"><input type="text" name="A_content" id="A_content">
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;น้ำหนักกระสอบเปล่า
                                            <input name="A_bag_weight" type="text" id="A_bag_weight" size="15">
                                            กก.</td>
                                    </tr>
                                    <tr>
                                        <td class="columnlabel">รหัสคุณสมบัติ</td>
                                        <td class="columnobject"><input name='A_spec_id' type='text' id="A_spec_id" value='' size='10' readonly />
                                            &nbsp;<a href='javascript:;' onClick="openBrWindow('m_product_spec_header', 301, 'Search_Doc_id.jsp');"><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE3' width='20' height='20' border='0' align='middle' ></a>&nbsp;&nbsp;&nbsp;<input name='spec_id_desc' type='text' id="spec_id_desc" value='' size='30' readonly/>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="columnlabel">คุณลักษณะของแป้ง   / Specification</td>
                                        <td class="columnobject">
                                            <select id="A_so2" name="A_so2" >
                                                <option selected value="1">มีกำมะถัน/So2</option>
                                                <option value="2" >ไม่มีกำมะถัน/So2</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan='2' class='blankspace'></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="center">
                                            <div style="width:100%;">
                                                <table width="100%" align="center" border="0" cellpadding="0" cellspacing="1" class="inner">
                                                    <tr>
                                                        <td colspan="6" class="h_multi">ข้อมูลคุณสมบัติ</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="3" rowspan="2" class="row3"></td>
                                                        <td width="7%" rowspan="2" class="row3">ลำดับที่&nbsp;</td>
                                                        <td width="30%" rowspan="2" class="row3">ข้อมูลวัตถุดิบ</td>
                                                        <td colspan="2" class="row3"><div align="center">Specification</div></td>
                                                        <td width="30%" rowspan="2" class="row3"><div align="center">unit&nbsp;</div></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="row3" width="15%">Min</td>
                                                        <td class="row3" width="15%">Max</td>
                                                    </tr>
                                                </table>
                                                <div  id="show">
                                                </div>
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
                                                            <input type='button' class="cgcButton_4" name='but1' value='  เพิ่ม  ' onclick='getId("status_cancle").value == "1" ? goAddChild() : alert("กรุณาบันทึกหัวเอกสารก่อนเพิ่ม");'/>
                                                            <input type='button' class="cgcButton_3" name='but2' value='  ลบ  '  onclick='getId("status_cancle").value == "1" ? goDelChild() : alert("กรุณาบันทึกหัวเอกสารก่อน");'/>		    			  		</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="3" rowspan="2" class="row3"><input type="checkbox" name="chk_all" id="chk_all" value="chk_all" onClick="javascript:ckall(this.checked);"/></td>
                                                        <td width="7%" rowspan="2" class="row3">ลำดับที่&nbsp;</td>
                                                        <td width="30%" rowspan="2" class="row3">ข้อมูลวัตถุดิบ</td>
                                                        <td colspan="2" class="row3"><div align="center">Specification</div></td>
                                                        <td width="30%" rowspan="2" class="row3"><div align="center">unit&nbsp;</div></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="row3" width="15%">Min</td>
                                                        <td class="row3" width="15%">Max</td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <div style="width:100%; height: 150px; overflow: auto;" id="show2">
                                                <table width="100%" align="center" border="0" cellpadding="0" cellspacing="1" class="inner"   id = "tbdetail"></table>
                                            </div>                    </td>
                                    </tr>
                                    <tr>
                                        <td colspan='2' class='blankspace'></td>
                                    </tr>
                                    <tr>
                                        <td class="columnlabel">&nbsp;</td>
                                        <td class="columnobject">
                                            <select id="A_adding_qty" name="A_adding_qty" >
                                                <option selected value="1">มี/Stock</option>
                                                <option value="2" >สั่งเพิ่ม/Order</option>
                                            </select>
                                            <input name="A_adding" type="text" id="A_adding" size="15">กระสอบ(Bags)
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="columnlabel">หมายเหตุ&nbsp;</td>
                                        <td class="columnobject"><textarea name='A_remark_adding' cols='40' rows='5' id="A_remark_adding"></textarea></td>
                                    </tr>
                                    <tr>
                                        <td class="columnlabel">&nbsp;</td>
                                        <td class="columnobject">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="columnlabel">ลักษณะตรา(ถ้ามี)</td>
                                        <td class="columnobject">
                                            <select id="A_mark_sign" name="A_mark_sign" >
                                                <option selected value="N">ไม่ตีตรา</option>
                                                <option value="Y" >ตีตรา</option>
                                            </select>
                                            <input type="text" name="A_mark_sign_desc" id="A_mark_sign_desc"><br><textarea name="A_remark" id="A_remark" cols="30"></textarea>
                                            <!--<input type="checkbox" name="checkbox5" id="checkbox5">
                                            ตีตรา<br>
                                            <input type="checkbox" name="checkbox6" id="checkbox6">
                                            ไม่ตีตรา
                                            <input type="text" name="A_mark_sign" id="A_mark_sign">
                                            <br> -->                                     </td>
                                    </tr>
                                    <tr>
                                        <td class="columnlabel">&nbsp;</td>
                                        <td class="columnobject">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="columnlabel">ไม้รอง</td>
                                        <td class="columnobject">

                                            <input type="checkbox" name="base_plate1" id="base_plate1" onclick="chkValue(1);">
                                            ไม่ต้องการ<br>
                                            <input type="checkbox" name="base_plate2" id="base_plate2" onclick="chkValue(2);">
                                            ต้องการ
                                            <input name="A_base_plate_qty" type="text" id="A_base_plate_qty" size="15">
                                            <br>
                                            <input type="checkbox" name="base_plate3" id="base_plate3" onclick="chkValue(3);">ห่อเป็นพาเลท
                                            <input name="A_wrap_on_pallet" type="text" id="A_wrap_on_pallet" size="15">
                                            กระสอบ&nbsp;&nbsp;&nbsp;&nbsp;จำนวน
                                            <input name="A_pallet_qty" type="text" id="A_pallet_qty" size="15">
                                            พาเลท
                                            <input type="hidden" name="A_base_plate" id="A_base_plate">
                                        </td>
                                    </tr>

                                    <tr>
                                        <td class="columnlabel">&nbsp;</td>
                                        <td class="columnobject">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="columnlabel">ผู้แจ้งผลิต</td>
                                        <td class="columnobject"><input name='A_reporter_id' type='text' id="A_reporter_id" value='' size='10' readonly />
                                            &nbsp;<a href='javascript:;' onClick="openBrWindow('Vemployee', 31, 'Search_Config2.jsp')"><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE3' width='20' height='20' border='0' align='middle' ></a>&nbsp;&nbsp;&nbsp;
                                            <input name='reporter_id_desc' type='text' id="reporter_id_desc" value='' size='30' readonly/></td>
                                    </tr>
                                    <tr>
                                        <td class="columnlabel">ผู้อนุมัติ</td>
                                        <td class="columnobject"><input name='A_approver_id' type='text' id="A_approver_id" value='' size='10' readonly />
                                            &nbsp;<a href='javascript:;' onClick="openBrWindow('Vemployee1', 31, 'Search_Config2.jsp')"><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE3' width='20' height='20' border='0' align='middle' ></a>&nbsp;&nbsp;&nbsp;
                                            <input name='approver_id_desc' type='text' id="approver_id_desc" value='' size='30' readonly/></td>
                                    </tr>
                                    <tr>
                                        <td class="columnlabel">ผู้ควบคุมคุณภาพ</td>
                                        <td class="columnobject"><input name='A_quality_id' type='text' id="A_quality_id" value='' size='10' readonly />
                                            &nbsp;<a href='javascript:;' onClick="openBrWindow('Vemployee2', 31, 'Search_Config2.jsp')"><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE3' width='20' height='20' border='0' align='middle' ></a>&nbsp;&nbsp;&nbsp;
                                            <input name='quality_id_desc' type='text' id="quality_id_desc" value='' size='30' readonly/></td>
                                    </tr>
                                    <tr>
                                        <td class="columnlabel">แผนกผลิต</td>
                                        <td class="columnobject"><input name='A_production_id' type='text' id="A_production_id" value='' size='10' readonly />
                                            &nbsp;<a href='javascript:;' onClick="openBrWindow('Vemployee3', 31, 'Search_Config2.jsp')"><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE3' width='20' height='20' border='0' align='middle' ></a>&nbsp;&nbsp;&nbsp;
                                            <input name='production_id_desc' type='text' id="production_id_desc" value='' size='30' readonly/></td>
                                    </tr>
                                    <tr>
                                        <td class="columnlabel">บัญชีคลังสินค้า</td>
                                        <td class="columnobject"><input name='A_account_id' type='text' id="A_account_id" value='' size='10' readonly />
                                            &nbsp;<a href='javascript:;' onClick="openBrWindow('Vemployee4', 31, 'Search_Config2.jsp')"><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE3' width='20' height='20' border='0' align='middle' ></a>&nbsp;&nbsp;&nbsp;
                                            <input name='account_id_desc' type='text' id="account_id_desc" value='' size='30' readonly/></td>
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

