<%@page import="com.bw.bean.UserBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <%!    String path, lookup,doc_eff_date,doc_no;
    %>
    <%
                lookup = (String) request.getParameter("lookup");
                path = (String) request.getParameter("report_code");
                doc_eff_date = (String) request.getParameter("eff_date");
                doc_no = (String) request.getParameter("doc_no");
    %>
    <head>
        <title></title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../CSS/MENU.css" rel="stylesheet" type="text/css">
        <link href="../CSS/BT.css" rel="stylesheet" type="text/css">  <link href="../CSS/component.css" rel="stylesheet" type="text/css"> 
        <link href="../CSS/cgc_button.css" rel="stylesheet" type="text/css">
        <script language="javascript" src="../JS/myAjaxFramework.js"></script>
        <script type="text/javascript">
            var my_window = null;
            var t;
            function openBrown(tableID,SentToShow)
            {
                t = "../SEARCHSCREEN/Search_Report.jsp?table="+tableID+"&sentdataToshow="+SentToShow;
                if(my_window == null)
                    my_window = window.open(t,'','status=1,width=560,height=500');
                else{
                    closepopup();
                    my_window = window.open(t,'','status=1,width=560,height=500');
                }
            }
            function Chknull(){
                if(document.getElementById('DOC_ID_desc').value == ''){
                    alert('กรุณาใส่ข้อมูลเลขที่เอกสาร');
                }else document.report.submit();
            }
        </script>
    </head>

    <body onunload="closepopup()">
        <form name="report" method="post" action="../JSP/CS_REPORT.jsp" target="_blank">
            <input type="hidden" name="report_code" value="<%=path%>">
            <input type="hidden" name="type_report" value="2">
            <input type="hidden" name="lookup" value="<%=lookup%>">
            <input type="hidden" name="doc_eff_date" value="<%=doc_eff_date%>">
            <input type="hidden" name="doc_no" value="<%=doc_no%>">
            <table  cellpadding="0"  cellspacing="0">
                <tr>
                    <td class="ftopleft"></td>
                    <td  class="ftopcenter" colspan="2">รายงาน&nbsp;</td>
                    <td class="ftopright"></td>
                </tr>
                <tr >
                    <td class="fcenterleft"></td>
                    <td  colspan="2" class="fcentercenter">
                        <div align="left">
                            <table  cellpadding="0" cellspacing="0" >
                                <tr>
                                    <td colspan="2"  class="blankspace"></td>
                                </tr>
                                <!--
                                <tr>
                                    <td colspan='2'><b>กำหนดเงื่อนไข การออกรายงาน</b></td></tr><tr><td class='columnlabel'>DOC_ID : &nbsp;</td><td class='columnobject'><input name='DOC_ID_desc' type='text' id="DOC_ID_desc" value='' />
                                        &nbsp;<a href='javascript:;' onclick="openBrown('','DOC_ID_desc')" ><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='?????' name='IMAGE1' width='20' height='20' border='0' align='middle' /></a></td></tr>

                                <tr>
                                    <td colspan='2' class='blankspace' ></td>
                                </tr>
                                -->
                                <tr>
                                    <td colspan='2'><b>กำหนดเงื่อนไข การออกรายงาน</b></td>
                                </tr>
                                <tr>
                                    <td class='columnlabel'>DOC_ID : &nbsp;</td><td class='columnobject'><input name='DOC_ID_desc' type='text' id="DOC_ID_desc" value='' />
                                        &nbsp;<a href='javascript:;' onclick="openBrown('','DOC_ID_desc')" ><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='?????' name='IMAGE1' width='20' height='20' border='0' align='middle' /></a>
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan='2' class='blankspace' align="right">
                                        <input type="button" class="cgcButton_11" name="myBut" value=" พิมพ์รายงาน  " onclick="Chknull()"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan='2' class='blankspace' ></td>
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
        </form>
    </body>
</html>
