<%@page import="com.bw.bean.UserBean"%>
<%@page import="com.bw.bean.DataBean_Mcompany"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BW ERP</title>
        <link href="../CSS/MENU.css" rel="stylesheet" type="text/css">
        <link href="../CSS/BT.css" rel="stylesheet" type="text/css">
        <script language="javascript" src="../JS/myAjaxFramework.js"></script>


        <%
            UserBean userbean = (UserBean) session.getAttribute("user");
            DataBean_Mcompany dataBean_Mcompany = (DataBean_Mcompany) session.getAttribute("name_t");
            //System.out.println("Session Header = " + session.getAttribute("session_id"));
%>

        <script language='javascript'>

            function linkpage(jsppage) {
                var mfixcon = "";
                with (document.btform) {
                    action = jsppage;
                    submit();
                }
            }

            function Logout() {
                if (confirm('คุณต้องการออกจากระบบใช่หรือไม่')) {
                    document.submitForm.submit();
                }
            }
            var StayAlive = 1; // เวลาเป็นวินาทีที่ต้องการให้ WIndows ปิด

            function KillMe() {
                setTimeout("self.close()", StayAlive * 1000);
                window.opener.location.reload();
            }

            function startTime()
            {
                var today = new Date();
                var h = today.getHours();
                var m = today.getMinutes();
                var s = today.getSeconds();
// add a zero in front of numbers<10
                m = checkTime(m);
                s = checkTime(s);
                document.getElementById('txt').innerHTML = h + ":" + m + ":" + s;
                t = setTimeout(function() {
                    startTime()
                }, 500);
            }

            function checkTime(i)
            {
                if (i < 10)
                {
                    i = "0" + i;
                }
                return i;
            }

        </script>
    </head>    
    <BODY onload="startTime()"BGCOLOR="#F7F7F7" LEFTMARGIN=0 TOPMARGIN=0 MARGINWIDTH=0 MARGINHEIGHT=0 onLoad="KillMe();
            self.focus();
            window.opener.location.reload();" >
        <input type="hidden" id="logout"/>
        <TABLE BORDER=0 align="center" CELLPADDING=0 CELLSPACING=0>
            <TR>
                <TD COLSPAN=9 align="center"><img src="../IMAGES/HEADER/bw_header.png"/></TD>
            </TR>
            <TR valign="top">
                <TD width="50">&nbsp;</TD>
                <TD COLSPAN=5 align="center" valign="top">
                    <form name="submitForm" target="_top" action="../JSP/Logout.jsp">
                        <div>
                            <pre><a href="javascript:;" onClick="Logout()"><span class="style2"><img src="../IMAGES/exit_btn_48.png" width="21" height="21" border="0"/><strong>ออกจากระบบ</strong></span></a></pre>
                        </div>
                    </form>                </TD>
                <td width="350" valign="middle" class="company" >
                    <div align="right">ฐานช้อมูล : <%=userbean.getSelect_database()%> &nbsp;                     
                    </div>
                </td>
                <td width="350" valign="middle" class="company">
                    <div align="right">ผู้ใช้ : <%=userbean.getUsername()%> &nbsp;:&nbsp; 
                        <%=userbean.getFullname()%><br>
                        <script language="javascript">MyDate('tha')</script><div id="txt">                            
                        </div>
                    </div>
                </td>
                <td width="96" class="columnobject">
                    <p align="right">&nbsp;</p>                
                </td>
            </TR>
        </TABLE>
    </BODY>
</html>