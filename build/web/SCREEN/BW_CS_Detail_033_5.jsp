<%@page import="com.bw.DB.D_product_report_daily_detail_starchDAO"%>
<%@page import="com.bw.bean.DataBeanD_product_report_daily_detail_starch"%>
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
        <link rel="stylesheet" type="text/css" media="all" href="../JS/jscalendar/skins/aqua/aqua.css" title="Aua" />
        <link type="text/css" href="../CSS/ui-lightness/jquery-ui-1.8.17.custom.css" rel="stylesheet" />
        <!-- main calendar program -->
        <script type="text/javascript" src="../JS/jscalendar/calendar.js"></script>
        <!-- language for the calendar -->
        <script type='text/javascript' src='../JS/jscalendar/lang/calendar-th.js'></script>
        <!-- the following script defines the Calendar.setup helper function, which makes
               adding a calendar a matter of 1 or 2 lines of code. -->
        <script type="text/javascript" src="../JS/jscalendar/calendar-setup.js"></script>
        <script type="text/javascript">
            function Amount(){
                getId("A_amount").value =  ((((parseFloat(getId("A_qty_litr").value) * parseFloat(getId("A_be_val").value) * parseFloat(getId("A_sg_val").value)) * (1.777/100) * 1.0225)/0.875)/1000).toFixed(3);
            }
            function goAdd(){
                var arrayChk = new Array;
                arrayChk[0]  = "chkNull";
                if(ChkParameter(arrayChk))
                {
                    Amount();
                    var strID = getIDElements('input', 'A_');
                    strID += getIDElements('input', 'I_');
                    strID += getIDElements('textarea', 'A_');
                    strID = strID.substr(0, strID.length-1);
                    //alert(strID);
                    getSave_Detail(URLsend(strID,'../JSP/BW_CS_Detail_033_5.jsp'), "../SHOWDETAILSCREEN/BW_CS_Show033_5.jsp?doc_id=", "show4", getId("A_doc_id").value);
                }
            }
            function goEdit()
            {

                var arrayChk = new Array;
                arrayChk[0]  = "chkNull";
                if(ChkParameter(arrayChk))
                {
                    Amount();
                    var strID = getIDElements('input', 'A_');
                    strID += getIDElements('input', 'U_');
                    strID += getIDElements('textarea', 'A_');
                    strID = strID.substr(0, strID.length-1);
                    //alert(strID);
                    getSave_Detail(URLsend(strID,'../JSP/BW_CS_Detail_033_5.jsp'), "../SHOWDETAILSCREEN/BW_CS_Show033_5.jsp?doc_id=", "show4", getId("A_doc_id").value);
                }
            }
            function goBack()
            {
                window.close();
            }
            function Calculator_starch(){
                if(getId("A_starch_bal").value != "" && getId("A_qty_tank").value != ""){
                    getId("A_starch_bal_x_qty_tank").value = (parseFloat(getId("A_starch_bal").value) * parseFloat(getId("A_qty_tank").value)).toFixed(2);
                    getId("A_qty_litr").value = (parseFloat(getId("A_starch_bal_x_qty_tank").value) * 2200).toFixed(2);
                }else{
                    getId("A_starch_bal_x_qty_tank").value = "";
                    getId("A_qty_litr").value = "";
                }
            }
        </script>
    </head>
    <body>
        <%!            ThaiUtil en;
            DataBeanD_product_report_daily_detail_starch objBean;
            D_product_report_daily_detail_starchDAO objdb;
            String line_no, doc_id, I_status, U_status,
                    qty_starch, be_val, sg_val, amount,cassava_of_date, starch_bal,qty_tank,starch_bal_x_qty_tank;
        %>
        <%
                    line_no = "";
                    doc_id = "";
                    I_status = "";
                    U_status = "";
                    qty_starch = "";
                    be_val = "";
                    sg_val = "";
                    amount = "";
                    cassava_of_date = "";
                    starch_bal="";
                    qty_tank = "";
                    starch_bal_x_qty_tank = "";
                    en = new ThaiUtil();
                    objBean = new DataBeanD_product_report_daily_detail_starch();
                    objdb = new D_product_report_daily_detail_starchDAO();
                    if (request.getQueryString().indexOf("line_no_") != -1) {
                        U_status = "2";
                        line_no = request.getQueryString().substring(8, request.getQueryString().indexOf("="));
                        doc_id = request.getParameter("A_doc_id");
                        objBean = objdb.Return_Edit(doc_id, line_no);
                        //tank = objBean.getTank();
                        qty_starch = objBean.getQty_starch();
                        be_val = objBean.getBe_val();
                        sg_val = objBean.getSg_val();
                        amount = objBean.getAmount();
                        cassava_of_date = objBean.getCassava_of_date();
                        starch_bal = objBean.getStarch_bal();
                        qty_tank = objBean.getQty_tank();
                        starch_bal_x_qty_tank = objBean.getStarch_bal_x_qty_tank();
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
        <input type="hidden" id="chkNull" name="chkNull" value="A_doc_id">
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
                                <td class="columnlabel">ตัดมันของวันที่</td>
                                <td class="columnobject"><input name="A_cassava_of_date" type="text" id="A_cassava_of_date" size="15" value ="<%=cassava_of_date%>">&nbsp;<a id='date_8'><img name='IMAGE2' src='../IMAGES/BUTTON/MAIN/CALENDAR20.png' border='0' align='absmiddle'></a><script type='text/javascript'>Calendar.setup({inputField:'A_cassava_of_date',ifFormat:'%d-%m-%Y',showsTime:false,button:'date_8',singleClick:true,step:1});</script>
                                    &nbsp;&nbsp;&nbsp;&nbsp;มีน้ำแป้งเหลือ
                                    <input name="A_starch_bal" type="text" id="A_starch_bal" size="15" onblur="Calculator_starch();" value="<%=starch_bal%>">
                                    &nbsp;x&nbsp;จำนวนถัง
                                    <input name="A_qty_tank" type="text" id="A_qty_tank" size="15" onblur="Calculator_starch();" value="<%=qty_tank%>">
                                    ถัง</td>
                            </tr>
                            <tr>
                                <td class="columnlabel"><p>คิดเป็นลิตร ต่อ ถัง</p></td>
                                <td class="columnobject"><input name="A_starch_bal_x_qty_tank" type="text" id="A_starch_bal_x_qty_tank" size="15" value ="<%=starch_bal_x_qty_tank%>">
                                    &nbsp;x&nbsp;2,200&nbsp;=&nbsp;
                                    <input name="A_qty_litr" type="text" id="A_qty_litr" size="15" value="<%=qty_starch%>">ลิตร</td>
                            </tr>
                            <!--<tr>
                                <td class="columnlabel">ถังที่*</td>
                                <td class="columnobject"><input name="A_tank" type="text" id="A_tank" size="10" value=""></td>
                            </tr>
                            <tr>
                                <td class="columnlabel">จำนวนลิตร*&nbsp;</td>
                                <td class="columnobject"><input name='A_qty_starch' type='text' id="A_qty_starch" value='' size='10' />
                                    &nbsp;</td>
                            </tr>-->
                            <tr>
                                <td class="columnlabel">ค่าBe'*</td>
                                <td class="columnobject"><input name="A_be_val" type="text" id="A_be_val" size="10" value="<%=be_val%>"><a href='#' onClick="openBrWindow('m_sg_config', 33, 'Search_Config2.jsp');"><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE1' width='20' height='20' border='0' align='middle' ></a>&nbsp;&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="columnlabel">ค่าS.G.*&nbsp;</td>
                                <td class="columnobject">
                                    <input name='A_sg_val' type='text' id="A_sg_val" value='<%=sg_val%>' size='10' />
                                    &nbsp;&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="columnlabel">รวมแป้งแห้ง&nbsp;</td>
                                <td class="columnobject">
                                    <input name='A_amount' type='text' id="A_amount" value='<%=amount%>' size='10' onblur="Amount();"/>                                </td>
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
