<%@page import="com.bw.Util.HeaderScreen_Report"%>
<%@page import="com.bw.bean.DataBean_Screen_Report"%>
<%@page import="com.bw.Util.HeaderScreen_Process"%>
<%@page import="com.bw.bean.DataBean_Screen_Process"%>
<%@page import="com.bw.bean.UserBean"%>
<%@page import="com.bw.DB.D_product_pack_detail_1DAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", -1);
%>
<html>
    <%!    String path, lookup, doc_eff_date, doc_no;
        D_product_pack_detail_1DAO objdetail;
    %>
    <head>
        <META Http-Equiv="Cache-Control" Content="no-cache">
        <META Http-Equiv="Pragma" Content="no-cache">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../CSS/MENU.css" rel="stylesheet" type="text/css">
        <link href="../CSS/BT.css" rel="stylesheet" type="text/css">  <link href="../CSS/component.css" rel="stylesheet" type="text/css"> 
        <link href="../CSS/cgc_button.css" rel="stylesheet" type="text/css">   
        <link rel="stylesheet" type="text/css" media="all" href="../JS/jscalendar/skins/aqua/aqua.css" title="Aua" />
        <!-- main calendar program -->
        <script type="text/javascript" src="../JS/jscalendar/calendar.js"></script>
        <!-- language for the calendar -->
        <script type='text/javascript' src='../JS/jscalendar/lang/calendar-th.js'></script>
        <!-- the following script defines the Calendar.setup helper function, which makes
               adding a calendar a matter of 1 or 2 lines of code. -->
        <script type="text/javascript" src="../JS/jscalendar/calendar-setup.js"></script>
        <script language="javascript" src="../JS/myAjaxFramework.js"></script>
        <script type="text/javascript">
            function goAddChild(URLSend)
            {
                var arryChk = new Array;
                arryChk[0] = "chkNull";
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
                    setTimeout("location.replace('BW_CS_030.jsp?status_cancle=1&A_doc_id="+getId('A_doc_id').value+"')",500);

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
                        SURL = "../JSP/BW_CS_Detail_030_21.jsp?D_status=3&chk_all=1&username="+getId("A_username").value;
                        SURL = SURL+"&A_doc_id="+getId("A_doc_id").value;
                        Delete_Line_no(SURL);
                        getId("show").innerHTML = "";
                        getId("chk_all").checked =false;
                    }
                }
                else//จะทำการลบข้อมูลเฉพาะ Datail ที่ทำการเลือกไว้
                {
                    SURL = "../JSP/BW_CS_Detail_030_21.jsp?D_status=3&ckbox=";
                    for(var i=0;i<document.getElementsByName("ckbox").length;i++)
                    {
                        Deleteflag += (document.getElementsByName("ckbox")[i].checked)?document.getElementsByName("ckbox")[i].value+",":"";
                    }
                    Deleteflag = Deleteflag.substring(0, Deleteflag.length -1);
                    if(Deleteflag != ""){
                        SURL = SURL+Deleteflag+"&A_doc_id="+getId("A_doc_id").value+"&username="+getId("A_username").value;
                        Delete_Line_no(SURL);
                        showTableNonPopup("show", "A_doc_id", "../SHOWDETAILSCREEN/BW_CS_Show030_2.jsp?doc_id=");
                        setTimeout('showTableNonPopup("show", "A_doc_id", "../SHOWDETAILSCREEN/BW_CS_Show030_2.jsp?doc_id=")', 1000);
                    }else{
                        showTableNonPopup("show", "A_doc_id", "../SHOWDETAILSCREEN/BW_CS_Show030_2.jsp?doc_id=");
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
                    var strID = getIDElements('input', 'I_');
                    strID += getIDElements('input', 'A_');
                    strID += getIDElements('input', 'sum_');
                    strID = strID.substr(0, strID.length-1);
                    getSave(URLsend(strID,'../JSP/BW_CS_Detail_030_2.jsp'));
                    setTimeout("location.replace('BW_CS_030.jsp?status_cancle=1&A_doc_id="+getId('A_doc_id').value+"')",3000);
                    //getSave_Detail(URLsend(strID,'../JSP/BW_CS_Detail_030_2.jsp'),"../SHOWDETAILSCREEN/BW_CS_Show030_2.jsp?doc_id=", "show", getId("A_doc_id").value);
                }
            }
            function Delete()
            {
                var r = confirm("คุณต้องการลบข้อมูลทั้งหมดหรือไม่")
                if(r)
                {
                    getSave(URLsend('D_status,A_doc_id','../JSP/BW_CS_Detail_030_2.jsp'));
                    setTimeout("location.replace('BW_CS_030.jsp?status_cancle=1&A_doc_id="+doc_id+"')",3000);
                }
            }
            function Unload()
            {

                if(getId("doc_id").disabled == true && getId("status_cancle").value != "1" ){
                    var r = confirm("คุณได้ทำการเปลี่ยนหน้าคุณต้องการบันทึกข้อมูลทั้งหมดใช่หรือไม่");
                    if(r == true){
                        getSave(URLsend('chkNull,doc_id,doc_date,time_from,time_to,runner_id,runner_id_desc,shift,wh_in,wh_out,loc_total,loc_1,s_bag_loc1,q_bag_loc1,w_bag_loc1,loc_1_desc,loc_2,s_bag_loc2,q_bag_loc2,w_bag_loc2,loc_2_desc,loc_3,s_bag_loc3,q_bag_loc3,w_bag_loc3,loc_3_desc,c_weight1,c_weight2,c_weight3,c_weight4,c_weight5,p_weight1,p_weight2,p_weight3,p_weight4,p_weight5,u_weight1,u_weight2,u_weight3,u_weight4,u_weight5,remark,child_ck,status_cancle','../JSP/CS_025.jsp'));
                    }
                    else{
                        var SURL = "../JSP/CS_024.jsp?status_d=3&chk_all=1";
                        SURL = SURL+"&doc_id="+getId("doc_id").value;
                        Delete_Line_no(SURL);
                    }
                }
                closepopup();
            }
            function OpenDoc_id()
            {

                if(getId("child_ck").value == "1" && getId("doc_id").disabled == true && getId("status_cancle").value == "1"){
                    alert("มีการเปลี่ยนแปลงข้อมูลกรุณาบันทึกข้อมูล");
                }
                else if(getId("child_ck").value == "1" && getId("doc_id").disabled == true && getId("status_cancle").value == ""){
                    alert("ถ้าต้องการเลือกข้อมูลอื่นกรุณาบันทึกข้อมูลหรือยกเลิกข้อมูล");
                }
                else{
                    openBrWindow('vd_carbon_analyze_header&stadment=and+complete_flag+<>+\'Y\'', 105, '../JSP/Search_Doc_id.jsp');
                }
            }
            function Chknull(){
                if(document.getElementById('doc_id').value == ''){
                    alert('กรุณาใส่ข้อมูลเลขที่เอกสาร');
                }else document.report.submit();
            }
        </script>
    </head>
    <body>
        <div align="center">
            <form name="report" method="post" action="../JSP/CS_REPORT.jsp" target="_blank">
                <%
                    UserBean userbean = (UserBean) session.getAttribute("user");
                    DataBean_Screen_Process objs_p = new DataBean_Screen_Process();
                    HeaderScreen_Process h_p = new HeaderScreen_Process();
                    objs_p = h_p.selectheaderscreen_process(objs_p, "CS_105");
                    // _______________________________________________________________report
                    DataBean_Screen_Report objr_p = new DataBean_Screen_Report();
                    HeaderScreen_Report r_p = new HeaderScreen_Report();
                    objr_p = r_p.Fn_Report(objr_p, "S803");
                    path = objr_p.getPath();
                    lookup = objr_p.getLookup();
                    doc_eff_date = objr_p.getDoc_eff_date();
                    doc_no = objr_p.getDoc_no();
                    //_______________________________________________________________report
                    objdetail = new D_product_pack_detail_1DAO();
                %>
                <input name="A_username" type="hidden" id="A_username" value="<%=userbean.getUsername()%>" size="30" readonly/>
                <input type="hidden" name="chkNull" id="chkNull" value="A_doc_id">
                <input type="hidden" name="I_status" id="I_status" value="1"><!-- เป็นการเพิ่มข้อมูลเข้าไป-->
                <input type="hidden" name="D_status" id="D_status" value="3"><!-- เป็นการ Delete ข้อมูลทั้งหมด -->
                <input type="hidden" name="status_cancle" id="status_cancle" value=""><!-- status_cancle = 1 คือค่าที่นำมา Edit แต่ถ้า ="" จะเป็นการ Insert -->
                <!---------------------------------------------------report----------------------------->
                <input type="hidden" id="report_code" name="report_code"  value="<%=path%>">
                <input type="hidden" id="type_report" name="type_report" value="2">
                <input type="hidden" id="lookup" name="lookup" value="<%=lookup%>">
                <input type="hidden" id="doc_eff_date" name="doc_eff_date" value="<%=doc_eff_date%>">
                <input type="hidden" id="doc_no" name="doc_no" value="<%=doc_no%>">
                <table  cellpadding="0"  cellspacing="0">
                    <tr>
                        <td class="ftopleft"></td>
                        <td  class="ftopcenter" colspan="2"><DIV id="u4_rtf4">
                                <DIV id="u4_rtf5">
                                    <DIV id="u9_rtf2">รายงานการถ่ายแป้ง(BW_CS_Detail_030_2)</DIV>
                                </DIV>
                            </DIV></td>
                        <td class="ftopright"></td>
                    </tr>
                    <tr >
                        <td class="fcenterleft"></td>
                        <td  colspan="2" class="fcentercenter"><div align="center">
                                <table width="94%"  cellpadding="0" cellspacing="0" >
                                    <tr>
                                        <td colspan="2" align="right"><b>หมายเลขเอกสาร :<%=objs_p.getIso_no()%></b></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="right"><b>วันที่มีผลบังคับใช้ : <%=objs_p.getEffective_date()%></b></td>
                                    </tr>
                                    <tr>
                                        <td width="150" class="columnlabel"><input type="button" class="cgcButton_8" id="bt1" onClick="location.replace('BW_CS_030.jsp?status_cancle=1&A_doc_id='+getId('A_doc_id').value)+'';" value=" กลับสู่หน้าหลัก "/></td>
                                        <td width="607" class="columnobject"></td>
                                    </tr>
                                    <tr>
                                        <td width="156" align="" class="columnlabel"><b>เลขที่เอกสาร*</b>&nbsp;</td>
                                        <td width="600" class="columnobject"><input name='A_doc_id' class='inputs' type="text" id="A_doc_id" value='<%=request.getParameter("A_doc_id")%>' size='20' /></td>
                                    </tr>
                                    <tr>
                                        <td colspan='2' class='btn_multi'>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td height="208" colspan="2" align="center"><div style="width:100%;">
                                                <table width="200" border="0" cellpadding="0" cellspacing="1">
                                                    <tr>
                                                        <td colspan="5" class="h_multi">รายงานการถ่ายแป้ง</td>
                                                        <td colspan="10" class="btn_multi">
                                                            <input type='button' class="cgcButton_4" name='but1' value='  เพิ่ม  ' onClick="javascript:goAddChild(URLsend('A_doc_id,I_status,A_username','BW_CS_Detail_030_21.jsp'));"/>
                                                            <input type='button' class="cgcButton_3" name='but2' value='   ลบ  ' onclick='javascript:goDelChild();'/>                                                </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="3px"  class="row3"><input  type="checkbox" name="chk_all" id="chk_all" onClick="ckall(this.checked);"></td>
                                                        <td width="7%"  class="row3"><div align="center">ลำดับที่</div></td>
                                                        <td width="20%"  class="row3"><div align="center">ชื่อแป้ง</div></td>

                                                        <td width="7%"  class="row3"><div align="center">Lot</div>                                                  
                                                            <div align="center"></div></td>
                                                        <td width="15%"  class="row3" >Orderทั้งหมด</td>
                                                        <td width="15%"  class="row3">ยอดคงเหลือ</td>
                                                        <td width="15%"  class="row3">รวมแป้งเบิก</td>
                                                        <td width="15%"  class="row3">รวมแป้งถ่าย</td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <div style="width:100%; height: 150px; overflow: auto;" id="show"><%=objdetail.Show_Detail(request.getParameter("A_doc_id"), null)%></div></td>
                                    </tr>
                                    <tr>
                                        <td colspan='2' class='blankspace'></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="center"><div align="right"><span class="columnobject">&nbsp;&nbsp;</span></div></td>
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
                <p>&nbsp;</p>
            </form>
        </div>
    </body>
</html>
