<%@page import="com.bw.DB.D_product_report_daily_detail_prdDAO"%>
<%@page import="com.bw.bean.DataBeanD_product_report_daily_detail_prd"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.bw.Util.ThaiUtil"%>
<%
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", -1);
%>
<html>
    <head>
        <title></title>
        <META Http-Equiv="Cache-Control" Content="no-cache">
        <META Http-Equiv="Pragma" Content="no-cache">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../CSS/MENU.css" rel="stylesheet" type="text/css">
        <link href="../CSS/BT.css" rel="stylesheet" type="text/css">
        <link href="../CSS/cgc_button.css" rel="stylesheet" type="text/css">        
        <script type="text/javascript" src="../JS/myAjaxFramework.js"></script>
        <script type="text/javascript">
            function goAdd(){
                var arrayChk = new Array;
                arrayChk[0]  = "chkNull";
                if(ChkParameter(arrayChk))
                {
                    var strID = getIDElements('input', 'A_');
                    strID += getIDElements('input', 'I_');
                    strID += getIDElements('textarea', 'A_');
                    strID = strID.substr(0, strID.length-1);
                    //alert(strID);
                    getSave_Detail(URLsend(strID,'../JSP/BW_CS_Detail_033_4.jsp'), "../SHOWDETAILSCREEN/BW_CS_Show033_4.jsp?doc_id=", "show3", getId("A_doc_id").value);
                }
            }
            function goEdit()
            {

                var arrayChk = new Array;
                arrayChk[0]  = "chkNull";
                if(ChkParameter(arrayChk))
                {
                    var strID = getIDElements('input', 'A_');
                    strID += getIDElements('input', 'U_');
                    strID += getIDElements('textarea', 'A_');
                    strID = strID.substr(0, strID.length-1);
                    //alert(strID);
                    getSave_Detail(URLsend(strID,'../JSP/BW_CS_Detail_033_4.jsp'), "../SHOWDETAILSCREEN/BW_CS_Show033_4.jsp?doc_id=", "show3", getId("A_doc_id").value);
                }
            }
            function goBack()
            {
                window.close();
            }
            function Cal_T(input_Pack,input_qty,out_put){
                getId(out_put).value = isNaN((parseInt(getId(input_Pack).value,10) * parseInt(getId(input_qty).value,10)))?"0":((parseInt(getId(input_Pack).value,10) * parseInt(getId(input_qty).value,10))/1000).toFixed(3);
            }
        </script>
    </head>
    <body>
        <%!            ThaiUtil en;
            DataBeanD_product_report_daily_detail_prd objBean;
            D_product_report_daily_detail_prdDAO objdb;
            String line_no, doc_id, I_status, U_status,
                    product_id, weight, bag_qty, amount, remark;
        %>
        <%
                    line_no = "";
                    doc_id = "";
                    I_status = "";
                    U_status = "";
                    product_id = "";
                    weight = "";
                    bag_qty = "";
                    amount = "";
                    remark = "";
                    en = new ThaiUtil();
                    objBean = new DataBeanD_product_report_daily_detail_prd();
                    objdb = new D_product_report_daily_detail_prdDAO();
                    if (request.getQueryString().indexOf("line_no_") != -1) {
                        U_status = "2";
                        line_no = request.getQueryString().substring(8, request.getQueryString().indexOf("="));
                        doc_id = request.getParameter("A_doc_id");
                        objBean = objdb.Return_Edit(doc_id, line_no);
                        product_id = objBean.getProduct_id();
                        weight = objBean.getWeight();
                        bag_qty = objBean.getBag_qty();
                        amount = objBean.getAmount();
                        remark = objBean.getRemark();
                    } else {
                        doc_id = request.getParameter("A_doc_id");
                        I_status = request.getParameter("I_status");
                    }
        %>
        <input name="username" type="hidden" id="username" value="<%=request.getParameter("A_username")%>" size="30" readonly/>
        <input type="hidden" id="A_doc_id" name="A_doc_id" value="<%=request.getParameter("A_doc_id")%>">
        <input type="hidden" id="A_line_no" name="A_line_no" value="<%=line_no%>">
        <input type="hidden" id="I_status" name="I_status" value="<%=I_status%>">
        <input type="hidden" id="U_status" name="U_status" value="<%=U_status%>">
        <input type="hidden" id="chkNull" name="chkNull" value="A_product_id">
        <table  cellpadding="0"  cellspacing="0" align="center">
            <tr >
                <td class="ftopleft"></td>
                <td  class="ftopcenter" colspan="2">&nbsp;</td>
                <td class="ftopright"></td>
            </tr>
            <tr >
                <td class="fcenterleft"></td>
                <td  colspan="2" class="fcentercenter">
                    <div align="center">
                        <table  cellpadding="0" cellspacing="0" >
                            <tr>
                                <td colspan="2"  class="blankspace"></td>
                            </tr>
                            <tr>
                                <td class="columnlabel">รายการผลผลิตที่อบได้*</td>
                                <td class="columnobject">
                                    <input name="A_product_id" type="text" id="A_product_id" size="10" value="<%=product_id%>">&nbsp;&nbsp;<a onclick="openBrWindow('vproduct', 22, 'Search_Config2.jsp');" href="#"><img width="20" height="20" align="middle" border="0" name="IMAGE3" alt="ค้นหา" src="../IMAGES/BUTTON/MAIN/SEARCH20.png"/></a>
                                    <input name="product_id_desc" type="text" id="product_id_desc" size="30" value="<%=product_id%>">
                                </td>
                            </tr>
                            <tr>
                                <td class="columnlabel">น้ำหนักบรรจุ*&nbsp;</td>
                                <td class="columnobject"><input name='A_weight' type='text' id="A_weight" value='<%=weight%>' size='10' onblur="Cal_T('A_weight','A_bag_qty','A_amount')"/>(กิโลกรัม)
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="columnlabel">จำนวน*</td>
                                <td class="columnobject"><input name="A_bag_qty" type="text" id="A_bag_qty" size="10" value="<%=bag_qty%>" onblur="Cal_T('A_weight','A_bag_qty','A_amount')"/>(กระสอบ)</td>
                            </tr>
                            <tr>
                                <td class="columnlabel">น้ำหนัก*&nbsp;</td>
                                <td class="columnobject">
                                    <input name='A_amount' type='text' id="A_amount" value='<%=amount%>' size='10' />(ตัน)
                                    &nbsp;&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="columnlabel">หมายเหตุ&nbsp;</td>
                                <td class="columnobject"><textarea name="A_remark" id="A_remark" cols="45" rows="5"><%=remark%></textarea></td>
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
