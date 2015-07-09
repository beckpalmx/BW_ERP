<%@page import="com.bw.Util.HeaderScreen_Report"%>
<%@page import="com.bw.bean.DataBean_Screen_Report"%>
<%@page import="com.bw.bean.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.bw.bean.DataBean_Screen_Process"%>
<%@page import="com.bw.Util.HeaderScreen_Process"%>
<html>
    <%!    String path, lookup, doc_eff_date, doc_no;
    %>
    <head>
        <script language="javascript" src="../JS/myAjaxFramework.js"></script>
        <link rel="stylesheet" type="text/css" media="all" href="../JS/jscalendar/skins/aqua/aqua.css" title="Aua" />
        <script type="text/javascript" src="../JS/jscalendar/calendar.js"></script>
        <script type='text/javascript' src='../JS/jscalendar/lang/calendar-th.js'></script>
        <script type="text/javascript" src="../JS/jscalendar/calendar-setup.js"></script>
        <script type="text/javascript">
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
                    else {
                        SURL = "../JSP/BW_CS_D_Casava_Skin_doc.jsp?status_d=3&chk_all=1";
                        SURL = SURL + "&doc_id=" + getId("doc_id").value;
                        Delete_Line_no(SURL)
                        cancelAction();
                        getId("status_cancle").value = "";
                        getId("child_ck").value = "";
                        getId("show").innerHTML = "";
                        getId("doc_id").disabled = false;
                    }
                    getId("doc_id").disabled = false;
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
                    SURL = "../JSP/BW_CS_D_Casava_Skin_doc.jsp?status_d=3&chk_all=1&username=" + getId("username").value;
                    SURL = SURL + "&doc_id=" + getId("doc_id").value;
                    Delete_Line_no(SURL);
                    showTableNonPopup("show", "doc_id", "../JSP/CS_Show117.jsp?doc_id=");
                    getId("chk_all").checked = false;
                }
                else//จะทำการลบข้อมูลเฉพาะ Datail ที่ทำการเลือกไว้
                {
                    //alert("test");
                    SURL = "../JSP/BW_CS_D_Casava_Skin_doc.jsp?status_d=3&ckbox=";

                    for (var i = 0; i < document.getElementsByName("ckbox").length; i++)
                    {
                        Deleteflag += (document.getElementsByName("ckbox")[i].checked) ? (i + 1).toString() + "," : "";
                    }
                    Deleteflag = Deleteflag.substring(0, Deleteflag.length - 1);
                    SURL = SURL + Deleteflag + "&doc_id=" + getId("doc_id").value + "&username=" + getId("username").value;
                    //alert(SURL);
                    Delete_Line_no(SURL);
                    showTableNonPopup("show", "doc_id", "../JSP/CS_Show117.jsp?doc_id=");
                    setTimeout('showTableNonPopup("show", "doc_id", "../JSP/CS_Show117.jsp?doc_id=")', 500);
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
                    getSave(URLsend('complete_flag,chkNull,doc_id,doc_date,doc_type,doc_time,remark,username', '../JSP/BW_CS_D_Casava_Skin_doc.jsp'));
                    getId("status_cancle").value = "";
                    getId("child_ck").value = "";
                    getId("show").innerHTML = "";
                    getId("doc_id").disabled = false;
                    getId("runner").disabled = false;
                }
            }
            function Delete()
            {
                var r = confirm("คุณต้องการลบข้อมูลทั้งหมดหรือไม่")
                if (r)
                {
                    getSave(URLsend('complete_flag,doc_id,doc_date,doc_type,doc_time,remark,username,status_d', '../JSP/BW_CS_D_Casava_Skin_doc.jsp'));
                    getId("status_cancle").value = "";
                    getId("child_ck").value = "";
                    getId("show").innerHTML = "";
                    getId("doc_id").disabled = false;
                }
            }

            function Checkvalue(thisvalue) {
                if (thisvalue) {
                    getId("complete_flag").value = "Y";
                    alert("เอกสารนี้สมบูรณ์เรียบร้อยแล้ว");
                } else {
                    getId("complete_flag").value = "N"
                    //alert("เอกสารนี้สมบูรณ์เรียบร้อยแล้ว");
                }
            }

        </script>      
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../CSS/MENU.css" rel="stylesheet" type="text/css">
        <link href="../CSS/BT.css" rel="stylesheet" type="text/css">
        <link href="../CSS/bw_button.css" rel="stylesheet" type="text/css">
        <title></title>
    </head>
    <body>
        <form name="report" method="post" action="../JSP/CS_REPORT.jsp" target="_blank">
            <%
                UserBean userbean = (UserBean) session.getAttribute("user");
                DataBean_Screen_Process objs_p = new DataBean_Screen_Process();
                HeaderScreen_Process h_p = new HeaderScreen_Process();
                objs_p = h_p.selectheaderscreen_process(objs_p, "BW_CS_D_Casava_Skin_doc");
                 // _______________________________________________________________report

                DataBean_Screen_Report objr_p = new DataBean_Screen_Report();
                HeaderScreen_Report r_p = new HeaderScreen_Report();
                objr_p = r_p.Fn_Report(objr_p, "S518");
                path = objr_p.getPath();
                lookup = objr_p.getLookup();
                doc_eff_date = objr_p.getDoc_eff_date();
                doc_no = objr_p.getDoc_no();

                 //_______________________________________________________________report
            %>
            <input name="username" type="hidden" id="username" value="<%=userbean.getUsername()%>" size="30" readonly/>
            <input type="hidden" id="chkNull" value="doc_id,doc_date,doc_time,doc_type">
            <input type="hidden" id="status_a" value="1"><!-- เป็นการเพิ่มข้อมูลเข้าไป-->
            <input type="hidden" id="status_d" value="3"><!-- เป็นการ Delete ข้อมูลทั้งหมด -->
            <input type="hidden" id="status_cancle" value=""><!-- status_cancle = 1 คือค่าที่นำมา Edit แต่ถ้า ="" จะเป็นการ Insert -->
            <input type="hidden" id="child_ck" name="child_ck" value="">
            <!---------------------------------------------------report----------------------------->
            <input type="hidden" id="report_code" name="report_code"  value="<%=path%>">
            <input type="hidden" id="type_report" name="type_report" value="2">
            <input type="hidden" id="lookup" name="lookup" value="<%=lookup%>">
            <input type="hidden" id="doc_eff_date" name="doc_eff_date" value="<%=doc_eff_date%>">
            <input type="hidden" id="doc_no" name="doc_no" value="<%=doc_no%>">
            <input type="hidden" id="doc_type" name="doc_type" value="R">
            <input type="hidden" id="remark" name="remark" value="-">
            <input type="hidden" id="cred_code" name="cred_code" value="000380"> <!-- C.Gigantic Carbon -->

            <table  cellpadding="0"  cellspacing="0">
                <tr>
                    <td class="ftopleft"></td>
                    <td  class="ftopcenter" colspan="2">บันทึกการขายกากสด (BW_CS_D_Casava_Skin_doc)&nbsp;</td>
                    <td class="ftopright"></td>
                </tr>
                <tr >
                    <td class="fcenterleft"></td>
                    <td  colspan="2" class="fcentercenter">
                        <div align="left">
                            <table  cellpadding="0" cellspacing="0" >
                                <tr>
                                    <td colspan="2" align="right"><b>หมายเลขเอกสาร : <%=objs_p.getIso_no()%> </b></td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="right"><b>วันที่มีผลบังคับใช้ : <%=objs_p.getEffective_date()%> </b></td>
                                </tr>                                
                                <tr>
                                    <td class="columnlabel"><b>เอกสารสมบูรณ์</b>&nbsp;</td>
                                    <td class="columnobject"><input name="complete_flag" type="checkbox" id="complete_flag" value="N" onClick="Checkvalue(this.checked)"></td>
                                </tr>                                  
                                <tr>
                                    <td class="columnlabel">
                                        <!--input name="runner" id="runner" class="bwButton_7" type="button" value="เลขที่เอกสาร" onclick="AjaxRun_id('doc_id', '../JSP/BW_CS_D_Casava_Skin_doc.jsp?runer_id=1');
                                                this.disabled = true;">&nbsp;-->
                                    <td class="columnobject">
                                        เลขที่เอกสาร&nbsp;
                                        <input name='doc_id' type='text' id="doc_id" value='' size='10' readonly="readonly"/>
                                        &nbsp;<a href='#' onClick="javascript:openBrWindow('vd_casava_skin__fresh&stadment=and+complete_flag+<>+\'Y\'and+count_rec+<>+0', 115, 'Search_Doc_id_By_DATE.jsp')"><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE1' width='20' height='20' border='0' align='middle' ></a>&nbsp;&nbsp;
                                        วันที่เอกสาร*&nbsp;
                                        <input type='text' name='doc_date' size='10' value='' id="doc_date" readonly="readonly" />&nbsp;<a id='date_1' ><img name='IMAGE2' src='../IMAGES/BUTTON/MAIN/CALENDAR20.png' border='0' align='absmiddle'></a><script type='text/javascript'>Calendar.setup({inputField: 'doc_date', ifFormat: '%d-%m-%Y', showsTime: false, button: 'date_1', singleClick: true, step: 1});</script>&nbsp;&nbsp;
                                        เวลา*&nbsp;
                                        <input name='doc_time' type='text' id="doc_time" value='' size='10' />                                
                                    </td>
                                </tr>

                                <tr>
                                    <td class="columnlabel">&nbsp;</td>
                                    <td class="columnobject">
                                        เอกสารที่อนุมัติแล้ว&nbsp;
                                        <input name='doc_id1' type='hidden' id="doc_id1" value='' size='10' />
                                        <a href='#' onClick="javascript:openBrWindow('vd_casava_skin__fresh&stadment=and+complete_flag+=+\'Y\'and+count_rec+<>+0', 115, 'Search_Doc_id_By_DATE.jsp')"><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE1' width='20' height='20' border='0' align='middle' ></a>&nbsp;&nbsp;                                                                                
                                    </td>
                                </tr>                                

                                <!--tr>
                                    <td class="columnlabel">&nbsp;</td>
                                    <td class="columnobject"><select name="doc_type" id="doc_type">
                                            <option value="+">รับเข้า</option>
                                            <option value="-">จ่ายออก</option>
                                        </select>
                                    </td>
                                </tr-->



                                <tr>
                                    <td colspan='2' class='blankspace'></td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center">
                                        <div style="width:100%;">
                                            <table width="100%" align="center" border="0" cellpadding="0" cellspacing="1" class="inner">
                                                <tr>
                                                    <td colspan="5" class="h_multi">ข้อมูลกากสด</td>
                                                    <td colspan="6" class="btn_multi">
                                                        <!--input type='button' class="bwButton_4" name='but1' value='  เพิ่ม  ' onClick="javascript:goAddChild(URLsend('doc_id,doc_date,status_a,username', 'BW_CS_D_Casava_Skin_doc_1.jsp'))"/>
                                                        <input type='button' class="bwButton_3" name='but2' value='  ลบ  ' onclick='goDelChild()'/-->
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td class="row3" width="3%"><input type="checkbox" name="chk_all" value="chk_all" onClick="javascript:ckall(this.checked);"/></td>
                                                    <!--td class="row3" width="7%">ลำดับ&nbsp;</td-->                                                    
                                                    <td class="row3" width="15%">เลขที่ใบชั่ง&nbsp;</td>
                                                    <td class="row3" width="10%">ทะเบียนรถ&nbsp;</td>
                                                    <td class="row3" width="15%">ชื่อลูกค้า</td>
                                                    <td class="row3" width="15%">ประเภท&nbsp;</td>
                                                    <td class="row3" width="15%">น้ำหนัก&nbsp;</td>
                                                    <td class="row3" width="17%">ราคาต่อหน่วย&nbsp;</td>
                                                    <td class="row3" width="15%">รวมราคา&nbsp;</td>
                                                </tr>

                                            </table>
                                        </div>
                                        <div style="width:100%; height: 400px; overflow: auto;" id="show">

                                        </div>
                                    </td>
                                </tr>

                                <br>
                                <!--tr>
                                    <td class="columnlabel">&nbsp;</td>
                                    <td class="columnobject"><textarea name="remark" id="remark" cols="45" rows="2"></textarea></td>
                                </tr-->

                                <tr>
                                    <td colspan='2' class='blankspace'>
                                        <br>
                                        <div align="center">
                                            <a href="javascript:;" onClick="cancle()"><img alt="" class="imgtransparent" src="../IMAGES/BTN_CANCEL_90.png" width="80" height="30" border="0"></a>
                                            <a href="javascript:;" onClick="AddHeader()"><img alt="" class="imgtransparent" src="../IMAGES/BTN_SAVE_90.png" width="80" height="30" border="0"></a>
                                            <a href="javascript:;" onClick="Delete()"><img alt="" class="imgtransparent" src="../IMAGES/BTN_DEL_90.png" width="80" height="30" border="0"></a>                
                                            <a href="javascript:;"  onclick="Chknull()"><img alt="พิมพ์เอกสาร" class="imgtransparent" src="../IMAGES/BTN_PRINT_90.png" width="80" height="30" border="0"></a>
                                        </div>
                                        <br>
                                    </td>
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
        </form>
    </body>
</html>