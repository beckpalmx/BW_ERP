<%@page import="com.bw.Util.UtiDatabase"%>
<%@page import="com.bw.DB.D_product_pack_detail_2DAO"%>
<%@page import="com.bw.bean.DataBeanD_product_pack_detail_2"%>
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
        <link href="../CSS/BT.css" rel="stylesheet" type="text/css">  <link href="../CSS/component.css" rel="stylesheet" type="text/css"> 
        <link href="../CSS/cgc_button.css" rel="stylesheet" type="text/css">        
        <script type="text/javascript" src="../JS/myAjaxFramework.js"></script>
        <script type="text/javascript">
            function goAdd(){
                var arrayChk = new Array;
                arrayChk[0]  = "chkNull";
                if(ChkParameter(arrayChk))
                {
                    var strID = getIDElements('input', 'A_')+getIDElements('select', 'A_');
                    strID += getIDElements('input', 'I_');
                    strID = strID.substr(0, strID.length-1);
                    alert(strID);
                    //getSave(URLsend(strID,'../JSP/BW_CS_Detail_030_211.jsp'));
                    //window.opener.location.reload();
                    setTimeout('window.close()', 1000);
                    getSave_Detail(URLsend(strID,'../JSP/BW_CS_Detail_030_211.jsp'), "../SHOWDETAILSCREEN/BW_CS_Show030_211.jsp?A_doc_line_no="+getId("A_doc_line_no").value+"&A_doc_id=", "show", getId("A_doc_id").value);
                }
            }
            function goEdit()
            {var arrayChk = new Array;
                arrayChk[0]  = "chkNull";
                if(ChkParameter(arrayChk))
                {
                    var strID = getIDElements('input', 'A_')+getIDElements('select', 'A_');
                    strID += getIDElements('input', 'U_');
                    strID = strID.substr(0, strID.length-1);
                    alert(strID);
                    getSave_Detail(URLsend(strID,'../JSP/BW_CS_Detail_030_211.jsp'), "../SHOWDETAILSCREEN/BW_CS_Show030_211.jsp?A_doc_line_no="+getId("A_doc_line_no").value+"&A_doc_id=", "show", getId("A_doc_id").value);
                }
            }
            function Cal_T(input_Pack,input_qty,out_put){
                getId(out_put).value = isNaN((parseInt(getId(input_Pack).value,10) * parseInt(getId(input_qty).value,10)))?"0":((parseInt(getId(input_Pack).value,10) * parseInt(getId(input_qty).value,10))/1000).toFixed(3);
            }
            function goBack()
            {
                window.close();
            }
            function select_value(){
                var n = select_value.arguments.length;
                for(var i = 0; i < n; i++){
                    getId(select_value.arguments[i++]).value = select_value.arguments[i];
                }
            }
        </script>
    </head>
    <%!            ThaiUtil en;
            DataBeanD_product_pack_detail_2 objBean;
            D_product_pack_detail_2DAO objdb;
            String line_no, doc_id, I_status, U_status,
                    product_id, pack, qty, weight,doc_line_no,shift;
             UtiDatabase objuti;
    %>
        <%
        objuti = new UtiDatabase();
        line_no = "";
        doc_id = "";
        I_status = "";
        U_status = "";
        product_id = "";
        weight = "";
        pack = "";
        qty = "";
        shift = "";
        doc_line_no = "";
                    en = new ThaiUtil();
                    objBean = new DataBeanD_product_pack_detail_2();
                    objdb = new D_product_pack_detail_2DAO();
                    if (request.getQueryString().indexOf("line_no_") != -1) {
                        U_status = "2";
                        doc_line_no = request.getParameter("A_doc_line_no");
                        line_no = request.getQueryString().substring(8, request.getQueryString().indexOf("="));
                        doc_id = request.getParameter("A_doc_id");
                        objBean = objdb.Return_Edit(doc_id,doc_line_no,line_no,"d_product_pack_detail_2");
                        product_id = objBean.getProd_id();
                        pack = objBean.getPack();
                        qty = objBean.getQty();
                        weight = objBean.getWeight();
                        shift = objBean.getShift();
                    } else {
                        doc_id = request.getParameter("A_doc_id");
                        I_status = request.getParameter("I_status");
                        doc_line_no = request.getParameter("A_doc_line_no");
                    }
        %>
    <body onload="select_value('A_shift','<%=shift%>');">
        

        <input type="hidden" id="A_doc_id" name="A_doc_id" value="<%=request.getParameter("A_doc_id")%>">
        <input type="hidden" id="A_line_no" name="A_line_no" value="<%=line_no%>">
        <input type="hidden" id="I_status" name="I_status" value="<%=I_status%>">
        <input type="hidden" id="U_status" name="U_status" value="<%=U_status%>">
        <input type="hidden" id="chkNull" name="chkNull" value="A_prod_id">
        <input type="hidden" id="A_doc_line_no" name="A_doc_line_no" value="<%=doc_line_no%>">
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
                              <td class="columnlabel">เบิกแป้งมาถ่าย&nbsp;</td>
                              <td class="columnobject"><input name='A_prod_id' type='text' id="A_prod_id" value='<%=product_id%>' size='35' />
                                  <img width="20" height="20" border="0" align="middle" onclick="openBrWindow('vproduct&textinput=A_prod_id|A_prod_id_desc', 31, 'Search_Detail.jsp');" style="cursor: pointer;" name="IMAGE3" alt="ค้นหา" src="../IMAGES/BUTTON/MAIN/SEARCH20.png">
                                    <input type="text" name="A_prod_id_desc" id="A_prod_id_desc" value="" size="40">
                              </td>
                            </tr>
                            <tr>
                                <td class="columnlabel">กะ</td>
                                <td class="columnobject"><%=objuti.ShowSelectBox("select shift_id,name_t from mshift where shift_id in('A_PD_M','B_PD_M','A_PD_A','B_PD_A','A_PD_N','B_PD_N') order by runno", "shift_id", "name_t", "A_shift")%></td>
                            </tr>
                            <tr>
                              <td class="columnlabel">บรรจุ</td>
                              <td class="columnobject"><input name='A_pack' type='text' id="A_pack" value='<%=pack%>' size='10' onblur="Cal_T('A_pack','A_qty','A_weight')" /></td>
                            </tr>
                            <tr>
                              <td class="columnlabel"><span class="row3">จำนวน(ก/ส)</span></td>
                              <td class="columnobject"><input name='A_qty' type='text' id="A_qty" value='<%=qty%>' size='10' onblur="Cal_T('A_pack','A_qty','A_weight')"/></td>
                            </tr>
                            <tr>
                                <td class="columnlabel"><span class="row3">จำนวน(T)</span>&nbsp;</td>
                          <td class="columnobject">
                              <input name='A_weight' type='text' id="A_weight" value='<%=weight%>' size='10' readonly/>                                </td>
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
