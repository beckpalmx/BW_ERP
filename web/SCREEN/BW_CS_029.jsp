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
            function Chknull(){
                if(document.getElementById('doc_id').value == ''){
                    alert('กรุณาใส่ข้อมูลเลขที่เอกสาร');
                }else document.report.submit();
            }
            function goAddChild(URLSend)
            {
                var arryChk = new Array;
                arryChk[0] = "chkNull"
                if(ChkParameter(arryChk))
                {
                    window.open(URLSend[0]);
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
                        getId("status_cancle").value = "";
                        getId("child_ck").value = "";
                        getId("show").innerHTML = "";
                        getId("doc_id").disabled = false;
                    }
                    else  if(getId("status_cancle").value == "1" && getId("child_ck").value == "1")
                    {
                        alert("มีการเปลี่ยนแปลงข้อมูลกรุณาบันทึกข้อมูล");
                    }
                    else{
                        SURL = "../JSP/CS_028.jsp?status_d=3&chk_all=1&username="+getId("username").value;
                        SURL = SURL+"&doc_id="+getId("doc_id").value;
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
                    SURL = "../JSP/CS_028.jsp?status_d=3&chk_all=1&username="+getId("username").value;
                    SURL = SURL+"&doc_id="+getId("doc_id").value;
                    Delete_Line_no_ShowTotal(SURL,'total_weight');
                    showTableNonPopup("show", "doc_id", "../JSP/CS_Show028.jsp?doc_id=");
                    setTimeout('showTableNonPopup("show", "doc_id", "../JSP/CS_Show028.jsp?doc_id=")', 500);
                    getId("chk_all").checked =false;
                }
                else//จะทำการลบข้อมูลเฉพาะ Datail ที่ทำการเลือกไว้
                {
                    SURL = "../JSP/CS_028.jsp?status_d=3&ckbox=";
                    for(var i=0;i<document.getElementsByName("ckbox").length;i++)
                    {
                        Deleteflag += (document.getElementsByName("ckbox")[i].checked)?(i+1).toString()+",":"";
                    }
                    Deleteflag = Deleteflag.substring(0, Deleteflag.length -1);
                    SURL = SURL+Deleteflag+"&doc_id="+getId("doc_id").value+"&username="+getId("username").value;
                    Delete_Line_no_ShowTotal(SURL,'total_weight');
                    showTableNonPopup("show", "doc_id", "../JSP/CS_Show028.jsp?doc_id=");
                    setTimeout('showTableNonPopup("show", "doc_id", "../JSP/CS_Show028.jsp?doc_id=")', 500);
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
                    getSave(URLsend('chkNull,A_doc_id,A_doc_date,A_p_type','../JSP/BW_CS_029.jsp'));
                    /*getId("status_cancle").value = "";
                    getId("child_ck").value = "";
                    getId("show").innerHTML = "";
                    getId("doc_id").disabled = false;
                    setTimeout('getId("total_weight").value = "0";getId("total_weight_chk").value = "0"',1000)*/
                    //setTimeout('window.location.reload()',1000);
                }

            }
            function Delete()
            {
                var r = confirm("คุณต้องการลบข้อมูลทั้งหมดหรือไม่")
                if(r)
                {
                    getSave(URLsend('doc_id,doc_date,date_ck,child_ck,time_from,time_to,runner_id,runner_id_desc,shift,burn_no,wh_in,wh_out,total_weight,status_d,username,tank_qty,operate_id','../JSP/CS_027.jsp'))
                    getId("date_ck").value = "";
                    getId("status_cancle").value = "";
                    getId("child_ck").value = "";
                    getId("show").innerHTML = "";
                    getId("doc_id").disabled = false;
                    setTimeout('getId("total_weight").value = "0";getId("total_weight_chk").value = "0"',1000);
                }
            }
            function Unload()
            {

                if(getId("doc_id").disabled == true && getId("status_cancle").value != "1" && getId("total_weight_chk").value == "0" ){
                    var r = confirm("คุณได้ทำการเปลี่ยนหน้าคุณต้องการบันทึกข้อมูลทั้งหมดใช่หรือไม่");
                    if(r == true){
                        getSave(URLsend('chkNull,doc_id,doc_date,time_from,time_to,runner_id,runner_id_desc,shift,burn_no,wh_in,wh_out,total_weight','../JSP/CS_027.jsp'));
                    }

                    else{
                        var SURL = "../JSP/CS_028.jsp?status_d=3&chk_all=1";
                        SURL = SURL+"&doc_id="+getId("doc_id").value;
                        Delete_Line_no(SURL);
                    }
                }
                else if(getId("doc_id").disabled == true && getId("status_cancle").value == "1" && getId("total_weight_chk").value != getId("total_weight").value ){
                    getSave(URLsend('chkNull,doc_id,doc_date,time_from,time_to,runner_id,runner_id_desc,shift,burn_no,wh_in,wh_out,total_weight','../JSP/CS_027.jsp'));
                }
            }
            function OpenDoc_id()
            {
                openBrWindow('d_product_not_quality_header&stadment=and+complete_flag+=+\'N\'', 29, 'Search_Doc_id.jsp');
                
            }
            function ChkDoc_id(){
                if(getId("doc_id").value.length != 12){
                    alert("กรุณาใส่เลขที่เอกสารให้ถูกต้อง");
                    getId("doc_id").select();
                }
            }
            function Generat_not_pass(){
                showTableNonPopup2("show", "A_doc_date,A_p_type", "../SHOWDETAILSCREEN/BW_CS_Show029.jsp");
            }
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../CSS/MENU.css" rel="stylesheet" type="text/css">
        <link href="../CSS/BT.css" rel="stylesheet" type="text/css">
        <link href="../CSS/cgc_button.css" rel="stylesheet" type="text/css">        
        <title>Insert title here</title>
    </head>
    <body onUnload="Unload()">
        <div align="center">
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
                <input name="username" type="hidden" id="username" value="<%=userbean.getUsername()%>" size="30" readonly/>
                <input type="hidden" id="date_ck" name="date_ck" value="">
                <input type="hidden" id="child_ck" name="child_ck" value="">
                <input type="hidden" id="chkNull" value="A_doc_id">
                <input type="hidden" id="status_a" value="1"><!-- เป็นการเพิ่มข้อมูลเข้าไป-->
                <input type="hidden" id="status_d" value="3"><!-- เป็นการ Delete ข้อมูลทั้งหมด -->
                <input type="hidden" id="status_cancle" value=""><!-- status_cancle = 1 คือค่าที่นำมา Edit แต่ถ้า ="" จะเป็นการ Insert -->
                <!---------------------------------------------------report----------------------------->
                <input type="hidden" id="report_code" name="report_code"  value="<%=path%>">
                <input type="hidden" id="type_report" name="type_report" value="2">
                <input type="hidden" id="lookup" name="lookup" value="<%=lookup%>">
                <input type="hidden" id="doc_eff_date" name="doc_eff_date" value="<%=doc_eff_date%>">
                <input type="hidden" id="doc_no" name="doc_no" value="<%=doc_no%>">
                <table  cellpadding="0"  cellspacing="0">
                    <tr >
                        <td class="ftopleft"></td>
                        <td  class="ftopcenter" colspan="2">บันทึกสรุปแป้งผ่านและไม่ผ่านการตรวจสอบคุณภาพ
                            (BW_CS_029)&nbsp;</td>
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

                                        <td width="150" class="columnlabel"><b>เลขที่เอกสาร*</b>&nbsp;</td>
                                        <td width="607" class="columnobject">
                                            <input name='A_doc_id' type='text' id="A_doc_id" value='' size='15' />
                                            &nbsp;<a href='#' onClick="OpenDoc_id()"  ><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE1' width='20' height='20' border='0' align='middle' ></a>&nbsp;&nbsp;
                                            วันที่เอกสาร*&nbsp;
                                            <input name='A_doc_date' type='text' id="A_doc_date" value='' size='10' readonly="readonly"/>
                                            &nbsp;<a id='date_1'><img name='IMAGE2' src='../IMAGES/BUTTON/MAIN/CALENDAR20.png' border='0' align='absmiddle'></a><script type='text/javascript'>Calendar.setup({inputField:'A_doc_date',ifFormat:'%d-%m-%Y',showsTime:false,button:'date_1',singleClick:true,step:1});</script>
                                            &nbsp;&nbsp;ประเภทแป้ง<select id="A_p_type" name="A_p_type"><option value="P">แป้งแห้ง</option><option value="R">แป้งถ่าย</option></select></td>
                                    </tr>
                                    <tr>
                                        <td colspan='2' class='blankspace'></td>
                                    </tr>
                                    <tr>
                                        <td height="200" colspan="2" align="center">
                                            <div style="width:100%;">
                                                <table width="100%" align="center" border="0" cellpadding="0" cellspacing="1" class="inner">

                                                    <tr>
                                                        <td width="50%" colspan="13" align="left" ><input type="button" class="cgcButton_11" value=" ค้นหาข้อมูล " onClick="Generat_not_pass();"/></td>
                                                        <td width="25%"  align="right" >&nbsp;</td>
                                                        <td width="25%" align="left" >&nbsp;</td>
                                                    </tr>
                                                    <tr>

                                                        <td width="100%"  colspan="14" align="center" class="headergrid">สาเหตุที่ไม่ผ่าน</td>

                                                    </tr>
                                                    <tr>
                                                        <td width="20%" align="center" class="row3">&nbsp;</td>
                                                        <td width="8%" align="center" class="row3">&nbsp;</td>
                                                        <td width="6%"align="center" class="row3">&nbsp;</td>
                                                        <td width="6%" align="center" class="row3">&nbsp;</td>
                                                        <td width="12%"colspan="2" align="center" class="row3">ph</td>
                                                        <td width="6%" align="center" class="row3">&nbsp;</td>
                                                        <td width="6%" align="center" class="row3">&nbsp;</td>
                                                        <td width="6%" align="center" class="row3">&nbsp;</td>
                                                        <td width="6%" align="center" class="row3">&nbsp;</td>
                                                        <td width="6%" align="center" class="row3">&nbsp;</td>
                                                        <td width="6%" align="center" class="row3">&nbsp;</td>
                                                        <td width="6%" align="center" class="row3">&nbsp;</td>
                                                        <td width="6%" align="center" class="row3">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="20%" align="center" class="row3">รหัสแป้ง</td>
                                                        <td width="8%" align="center" class="row3">น้ำหนัก<br>บรรจ(KG)ุ</td>
                                                        <td width="6%" align="center" class="row3">ความชื้น</td>
                                                        <td width="6%" align="center" class="row3">Viscosity</td>
                                                        <td width="6%" align="center" class="row3">สูง</td>
                                                        <td width="6%" align="center" class="row3">ต่ำ</td>
                                                        <td width="6%" align="center" class="row3">ความละเอียด</td>
                                                        <td width="6%" align="center" class="row3">กากอ่อน</td>
                                                        <td width="6%" align="center" class="row3">Whiteness</td>
                                                        <td width="6%" align="center" class="row3">SO2</td>
                                                        <td width="6%" align="center" class="row3">ผงเหล็ก</td>
                                                        <td width="6%" align="center" class="row3">สื่งแปลก<br>ปลอม</td>
                                                        <td width="6%" align="center" class="row3">จุดดำ</td>
                                                        <td width="6%" align="center" class="row3">จำนวน<br>ก/ส<br>ไม่ผ่าน</td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <div style="width:100%; height: 150px; overflow: auto;" id="show" ></div>                                </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="right"></td>
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
            </form>
        </div>
    </body>
</html>