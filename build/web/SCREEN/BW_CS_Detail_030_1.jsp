<%@page import="com.bw.Util.UtiDatabase"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="com.bw.Util.HeaderScreen_Report"%>
<%@page import="com.bw.bean.DataBean_Screen_Report"%>
<%@page import="com.bw.bean.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.bw.bean.DataBean_Screen_Process"%>
<%@page import="com.bw.Util.HeaderScreen_Process"%>
<%@page import="com.bw.DB.D_product_roast_headerDAO"%>
<%@page import="com.bw.bean.DataBeanD_product_roast_header"%>
<%@page import="com.bw.DB.D_product_roast_detail_1DAO"%>
<%@page import="com.bw.DB.D_product_roast_detail_2DAO"%>
<%
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", -1);
%>
<html>
    <%!    String path, lookup, doc_eff_date, doc_no,
                doc_id,
                prod_roast_per_hr,
                temp_roast_in,
                temp_roast_out,
                temp_water_in,
                temp_water_out,
                firewood_use,
                firewood_per_ton,
                biogas_use,
                biogas_per_ton,
                elec_stream_t1,
                elec_stream_st1,
                elec_stream_t2,
                elec_stream_st2,
                total_withdraw,
                total_prod_1,
                total_production,
                tot_roast_hr,
                total_1,
                total_2,
                total_3,
                date_report;
        D_product_roast_detail_1DAO objdetail1;
        D_product_roast_detail_2DAO objdetail2;
    %>
    <head>
        <META Http-Equiv="Cache-Control" Content="no-cache">
        <META Http-Equiv="Pragma" Content="no-cache">
        <script language="javascript" src="../JS/myAjaxFramework.js"></script>
        <!-- calendar stylesheet -->
        <link rel="stylesheet" type="text/css" media="all" href="../JS/jscalendar/skins/aqua/aqua.css" title="Aua" />
        <link type="text/css" href="../CSS/ui-lightness/jquery-ui-1.8.17.custom.css" rel="stylesheet" />
        <!-- main calendar program -->
        <script type="text/javascript" src="../JS/jscalendar/calendar.js"></script>
        <!-- language for the calendar -->
        <script type='text/javascript' src='../JS/jscalendar/lang/calendar-th.js'></script>
        <!-- the following script defines the Calendar.setup helper function, which makes
               adding a calendar a matter of 1 or 2 lines of code. -->
        <script type="text/javascript" src="../JS/jscalendar/calendar-setup.js"></script>
        <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
        <script type="text/javascript">
            function test(){
                var strID = "";
                strID = getIDElements('input','A_');
                //alert(strID);
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
                        getId("show").innerHTML = "";
                        getId("show2").innerHTML = "";
                        getId("status_cancle").value = "";
                        getId("child_ck").value = "";
                    }
                    else{
                        SURL = "../JSP/CS_037.jsp?status_d=3&chk_all=1";
                        SURL = SURL+"&doc_id="+getId("doc_id").value;
                        Delete_Line_no(SURL);
                        SURL = "../JSP/CS_045.jsp?status_d=3&chk_all=1";
                        SURL = SURL+"&doc_id="+getId("doc_id").value;
                        Delete_Line_no(SURL);
                        cancelAction();
                        getId("show").innerHTML = "";
                        getId("show2").innerHTML = "";
                        getId("status_cancle").value = "";
                        getId("child_ck").value = "";
                    }
                    getId("doc_id").disabled = false;
                }

            }
            function ckall(Name_check_all,Value)//ทำการกดปุ้ม check ทั้งหมดใช้หรือไม่
            {

                for(var i=0;i<document.getElementsByName(Name_check_all).length;i++)
                {
                    document.getElementsByName(Name_check_all)[i].checked = Value;
                }

            }
            
            function goDelChild(URLDelete,URLShow,Div_id,Name_check_all,Name_check_detail)
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
                    for(var i=0;i<document.getElementsByName(Name_check_detail).length;i++)
                    {
                        Deleteflag += (document.getElementsByName(Name_check_detail)[i].checked)?document.getElementsByName(Name_check_detail)[i].value+",":"";
                    }
                    Deleteflag = Deleteflag.substring(0, Deleteflag.length -1);
                    if(Deleteflag != ""){
                        SURL = SURL+Deleteflag+"&A_doc_id="+getId("A_doc_id").value+"&username="+getId("A_username").value;
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
                    var arryChk = new Array;
                    arryChk[0] = "chkNull"
                    if(ChkParameter(arryChk))
                    {
                        var strID = "",doc_id = getId("A_doc_id").value;
                        strID += getIDElements('input','I_');
                        strID += getIDElements('input','A_');
                        strID = strID.substr(0, strID.length-1);
                        //alert(strID);
                        getSave(URLsend('chkNull,'+strID,'../JSP/BW_CS_Detail_030_1.jsp'));

                        setTimeout("location.replace('BW_CS_030.jsp?status_cancle=1&A_doc_id="+doc_id+"')",3000);
                    }
                }
            }
            function Delete()
            {
                confirmDialogDelete(URLsend('A_doc_id,D_status','../JSP/BW_CS_030.jsp'));
                //getId("status_cancle").value = "";
                //location.replace(page_number+'.jsp?A_doc_id='+getId('A_doc_id').value+"&A_doc_date="+getId('A_doc_date').value+"");
            }
            function Unload()
            {

            }
            function Chk_insert_value(checkbox_name,text_name){
                if(getId(checkbox_name).checked){
                    getId(checkbox_name).value = "Y";
                    getId(text_name).disabled = false;
                }else{
                    getId(checkbox_name).value = "N";
                    getId(text_name).disabled = true;
                    getId(text_name).value = "";
                }
            }
            function Chknull(){
                if(document.getElementById('doc_id').value == ''){
                    alert('กรุณาใส่ข้อมูลเลขที่เอกสาร');
                }else document.report.submit();
            }
            function Checkvalue(thisvalue){
                if(thisvalue){
                    getId("job_id_complete").value = "Y";
                    alert("เอกสารนี้สมบูรณ์เรียบร้อยแล้ว");
                    getId("remark").disabled = false;
                }else{
                    getId("job_id_complete").value = "N";
                    getId("remark").value = "";
                    getId("remark").disabled = true;
                }
            }
            function Checkvalue2(thisvalue){
                if(thisvalue){
                    getId("job_id_end").value = "Y";
                    alert("ทำการจบใบแจ้งการผลิต");
                }else{
                    getId("job_id_end").value = "N";
                }
            }
            $(function(){

                // Accordion
                //$("#accordion").accordion({ header: "h3" });
                $('#tabs').tabs();
            });
        </script>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../CSS/MENU.css" rel="stylesheet" type="text/css">
        <link href="../CSS/BT.css" rel="stylesheet" type="text/css">  <link href="../CSS/component.css" rel="stylesheet" type="text/css"> 
        <link href="../CSS/cgc_button.css" rel="stylesheet" type="text/css">   
        <title>Insert title here</title>
    </head>

    <body >
        <div align="center">
            <div  id="imgLoading" style="display: none" align="center" ><img src="../IMAGES/spinner.gif">กำลังประมวลผล...กรุณารอสักครู่</div>
            <div  id="showpage" style="display: '' ">
                <form name="report" method="post" action="../JSP/CS_REPORT.jsp" target="_blank">
                    <%
                        objdetail1 = new D_product_roast_detail_1DAO();
                        objdetail2 = new D_product_roast_detail_2DAO();
                        UserBean userbean = (UserBean) session.getAttribute("user");
                        DataBean_Screen_Process objs_p = new DataBean_Screen_Process();
                        HeaderScreen_Process h_p = new HeaderScreen_Process();
                        objs_p = h_p.selectheaderscreen_detail(objs_p, "CS_036");
                        UtiDatabase objuti = new UtiDatabase();
                        DataBeanD_product_roast_header objBean = new DataBeanD_product_roast_header();
                        D_product_roast_headerDAO objDAO = new D_product_roast_headerDAO();
                        // _______________________________________________________________report
                        DataBean_Screen_Report objr_p = new DataBean_Screen_Report();
                        HeaderScreen_Report r_p = new HeaderScreen_Report();
                        objr_p = r_p.Fn_Report(objr_p, "S509");
                        path = objr_p.getPath();
                        lookup = objr_p.getLookup();
                        doc_eff_date = objr_p.getDoc_eff_date();
                        doc_no = objr_p.getDoc_no();
                        //_______________________________________________________________report
                        //--------------------------return_Value---------------------------------
                        objBean = objDAO.Return_Value(request.getParameter("A_doc_id"), request.getParameter("A_doc_date"));
                        doc_id = request.getParameter("A_doc_id");
                        prod_roast_per_hr = objuti.NotNull(objBean.getProd_roast_per_hr(), "0");
                        temp_roast_in = objuti.NotNull(objBean.getTemp_roast_in(), "0");
                        temp_roast_out = objuti.NotNull(objBean.getTemp_roast_out(), "0");
                        temp_water_in = objuti.NotNull(objBean.getTemp_water_in(), "0");
                        temp_water_out = objuti.NotNull(objBean.getTemp_water_out(), "0");
                        firewood_use = objuti.NotNull(objBean.getFirewood_use(), "0");
                        firewood_per_ton = objuti.NotNull(objBean.getFirewood_per_ton(), "0");
                        biogas_use = objuti.NotNull(objBean.getBiogas_use(), "0");
                        biogas_per_ton = objuti.NotNull(objBean.getBiogas_per_ton(), "0");
                        elec_stream_t1 = objuti.NotNull(objBean.getElec_stream_t1(), "0");
                        elec_stream_st1 = objuti.NotNull(objBean.getElec_stream_st1(), "0");
                        elec_stream_t2 = objuti.NotNull(objBean.getElec_stream_t2(), "0");
                        elec_stream_st2 = objuti.NotNull(objBean.getElec_stream_st2(), "0");
                        total_withdraw = objuti.NotNull(objBean.getTotal_withdraw(), "0");
                        total_prod_1 = objuti.NotNull(objBean.getTotal_prod_1(), "0");
                        total_production = objuti.NotNull(objBean.getTotal_production(), "0");
                        tot_roast_hr = objuti.NotNull(objBean.getTotal_roast_hr(), "0");
                        total_1 = objuti.NotNull(objBean.getTotal_1(), "0");
                        total_2 = objuti.NotNull(objBean.getTotal_2(), "0");
                        total_3 = objuti.NotNull(objBean.getTotal_3(), "0");
                        date_report = "";
                        //--------------------------return_Value---------------------------------
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
                    <!---------------------------------------------------add-------------------------------->
                    <input type="hidden" id="A_doc_date" name="A_doc_date" value="<%=request.getParameter("A_doc_date")%>">
                    <table  cellpadding="0"  cellspacing="0">
                        <tr>
                            <td class="ftopleft"></td>
                            <td  class="ftopcenter" colspan="2">รายงานการอบแป้ง</td>
                            <td class="ftopright"></td>
                        </tr>
                        <tr >
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
                                            <td width="150" class="columnlabel"><input type="button" class="cgcButton_8" id="bt1" onClick="location.replace('BW_CS_030.jsp?status_cancle=1&A_doc_id='+getId('A_doc_id').value)+'';" value=" กลับสู่หน้าหลัก "/></td>
                                            <td width="607" class="columnobject"></td>
                                        </tr>
                                        <tr>
                                            <td width="150" class="columnlabel"><b>เลขที่เอกสาร*</b>&nbsp;</td>
                                            <td width="607" class="columnobject">
                                                <input name='A_doc_id' class='inputs' type="text" id="A_doc_id" value='<%=request.getParameter("A_doc_id")%>' size='20' />&nbsp;&nbsp;วันที่รายงาน<input name='A_date_report' class='inputs' type="text" id="A_date_report" value='<%=date_report%>' size='10' readonly="readonly"/>
                                                &nbsp;<a id='date_1'><img name='IMAGE2' src='../IMAGES/BUTTON/MAIN/CALENDAR20.png' border='0' align='absmiddle'></a><script type='text/javascript'>Calendar.setup({inputField:'A_date_report',ifFormat:'%d-%m-%Y',showsTime:false,button:'date_1',singleClick:true,step:1});</script>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="columnlabel">&nbsp;</td>
                                            <td class="columnobject">&nbsp;</td>
                                        </tr>
                                        <a name="top"></a>
                                        <tr>
                                            <td colspan="2" align="left">
                                                <div id="tabs">
                                                    <ul>
                                                        <li><a href="#tabs-1">เวลาอบ</a></li>
                                                        <li><a href="#tabs-2">แป้งเบิกเวียนน้ำ</a></li>
                                                        <li><a href="#tabs-3">แป้งเบิกMixแห้ง</a></li>
                                                        <li><a href="#tabs-4">แป้งอบได้</a></li>
                                                        <!--<li><a href="#tabs-5">น้ำแป้ง</a></li>-->
                                                    </ul>
                                                    
                                                    <div id="tabs-1"><div align="center" style="width:100%;"><table width="100%" align="center" border="0" cellpadding="0" cellspacing="1" class="inner">
                                                                <tr>                                                                    
                                                                    <td colspan="5" class="h_multi">&nbsp;</td>
                                                                    <td colspan="6" class="btn_multi"><input type='button' class="cgcButton_4" name='but1' value='  เพิ่ม  ' onClick="javascript:goAddChild(URLsend('A_doc_id,I_status,A_username','BW_CS_Detail_030_11.jsp'));"/>
                                                                        <input type='button' class="cgcButton_3" name='but6' value='  ลบ  ' onClick="goDelChild('BW_CS_Detail_030_11.jsp','BW_CS_Show030_11.jsp','show','chk_all','ckbox')"/>                                      </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="row3" width="3%"><input name="chk_all" type="checkbox" id="chk_all" onClick="javascript:ckall(this.value,this.checked);" value="ckbox"/></td>
                                                                    <td class="row3" width="7%">ลำดับ</td>
                                                                    <td class="row3" width="10%">วันที่เริ่ม</td>
                                                                    <td class="row3" width="15%">เวลาที่เริ่มอบ</td>
                                                                    <td class="row3" width="10%">วันที่สิ่นสุด</td>
                                                                    <td class="row3" width="15%">เวลาสิ้นสุดการอบ</td>
                                                                    <td class="row3" width="20%">จำนวนชัวโมง</td>
                                                                    <td class="row3" width="20%">หมายเหตุ</td>
                                                                </tr>
                                                            </table>
                                                            <div style="width:100%; height: 150px; overflow: auto;" id="show" align="center"><%=objdetail1.Show_Detail(doc_id, 1)%></div><div align="center" style="width:100%;"> <table  cellpadding="0"  cellspacing="0"><tr>
                                                                        <td colspan="2" align="right">รวมใช้เวลาอบ
                                                                            <input name="tot_roast_hr" class='inputs' type="text" id="tot_roast_hr" size="15" value="<%=tot_roast_hr%>">
                                                                            ชม.</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="columnlabel">กำลังการผลิตแป้งแห้ง</td>
                                                                        <td class="columnobject"><input name="A_prod_roast_per_hr" class='inputs' type="text" id="A_prod_roast_per_hr" size="15" value="<%=prod_roast_per_hr%>">
                                                                            Kg./hr</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="columnlabel">อุณหภูมิอบแป้ง   ท่อเข้า
                                                                        </td>
                                                                        <td class="columnobject"><input name="A_temp_roast_in" class='inputs' type="text" id="A_temp_roast_in" size="15" value ="<%=temp_roast_in%>">
                                                                            C<sup>o</sup>&nbsp;&nbsp;&nbsp;อุณหภูมิอบแป้ง ท่อออก
                                                                            <input name="A_temp_roast_out" class='inputs' type="text" id="A_temp_roast_out" size="15" value ="<%=temp_roast_out%>">
                                                                            C<sup>o</sup></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="columnlabel">อุณหภูมิน้ำมันเข้า   ท่อเข้า
                                                                        </td>
                                                                        <td class="columnobject"><input name="A_temp_water_in" class='inputs' type="text" id="A_temp_water_in" size="15" value ="<%=temp_water_in%>">
                                                                            C<sup>o</sup>&nbsp;&nbsp;&nbsp;อุณหภูมิน้ำมันออก ท่อออก

                                                                            <input name="A_temp_water_out" class='inputs' type="text" id="A_temp_water_out" size="15" value ="<%=temp_water_out%>">
                                                                            C<sup>o</sup></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="columnlabel">ปริมาณฝืนที่ใช้
                                                                        </td>
                                                                        <td class="columnobject"><input name="A_firewood_use" class='inputs' type="text" id="A_firewood_use" size="15" value ="<%=firewood_use%>">
                                                                            Kg.&nbsp;&nbsp;&nbsp;ปริมาณฝืนที่ใช้ต่อตันแป้ง
                                                                            <input name="A_firewood_per_ton" class='inputs' type="text" id="A_firewood_per_ton" size="15" value ="<%=firewood_per_ton%>">
                                                                            Kg./T</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="columnlabel">ปริมาณ   Biogas ที่ใช้
                                                                        </td>
                                                                        <td class="columnobject"><input name="A_biogas_use" class='inputs' type="text" id="A_biogas_use" size="15" value ="<%=biogas_use%>">
                                                                            NCMH
                                                                            &nbsp;&nbsp;&nbsp;ปริมาณ Biogas ที่ใช้ต่อตันแป้ง

                                                                            <input name="A_biogas_per_ton" class='inputs' type="text" id="A_biogas_per_ton" size="15" value ="<%=biogas_per_ton%>">
                                                                            NCMH</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="columnlabel">โรงไฟฟ้าส่งสตรีม เวลา</td>
                                                                        <td class="columnobject"><input name="A_elec_stream_t1" class='inputs' type="text" id="A_elec_stream_t1" size="15" value ="<%=elec_stream_t1%>">
                                                                            น.                                                                      &nbsp;&nbsp;&nbsp;&nbsp;
                                                                            หยุดส่งเวลา
                                                                            <input name="A_elec_stream_st1" class='inputs' type="text" id="A_elec_stream_st1" size="15" value ="<%=elec_stream_st1%>">
                                                                            น.</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="columnlabel">โรงไฟฟ้าส่งสตรีม เวลา</td>
                                                                        <td class="columnobject"><input name="A_elec_stream_t2" class='inputs' type="text" id="A_elec_stream_t2" size="15" value ="<%=elec_stream_t2%>">
                                                                            น.                                                                      &nbsp;&nbsp;&nbsp;&nbsp;
                                                                            หยุดส่งเวลา
                                                                            <input name="A_elec_stream_st2" class='inputs' type="text" id="A_elec_stream_st2" size="15" value ="<%=elec_stream_st2%>">
                                                                            น.</td>
                                                                    </tr>
                                                                    <!--<tr>
                                                                        <td class="columnlabel">ปริมาณน้ำ/ตันแป้ง</td>
                                                                        <td class="columnobject"><input name="textfield13" class='inputs' type="text" id="textfield13" size="15">
                                                                            กิโลวัตต์/ตันแป้ง</td>
                                                                    </tr>-->
                                                                    <tr>
                                                                        <td class="columnlabel">&nbsp;</td>
                                                                        <td class="columnobject">&nbsp;</td>
                                                                    </tr></table>
                                                            </div> </div>
                                                    </div>
                                                    <div id="tabs-2"><div align="center" style="width:100%;"><table width="100%" align="center" border="0" cellpadding="0" cellspacing="1" class="inner">
                                                                <tr>
                                                                    <td colspan="5" class="h_multi">&nbsp;</td>
                                                                    <a href="#top">กลับด้านบน</a>
                                                                    <td colspan="6" class="btn_multi"><input type='button' class="cgcButton_4" name='but1' value='  เพิ่ม  ' onClick="javascript:goAddChild(URLsend('A_doc_id,I_status,A_username','BW_CS_Detail_030_12.jsp'));"/>
                                                                        <input type='button' class="cgcButton_3" name='but5' value='  ลบ  ' onClick="goDelChild('BW_CS_Detail_030_12.jsp','BW_CS_Show030_12.jsp','show2','chk_all2','ckbox_2')"/>                                      </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="row3" width="3%"><input name="chk_all2" type="checkbox" id="chk_all2" onClick="javascript:ckall(this.value,this.checked);" value="ckbox_2"/></td>
                                                                    <td class="row3" width="7%">ลำดับ&nbsp;</td>
                                                                    <td class="row3" width="20%">แป้งเบิกเวียนน้ำ</td>
                                                                    <td class="row3" width="20%">บรรจุ</td>
                                                                    <td class="row3" width="20%">จำนวน(ก/ส)</td>
                                                                    <td class="row3" width="30%">จำนวน(T)</td>
                                                                </tr>
                                                            </table>
                                                            <div style="width:100%; height: 150px; overflow: auto;" id="show2" align="center"><%=objdetail2.Show_Detail(doc_id, 1, "d_product_roast_detail_2")%></div>
                                                            <div align="center"> <table  cellpadding="0"  cellspacing="0">
                                                                    <tr>
                                                                        <td colspan="2" align="right">รวม
                                                                            <input name="A_total_1" class='inputs' type="text" id="A_total_1" size="15" value="<%=total_1%>"></td>
                                                                    </tr></table></div> </div></div>
                                                    <div id="tabs-3"><div align="center" style="width:100%;">
                                                            <table width="100%" align="center" border="0" cellpadding="0" cellspacing="1" class="inner">
                                                                <tr>
                                                                    <td colspan="5" class="h_multi">&nbsp;</td>
                                                                    <a href="#top">กลับด้านบน</a>
                                                                    <td colspan="6" class="btn_multi"><input type='button' class="cgcButton_4" name='but1' value='  เพิ่ม  ' onClick="javascript:goAddChild(URLsend('A_doc_id,I_status,A_username','BW_CS_Detail_030_13.jsp'));"/>
                                                                        <input type='button' class="cgcButton_3" name='but' value='  ลบ  ' onClick="goDelChild('BW_CS_Detail_030_13.jsp','BW_CS_Show030_13.jsp','show3','chk_all3','ckbox_3')"/>    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="row3" width="3%"><input name="chk_all3" type="checkbox" id="chk_all3" onClick="javascript:ckall(this.value,this.checked);" value="ckbox_3"/></td>
                                                                    <td class="row3" width="7%">ลำดับ&nbsp;</td>
                                                                    <td class="row3" width="20%">แป้งเบิกMixแห้ง</td>
                                                                    <td class="row3" width="20%">บรรจุ</td>
                                                                    <td class="row3" width="20%">จำนวน(ก/ส)</td>
                                                                    <td class="row3" width="30%">จำนวน(T)</td>
                                                                </tr>
                                                            </table>
                                                            <div style="width:100%; height: 150px; overflow: auto;" id="show3" align="center"><%=objdetail2.Show_Detail(doc_id, 2, "d_product_roast_detail_3")%></div>
                                                            <div align="center"> <table  cellpadding="0"  cellspacing="0">
                                                                    <tr>
                                                                        <td colspan="2" align="right">รวม
                                                                            <input name="A_total_2" class='inputs' type="text" id="A_total_2" size="15" value="<%=total_2%>"></td>
                                                                    </tr></table></div> </div></div>
                                                    <div id="tabs-4"><div align="center" style="width:100%;">
                                                            <table width="100%" align="center" border="0" cellpadding="0" cellspacing="1" class="inner">
                                                                <tr>
                                                                    <td colspan="5" class="h_multi">&nbsp;</td>
                                                                    <a href="#top">กลับด้านบน</a>
                                                                    <td colspan="6" class="btn_multi"><input type='button' class="cgcButton_4" name='but1' value='  เพิ่ม  ' onClick="javascript:goAddChild(URLsend('A_doc_id,I_status,A_username','BW_CS_Detail_030_14.jsp'));"/>
                                                                        <input type='button' class="cgcButton_3" name='but2' value='  ลบ  ' onClick="goDelChild('BW_CS_Detail_030_14.jsp','BW_CS_Show030_14.jsp','show4','chk_all4','ckbox_4')"/>    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="row3" width="3%"><input name="chk_all4" type="checkbox" id="chk_all4" onClick="javascript:ckall(this.value,this.checked);" value="ckbox_4"/></td>
                                                                    <td class="row3" width="7%">ลำดับ&nbsp;</td>
                                                                    <td class="row3" width="20%">แป้งอบได้</td>
                                                                    <td class="row3" width="20%">บรรจุ</td>
                                                                    <td class="row3" width="20%">จำนวน(ก/ส)</td>
                                                                    <td class="row3" width="30%">จำนวน(T)</td>
                                                                </tr>
                                                            </table>
                                                            <div style="width:100%; height: 150px; overflow: auto;" id="show4" align="center"><%=objdetail2.Show_Detail(doc_id, 3, "d_product_roast_detail_4")%></div>
                                                            <div align="center"> <table  cellpadding="0"  cellspacing="0">
                                                                    <tr>
                                                                        <td colspan="2" align="right">รวม
                                                                            <input name="A_total_3" class='inputs' type="text" id="A_total_3" size="15" value="<%=total_3%>"></td>
                                                                    </tr></table></div> </div></div>
                                                </div></td>
                                        </tr>

                                        <tr>
                                            <td colspan="2" align="center">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="columnlabel">รวมรายการเบิก</td>
                                            <td class="columnobject"><input name="A_total_withdraw" class='inputs' type="text" id="A_total_withdraw" size="15"  value="<%=total_withdraw%>">
                                                ตัน</td>
                                        </tr>
                                        <tr>
                                            <td class="columnlabel">จำนวนแป้งแห้งที่ผลิตได้ทั้งหมด</td>
                                            <td class="columnobject"><input name="A_total_prod_1" class='inputs' type="text" id="A_total_prod_1" size="15"  value="<%=total_prod_1%>">
                                                ตัน</td>
                                        </tr>
                                        <tr>
                                            <td class="columnlabel">ผลผลิตการอบแป้งบริสุทธิ</td>
                                            <td class="columnobject"><input name="A_total_production" class='inputs' type="text" id="A_total_production" size="15"  value="<%=total_production%>">
                                                ตัน(คิดเหมือนผลผลิตตัดมัน)</td>
                                        </tr>
                                        <tr>
                                            <td class="columnlabel">&nbsp;</td>
                                            <td class="columnobject">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" align="center">&nbsp;</td>                                            
                                        </tr>
                                        <!-- ***************************************************** -->
                                        <tr>
                                            <td colspan='2' class='blankspace'>
                                            <center><a href="#top">กลับด้านบน</a></center>
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
                </form>
            </div>
        </div>
    </body>
</html>