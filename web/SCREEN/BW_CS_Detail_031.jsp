<%@page import="com.bw.bean.DataBeanD_job_order_detail"%>
<%@page import="com.bw.DB.D_job_order_detailDAO"%>
<%@page import="com.bw.Util.ThaiUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
                    alert(strID);
                    getSave_Detail(URLsend(strID,'../JSP/BW_CS_Detail_031.jsp'),"../SHOWDETAILSCREEN/BW_CS_Show031_Other.jsp?doc_id=", "show2", getId("A_doc_id").value);
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
                    alert(strID)
                    getSave_Detail(URLsend(strID,'../JSP/BW_CS_Detail_031.jsp'),"../SHOWDETAILSCREEN/BW_CS_Show031_Other.jsp?doc_id=", "show2", getId("A_doc_id").value);
                }
            }
            function goBack()
            {
                window.close();
            }
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../CSS/MENU.css" rel="stylesheet" type="text/css">
        <link href="../CSS/BT.css" rel="stylesheet" type="text/css">
        <link href="../CSS/cgc_button.css" rel="stylesheet" type="text/css">        
    </head>
    <body>
        <%!            ThaiUtil en = new ThaiUtil();
            D_job_order_detailDAO objDAO = new D_job_order_detailDAO();
            DataBeanD_job_order_detail objBean = new DataBeanD_job_order_detail();
            String doc_id, param, line_no, A_status, U_status, spec_min,spec_max, unit;
        %>
        <%
                    doc_id = "";
                    line_no = "";
                    A_status = "";
                    U_status = "";
                    param = "";
                    spec_min = "";
                    spec_max = "";
                    unit = "";
                    if (request.getQueryString().indexOf("line_no_") != -1) {
                        line_no = request.getQueryString().substring(8, request.getQueryString().indexOf("="));
                        doc_id = en.EncodeTexttoTIS(request.getParameter("A_doc_id"));
                        objBean = objDAO.Return_Edit(doc_id, line_no);
                        param = objBean.getParam();
                        spec_min = objBean.getSpec_min();
                        spec_max = objBean.getSpec_max();
                        unit = objBean.getUnit();
                        U_status = "2";
                    } else {
                        doc_id = en.EncodeTexttoTIS(request.getParameter("A_doc_id"));
                        A_status = request.getParameter("I_status");
                    }

        %>
        <input name="A_username" type="hidden" id="A_username" value="<%=request.getParameter("A_username")%>" size="30" readonly/>
        <input type="hidden" id="A_doc_id" value="<%=doc_id%>">
        <input type="hidden" id="A_line_no" value="<%=line_no%>">
        <input type="hidden" id="I_status" value="<%=A_status%>">
        <input type="hidden" id="U_status" value="<%=U_status%>">
        <input type="hidden" id="chkNull" value="A_param">

        <table  cellpadding="0"  cellspacing="0" align="center">
            <tr >
                <td class="ftopleft"></td>
                <td  class="ftopcenter" colspan="2">ข้อมูลการผลิต&nbsp;</td>
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
                                <td class="columnlabel">Parameter*&nbsp;</td>
                                <td class="columnobject">
                                    <input name='A_param' type='text' id="A_param" value='<%=param%>' size='30' />
                                </td>
                            </tr>
                            <tr>
                                <td class="columnlabel">Specification&nbsp;</td>
                                <td class="columnobject">Min
                                    <input name='A_spec_min' type='text' id="A_spec_min" value='<%=spec_min%>' size='30' />&nbsp;-&nbsp;<input name='A_spec_max' type='text' id="A_spec_max" value='<%=spec_max%>' size='30' />
                                </td>
                            </tr>
                            <tr>
                                <td class="columnlabel">unit&nbsp;</td>
                                <td class="columnobject">
                                    <input name='A_unit' type='text' id="A_unit" value='<%=unit%>' size='30' />
                                </td>
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
                                    <input type="button" class="cgcButton_5" name="button2" value="ยกเลิก" onClick="javascript:goBack();"/>
                                </td>
                            </tr>

                            <tr>
                                <td colspan='2' class='blankspace'>
                                </td>
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

