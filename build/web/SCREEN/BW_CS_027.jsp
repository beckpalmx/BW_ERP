<%@page import="com.bw.Util.HeaderScreen_Report"%>
<%@page import="com.bw.bean.DataBean_Screen_Report"%>
<%@page import="com.bw.Util.UtiDatabase"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
            function ResetValue() {
                getId("status_cancle").value = "";
                getId("show").innerHTML = "";
                getId("A_return_flag").checked = false;
                getId("A_return_flag").value = "N";
            }
            function Chknull() {
                if (document.getElementById('doc_id').value == '') {
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

                var SURL;
                var r = confirm("คุณต้องการยกเลิกข้อมูลทั้งหมดหรือไม่")
                if (r)
                {
                    if (getId("status_cancle").value == "1")
                    {
                        cancelAction();
                        getId("status_cancle").value = "";
                        getId("child_ck").value = "";
                        getId("show").innerHTML = "";
                        getId("doc_id").disabled = false;
                    }
                    else if (getId("status_cancle").value == "1" && getId("child_ck").value == "1")
                    {
                        alert("มีการเปลี่ยนแปลงข้อมูลกรุณาบันทึกข้อมูล");
                    }
                    else {
                        SURL = "../JSP/CS_028.jsp?status_d=3&chk_all=1&username=" + getId("username").value;
                        SURL = SURL + "&doc_id=" + getId("doc_id").value;
                        Delete_Line_no(SURL)
                        cancelAction();
                        getId("status_cancle").value = "";
                        getId("child_ck").value = "";
                        getId("show").innerHTML = "";
                        getId("doc_id").disabled = false;
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
                    getSave(URLsend('chkNull,A_doc_id,A_return_flag,A_doc_confirm,A_wh_leader_id,A_account_id', '../JSP/BW_CS_027.jsp'));
                    ResetValue();
                }
            }
            function Delete()
            {

            }
            function Unload()
            {
            }
            function OpenDoc_id(input_type)
            {
                openBrWindow('vd_product_withdraw_confirm_header&stadment=and+complete_flag+=+\'N\'+and+doc_type+=+\'' + input_type + '\'', 27, 'Search_Doc_id.jsp');
            }
            function Click_Return_flag(value) {
                if (value) {
                    alert("ทำการย้อนเอกสารนี้กลับไปหาต้นฉบับ");
                    getId("A_return_flag").checked = value;
                    getId("A_return_flag").value = "Y";
                } else {
                    getId("A_return_flag").checked = value;
                    getId("A_return_flag").value = "N";
                }
            }
            function doc_confrim(objthis) {
                if (objthis.checked) {
                    alert("ทำการยืนยันเอกสารสมบูรณ์");
                    objthis.value = "Y";
                } else {
                    objthis.value = "N";
                    objthis.checked = false;
                }
            }
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../CSS/MENU.css" rel="stylesheet" type="text/css">
        <link href="../CSS/BT.css" rel="stylesheet" type="text/css">  <link href="../CSS/component.css" rel="stylesheet" type="text/css"> 
        <link href="../CSS/bw_button.css" rel="stylesheet" type="text/css">        
        <title>Insert title here</title>
    </head>
    <body onUnload="Unload()">
        <form name="report" method="post" action="../JSP/CS_REPORT.jsp" target="_blank">
            <%
                UserBean userbean = (UserBean) session.getAttribute("user");
                DataBean_Screen_Process objs_p = new DataBean_Screen_Process();
                HeaderScreen_Process h_p = new HeaderScreen_Process();
                objs_p = h_p.selectheaderscreen_process(objs_p, "CS_027");
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
            <input type="hidden" name="chkNull" id="chkNull" value="A_doc_id">
            <input type="hidden" name="I_status" id="I_status" value="1">
            <!-- เป็นการเพิ่มข้อมูลเข้าไป-->
            <input type="hidden" name="D_status" id="D_status" value="3"><!-- เป็นการ Delete ข้อมูลทั้งหมด -->
            <input type="hidden" name="status_cancle" id="status_cancle" value=""><!-- status_cancle = 1 คือค่าที่นำมา Edit แต่ถ้า ="" จะเป็นการ Insert -->
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
                        <td  class="ftopcenter" colspan="2">ยืนยันการเบิกสินค้าสำเร็จรูป
                            (BW_CS_027)&nbsp;</td>
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
                                        <td class="columnlabel">ทำการคืนเอกสารเพื่อแก้ไข</td>
                                        <td class="columnobject"><input type="checkbox" name="A_return_flag" id="A_return_flag" value ="N" onClick="Click_Return_flag(this.checked);"></td>
                                    </tr>
                                    <tr>
                                        <td class="columnlabel">บริษัทที่จ่าย</td>
                                        <td class="columnobject"><select name="A_company_id" id="A_company_id">
                                                <option value="1" selected>BW</option>
                                                <option value="2">ATS</option>
                                            </select></td>
                                    </tr>
                                    <tr>

                                        <td width="150" class="columnlabel"><b>เลขที่เอกสาร*</b>&nbsp;</td>
                                        <td width="607" class="columnobject">
                                            <input name='A_doc_id' class='inputs' type="text" id="A_doc_id" value='' size='15' />
                                            &nbsp;<a href='#' onClick="OpenDoc_id('N')"  ><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE1' width='20' height='20' border='0' align='middle' ></a>&nbsp;&nbsp;
                                            &nbsp;<a href='#' onClick="OpenDoc_id('Y')"  ><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE1' width='20' height='20' border='0' align='middle' ></a>&nbsp;&nbsp;
                                            วันที่เอกสาร*&nbsp;
                                            <input name='A_doc_date' class='inputs' type="text" id="A_doc_date" value='' size='10' readonly="readonly"/>
                                            <!--&nbsp;<a id='date_1'><img name='IMAGE2' src='../IMAGES/BUTTON/MAIN/CALENDAR20.png' border='0' align='absmiddle'></a><script type='text/javascript'>Calendar.setup({inputField:'doc_date',ifFormat:'%d-%m-%Y',showsTime:false,button:'date_1',singleClick:true,step:1});</script>-->
                                            &nbsp;&nbsp;เวลา*
                                            <input name='A_doc_time' class='inputs' type="text" id="A_doc_time" value='' size='10' maxlength="5" readonly/></td>
                                    </tr>
                                    <tr>
                                        <td class="columnlabel">แผนกผู้เบิก*&nbsp;</td>
                                        <td class="columnobject">
                                            <input name='A_dp_id' class='inputs' type="text" id="A_dp_id" value='' size='10' readonly="readonly" />
                                            &nbsp;&nbsp;&nbsp;<input name='dp_id_desc' class='inputs' type="text" id="dp_id_desc" value='' size='30' readonly="readonly" />                                </td>
                                    </tr>
                                    <tr>
                                        <td class="columnlabel">ทำการยืนยันเอกสาร*&nbsp;</td>
                                        <td class="columnobject"><input type="checkbox" id="A_doc_confirm" name="A_doc_confirm" value="N" onclick="doc_confrim(this)"></td>
                                    </tr>
                                    <tr>
                                        <td colspan='2' class='blankspace'></td>
                                    </tr>
                                    <tr>
                                        <td height="200" colspan="2" align="center">
                                            <div style="width:100%;">
                                                <table width="100%" align="center" border="0" cellpadding="0" cellspacing="1" class="inner">
                                                    <tr>
                                                        <td colspan="4" class="h_multi">ข้อมูลสินค้า</td>
                                                        <td colspan="5" class="btn_multi">
                                                    </tr>
                                                    <tr>
                                                        <td class="row3" width="7%">No.</td>
                                                        <td class="row3" width="20%">รายการเบิกสินค้า&nbsp;</td>
                                                        <td class="row3" width="10%">คลัง&nbsp;</td>
                                                        <td class="row3" width="10%">กะ&nbsp;</td>
                                                        <td class="row3" width="10%">น้ำหนัก(กก.)&nbsp;</td>
                                                        <td class="row3" width="10%">จำนวน<br>(ก/ส)&nbsp;</td>
                                                        <td class="row3" width="13%">ยอดตรวจนับ<br>(ก/ส)&nbsp;</td>
                                                        <td class="row3" width="20%">หมายเหตุในการเบิก&nbsp;</td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <div style="width:100%; height: 150px; overflow: auto;" id="show">                                    </div>                                </td>
                                    </tr>
                                    <tr>
                                        <td class="columnlabel">ผู้ส่งสินค้า</td>
                                        <td class="columnobject"><input name='A_reporter_id' class='inputs' type="text" id="A_reporter_id" value='' size='10' readonly="readonly" />
                                            &nbsp;&nbsp;&nbsp;
                                            <input name='reporter_id_desc' class='inputs' type="text" id="reporter_id_desc" value='' size='30' readonly="readonly" />                              </td>
                                    </tr>
                                    <tr>
                                        <td class="columnlabel">ผู้อนุมัติ</td>
                                        <td class="columnobject"><input name='A_approver_id' class='inputs' type="text" id="A_approver_id" value='' size='10' readonly="readonly" />
                                            &nbsp;&nbsp;&nbsp;
                                            <input name='approver_id_desc' class='inputs' type="text" id="approver_id_desc" value='' size='30' readonly="readonly" />                              </td>
                                    </tr>
                                    <tr>
                                        <td class="columnlabel">แผนกคลังสินค้า</td>
                                        <td class="columnobject">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="columnlabel">ตรวจนับสินค้า                                 </td>
                                        <td class="columnobject"><input name='A_wh_leader_id' class='inputs' type="text" id="A_wh_leader_id" value='' size='10' readonly="readonly" />
                                            &nbsp;&nbsp;&nbsp;<img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE3' width='20' height='20' border='0' align='middle' style="cursor: pointer;" onClick="openBrWindow('Vemployee2', 24, 'Search_Config2.jsp');">&nbsp;&nbsp;&nbsp;
                                            <input name='wh_leader_id_desc' class='inputs' type="text" id="wh_leader_id_desc" value='' size='30' readonly="readonly" />หัวหน้าคลังสินค้า</td>
                                    </tr>
                                    <tr>
                                        <td class="columnlabel">ผู้อนุมัติ </td>
                                        <td class="columnobject"><input name='A_account_id' class='inputs' type="text" id="A_account_id" value='' size='10' readonly="readonly" />
                                            &nbsp;&nbsp;&nbsp;<img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE3' width='20' height='20' border='0' align='middle' style="cursor: pointer;" onClick="openBrWindow('Vemployee3', 24, 'Search_Config2.jsp');">&nbsp;&nbsp;&nbsp;
                                            <input name='account_id_desc' class='inputs' type="text" id="account_id_desc" value='' size='30' readonly="readonly" />หัวหน้าแผนกบัญชี/คลังสินค้า</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="right"></td>
                                    </tr>
                                    <tr>
                                        <td colspan='2' class='blankspace'>
                                            <br>
                                            <div align="center">
                                                <a href="javascript:;" onClick="cancle()"><img alt="" class="imgtransparent" src="../IMAGES/BTN_CANCEL_90.png" width="80" height="30" border="0"></a>
                                                <a href="javascript:;" onClick="AddHeader()"><img alt="" class="imgtransparent" src="../IMAGES/BTN_SAVE_90.png" width="80" height="30" border="0"></a>
                                                <a href="javascript:;" onClick="Delete()"><img alt="" class="imgtransparent" src="../IMAGES/BTN_DEL_90.png" width="80" height="30" border="0"></a>
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