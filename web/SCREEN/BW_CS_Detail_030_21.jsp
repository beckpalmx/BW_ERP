<%@page import="com.bw.bean.DataBeanD_product_pack_datail_1"%>
<%@page import="com.bw.DB.D_product_pack_detail_1DAO"%>
<%@page import="com.bw.DB.D_product_pack_detail_2DAO"%>
<%@page import="com.bw.Util.ThaiUtil"%>
<%@page import="com.bw.Util.UtiDatabase"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", -1);
%>
<html>
    <head>
        <META Http-Equiv="Cache-Control" Content="no-cache">
        <META Http-Equiv="Pragma" Content="no-cache">
        <title></title>
        <script type="text/javascript" src="../JS/myAjaxFramework.js"></script>
        <script type="text/javascript">
            function goAdd(){
                var arrayChk = new Array;
                arrayChk[0]  = "chkNull";
                if(ChkParameter(arrayChk))
                {
                    var strID = getIDElements('input', 'I_');
                    strID += getIDElements('input', 'A_');
                    strID = strID.substr(0, strID.length-1);
                    getSave_Detail(URLsend(strID,'../JSP/BW_CS_Detail_030_21.jsp'),"../SHOWDETAILSCREEN/BW_CS_Show030_2.jsp?doc_id=", "show", getId("A_doc_id").value);
                }
            }
            function goEdit()
            {

                var arrayChk = new Array;
                arrayChk[0]  = "chkNull";
                if(ChkParameter(arrayChk))
                {
                    var strID = getIDElements('input', 'U_');
                    strID += getIDElements('input', 'A_');
                    strID = strID.substr(0, strID.length-1);
                    //alert(strID);
                    getSave_Detail(URLsend(strID,'../JSP/BW_CS_Detail_030_21.jsp'),"../SHOWDETAILSCREEN/BW_CS_Show030_2.jsp?doc_id=", "show", getId("A_doc_id").value);
                }
            }
            function goBack()
            {
                window.close();
            }
            function OpenEdit(URLSend)
            {
                window.open(URLSend[0]);
            }
            function goAddChild(URLSend)
            {
                var arryChk = new Array;
                arryChk[0] = "chkNull";
                if(ChkParameter(arryChk))
                {
                    window.open(URLSend[0]);
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
                        SURL = "../JSP/BW_CS_Detail_030_211.jsp?D_status=3&chk_all=1&username="+getId("A_username").value;
                        SURL = SURL+Deleteflag+"&A_doc_id="+getId("A_doc_id").value+"&A_doc_line_no="+getId("A_doc_line_no").value;
                        Delete_Line_no(SURL);
                        getId("show").innerHTML = "";
                        getId("chk_all").checked =false;
                    }
                }
                else//จะทำการลบข้อมูลเฉพาะ Datail ที่ทำการเลือกไว้
                {
                    SURL = "../JSP/BW_CS_Detail_030_211.jsp?D_status=3&ckbox=";
                    for(var i=0;i<document.getElementsByName("ckbox").length;i++)
                    {
                        Deleteflag += (document.getElementsByName("ckbox")[i].checked)?document.getElementsByName("ckbox")[i].value+",":"";
                    }
                    Deleteflag = Deleteflag.substring(0, Deleteflag.length -1);
                    if(Deleteflag != ""){
                        SURL = SURL+Deleteflag+"&A_doc_id="+getId("A_doc_id").value+"&A_doc_line_no="+getId("A_doc_line_no").value;
                        //alert(SURL)
                        Delete_Line_no(SURL);
                        SURL = "../SHOWDETAILSCREEN/BW_CS_Show030_211.jsp?A_doc_line_no="+getId("A_doc_line_no").value+"&A_doc_id=";
                        //alert(SURL);
                        showTableNonPopup("show", "A_doc_id", SURL);
                        //setTimeout('showTableNonPopup("show", "A_doc_id", "../SHOWDETAILSCREEN/BW_CS_Show024.jsp?doc_id=")', 1000);
                    }else{
                        SURL = "../SHOWDETAILSCREEN/BW_CS_Show030_211.jsp?A_doc_line_no="+getId("A_doc_line_no").value+"&A_doc_id=";
                       // alert(SURL);
                        showTableNonPopup("show", "A_doc_id", SURL);
                    }

                }
            }
            function goDelChild2()
            {
                var Deleteflag ="";
                var SURL;
                if(getId("chk_all").checked)//จะทำการลบข้อมูลของ Detail ทั้งหมด ทึ่ตรงกับรหัส
                {
                    var r = confirm("คุณต้องการลบข้อมูลลายละเอียดของเอกสารนี้ใช่หรือไม่")
                    if(r){
                        SURL = "../JSP/BW_CS_Detail_030_212.jsp?D_status=3&chk_all=1&username="+getId("A_username").value;
                        SURL = SURL+Deleteflag+"&A_doc_id="+getId("A_doc_id").value+"&A_doc_line_no="+getId("A_doc_line_no").value;
                        Delete_Line_no(SURL);
                        getId("show").innerHTML = "";
                        getId("chk_all").checked =false;
                    }
                }
                else//จะทำการลบข้อมูลเฉพาะ Datail ที่ทำการเลือกไว้
                {
                    SURL = "../JSP/BW_CS_Detail_030_212.jsp?D_status=3&ckbox=";
                    for(var i=0;i<document.getElementsByName("ckbox").length;i++)
                    {
                        Deleteflag += (document.getElementsByName("ckbox")[i].checked)?document.getElementsByName("ckbox")[i].value+",":"";
                    }
                    Deleteflag = Deleteflag.substring(0, Deleteflag.length -1);
                    if(Deleteflag != ""){
                        SURL = SURL+Deleteflag+"&A_doc_id="+getId("A_doc_id").value+"&A_doc_line_no="+getId("A_doc_line_no").value;
                        //alert(SURL)
                        Delete_Line_no(SURL);
                        SURL = "../SHOWDETAILSCREEN/BW_CS_Show030_212.jsp?A_doc_line_no="+getId("A_doc_line_no").value+"&A_doc_id=";
                        //alert(SURL);
                        showTableNonPopup("show1", "A_doc_id", SURL);
                        //setTimeout('showTableNonPopup("show", "A_doc_id", "../SHOWDETAILSCREEN/BW_CS_Show024.jsp?doc_id=")', 1000);
                    }else{
                        SURL = "../SHOWDETAILSCREEN/BW_CS_Show030_212.jsp?A_doc_line_no="+getId("A_doc_line_no").value+"&A_doc_id=";
                        //alert(SURL);
                        showTableNonPopup("show1", "A_doc_id", SURL);
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
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../CSS/MENU.css" rel="stylesheet" type="text/css">
        <link href="../CSS/BT.css" rel="stylesheet" type="text/css">  <link href="../CSS/component.css" rel="stylesheet" type="text/css"> 
        <link href="../CSS/cgc_button.css" rel="stylesheet" type="text/css">        
    </head>
    <body >
        <%!            ThaiUtil en;
            UtiDatabase objuti;
            String doc_id, line_no, I_status, U_status, cust_id, lot_no, order_prod_pack, total_prod_pack, withdraw_tot_weight, prod_tot_weight;
            D_product_pack_detail_2DAO objdetail;
            D_product_pack_detail_1DAO objdetail1;
            DataBeanD_product_pack_datail_1 bean;
        %>
        <%
                    objdetail = new D_product_pack_detail_2DAO();
                    objdetail1 = new D_product_pack_detail_1DAO();
                    doc_id = "";
                    line_no = "";
                    I_status = "";
                    U_status = "";
                    cust_id = "";
                    lot_no = "";
                    order_prod_pack = "";
                    total_prod_pack = "";
                    withdraw_tot_weight = "";
                    prod_tot_weight = "";
                    if (request.getQueryString().indexOf("line_no_") != -1) {
                        U_status = "2";
                        line_no = request.getQueryString().substring(8, request.getQueryString().indexOf("="));
                        doc_id = request.getParameter("A_doc_id");
                        bean = objdetail1.Return_Edit(doc_id, line_no);
                        cust_id = bean.getCust_id();
                        lot_no = bean.getLot_no();
                        order_prod_pack = bean.getOrder_prod_pack();
                        total_prod_pack = bean.getTotal_prod_pack();
                        withdraw_tot_weight = bean.getWithdraw_tot_weight();
                        prod_tot_weight = bean.getProd_tot_weight();

                    } else {
                        doc_id = request.getParameter("A_doc_id");
                        I_status = request.getParameter("I_status");

                    }
        %>
        <input name="A_username" type="hidden" id="A_username" value="" size="30" readonly/>
        <input type="hidden" id="A_doc_id" name="A_doc_id" value="<%=doc_id%>">
        <input type="hidden" id="A_doc_line_no" name="A_doc_line_no" value="<%=line_no%>">
        <input type="hidden" id="I_status" name="I_status" value="<%=I_status%>">
        <input type="hidden" id="status_a_parameter" name="status_a_parameter" value="1">
        <input type="hidden" id="U_status" name="status_u" value="<%=U_status%>">
        <input type="hidden" id="chkNull" name="chkNull" value="A_cust_id">
        <input type="hidden" id="status_d" name="status_d" value="3"><!-- เป็นการ Delete ข้อมูลทั้งหมด -->
        <table  cellpadding="0"  cellspacing="0" align="center">
            <tr >
                <td height="119" class="ftopleft"></td>
                <td  class="ftopcenter" colspan="2">ข้อมูลการถ่ายแป้ง</td>
                <td class="ftopright"></td>
            </tr>
            <tr >
                <td class="fcenterleft"></td>
                <td  colspan="2" class="fcentercenter">
                    <div align="center">
                        <table width="94%"  cellpadding="0" cellspacing="0" >
                            <tr>
                                <td colspan="2"  class="blankspace"></td>
                            </tr>

                            <tr>
                                <td class="columnlabel">ชื่อแป้ง</td>
                                <td colspan="2" class="columnobject"><input name="A_cust_id" type="text" id="A_cust_id" size="10" value="<%=cust_id%>"><a href='#' onClick="openBrWindow('vproduct', 30, 'Search_Config2.jsp')"><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE1' width='20' height='20' border='0' align='middle' ></a>
                                    <input name="cust_id_desc" type="text" id="cust_id_desc" size="30">&nbsp;&nbsp;&nbsp;&nbsp;Lot
                                    <input type="text" name="A_lot_no" id="A_lot_no" value="<%=lot_no%>"></td>
                            </tr>
                            <tr>
                                <td class="columnlabel">orderทั้งหมด</td>
                                <td colspan="2" class="columnobject"><input type="text" name="A_order_prod_pack" id="A_order_prod_pack" value="<%=order_prod_pack%>">
                                    ก/ส&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ยอดคงเหลือ
                                    <input type="text" name="A_total_prod_pack" id="A_total_prod_pack" value="<%=total_prod_pack%>">
                                    ก/ส</td>
                            </tr>
                            <tr>
                                <td colspan='2' class='blankspace'></td>
                            </tr>
                            <tr><td class="columnlabel"></td>
                                <td colspan="2" class="columnobject" >
                                    <div style="width:100%;" >
                                        <table width="100%" align="center" border="0" cellpadding="0" cellspacing="1" class="inner">
                                            <%if (U_status.equals("2")) {%>
                                            <tr>
                                                <td colspan="5" class="h_multi">รายงานการถ่ายแป้ง</td>
                                                <td colspan="10" class="btn_multi">
                                                        <input type='button' name='but1' value='  เพิ่ม  ' onClick="javascript:goAddChild(URLsend('A_doc_id,I_status,A_username,A_doc_line_no','BW_CS_Detail_030_211.jsp'));"/>
                                                        <input type="button" name="del2" id="del3" value=" ลบ " onClick="goDelChild()">
                                                        <!--<input type="button" name="test" id="test" value=" เพิ่มck " onClick="testck()">-->
                                                    </td>
                                            </tr>
                                            <%}%>
                                            <tr>
                                                <td width='3%' class="row3"><input type="checkbox" name="chk_all" id="chk_all" onClick="ckall(this.checked)"></td>
                                                <td  width='7%' class="row3">ลำดับ</td>
                                                <td width='20%' class="row3">เบิกแป้งมาถ่าย</td>
                                                <td width='20%' class="row3">บรรจุ</td>
                                                <td width='25%' class="row3">จำนวน(ก/ส)</td>
                                                <td width='25%' class="row3">จำนวน(T)</td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div style="width:100%; height: 150px; overflow: auto;" id="show">
                                        <%=objdetail.Show_Detail(doc_id, line_no, 1)%>
                                    </div>
                                </td>
                            </tr>
                            <tr><td class="columnlabel"></td>
                                <td colspan="2" align="right">               รวม<input type="text" name="withdraw_tot_weight" id="withdraw_tot_weight" value="<%=withdraw_tot_weight%>"></td>
                            </tr>
                            <tr>
                                <td colspan='2' class='btn_multi'>&nbsp;</td>
                            </tr>
                            <tr><td class="columnlabel"></td>
                                <td colspan="2" class="columnobject" ><div style="width:100%;"><table width="100%" align="center" border="0" cellpadding="0" cellspacing="1" class="inner">
                                        <%if (U_status.equals("2")) {%>
                                        <tr>
                                            <td colspan="5" class="h_multi">รายงานการถ่ายแป้ง</td>
                                                <td colspan="10" class="btn_multi">
                                                    <input type='button' name='but1' value='  เพิ่ม  ' onClick="javascript:goAddChild(URLsend('A_doc_id,I_status,A_username,A_doc_line_no','BW_CS_Detail_030_212.jsp'));"/>
                                                    <input type="button" name="del2" id="del3" value=" ลบ " onClick="goDelChild2()">
                                                    <!--<input type="button" name="test" id="test" value=" เพิ่มck " onClick="testck()">-->
                                                </td>
                                        </tr>
                                        <%}%>
                                        <tr>
                                            <td width='3%' class="row3"><input type="checkbox" name="chk_all" id="chk_all" onClick="ckall(this.checked)"></td>
                                            <td  width='7%' class="row3">ลำดับ</td>
                                            <td width='20%' class="row3">แป้งถ่ายได้</td>
                                            <td width='20%' class="row3">บรรจุ</td>
                                            <td width='25%' class="row3">จำนวน(ก/ส)</td>
                                            <td width='25%' class="row3">จำนวน(T)</td>
                                        </tr>

                                    </table></div>
                                    <div style="width:100%; height: 100px; overflow: auto;" id="show1"><%=objdetail.Show_Detail(doc_id, line_no, 2)%></div>                                </td>
                            </tr>
                            <tr><td class="columnlabel"></td>
                                <td colspan="2" align="right">            รวม<input type="text" name="prod_tot_weight" id="prod_tot_weight" value="<%=prod_tot_weight%>">                 </td>
                            </tr>

                            <tr>

                                <td colspan="2" class="columnlabel">                               </td>
                            </tr>

                            <tr><td class="columnlabel"></td>
                                <td colspan='2'  align="right">
                                    <%
                                                if (request.getParameter("I_status") != null) {
                                    %>
                                    <input type="button" class="cgcButton_5" name="button1" value="ตกลง" onClick="javascript:goAdd();"/>&nbsp;&nbsp;
                                    <%} else {
                                    %>
                                    <input type="button" class="cgcButton_5" name="button1" value="แก้ไข" onClick="javascript:goEdit();"/>&nbsp;&nbsp;
                                    <%}
                                    %>

                                    <input type="button" class="cgcButton_5" name="button2" value="ยกเลิก" onClick="javascript:goBack();"/>                                </td>
                            </tr>

                            <tr>
                                <td colspan='2' class='blankspace'>                                </td>
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

    </body>
</html>
