<%@page import="com.bw.DB.D_product_not_quality_detailDAO"%>
<%@page import="com.bw.bean.DataBeanD_product_not_quality"%>
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
        <link href="../CSS/cgc_button.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="../JS/myAjaxFramework.js"></script>
        <script type="text/javascript">
            function goAdd(){
                var arrayChk = new Array;
                arrayChk[0]  = "chkNull";
                if(ChkParameter(arrayChk))
                {
                    var strID = getIDElements('input', 'A_');
                    strID = strID.substr(0, strID.length-1);
                    //alert(strID);
                    //getSave_Detail(URLsend(strID,'../JSP/BW_CS_024.jsp'), "../JSP/BW_CS_Show023.jsp?doc_id=", "show", getId("A_doc_id").value);
                }
            }
            function goEdit()
            {

                var arrayChk = new Array;
                arrayChk[0]  = "chkNull";
                if(ChkParameter(arrayChk))
                {

                    getSave_Detail(array, URLShowDetail, DivShow, Valueinput)(URLsend('doc_id,line_no,tank_suite,product_id,location_id,silo_no,weight_tot,weight_tank,weight,status_u,username,channel,remark','../JSP/CS_028.jsp'));
                    opener.getId("doc_id").disabled = true;
                    showTable("show","doc_id","../JSP/CS_Show028.jsp?doc_id=");
                    setTimeout('showTable("show","doc_id","../JSP/CS_Show028.jsp?doc_id=");',800);

                    setTimeout('window.close()', 1000);
                }
            }
            function goBack()
            {
                window.close();
            }
        </script>
    </head>
    <body>
        <%!            ThaiUtil en;
            DataBeanD_product_not_quality objBean;
            D_product_not_quality_detailDAO objdb;
            String line_no, doc_id, A_status, U_status,
                    product_lot_id, weight, bag_qty, remark;
        %>
        <%
            line_no = "";
            doc_id = "";
            A_status = "";
            U_status = "";
            product_lot_id = "";
            weight = "";
            bag_qty = "";
            remark = "";
            en = new ThaiUtil();
            objBean = new DataBeanD_product_not_quality();
            objdb = new D_product_not_quality_detailDAO();
            if (request.getQueryString().indexOf("line_no_") != -1) {
                U_status = "2";
                line_no = request.getQueryString().substring(8, request.getQueryString().indexOf("="));
                doc_id = request.getParameter("A_doc_id");
                objBean = objdb.Return_Edit(doc_id, line_no);
                weight = objBean.getWeight();
            } else {
                doc_id = request.getParameter("A_doc_id");
                A_status = request.getParameter("A_status");
            }
        %>
        <input name="username" type="hidden" id="username" value="<%=request.getParameter("A_username")%>" size="30" readonly/>
        <input type="hidden" id="A_doc_id" name="A_doc_id" value="<%=request.getParameter("A_doc_id")%>">
        <input type="hidden" id="A_line_no" name="A_line_no" value="<%=line_no%>">
        <input type="hidden" id="A_status" name="A_status" value="<%=A_status%>">
        <input type="hidden" id="U_status" name="U_status" value="<%=U_status%>">
        <input type="hidden" id="chkNull" name="chkNull" value="A_product_id,A_weight,A_bag_qty">
        <div align="center">
            <table  cellpadding="0"  cellspacing="0" align="center">
                <tr >
                    <td class="ftopleft"></td>
                    <td  class="ftopcenter" colspan="2">ข้อมูลแป้งที่ไม่ผ่าน</td>
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
                                    <td height="24" class="columnlabel">รหัสแป้ง*&nbsp;</td>
                                    <td class="columnobject">
                                        <input name='A_product_id' type='text' id="A_product_id" value='' size='10' />                                </td>
                                </tr>

                                <tr>
                                    <td class="columnlabel"><span class="row3">บรรจุ(KG)&nbsp;</span></td>
                                    <td class="columnobject">
                                        <input name="A_weight" type="text" id="A_weight" size="10" value="">                                </td>
                                </tr>
                                <tr>
                                    <td class="columnlabel"><span class="row3">ความชื้น&nbsp;</span>&nbsp;</td>
                                    <td class="columnobject"><input type="checkbox" name="checkbox" id="checkbox"></td>
                                </tr>
                                <tr>
                                    <td class="columnlabel">Viscoisty</td>
                                    <td class="columnobject"><input type="checkbox" name="checkbox2" id="checkbox2"></td>
                                </tr>
                                <tr>
                                    <td class="columnlabel">pHแป้ง                              </td>
                                    <td class="columnobject">
                                        <input type="radio" name="radio" id="radio" value="radio">
                                        สูง
                                        <input type="radio" name="radio" id="radio2" value="radio">
                                        ต่ำ</td>
                                </tr>
                                <tr>
                                    <td class="columnlabel">ความละเอียด</td>
                                    <td class="columnobject"><input type="checkbox" name="checkbox2" id="checkbox2">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="columnlabel">กากอ่อน</td>
                                    <td class="columnobject"><input type="checkbox" name="checkbox2" id="checkbox2">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="columnlabel">%Whiteness</td>
                                    <td class="columnobject"><input type="checkbox" name="checkbox2" id="checkbox2">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="columnlabel">ผงเหล็ก</td>
                                    <td class="columnobject"><input type="checkbox" name="checkbox2" id="checkbox2">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="columnlabel">SO2</td>
                                    <td class="columnobject"><input type="checkbox" name="checkbox2" id="checkbox2">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="columnlabel">สิ่งแปลกปลอม</td>
                                    <td class="columnobject"><input type="text" name="textfield" id="textfield"></td>
                                </tr>
                                <tr>
                                    <td class="columnlabel">จุดดำ</td>
                                    <td class="columnobject"><input type="checkbox" name="checkbox2" id="checkbox2">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="columnlabel"><span class="row3">จำนวน ก/ส ที่ไม่ผ่าน&nbsp;</span></td>
                                    <td class="columnobject"><input type="text" name="textfield2" id="textfield2"></td>
                                </tr>

                                <tr>
                                    <td colspan='2'  align="right">
                                        <%
                                            if (request.getParameter("A_status") != null) {
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
        </div>
    </body>
</html>
