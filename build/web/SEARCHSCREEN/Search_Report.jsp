<%@page import="com.bw.Util.UtiDatabase"%>
<%@page import="com.bw.DB.DBConnect"%>
<%@page import="javax.swing.JOptionPane"%>
<%@ page language="java" contentType="text/html; charset=TIS-620" pageEncoding="TIS-620"%>
<%@page import="java.sql.*"%>
<head>
    <script type="text/javascript" src="../JS/myAjaxFramework.js"></script>
    <script type="text/javascript">

    </script>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=TIS-620">
    <link href="../CSS/MENU.css" rel="stylesheet" type="text/css">
    <link href="../CSS/BT.css" rel="stylesheet" type="text/css">  
    <link href="../CSS/component.css" rel="stylesheet" type="text/css"> 
    <link href="../CSS/cgc_button.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="../JS/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../JS/bootstrap/css/bootstrap-theme.min.css">

    <script src="../JS/jquery/jquery-2.1.4.js"></script>
    <script src="../JS/bootstrap/js/bootstrap.min.js"></script>                           

    <link rel="stylesheet" href="../CSS/checkbox/awesome-bootstrap-checkbox.css"/>   

    <script src="../JS/alertify/alertify.js"></script>        

    <link rel="stylesheet" href="../CSS/alertify/alertify.core.css" />

    <link rel="stylesheet" href="../CSS/alertify/alertify.default.css">

    <link rel="stylesheet" href="../FONTS/css/font-awesome.css" />           
</head>
<body>
    <form name="serForm" method="get" action="Search_Report.jsp">
        <input type="hidden" name="table" value="<%=request.getParameter("table")%>">
        <input type="hidden" name="page" value="<%=request.getParameter("page")%>">
        <input type="hidden" name="sentdataToshow" value="<%=request.getParameter("sentdataToshow")%>">
        <br>
        <div class="container">        
            <div class="panel panel-primary">
                <div class="panel-heading"> <span class="glyphicon glyphicon-zoom-in" style="color:white"></span>&nbsp;<b>���Ң�����</b></div>
                <div class="panel-footer">             
                    <div style="width: 650px;" align="left">
                        <table width="630" cellpadding="0" cellspacing="0" border="0">
                            <tr>
                                <td colspan="6"  class="blankspace"></td>
                            </tr>
                            <tr>
                                <td colspan="3" align="right">�Ţ����͡��� :&nbsp;</td>
                                <td align="left"><input class='inputs' type="text" name="searchtxt" value="" size="40"/>
                                    <input type="submit" id="submit" class="cgcButton_6" value="����">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" class="header2"><div align="left">�Ţ����͡���</div></td>
                                <td width="62%" colspan="3" class="header2"><div align="left">�ѹ���</div></td>
                            </tr>
                            <%
                                String inputtable = request.getParameter("table");
                                String SQL, SQL2, Encode, strid, memtable, memID, memfillname, sentToshow;

                                int start, screen;
                                int row_page = 13;
                                int total = 0;
                                int count = 0;
                                sentToshow = (String) request.getParameter("sentdataToshow");
                                UtiDatabase objut = new UtiDatabase();
                                DBConnect db = new DBConnect();
                                Connection Conn = db.openNewConnection();
                                if (request.getParameter("searchid") == null) {
                                    SQL = "Select Count(*) As num from  " + inputtable + " where delete_flag <> 'Y'"; //and complete_flag ='Y'
                                    total = objut.numRowdatabase(SQL);
                                } else if (request.getParameter("searchid") != null) {
                                    strid = new String(request.getParameter("searchid").getBytes("ISO8859-1"), "TIS-620");
                                    //Encode = new String(request.getParameter("searchtxt").getBytes("ISO8859-1"),"TIS-620");
                                    SQL = "Select Count(*) As num from  " + inputtable + " where delete_flag <> 'Y' and doc_id like '" + strid + "%'"; //and complete_flag ='Y'
                                    total = objut.numRowdatabase(SQL);
                                }

                                if (total == 0) {%>
                            <tr>
                                <td colspan="4" align="left">��辺��觷�����</td>

                            </tr></table>
                            <%}
                                int total_page = (int) Math.ceil((double) total / (double) row_page);
                                if (request.getParameter("screen") == null) {
                                    screen = 1;
                                } else {
                                    screen = Integer.parseInt(request.getParameter("screen"));
                                }
                                if (screen >= 1 && screen <= total) {
                                    start = (screen - 1) * row_page;
                                    //row_page=row_page*screen;


                            %>
                            <%!ResultSet rs2;
                                String getshowdata, data2;
                            %>
                            <%                                String sql2;
                                if (request.getParameter("searchid") == null) {
                                    sql2 = "select * from " + request.getParameter("table") + " where delete_flag <> 'Y'  order by runno desc limit " + row_page + " offset " + start;
                                    rs2 = Conn.createStatement().executeQuery(sql2);
                                } else if (request.getParameter("searchid") != null) {
                                    sql2 = "select * from " + request.getParameter("table") + " where delete_flag <> 'Y' and doc_id like '" + new String(request.getParameter("searchid").getBytes("ISO8859-1"), "TIS-620") + "%' order by runno desc limit " + row_page + " offset " + start;
                                    rs2 = Conn.createStatement().executeQuery(sql2);
                                }

                                while (rs2.next()) {
                                    getshowdata = rs2.getString("doc_id");
                                    data2 = rs2.getString("doc_date");

                            %>
                        <tr>
                            <td colspan="3" align="left"><a  href="#" onClick="gettoShow('<%=getshowdata%>', '<%=sentToshow%>')" class="link_transparent"><%=getshowdata%></a></td>
                            <td colspan="3" align="left"><%=data2%></td>
                        </tr>
                        <%

                            }

                        %>
                        </table>
                        <div align="center">
                            <%                    if (screen > 1) {
                                    if (request.getParameter("searchid") == null) {%>
                            <a href="../SEARCHSCREEN/Search_Report.jsp?screen=<%=screen - 1%>&table=<%=request.getParameter("table")%>&sentdataToshow=<%=sentToshow%>" class="link_transparent">��͹��Ѻ</a>
                            <%
                            } else if (request.getParameter("searchid") != null) {%>
                            <a href="../SEARCHSCREEN/Search_Report.jsp?screen=<%=screen - 1%>&table=<%=request.getParameter("table")%>&searchid=<%=new String(request.getParameter("searchid").getBytes("ISO8859-1"), "TIS-620")%>&sentdataToshow=<%=sentToshow%>" class="link_transparent">��͹��Ѻ</a>
                            <%
                                    }

                                }
                                if ((screen % 10) != 0 && screen <= 10) {
                                    for (int i = 1; i <= 10 && i <= total_page; i++) {

                                        if (i == screen) {
                            %>
                            <%="[" + i + "]"%>
                            <%
                            } else {
                                if (request.getParameter("searchid") == null) {%>
                            | <a href="../SEARCHSCREEN/Search_Report.jsp?screen=<%=i%>&table=<%=request.getParameter("table")%>&sentdataToshow=<%=sentToshow%>" class="link_transparent"><%=i%></a> |
                            <%
                            } else if (request.getParameter("searchid") != null) {%>
                            | <a href="../SEARCHSCREEN/Search_Report.jsp?screen=<%=i%>&table=<%=request.getParameter("table")%>&searchid=<%=new String(request.getParameter("searchid").getBytes("ISO8859-1"), "TIS-620")%>&sentdataToshow=<%=sentToshow%>" class="link_transparent"><%=i%></a> |
                            <%
                                        }
                                    }

                                }
                            } else {
                                for (int y = (screen - 5); y <= (screen + 5) && y <= total_page; y++) {
                                    if (y == screen) {
                            %>
                            <%="[" + y + "]"%>
                            <%
                            } else {
                                if (request.getParameter("searchid") == null) {%>
                            | <a href="../SEARCHSCREEN/Search_Report.jsp?screen=<%=y%>&table=<%=request.getParameter("table")%>&sentdataToshow=<%=sentToshow%>" class="link_transparent"><%=y%></a> |
                            <%
                            } else if (request.getParameter("searchid") != null) {%>
                            | <a href="../SEARCHSCREEN/Search_Report.jsp?screen=<%=y%>&table=<%=request.getParameter("table")%>&searchid=<%=new String(request.getParameter("searchid").getBytes("ISO8859-1"), "TIS-620")%>&sentdataToshow=<%=sentToshow%>" class="link_transparent"><%=y%></a> |
                            <%
                                            }
                                        }
                                    }
                                }
                                if (screen < total_page) {
                                    if (request.getParameter("searchid") == null) {%>
                            <a href="../SEARCHSCREEN/Search_Report.jsp?screen=<%=screen + 1%>&table=<%=request.getParameter("table")%>&sentdataToshow=<%=sentToshow%>" class="link_transparent">仢�ҧ˹��</a>
                            <%
                            } else if (request.getParameter("searchid") != null && request.getParameter("searchtxt") != null) {%>
                            <a href="../SEARCHSCREEN/Search_Report.jsp?screen=<%=screen + 1%>&table=<%=request.getParameter("table")%>&searchid=<%=new String(request.getParameter("searchid").getBytes("ISO8859-1"), "TIS-620")%>&sentdataToshow=<%=sentToshow%>" class="link_transparent">仢�ҧ˹��</a>
                            <%
                                        }
                                    } else {
                                        ;

                                    }
                                    rs2.close();
                                    Conn.close();
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>                        
    </form>
</body>
