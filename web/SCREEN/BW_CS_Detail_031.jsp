<%@page import="com.bw.bean.DataBeanD_job_order_detail"%>
<%@page import="com.bw.DB.D_job_order_detailDAO"%>
<%@page import="com.bw.Util.ThaiUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
                    strID = strID.substr(0, strID.length - 1);
                    //alert(strID);
                    getSave_Detail(URLsend(strID, '../JSP/BW_CS_Detail_031.jsp'), "../SHOWDETAILSCREEN/BW_CS_Show031_Other.jsp?doc_id=", "show2", getId("A_doc_id").value);
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
                    strID = strID.substr(0, strID.length - 1);
                    //alert(strID)
                    getSave_Detail(URLsend(strID, '../JSP/BW_CS_Detail_031.jsp'), "../SHOWDETAILSCREEN/BW_CS_Show031_Other.jsp?doc_id=", "show2", getId("A_doc_id").value);
                }
            }
            function goBack()
            {
                window.close();
            }
        </script>
    </head>
    <body>
        <%!
            ThaiUtil en = new ThaiUtil();
            D_job_order_detailDAO objDAO = new D_job_order_detailDAO();
            DataBeanD_job_order_detail objBean = new DataBeanD_job_order_detail();
            String doc_id, param, line_no, A_status, U_status, spec_min, spec_max, unit;
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
        <br>
        <div class="container">
            <div class="panel panel-primary">
                <div class="panel-heading"> <span class="glyphicon glyphicon-tasks"></span>&nbsp;
                    <b>ข้อมูลการผลิต</b>
                </div>                        
                <div class="panel-footer">                        
                    <div align="center">
                        <table  cellpadding="0" cellspacing="0" >
                            <tr>
                                <td colspan="2"  class="blankspace"></td>
                            </tr>


                            <div class="row">                            
                                <label class="control-label col-md-1 columnlabel1">Parameter&nbsp;:&nbsp;</label>
                                <div class="col-md-4">
                                    <input type="text" class="inputs" name='A_param' id="A_param" size='30' value='<%=param%>' />
                                </div>
                            </div>                                

                            <div class="row">                            
                                <label class="control-label col-md-1 columnlabel1">Specification Min&nbsp;:&nbsp;</label>
                                <div class="col-md-4">
                                    <input type="text" class="inputs" name='A_spec_min' id="A_spec_min" size='30' value='<%=spec_min%>' />
                                </div>                                                   
                            </div>     

                            <div class="row">                            
                                <label class="control-label col-md-1 columnlabel1">Specification Max&nbsp;:&nbsp;</label>
                                <div class="col-md-4">
                                    <input type="text" class="inputs" name='A_spec_max' id="A_spec_max" size='30' value='<%=spec_max%>' />
                                </div>             
                            </div>            

                            <div class="row">                            
                                <label class="control-label col-md-1 columnlabel1">Unit&nbsp;:&nbsp;</label>
                                <div class="col-md-4">
                                    <input type="text" class="inputs" name='A_unit' id="A_unit" size='30' value='<%=unit%>' />
                                </div>
                            </div>                                     

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
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

