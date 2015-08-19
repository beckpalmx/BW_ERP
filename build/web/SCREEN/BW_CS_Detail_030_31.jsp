<%@page import="com.bw.DB.D_product_milling_detail_1DAO"%>
<%@page import="com.bw.bean.DataBeanD_product_milling_detail_1"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.bw.Util.ThaiUtil"%>
<html>
    <head>
        <title></title>
        <META Http-Equiv="Cache-Control" Content="no-cache">
        <META Http-Equiv="Pragma" Content="no-cache">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" media="all" href="../JS/jscalendar/skins/aqua/aqua.css" title="Aua" />
        <script type="text/javascript" src="../JS/jscalendar/calendar.js"></script>
        <script type='text/javascript' src='../JS/jscalendar/lang/calendar-th.js'></script>
        <script type="text/javascript" src="../JS/jscalendar/calendar-setup.js"></script>
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
                    var strID = getIDElements('input', 'A_');
                    strID += getIDElements('input', 'I_');
                    strID = strID.substr(0, strID.length-1);
                    alert(strID);
                    getSave_Detail(URLsend(strID,'../JSP/BW_CS_Detail_030_31.jsp'), "../SHOWDETAILSCREEN/BW_CS_Show030_31.jsp?doc_id=", "show", getId("A_doc_id").value);
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
                    strID = strID.substr(0, strID.length-1);
                    alert(strID);
                    getSave_Detail(URLsend(strID,'../JSP/BW_CS_Detail_030_31.jsp'), "../SHOWDETAILSCREEN/BW_CS_Show030_31.jsp?doc_id=", "show", getId("A_doc_id").value);
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
            DataBeanD_product_milling_detail_1 objBean;
            D_product_milling_detail_1DAO objdb;
            String line_no, doc_id, I_status, U_status,
                    milling_date, start_milling_date, start_milling_time, stop_milling_date, stop_milling_time, remark;
        %>
        <%
            line_no = "";
            doc_id = "";
            I_status = "";
            U_status = "";
            milling_date = "";
            start_milling_date = "";
            start_milling_time = "";
            stop_milling_date = "";
            stop_milling_time = "";
            remark = "";
            en = new ThaiUtil();
            objBean = new DataBeanD_product_milling_detail_1();
            objdb = new D_product_milling_detail_1DAO();
            if (request.getQueryString().indexOf("line_no_") != -1) {
                U_status = "2";
                line_no = request.getQueryString().substring(8, request.getQueryString().indexOf("="));
                doc_id = request.getParameter("A_doc_id");
                objBean = objdb.Return_Edit(doc_id, line_no);
                milling_date = objBean.getMilling_date();
                start_milling_date = objBean.getStart_milling_date();
                start_milling_time = objBean.getStart_milling_time();
                stop_milling_date = objBean.getStop_milling_date();
                stop_milling_time = objBean.getStop_milling_time();
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
        <input type="hidden" id="chkNull" name="chkNull" value="A_milling_date,A_start_milling_date">
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
                                <td class="columnlabel">โม่หัวมันวันที่</td>
                                <td class="columnobject"><input class='inputs' type="text" name="A_milling_date" id="A_milling_date" value="<%=milling_date%>" size="10" readonly> &nbsp;<a id='date_1'><img name='IMAGE2' src='../IMAGES/BUTTON/MAIN/CALENDAR20.png' border='0' align='absmiddle'></a><script type='text/javascript'>Calendar.setup({inputField:'A_milling_date',ifFormat:'%d-%m-%Y',showsTime:false,button:'date_1',singleClick:true,step:1});</script></td>
                            </tr>
                            <tr>
                                <td class="columnlabel">วันที่เริ่มโม่</td>
                                <td class="columnobject"><input class='inputs' type="text" name="A_start_milling_date" id="A_start_milling_date" value="<%=start_milling_date%>" size="10" readonly>&nbsp;<a id='date_2'><img name='IMAGE2' src='../IMAGES/BUTTON/MAIN/CALENDAR20.png' border='0' align='absmiddle'></a><script type='text/javascript'>Calendar.setup({inputField:'A_start_milling_date',ifFormat:'%d-%m-%Y',showsTime:false,button:'date_2',singleClick:true,step:1});</script>
                                    &nbsp;&nbsp;&nbsp;เวลาเริ่มโม่
                                    <input class='inputs' type="text" name="A_start_milling_time" id="A_start_milling_time" value="<%=start_milling_time%>"></td>
                            </tr>
                            <tr>
                                <td class="columnlabel">วันที่หัวมันหมด</td>
                                <td class="columnobject"><input class='inputs' type="text" name="A_stop_milling_date" id="A_stop_milling_date" value="<%=stop_milling_date%>" size="10" readonly>&nbsp;<a id='date_3'><img name='IMAGE2' src='../IMAGES/BUTTON/MAIN/CALENDAR20.png' border='0' align='absmiddle'></a><script type='text/javascript'>Calendar.setup({inputField:'A_stop_milling_date',ifFormat:'%d-%m-%Y',showsTime:false,button:'date_3',singleClick:true,step:1});</script>
                                    &nbsp;&nbsp;&nbsp;เวลาที่หัวมันหมด
                                    <input class='inputs' type="text" name="A_stop_milling_time" id="A_stop_milling_time" value="<%=stop_milling_time%>"></td>
                            </tr>
                            <tr>
                                <td class="columnlabel">หมายเหตุ&nbsp;</td>
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
