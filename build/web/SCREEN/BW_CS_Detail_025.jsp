<%@page import="com.bw.Util.UtiDatabase"%>
<%@page import="com.bw.DB.D_product_accept_confirm_detailDAO"%>
<%@page import="com.bw.bean.DataBeanD_product_accept_detail"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.bw.Util.ThaiUtil"%>
<html>
    <head>
        <title></title>
        <META Http-Equiv="Cache-Control" Content="no-cache">
        <META Http-Equiv="Pragma" Content="no-cache">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../CSS/MENU.css" rel="stylesheet" type="text/css">
        <link href="../CSS/BT.css" rel="stylesheet" type="text/css">  
        <link href="../CSS/component.css" rel="stylesheet" type="text/css"> 
        <link href="../CSS/cgc_button.css" rel="stylesheet" type="text/css">        
        <script type="text/javascript" src="../JS/myAjaxFramework.js"></script>

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
            function goAdd() {
                var arrayChk = new Array;
                arrayChk[0] = "chkNull";
                if (ChkParameter(arrayChk))
                {
                    if (parseInt(getId("bag_qty").value, 10) > parseInt(getId("A_amount").value, 10)) {
                        alert("กรุณากรอกยอดตรวจนับให้ถูกต้อง");
                    } else {
                        var strID = getIDElements('input', 'I_');
                        strID += getIDElements('input', 'A_');
                        strID += getIDElements('select', 'A_');
                        strID += getIDElements('textarea', 'A_');
                        strID = strID.substr(0, strID.length - 1);
                        getSave_Detail(URLsend(strID, '../JSP/BW_CS_Detail_025.jsp'), "../SHOWDETAILSCREEN/BW_CS_Show025.jsp?doc_id=", "show", getId("A_doc_id").value);
                    }
                }
            }
            function goEdit()
            {

                var arrayChk = new Array;
                arrayChk[0] = "chkNull";
                if (ChkParameter(arrayChk))
                {
                    if (parseInt(getId("A_amount").value, 10) > parseInt(getId("bag_qty").value, 10)) {
                        alert("กรุณากรอกยอดตรวจนับให้ถูกต้อง");
                        getId("A_amount").select();
                    } else {
                        var strID = getIDElements('input', 'U_');
                        strID += getIDElements('input', 'A_');
                        strID += getIDElements('textarea', 'A_');
                        strID = strID.substr(0, strID.length - 1);
                        //alert(strID)
                        getSave_Detail(URLsend(strID, '../JSP/BW_CS_Detail_025.jsp'), "../SHOWDETAILSCREEN/BW_CS_Show025.jsp?doc_id=", "show", getId("A_doc_id").value);

                    }
                }
            }
            function goBack()
            {
                window.close();
            }
            function select() {
                if (getId("U_status").value !== "") {
                    getId("A_shift").value = getId("selectshift").value;
                }

            }
        </script>
    </head>
    <body onLoad="select();">
        <%!            ThaiUtil en;
            DataBeanD_product_accept_detail objBean;
            D_product_accept_confirm_detailDAO objdb;
            UtiDatabase objuti;
            String line_no, doc_id, A_status, U_status,
                    product_id, weight, bag_qty, remark, shift, amount, product_name, quantity, wh_in;
        %>
        <%
            line_no = "";
            doc_id = "";
            A_status = "";
            U_status = "";
            product_id = "";
            weight = "";
            bag_qty = "";
            remark = "";
            shift = "";
            amount = "";
            wh_in = "";
            quantity = "";
            product_name = "";
            en = new ThaiUtil();
            objBean = new DataBeanD_product_accept_detail();
            objdb = new D_product_accept_confirm_detailDAO();
            objuti = new UtiDatabase();
            if (request.getQueryString().indexOf("line_no_") != -1) {
                U_status = "2";
                line_no = request.getQueryString().substring(8, request.getQueryString().indexOf("="));
                doc_id = request.getParameter("A_doc_id");
                objBean = objdb.Return_Edit(doc_id, line_no);
                product_id = objBean.getProduct_id();
                weight = objBean.getWeight();
                bag_qty = objBean.getBag_qty();
                remark = objBean.getRemark();
                shift = objBean.getShift();
                amount = objBean.getAmount();
                product_name = objBean.getProduct_name();
                quantity = objBean.getQuantity();
                wh_in = objBean.getWh_id();
            } else {
                doc_id = request.getParameter("A_doc_id");
                A_status = request.getParameter("I_status");
            }
        %>
        <input name="username" type="hidden" id="username" value="<%=request.getParameter("A_username")%>" size="30" readonly/>
        <input type="hidden" id="A_doc_id" name="A_doc_id" value="<%=request.getParameter("A_doc_id")%>">
        <input type="hidden" id="A_line_no" name="A_line_no" value="<%=line_no%>">
        <input type="hidden" id="I_status" name="I_status" value="<%=A_status%>">
        <input type="hidden" id="U_status" name="U_status" value="<%=U_status%>">
        <input type="hidden" id="chkNull" name="chkNull" value="A_amount">
        <br>
        <div class="container">
            <div class="panel panel-primary">
                <div class="panel-heading"> <span class="glyphicon glyphicon-tasks"></span>&nbsp;
                    <b>ข้อมูลการรับสินค้า</b>
                </div>                        
                <div class="panel-footer">                                    <div align="center">
                        <table  cellpadding="0" cellspacing="0" >
                            <tr>
                                <td colspan="2"  class="blankspace"></td>
                            </tr>
                            <tr>
                                <td class="columnlabel1">รหัสสินค้า*&nbsp;</td>
                                <td class="columnobject">
                                    <input name='product_id' class='inputs' type="text" id="product_id" value='<%=product_id%>' size='20' />
                                    <input class='inputs' type="text" name="product_id_desc" id="product_id_desc" value="<%=product_name%>" size='50'></td>
                            </tr>
                            <tr>
                                <td class="columnlabel1">กะ</td>
                                <td class="columnobject"><%=objuti.ShowSelectBox("select shift_id,name_t from mshift order by runno", "shift_id", "name_t", "A_shift")%>
                                    <input type="hidden" id="selectshift" value="<%=shift%>">&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="columnlabel1"><span class="row3">คลังสินค้า&nbsp;</span></td>
                                <td class="columnobject">
                                    <input name="A_wh_in" class='inputs' type="text" id="A_wh_in" size="10" value="<%=wh_in%>" readonly> <a href="#">
                                        <img height="20" border="0" align="middle" width="20" src="../IMAGES/BUTTON/MAIN/SEARCH20.png" alt="ค้นหา" name="IMAGE4" onclick="openBrWindow('Mwarehouse&textinput=A_wh_in', 31, 'Search_Detail.jsp')">
                                    </a>                               </td>
                            </tr>
                            <tr>
                                <td class="columnlabel1"><span class="row3">น้ำหนัก(กก.)&nbsp;</span></td>
                                <td class="columnobject">
                                    <input name="weight" class='inputs' type="text" id="weight" size="10" value="<%=weight%>" readonly>                                </td>
                            </tr>
                            <tr>
                                <td class="columnlabel1"><span class="row3">จำนวน(ก/ส)&nbsp;</span>&nbsp;</td>
                                <td class="columnobject"><input name='bag_qty' class='inputs' type="text" id="bag_qty" value='<%=bag_qty%>' size='10' />
                                </td>
                            </tr>
                            <tr>
                                <td class="columnlabel1"><span class="row3">น้าหนักรวม&nbsp;</span>&nbsp;</td>
                                <td class="columnobject"><input name='quantity' class='inputs' type="text" id="quantity" value='<%=quantity%>' size='10' />
                                </td>
                            </tr>
                            <tr>
                                <td class="columnlabel1"><span class="row3">ยอดตรวจนับ
                                        (ก/ส)&nbsp;</span></td>
                                <td class="columnobject"><input name='A_amount' class='inputs' type="text" id="A_amount" value='<%=amount%>' size='10' />                              </td>
                            </tr>
                            <tr>
                                <td class="columnlabel1">หมายเหตุ&nbsp;</td>
                                <td class="columnobject"><textarea class='text_inputs' name="A_remark" id="A_remark" cols="45" rows="5"><%=remark%></textarea></td>
                            </tr>

                            <tr>
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
                                    <input type="button" class="cgcButton_5" name="button2" value="ยกเลิก" onClick="goBack()"/>                                </td>
                            </tr>

                            <tr>
                                <td colspan='2' class='blankspace'>                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>                                    
    </body>
</html>
