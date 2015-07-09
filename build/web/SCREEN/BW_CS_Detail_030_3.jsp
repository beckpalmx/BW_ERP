<%@page import="com.bw.bean.DataBeanD_product_milling_header"%>
<%@page import="com.bw.DB.D_product_milling_headerDAO"%>
<%@page import="com.bw.DB.D_product_milling_detail_2DAO"%>
<%@page import="com.bw.DB.D_product_milling_detail_1DAO"%>
<%@page import="com.bw.Util.HeaderScreen_Report"%>
<%@page import="com.bw.bean.DataBean_Screen_Report"%>
<%@page import="com.bw.Util.UtiDatabase"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.bw.bean.DataBean_Screen_Process"%>
<%@page import="com.bw.Util.HeaderScreen_Process"%>
<%@page import="com.bw.bean.UserBean"%>
<html>
    <%!    String path, lookup, doc_eff_date, doc_no,cod_in,cod_out,cassava_roots_qty,total_2;
        D_product_milling_detail_1DAO objdetail_1;
        D_product_milling_detail_2DAO objdetail_2;
        D_product_milling_headerDAO objheader;
        DataBeanD_product_milling_header objBean;
    %>
    <head>
        <META Http-Equiv="Cache-Control" Content="no-cache">
        <META Http-Equiv="Pragma" Content="no-cache">
        <script language="javascript" src="../JS/myAjaxFramework.js"></script>
        <link rel="stylesheet" type="text/css" media="all" href="../JS/jscalendar/skins/aqua/aqua.css" title="Aua" />
        <script type="text/javascript" src="../JS/jscalendar/calendar.js"></script>
        <script type='text/javascript' src='../JS/jscalendar/lang/calendar-th.js'></script>
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
                        getId("complete_flag").value = "N";
                        setTimeout('getId("total_weight").value = "0";getId("total_weight_chk").value = "0";getId("lost_weight").value = "0";getId("lost_weight_chk").value = "0";',1000);
                    }

                    else{
                        SURL = "../JSP/CS_030.jsp?status_d=3&chk_all=1&username="+getId("username").value;
                        SURL = SURL+"&doc_id="+getId("doc_id").value;
                        Delete_Line_no(SURL)
                        cancelAction();
                        getId("status_cancle").value = "";
                        getId("child_ck").value = "";
                        getId("show").innerHTML = "";
                        getId("doc_id").disabled = false;
                        getId("complete_flag").value = "N";
                        setTimeout('getId("total_weight").value = "0";getId("total_weight_chk").value = "0";getId("lost_weight").value = "0";getId("lost_weight_chk").value = "0";',1000);
                    }
                }

            }
            function ckall(Name_check_all,Value)//ทำการกดปุ้ม check ทั้งหมดใช้หรือไม่
            {

                for(var i=0;i<document.getElementsByName(Name_check_all).length;i++)
                {
                    document.getElementsByName(Name_check_all)[i].checked = Value;
                }

            }
            function goDelChild(URLDelete,URLShow,Div_id,Name_check_all,Name_check_box_line_no)
            {
                var Deleteflag ="";
                var SURL;
                if(getId(Name_check_all).checked)//จะทำการลบข้อมูลของ Detail ทั้งหมด ทึ่ตรงกับรหัส
                {
                    var r = confirm("คุณต้องการลบข้อมูลลายละเอียดของเอกสารนี้ใช่หรือไม่")
                    if(r){
                        SURL = "../JSP/"+URLDelete+"?D_status=3&chk_all=1&username="+getId("A_username").value;
                        SURL = SURL+"&A_doc_id="+getId("A_doc_id").value;
                        Delete_Line_no(SURL);
                        getId(Div_id).innerHTML = "";
                        getId("chk_all").checked =false;
                    }
                }
                else//จะทำการลบข้อมูลเฉพาะ Datail ที่ทำการเลือกไว้
                {
                    SURL = "../JSP/"+URLDelete+"?D_status=3&ckbox=";
                    for(var i=0;i<document.getElementsByName(Name_check_box_line_no).length;i++)
                    {
                        Deleteflag += (document.getElementsByName(Name_check_box_line_no)[i].checked)?document.getElementsByName(Name_check_box_line_no)[i].value+",":"";
                    }
                    Deleteflag = Deleteflag.substring(0, Deleteflag.length -1);
                    if(Deleteflag != ""){
                        SURL = SURL+Deleteflag+"&A_doc_id="+getId("A_doc_id").value+"&username="+getId("A_username").value;
                        //alert(SURL)
                        Delete_Line_no(SURL);
                        showTableNonPopup(Div_id, "A_doc_id", "../SHOWDETAILSCREEN/"+URLShow+"?doc_id=");
                        setTimeout('showTableNonPopup("'+Div_id+'", "A_doc_id", "../SHOWDETAILSCREEN/'+URLShow+'?doc_id=")', 1000);
                    }else{
                        showTableNonPopup(Div_id, "A_doc_id", "../SHOWDETAILSCREEN/"+URLShow+"?doc_id=");
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
                    var strID = "",doc_id = getId('A_doc_id').value;
                    strID += getIDElements('input','I_');
                    strID += getIDElements('input','A_');
                    strID = strID.substr(0, strID.length-1);
                    //alert(strID);
                    getSave(URLsend('chkNull,'+strID,'../JSP/BW_CS_Detail_030_3.jsp'));
                    setTimeout("location.replace('BW_CS_030.jsp?status_cancle=1&A_doc_id="+doc_id+"')",3000);
                }
            }
            function Delete()
            {
                var r = confirm("คุณต้องการลบข้อมูลทั้งหมดหรือไม่")
                if(r)
                {
                    var doc_id = getId("A_doc_id").value;
                    getSave(URLsend('D_status,A_doc_id','../JSP/BW_CS_Detail_030_3.jsp'));
                    location.replace('BW_CS_030.jsp?status_cancle=1&A_doc_id='+doc_id);
                }
            }
            function Unload()
            {

                if(getId("doc_id").disabled == true && getId("status_cancle").value != "1" && getId("total_weight_chk").value == "" ){
                    var r = confirm("คุณได้ทำการเปลี่ยนหน้าคุณต้องการบันทึกข้อมูลทั้งหมดใช่หรือไม่");
                    if(r == true){
                        getSave(URLsend('chkNull,doc_id,doc_date,time_from,time_to,runner_id,runner_id_desc,shift,burn_no,wh_in,wh_out,total_weight','../JSP/CS_029.jsp'));
                    }

                    else{
                        var SURL = "../JSP/CS_030.jsp?status_d=3&chk_all=1";
                        SURL = SURL+"&doc_id="+getId("doc_id").value;
                        Delete_Line_no(SURL);
                    }
                }
                else if(getId("doc_id").disabled == true && getId("status_cancle").value == "1" && getId("total_weight_chk").value != getId("total_weight").value ){
                    getSave(URLsend('chkNull,doc_id,doc_date,time_from,time_to,runner_id,runner_id_desc,shift,burn_no,wh_in,wh_out,total_weight','../JSP/CS_029.jsp'));
                }
            }
            function Checkvalue(thisvalue){
                if(thisvalue){
                    getId("complete_flag").value = "Y";
                    alert("เอกสารนี้สมบูรณ์เรียบร้อยแล้ว");
                }else{
                    getId("complete_flag").value = "N"
                    //alert("เอกสารนี้สมบูรณ์เรียบร้อยแล้ว");
                }
            }
            
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../CSS/MENU.css" rel="stylesheet" type="text/css">
        <link href="../CSS/BT.css" rel="stylesheet" type="text/css">
        <link href="../CSS/cgc_button.css" rel="stylesheet" type="text/css">   
        <title>Insert title here</title>
    </head>
    <body>
        <form name="report" method="post" action="../JSP/CS_REPORT.jsp" target="_blank">
            <%
                        DataBean_Screen_Process objs_p = new DataBean_Screen_Process();
                        HeaderScreen_Process h_p = new HeaderScreen_Process();
                        objs_p = h_p.selectheaderscreen_process(objs_p, "CS_029");
                        UserBean userbean = (UserBean) session.getAttribute("user");
                        UtiDatabase objuti = new UtiDatabase();
                        // _______________________________________________________________report
                        DataBean_Screen_Report objr_p = new DataBean_Screen_Report();
                        HeaderScreen_Report r_p = new HeaderScreen_Report();
                        objr_p = r_p.Fn_Report(objr_p, "S505");
                        path = objr_p.getPath();
                        lookup = objr_p.getLookup();
                        doc_eff_date = objr_p.getDoc_eff_date();
                        doc_no = objr_p.getDoc_no();
                        //_______________________________________________________________report
                        cod_in = "";
                        cod_out = "";
                        cassava_roots_qty = "";
                        total_2 = "";
                        objdetail_1 = new D_product_milling_detail_1DAO();
                        objdetail_2 = new D_product_milling_detail_2DAO();
                        objheader = new D_product_milling_headerDAO();
                        objBean = new DataBeanD_product_milling_header();
                        objBean = objheader.ReturnEdit(request.getParameter("A_doc_id"));
                        cod_in = objBean.getCod_in();
                        cod_out = objBean.getCod_out();
                        cassava_roots_qty = objBean.getCassava_roots_qty();
                        total_2=  objBean.getTotal_2();
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
                <tr >
                    <td class="ftopleft"></td>
                    <td  class="ftopcenter" colspan="2">รายงานการโม่มัน(BW_CS_Detail_030_3)&nbsp;</td>
                    <td class="ftopright"></td>
                </tr>
                <tr >
                    <td class="fcenterleft"></td>
                    <td  colspan="2" class="fcentercenter">
                        <div align="left">
                            <table   cellpadding="0" cellspacing="0" >
                                <tr>
                                    <td colspan="2" align="right"><b>หมายเลขเอกสาร : <%=objs_p.getIso_no()%> </b></td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="right"><b>วันที่มีผลบังคับใช้ : <%=objs_p.getEffective_date()%> </b></td>
                                </tr>
                                <tr>
                                    <a name="top"></a>
                                    <td width="150" class="columnlabel"><input type="button"  class="cgcButton_8" id="bt1" onClick="location.replace('BW_CS_030.jsp?status_cancle=1&A_doc_id='+getId('A_doc_id').value)+'';" value=" กลับสู่หน้าหลัก "/></td>
                                    <td width="607" class="columnobject"></td>
                                </tr>                                
                                <tr>
                                    <td width="150" class="columnlabel"><b>เลขที่เอกสาร*</b>&nbsp;</td>
                                    <td width="607" class="columnobject">
                                        <input name='A_doc_id' type='text' id="A_doc_id" value='<%=request.getParameter("A_doc_id")%>' size='20' onBlur="ChkDoc_id();"/>
                                        &nbsp;
                                        &nbsp;&nbsp;&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan='2' class='blankspace'></td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center">
                                        <div style="width:100%;">
                                            <table width="100%" align="center" border="0" cellpadding="0" cellspacing="1" class="inner">
                                                <tr>
                                                    <td colspan="5" class="h_multi">&nbsp;</td>
                                                    <td colspan="6" class="btn_multi">
                                                        <input type='button' class="cgcButton_4" name='but1' value='  เพิ่ม  ' onClick="javascript:goAddChild(URLsend('A_doc_id,I_status,A_username','BW_CS_Detail_030_31.jsp'));"/>
                                                        <input type='button' class="cgcButton_3" name='but2' value='  ลบ  ' onClick="goDelChild('BW_CS_Detail_030_31.jsp','BW_CS_Show030_31.jsp','show','chk_all','ckbox')"/>		    			  		</td>
                                                </tr>
                                                <tr>
                                                    <td class="row3" width="3px"><input type="checkbox" name="chk_all"  id="chk_all" value="ckbox" onClick="javascript:ckall(this.value,this.checked);" /></td>
                                                    <td class="row3" width="7%">ลำดับที่&nbsp;</td>
                                                    <td class="row3" width="15%">โม่หัวมันวันที่</td>
                                                    <td class="row3" width="15%">วันที่เริ่มโม่</td>
                                                    <td class="row3" width="15%">เวลาเริ่มโม่&nbsp;</td>
                                                    <td class="row3" width="15%">วันที่หัวมันหมด&nbsp;</td>
                                                    <td class="row3" width="15%">เวลาที่หัวมันหมด</td>
                                                    <td class="row3" width="15%">หมายเหตุ&nbsp;</td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div style="width:100%; height: 150px; overflow: auto;" id="show"><%=objdetail_1.Show_Detail(request.getParameter("A_doc_id"), null)%></div>                                </td>
                                </tr>
                                <tr>
                                    <td class="columnlabel">&nbsp;</td>
                                    <td class="columnobject">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center">
                                        <div style="width:100%;">
                                            <table width="100%" align="center" border="0" cellpadding="0" cellspacing="1" class="inner">
                                                <tr>
                                                    <td colspan="5" class="h_multi">&nbsp;</td>
                                                    <td colspan="6" class="btn_multi">
                                                        <a href="#top">กลับด้านบน</a>
                                                        <input type='button' class="cgcButton_4" name='but1' value='  เพิ่ม  ' onClick="javascript:goAddChild(URLsend('A_doc_id,I_status,A_username','BW_CS_Detail_030_32.jsp'));"/>
                                                        <input type='button' class="cgcButton_3" name='but2' value='  ลบ  ' onClick="goDelChild('BW_CS_Detail_030_32.jsp','BW_CS_Show030_32.jsp','show2','chk_all2','ckbox2')"/>		    			  		</td>
                                                </tr>
                                                <tr>
                                                    <td class="row3" width="3px"><input type="checkbox" name="chk_all2"  id="chk_all2" value="ckbox2" onClick="javascript:ckall(this.value,this.checked);"/></td>
                                                    <td class="row3" width="7%">ลำดับที่&nbsp;</td>
                                                    <td class="row3" width="15%">เริ่มโม่มันวันที่</td>
                                                    <td class="row3" width="15%">เริ่มโม่มันเวลา</td>
                                                    <td class="row3" width="15%">โม่มันถึงวันที่&nbsp;</td>
                                                    <td class="row3" width="15%">โม่มันถึงเวลา&nbsp;</td>
                                                    <td class="row3" width="15%">จำนวนชั่วโมง</td>
                                                    <td class="row3" width="15%">หมายเหตุ&nbsp;</td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div style="width:100%; height: 150px; overflow: auto;" id="show2"><%=objdetail_2.Show_Detail(request.getParameter("A_doc_id"), null)%></div>                                </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="right">ใช้เวลาในการโม่
                                        <input type="text" name="total_2" id="total_2" value="<%=total_2%>">
                                        ชัวโมง</td>
                                </tr>
                                <tr>
                                    <td class="columnlabel">ค่าCODขาเข้า</td>
                                    <td class="columnobject"><input name='A_cod_in' type='text' id="A_cod_in" value='<%=cod_in%>' size='15' /></td>
                                </tr>
                                <tr>
                                    <td class="columnlabel">ค่าCODขาเข้า</td>
                                    <td class="columnobject"><input name='A_cod_out' type='text' id="A_cod_out" value='<%=cod_out%>' size='15' /></td>
                                </tr>
                                <tr>
                                    <td class="columnlabel">ปริมาณเหง้า&nbsp;</td>
                                    <td class="columnobject"><input name='A_cassava_roots_qty' type='text' id="A_cassava_roots_qty" value='<%=cassava_roots_qty%>' size='15' />
                                        Kg.</td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="right"><!--
	          		<input type='text' name='____total_weight' size='10' value='' />
	          		 -->	          	</td>
                                </tr>
                                <tr>
                                    <td colspan='2' class='blankspace'>
                                        <br>
                                        <center><a href="#top">กลับด้านบน</a></center>
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
        </form>
    </body>
</html>