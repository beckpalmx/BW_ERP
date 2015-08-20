<%@page import="com.bw.Util.HeaderScreen_Report"%>
<%@page import="com.bw.bean.DataBean_Screen_Report"%>
<%@page import="com.bw.Util.UtiDatabase"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        <script language="javascript" src="../JS/engine.js"></script>
        <!-- calendar stylesheet -->
        <link rel="stylesheet" type="text/css" media="all" href="../JS/jscalendar/skins/aqua/aqua.css" title="Aua" />
        <!-- main calendar program -->
        <script type="text/javascript" src="../JS/jscalendar/calendar.js"></script>
        <!-- language for the calendar -->
        <script type='text/javascript' src='../JS/jscalendar/lang/calendar-th.js'></script>
        <!-- the following script defines the Calendar.setup helper function, which makes
               adding a calendar a matter of 1 or 2 lines of code. -->
        <script type="text/javascript" src="../JS/jscalendar/calendar-setup.js"></script>
        <script type="text/javascript">
            function ResetValue(){
                getId("maxline").value = "0";
                getId("A_complete_flag").value = "N";
                getId("A_complete_flag").checked = false;
                getId("status_cancle").value  = "";
                getId("show").innerHTML = "<table width=\"100%\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"1\" class=\"inner\"  name = \"tbExp\" id = \"tbExp\"></table>";
            }
            function Chknull(){
                if(document.getElementById('doc_id').value == ''){
                    alert('กรุณาใส่ข้อมูลเลขที่เอกสาร');
                }else document.report.submit();
            }
            function goAddChild(URLSend)
            {
                if(getId("status_cancle").value == "1"){
                    var arryChk = new Array;
                    arryChk[0] = "chkNull";
                    if(ChkParameter(arryChk))
                    {
                        window.open(URLSend[0]);
                    }
                }else{
                    alert("กรุณาบันทึกหัวเอกสาร");
                }

            }
            function cancle()
            {

                var SURL;
                var r = confirm("คุณต้องการยกเลิกข้อมูลทั้งหมดหรือไม่")
                if(r)
                {
                    if(getId("status_cancle").value == "1")
                    {
                        cancelAction();
                        ResetValue();
                    }else{

                    }

                }

            }
            function ckall(Value)//ทำการกดปุ้ม check ทั้งหมดใช้หรือไม่
            {

                for(var i=0;i<document.getElementsByName("ckbox").length;i++)
                {
                    document.getElementsByName("ckbox")[i].checked = Value;
                }

            }
            function goDelChild()
            {
                var Deleteflag ="";
                var SURL;
                if(getId("chk_all").checked)//จะทำการลบข้อมูลของ Detail ทั้งหมด ทึ่ตรงกับรหัส
                {
                    var r = confirm("คุณต้องการลบข้อมูลลายละเอียดของเอกสารนี้ใช่หรือไม่")
                    if(r){
                        SURL = "../JSP/BW_CS_Detail_051.jsp?D_status=3&chk_all=1&username="+getId("A_username").value;
                        SURL = SURL+"&A_doc_id="+getId("A_doc_id").value;
                        Delete_Line_no(SURL);
                        getId("show").innerHTML = "";
                        getId("chk_all").checked =false;
                    }
                }
                else//จะทำการลบข้อมูลเฉพาะ Datail ที่ทำการเลือกไว้
                {
                    SURL = "../JSP/BW_CS_Detail_051.jsp?D_status=3&ckbox=";
                    for(var i=0;i<document.getElementsByName("ckbox").length;i++)
                    {
                        Deleteflag += (document.getElementsByName("ckbox")[i].checked)?document.getElementsByName("ckbox")[i].value+",":"";
                    }
                    Deleteflag = Deleteflag.substring(0, Deleteflag.length -1);
                    if(Deleteflag != ""){
                        SURL = SURL+Deleteflag+"&A_doc_id="+getId("A_doc_id").value+"&username="+getId("A_username").value;
                        Delete_Line_no(SURL);
                        showTableNonPopup("show", "A_doc_id", "../SHOWDETAILSCREEN/BW_CS_Show051.jsp?doc_id=");
                        setTimeout('showTableNonPopup("show", "A_doc_id", "../SHOWDETAILSCREEN/BW_CS_Show051.jsp?doc_id=")', 1000);
                    }else{
                        showTableNonPopup("show", "A_doc_id", "../SHOWDETAILSCREEN/BW_CS_Show051.jsp?doc_id=");
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
                if(r)
                {
                    var strID = "";
                    strID += getIDElements('input','I_');
                    strID += getIDElements('input','A_');
                    strID += getIDElements('select', 'A_');
                    strID += getIDElements('input','P_');
                    strID += getIDElements('select', 'P_');
                    strID = strID.substr(0, strID.length-1);
                    //alert(strID);
                    getSave(URLsend('chkNull,maxline,'+strID,'../JSP/BW_CS_051.jsp'));
                    ResetValue();
                }

            }
            function Delete()
            {
                var r = confirm("คุณต้องการลบข้อมูลทั้งหมดหรือไม่")
                if(r)
                {
                    getSave(URLsend('D_status,A_doc_id','../JSP/BW_CS_051.jsp'));
                    ResetValue();
                }

            }
            function Unload()
            {
            }
            function OpenDoc_id(input_value)
            {
                openBrWindow('vd_product_withdraw_suppliers_header&stadment=+and+create_by=\''+getId('A_username').value+'\'++and+count_send_complete+'+(input_value==1?'<>+\'0\'':'=+\'0\''), 51, 'Search_Doc_id.jsp');

            }
            function Click_Complete_flag(value){
                if(value){
                    alert("เอกสารนี้สมบูรณ์");
                    getId("A_complete_flag").checked = value;
                    getId("A_complete_flag").value = "Y";
                }else{
                    getId("A_complete_flag").checked = value;
                    getId("A_complete_flag").value = "N";
                }
            }
            function CreateNewRow()
            {
                var intLine = parseInt(getId("maxline").value);
                intLine++;
                var Test_array = getId("shift").value.split(",");
                var Test_array1 = getId("shift_value").value.split(",");
                var theTable = document.getElementById("tbExp");
                var newRow = theTable.insertRow(theTable.rows.length);
                newRow.id = newRow.uniqueID;

                var item1 = 1;
                var newCell;
                //*** Column 1 ***//
                newCell = newRow.insertCell(0)
                newCell.id = newCell.uniqueID
                newCell.setAttribute("width", "3px");
                newCell.setAttribute("class", "forborder");
                newCell.innerHTML = "<td ><input type = 'checkbox' id = '"+intLine+"' name = 'ckbox'></td>"
                newCell = newRow.insertCell(1)
                newCell.setAttribute("width", "7%");
                newCell.setAttribute("class", "forborder");
                newCell.innerHTML = "<td>"+intLine+"&nbsp;</td>"
                newCell = newRow.insertCell(2)
                newCell.setAttribute("width", "20%");
                newCell.setAttribute("class", "forborder");
                newCell.innerHTML = "<td><INPUT TYPE=\"text\" SIZE=\"12\" ID=\"P_product_id_"+intLine+"\" VALUE=\"\" onclick=\"openBrWindow(\'Vproduct&textinput=P_product_id_"+intLine+"\', 31, \'Search_Detail.jsp\')\" ></td>"
                newCell = newRow.insertCell(3)
                newCell.setAttribute("width", "12%");
                newCell.setAttribute("class", "forborder");
                newCell.innerHTML = "<td><INPUT TYPE=\"text\" SIZE=\"5\" ID=\"P_wh_id_"+intLine+"\" VALUE=\"\" onclick=\"openBrWindow(\'Mwarehouse&textinput=P_wh_id_"+intLine+"\', 31, \'Search_Detail.jsp\')\" ></td>"
                newCell = newRow.insertCell(4)
                newCell.setAttribute("width", "10%");
                newCell.setAttribute("class", "forborder");
                var select_text = "<td><select name=\"P_shift_"+intLine+"\" id=\"P_shift_"+intLine+"\">";//<INPUT TYPE=\"text\" SIZE=\"10\" ID=\"P_shift_"+intLine+"\" VALUE=\"\" >&nbsp;
                for(var i = 0;i<Test_array.length;i++){
                    select_text += "<option value=\""+Test_array[i]+"\">"+Test_array1[i]+"</option>";
                }
                select_text += "</select></td>";
                newCell.innerHTML =select_text;
                newCell = newRow.insertCell(5)
                newCell.setAttribute("width", "10%");
                newCell.setAttribute("class", "forborder");
                newCell.innerHTML = "<td><INPUT TYPE=\"text\" SIZE=\"7\" ID=\"P_weight_"+intLine+"\" VALUE=\"\" onblur=\"Amount('P_weight_"+intLine+"','P_bag_"+intLine+"','P_quantity_"+intLine+"')\">&nbsp;</td>"
                newCell = newRow.insertCell(6)
                newCell.setAttribute("width", "10%");
                newCell.setAttribute("class", "forborder");
                newCell.innerHTML = "<td><INPUT TYPE=\"text\" SIZE=\"7\" ID=\"P_bag_"+intLine+"\" VALUE=\"\" onblur=\"Amount('P_weight_"+intLine+"','P_bag_"+intLine+"','P_quantity_"+intLine+"')\">&nbsp;</td>"
                newCell = newRow.insertCell(7)
                newCell.setAttribute("width", "10%");
                newCell.setAttribute("class", "forborder");
                newCell.innerHTML = "<td><INPUT TYPE=\"text\" SIZE=\"7\" ID=\"P_quantity_"+intLine+"\" VALUE=\"\" >&nbsp;</td>"
                newCell = newRow.insertCell(8)
                newCell.setAttribute("width", "20%");
                newCell.setAttribute("class", "forborder");
                newCell.innerHTML = "<td><INPUT TYPE=\"text\" SIZE=\"18\" ID=\"P_remark_"+intLine+"\" VALUE=\"\" >&nbsp;</td>"

                getId("maxline").value = intLine;
            }

            function RemoveRow()
            {
                var intLine = parseInt(getId("maxline").value);
                if(parseInt(intLine) > 0)
                {
                    var theTable = (document.all) ? document.all.tbExp : document.getElementById("tbExp");
                    var theTableBody = theTable.tBodies[0];
                    theTableBody.deleteRow(intLine-1);
                    intLine--;
                    getId("maxline").value = intLine;
                }
            }
            function Amount(weight,bag,amount){
                if(getId(weight).value != "" && getId(bag).value != ""){
                    getId(amount).value = parseInt(getId(weight).value, 10) * parseInt(getId(bag).value, 10);
                }
            }
            function Runid(output_value,input_value){
                if(getId(input_value).value == ""){
                    AjaxRun_id('A_doc_id', '../JSP/BW_CS_051.jsp?status_runid=4');
                }else{
                    Format_Date(output_value, getId(input_value).value);
                    AjaxRun_id('A_doc_id', '../JSP/BW_CS_051.jsp?status_runid=4&A_doc_id='+getId(output_value).value);
                }
            }
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../CSS/MENU.css" rel="stylesheet" type="text/css">
        <link href="../CSS/BT.css" rel="stylesheet" type="text/css">  <link href="../CSS/component.css" rel="stylesheet" type="text/css"> 
        <title>Insert title here</title>
    </head>
    <body onUnload="Unload()">
        <form name="report" method="post" action="../JSP/CS_REPORT.jsp" target="_blank">
            <%
                UserBean userbean = (UserBean) session.getAttribute("user");
                DataBean_Screen_Process objs_p = new DataBean_Screen_Process();
                HeaderScreen_Process h_p = new HeaderScreen_Process();
                objs_p = h_p.selectheaderscreen_process(objs_p, "BW_CS_051");
                UtiDatabase objuti = new UtiDatabase();
                // _______________________________________________________________report
                DataBean_Screen_Report objr_p = new DataBean_Screen_Report();
                HeaderScreen_Report r_p = new HeaderScreen_Report();
                objr_p = r_p.Fn_Report(objr_p, "S504");
                path = objr_p.getPath();
                lookup = objr_p.getLookup();
                doc_eff_date = objr_p.getDoc_eff_date();
                doc_no = objr_p.getDoc_no();
                //_______________________________________________________________report
%>
            <input name="A_username" type="hidden" id="A_username" value="<%=userbean.getUsername()%>" size="30" readonly/>
            <input type="hidden" name="chkNull" id="chkNull" value="A_doc_date">
            <input type="hidden" name="A_status" id="I_status" value="1"><!-- เป็นการเพิ่มข้อมูลเข้าไป-->
            <input type="hidden" name="D_status" id="D_status" value="3"><!-- เป็นการ Delete ข้อมูลทั้งหมด -->
            <input type="hidden" name="status_cancle" id="status_cancle" value=""><!-- status_cancle = 1 คือค่าที่นำมา Edit แต่ถ้า ="" จะเป็นการ Insert -->
            <input type="hidden" name="maxline" value="0" id="maxline">
            <input type="hidden" name="shift" id="shift" value ="1,2,3">
            <input type="hidden" name="shift_value" id="shift_value" value="เช้า,บ่าย,ดึก">
            <input type="hidden" name="A_dept_doc_id" id="A_dept_doc_id" value="<%=userbean.getDept_doc_id()%>"><!--ตัวย่อที่จะติดไปกับเอกสาร-->
            <input type="hidden" name="dept_id" id="dept_id" value="<%=userbean.getDept_id()%>">
            <input type="hidden" name="A_screen_id" id="A_screen_id" value="BW_CS_051"><!--ไว้ตรวจสอบว่า mscreen_id ใน table d_running_doc_id -->
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
                        <td  class="ftopcenter" colspan="2">ใบเบิกพัสดุ(BW_CS_051)&nbsp;</td>
                        <td class="ftopright"></td>
                    </tr>
                    <tr>
                        <td class="fcenterleft"></td>
                        <td  colspan="2" class="fcentercenter">
                            <div align="left">
                                <table  cellpadding="0" cellspacing="0" >
                                    <tr>
                                        <td colspan="2" align="right"><b>หมายเลขเอกสาร : <%=objs_p.getIso_no()%></b></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="right"><b>วันที่มีผลบังคับใช้ : <%=objs_p.getEffective_date()%></b></td>
                                    </tr>
                                    <tr>
                                        <td class="columnlabel">เอกสารสมบูรณ์</td>
                                        <td class="columnobject"><input type="checkbox" name="A_complete_flag" id="A_complete_flag" value ="N" onClick="Click_Complete_flag(this.checked);"></td>
                                    </tr>
                                    <tr>
                                        <td class="columnlabel">บริษัทที่จ่าย</td>
                                        <td class="columnobject"><select name="A_company_id" id="A_company_id">
                                                <option value="1" selected>BW</option>
                                                <option value="2">ATS</option>
                                            </select></td>
                                    </tr>
                                    <tr>

                                        <td width="150" class="columnlabel">เลขที่เอกสาร</td>
                                        <td width="607" class="columnobject">
                                            <input name='A_doc_id' class='inputs' type="text" id="A_doc_id" value='' size='15' />
                                            &nbsp;<a href='#' onClick="OpenDoc_id(0)"  ><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE1' width='20' height='20' border='0' align='middle' ></a>&nbsp;&nbsp;
                                            &nbsp;<a href='#' onClick="OpenDoc_id(1)"  ><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE1' width='20' height='20' border='0' align='middle' ></a>&nbsp;&nbsp;
                                            วันที่เอกสาร*&nbsp;
                                            <input name='A_doc_date' class='inputs' type="text" id="A_doc_date" value='' size='10' readonly="readonly"/>
                                            &nbsp;<a id='date_1'><img name='IMAGE2' src='../IMAGES/BUTTON/MAIN/CALENDAR20.png' border='0' align='absmiddle'></a><script type='text/javascript'>Calendar.setup({inputField:'A_doc_date',ifFormat:'%d-%m-%Y',showsTime:false,button:'date_1',singleClick:true,step:1});</script>&nbsp;&nbsp;เวลา
                                            <input name='A_doc_time' class='inputs' type="text" id="A_doc_time" value='' size='10' maxlength="5" /></td>
                                    </tr>
                                    <tr>
                                        <td class="columnlabel">แผนกผู้เบิก&nbsp;</td>
                                        <td class="columnobject">
                                            <input name='A_dp_id' class='inputs' type="text" id="A_dp_id" value='' size='10' readonly="readonly" />
                                            &nbsp;&nbsp;&nbsp;<img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE3' width='20' height='20' border='0' align='middle' style="cursor: pointer;" onClick="openBrWindow('mdepartment', 24, 'Search_Config2.jsp');">&nbsp;&nbsp;&nbsp;<input name='dp_id_desc' class='inputs' type="text" id="dp_id_desc" value='' size='30' readonly="readonly" />                                </td>
                                    </tr>
                                    <tr>
                                        <td colspan='2' class='blankspace'></td>
                                    </tr>
                                    <tr>
                                        <td height="200" colspan="2" align="center">
                                            <div style="width:100%;">
                                                <table width="100%" align="center" border="0" cellpadding="0" cellspacing="1" class="inner">
                                                    <tr>
                                                        <td colspan="4" class="h_multi">ข้อมูลเบิกสินค้า</td>
                                                        <td colspan="5" class="btn_multi">
                                                            <input type='button' name='but1' value='  เพิ่ม  ' onClick="getId('status_cancle').value == '1'?goAddChild(URLsend('A_doc_id,I_status,A_username','BW_CS_Detail_051.jsp')):CreateNewRow();"/>
                                                            <input type='button' name='but2' value='  ลบ  ' onclick="getId('status_cancle').value == '1'?goDelChild():RemoveRow();"/>                                                </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="row3" width="3px"><input type="checkbox" name="chk_all" id="chk_all" value="chk_all" onClick="javascript:ckall(this.checked);"/></td>
                                                        <td class="row3" width="7%">No.</td>
                                                        <td class="row3" width="20%">รายการเบิกสินค้า&nbsp;</td>
                                                        <td class="row3" width="12%">คลัง&nbsp;</td>
                                                        <td class="row3" width="10%">กะ&nbsp;</td>
                                                        <td class="row3" width="10%">น้ำหนัก(กก.)&nbsp;</td>
                                                        <td class="row3" width="10%">จำนวน(ก/ส)&nbsp;</td>
                                                        <td class="row3" width="10%">น้ำหนักรวม&nbsp;</td>
                                                        <td class="row3" width="20%">หมายเหตุ&nbsp;</td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <div style="width:100%; height: 150px; overflow: auto;" id="show">
                                                <table width="100%" align="center" border="0" cellpadding="0" cellspacing="1" class="inner"  name = "tbExp" id = "tbExp">
                                                </table>
                                            </div>                                </td>
                                    </tr>
                                    <tr>
                                        <td class="columnlabel">ผู้เบิกสินค้า</td>
                                        <td class="columnobject"><input name='A_reporter_id' class='inputs' type="text" id="A_reporter_id" value='' size='10' readonly="readonly" />
                                            &nbsp;&nbsp;&nbsp;<img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE3' width='20' height='20' border='0' align='middle' style="cursor: pointer;" onClick="openBrWindow('Vemployee', 24, 'Search_Config2.jsp');">&nbsp;&nbsp;&nbsp;
                                            <input name='reporter_id_desc' class='inputs' type="text" id="reporter_id_desc" value='' size='30' readonly="readonly" />                              </td>
                                    </tr>
                                    <tr>
                                        <td class="columnlabel">ผู้อนุมัติ</td>
                                        <td class="columnobject"><input name='A_approver_id' class='inputs' type="text" id="A_approver_id" value='' size='10' readonly="readonly" />
                                            &nbsp;&nbsp;&nbsp;<img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE3' width='20' height='20' border='0' align='middle' style="cursor: pointer;" onClick="openBrWindow('Vemployee1', 24, 'Search_Config2.jsp');">&nbsp;&nbsp;&nbsp;
                                            <input name='approver_id_desc' class='inputs' type="text" id="approver_id_desc" value='' size='30' readonly="readonly" />                              </td>
                                    </tr>

                                    <tr>
                                        <td colspan="2" align="right"></td>
                                    </tr>
                                    <tr>
                                        <td colspan='2' class='blankspace'>
                                            <br>
                                            <div align="center">
                                                <a href="javascript:;" onClick="cancle()"><img alt=""  src="../IMAGES/BTN_CANCEL_90.png" width="80" height="30" border="0"></a>
                                                <a href="javascript:;" onClick="AddHeader()"><img alt=""  src="../IMAGES/BTN_SAVE_90.png" width="80" height="30" border="0"></a>
                                                <a href="javascript:;" onClick="Delete()"><img alt=""  src="../IMAGES/BTN_DEL_90.png" width="80" height="30" border="0"></a>
                                                <a href="javascript:;"  onclick="Chknull()"><img alt="พิมพ์เอกสาร" src="../IMAGES/BTN_PRINT_90.png" width="80" height="30" border="0"></a></div>
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