<%@page import="com.bw.Util.UtiDatabase"%>
<%@page import="com.bw.DB.D_product_withdraw_detailDAO"%>
<%@page import="com.bw.bean.DataBeanD_product_withdraw_detail"%>
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
                    var strID = getIDElements('input', 'I_');
                    strID += getIDElements('input', 'A_');
                    strID += getIDElements('select', 'A_');
                    strID += getIDElements('textarea', 'A_');
                    strID = strID.substr(0, strID.length - 1);
                    getSave_Detail(URLsend(strID, '../JSP/BW_CS_Detail_051.jsp'), "../SHOWDETAILSCREEN/BW_CS_Show051.jsp?doc_id=", "show", getId("A_doc_id").value);
                }
            }
            function goEdit()
            {

                var arrayChk = new Array;
                arrayChk[0] = "chkNull";
                if (ChkParameter(arrayChk))
                {
                    var strID = getIDElements('input', 'U_');
                    strID += getIDElements('input', 'A_');
                    strID += getIDElements('select', 'A_');
                    strID += getIDElements('textarea', 'A_');
                    strID = strID.substr(0, strID.length - 1);
                    alert(strID)
                    getSave_Detail(URLsend(strID, '../JSP/BW_CS_Detail_051.jsp'), "../SHOWDETAILSCREEN/BW_CS_Show051.jsp?doc_id=", "show", getId("A_doc_id").value);
                }
            }
            function goBack()
            {
                window.close();
            }
            function select() {
                if (getId("U_status").value != "") {
                    getId("A_shift").value = getId("selectshift").value;
                }

            }
            function Amount(weight, bag, amount) {
                if (getId(weight).value != "" && getId(bag).value != "") {
                    getId(amount).value = parseInt(getId(weight).value, 10) * parseInt(getId(bag).value, 10);
                }
            }
        </script>
    </head>
    <body onLoad="select();">
        <%!            ThaiUtil en;
            UtiDatabase objuti;
            DataBeanD_product_withdraw_detail objBean;
            D_product_withdraw_detailDAO objdb;
            String line_no, doc_id, A_status, U_status,
                    product_id, weight, bag_qty, remark, shift, product_name, quantity, wh_in;
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
            product_name = "";
            quantity = "";
            wh_in = "";
            en = new ThaiUtil();
            objBean = new DataBeanD_product_withdraw_detail();
            objdb = new D_product_withdraw_detailDAO();
            objuti = new UtiDatabase();
            if (request.getQueryString().indexOf("line_no_") != -1) {
                U_status = "2";
                line_no = request.getQueryString().substring(8, request.getQueryString().indexOf("="));
                doc_id = request.getParameter("A_doc_id");
                objBean = objdb.Return_Edit_suppliers(doc_id, line_no);
                product_id = objBean.getProduct_id();
                weight = objBean.getWeight();
                bag_qty = objBean.getBag_qty();
                remark = objBean.getRemark();
                shift = objBean.getShift();
                product_name = objBean.getProduct_name();
                wh_in = objBean.getWh_id();
                quantity = objBean.getQuantity();
            } else {
                doc_id = request.getParameter("A_doc_id");
                A_status = request.getParameter("I_status");
            }
        %>
        <input name="username" type="hidden" id="username" value="<%=request.getParameter("A_username")%>" size="30" readonly/>
        <input type="hidden" id="A_doc_id" name="A_doc_id" value="<%=request.getParameter("A_doc_id")%>">
        <input type="hidden" id="A_line_no" name="A_line_no" value="<%=line_no%>">
        <input type="hidden" id="I_status" name="A_status" value="<%=A_status%>">
        <input type="hidden" id="U_status" name="U_status" value="<%=U_status%>">
        <input type="hidden" id="chkNull" name="chkNull" value="A_product_id,A_weight,A_bag_qty,A_quantity">
        <br>
        <div class="container">
            <div class="panel panel-primary">
                <div class="panel-heading"> <span class="glyphicon glyphicon-tasks"></span>&nbsp;
                    <b>ข้อมูลการเบิก</b>
                </div>                        
                <div class="panel-footer">   
                    <div align="center">
                        <table  cellpadding="0" cellspacing="0" >
                            <tr>
                                <td colspan="2"  class="blankspace"></td>
                            </tr>
                            <tr>
                                <td class="columnlabel1">รหัสสินค้า*&nbsp;</td>
                                <td class="columnobject">
                                    <input name='A_product_id' class='inputs' type="text" id="A_product_id" value='<%=product_id%>' size='10' />&nbsp;<a href='#' onClick="openBrWindow('vproduct', 24, 'Search_Config2.jsp');" ><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE3' width='20' height='20' border='0' align='middle' ></a>&nbsp;&nbsp;<input name='product_id_desc' class='inputs' type="text" id="product_id_desc" value='<%=product_name%>' size='50' readonly="readonly" />                                
                                </td>
                            </tr>
                            <tr>
                                <td class="columnlabel1">คลังสินค้า&nbsp;</td>
                                <td class="columnobject">
                                    <input name="A_wh_in" class='inputs' type="text" id="A_wh_in" size="10" value="<%=wh_in%>"><a href='#'><img align='middle' border='0' width='20' height='20' onclick="openBrWindow('Mwarehouse&textinput=A_wh_in', 31, 'Search_Detail.jsp')" name='IMAGE4' alt='ค้นหา' src='../IMAGES/BUTTON/MAIN/SEARCH20.png'></a>
                                </td>
                            </tr>
                            <tr>
                                <td class="columnlabel1">กะ</td>
                                <td class="columnobject"><%=objuti.ShowSelectBox("select shift_id,name_t from mshift order by runno", "shift_id", "name_t", "A_shift")%>
                                    <input type="hidden" id="selectshift" value="<%=shift%>">&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="columnlabel1"><span class="row3">น้ำหนัก(กก.)&nbsp;</span></td>
                                <td class="columnobject">
                                    <input name="A_weight" class='inputs' type="text" id="A_weight" size="10" value="<%=weight%>" onblur="Amount('A_weight', 'A_bag_qty', 'A_quantity')" >
                                </td>
                            </tr>
                            <tr>
                                <td class="columnlabel1"><span class="row3">จำนวน(ก/ส)&nbsp;</span>&nbsp;</td>
                                <td class="columnobject">
                                    <input name='A_bag_qty' class='inputs' type="text" id="A_bag_qty" value='<%=bag_qty%>' size='10' onblur="Amount('A_weight', 'A_bag_qty', 'A_quantity')"/>                                </td>
                            </tr>
                            <tr>
                                <td class="columnlabel1"><span class="row3">น้ำหนักรวม&nbsp;</span>&nbsp;</td>
                                <td class="columnobject">
                                    <input name='A_quantity' class='inputs' type="text" id="A_quantity" value='<%=quantity%>' size='10' />                                </td>
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
        </div>
    </body>
</html>
