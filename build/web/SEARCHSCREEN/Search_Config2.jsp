<%@page import="com.bw.Util.Serchselect" %>
<%@page import="com.bw.Util.UtiDatabase"%>
<%@page import="com.bw.DB.DBConnect"%>
<%@page import="javax.swing.JOptionPane"%>
<%@ page language="java" contentType="text/html; charset=TIS-620" pageEncoding="TIS-620"%>
<%@page import="java.sql.*"%>
<head>
    <script type="text/javascript" src="../JS/myAjaxFramework.js"></script>
    <script type="text/javascript">
        function EncodeBefor_Search() {
            var str = getId("searchtxt").value;
            for (var i = 0; i < str.length; i++) {
                getId("searchtxt").value = (getId("searchtxt").value.indexOf(" ") != -1) ? getId("searchtxt").value.replace(" ", "_") : getId("searchtxt").value;
            }
            str = getId("searchid").value;
            for (var i = 0; i < str.length; i++) {
                getId("searchid").value = (getId("searchid").value.indexOf(" ") != -1) ? getId("searchid").value.replace(" ", "_") : getId("searchid").value;
            }

            getId("serForm").submit();
        }
    </script>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=TIS-620">
    <link href="../CSS/MENU.css" rel="stylesheet" type="text/css">
    <link href="../CSS/BT.css" rel="stylesheet" type="text/css">
    <link href="../CSS/cgc_button.css" rel="stylesheet" type="text/css">
    <META Http-Equiv="Cache-Control" Content="no-cache">
    <META Http-Equiv="Pragma" Content="no-cache">
</head>
<%!    String stadment;
    UtiDatabase objselect;
%>
<%
//JOptionPane.showConfirmDialog(null, request);
    if (request.getParameter("stadment") != null) {
        stadment = new String(request.getParameter("stadment").getBytes("ISO8859-1"), "TIS-620");
        //JOptionPane.showConfirmDialog(null, stadment);
    } else {
        stadment = "";
    }
    objselect = new UtiDatabase();
%>
<body>
    <form name="serForm" id="serForm" method="get" action="Search_Config2.jsp">
        <input type="hidden" name="table" id="table" value="<%=request.getParameter("table")%>">
        <input type="hidden" name="page" id="page" value="<%=request.getParameter("page")%>">
        <input type="hidden" name="coloum" id="coloum" value="<%=request.getParameter("coloum")%>">
        <input type="hidden" name="stadment" id="stadment" value="<%=stadment%>">

        <%

            Serchselect ss = new Serchselect();
            int inputpage = Integer.parseInt(request.getParameter("page"));
                    //int inputFillColoum = Integer.parseInt(request.getParameter("coloum"));
            //JOptionPane.showConfirmDialog(null, request.getParameter("table"));
            String inputtable = request.getParameter("table");
            String[] memcolom, memcoloumShow, memcoloumFill;
            String SQL, SQL2, Encode, strid, memtable, memID, memfillname;

        %>
        <div style="width: 600px;">
            <table width="64%" cellpadding="0"  cellspacing="0">
                <tr >
                    <td width="20" class="ftopleft"></td>
                    <td  class="ftopcenter" colspan="2">��§ҹ&nbsp;</td>
                    <td width="7" class="ftopright"></td>
                </tr>
                <tr >
                    <td class="fcenterleft"></td>
                    <td  colspan="2" class="fcentercenter">
                        <div style="width: 500px;" align="center">
                            <table width="550" cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                    <td width="90"><input type="button" class="cgcButton_5" name="bt1" value="��͹��Ѻ" onClick="javascript:window.close();"/></td>
                                    <td width="46">���� :</td>
                                    <td width="199"><input type="text" name="searchid" id="searchid" value="" size="40"/></td>
                                    <td width="199">&nbsp;</td>
                                    <td width="16" colspan="2"></td>
                                </tr>

                                <tr>
                                    <td>&nbsp;</td>
                                    <td>���� &nbsp;&nbsp;&nbsp;&nbsp;</td>
                                    <td><input type="text" name="searchtxt" id="searchtxt" value="" size="40"/></td>
                                    <td><input type="button"  class="cgcButton_6" value="����"6 onclick="EncodeBefor_Search()"></td>                                    
                                    <td colspan="2"></td>
                                </tr>
                                <%if (request.getParameter("table").equals("vproduct") || request.getParameter("table").equals("Vproduct")) {%>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                    <td><%=objselect.ShowSelectBoxSearch("select * from mproduct_type order by name_t", "ptype_id", "name_t", "mproduct_type")%></td>

                                    <td colspan="2"></td>
                                </tr>
                                <%}%>
                            </table>
                        </div>
                        <div style="width: 500px; height: 300px; overflow: auto;" align="center">
                            <table cellpadding="0" cellspacing="0" >
                                <tr>
                                    <%
                                        memcoloumFill = ss.SelectFillName(inputpage, inputtable);

                                        for (int i = 0; i < memcoloumFill.length; i++) {%>
                                    <td class="header2"><div align="left"><%= memcoloumFill[i]%></div></td>
                                        <%
                                            }
                                        %>
                                </tr>
                                <%
                                    memtable = ss.SelectTable(inputtable);
                                    memcolom = ss.SelectColoum(inputpage, inputtable);
                                    memID = ss.SelectID(inputpage, inputtable);
                                    memcoloumShow = ss.SelectColoumShow(inputpage, inputtable);

                                    int start, screen;
                                    int row_page = 15;
                                    int total = 0;
                                    int count = 0;
                                    UtiDatabase objut = new UtiDatabase();
                                    DBConnect db = new DBConnect();
                                    Connection Conn = db.openNewConnection();
                                    if (request.getParameter("searchid") == null && request.getParameter("searchtxt") == null) {
                                        SQL = "Select Count(*) As num from  " + memtable + " where delete_flag <> 'Y' " + stadment;
                                        total = objut.numRowdatabase(SQL);
                                    } else if (request.getParameter("searchid") != null && request.getParameter("searchtxt") != null) {
                                        strid = new String(request.getParameter("searchid").getBytes("ISO8859-1"), "TIS-620");
                                        Encode = new String(request.getParameter("searchtxt").getBytes("ISO8859-1"), "TIS-620");
                                        SQL = "Select Count(*) As num from  " + memtable + " where delete_flag <> 'Y' and " + memcolom[0] + " like '" + strid + "%' and " + memcolom[1] + " like '" + Encode + "%' " + stadment;
                                        total = objut.numRowdatabase(SQL);
                                    } else if (request.getParameter("searchid") != null && request.getParameter("searchtxt") == null) {
                                        strid = new String(request.getParameter("searchid").getBytes("ISO8859-1"), "TIS-620");
                                        SQL = "Select Count(*) As num from  " + memtable + " where delete_flag <> 'Y' and " + memcolom[0] + " like '" + strid + "%' " + stadment;
                                        total = objut.numRowdatabase(SQL);
                                    } else {
                                        Encode = new String(request.getParameter("searchtxt").getBytes("ISO8859-1"), "TIS-620");
                                        SQL = "Select Count(*) As num from  " + memtable + " where delete_flag <> 'Y' and " + memcolom[1] + " like '" + Encode + "%' " + stadment;
                                        total = objut.numRowdatabase(SQL);
                                    }
                                    if (total == 0) {%>
                                <tr>
                                    <td></td>
                                    <td align="center">��辺�����ŷ���ͧ���</td>
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
                                    String getshowdata;%>
                                <%                                    rs2 = null;
                                    try {
                                        String sql2;
                                        if (request.getParameter("searchid") == null && request.getParameter("searchtxt") == null) {

                                            sql2 = "select * from " + memtable + " where delete_flag <> 'Y' " + stadment + " order by runno desc limit " + row_page + " offset " + start;
                                            rs2 = Conn.createStatement().executeQuery(sql2);
                                        } else if (request.getParameter("searchid") != null && request.getParameter("searchtxt") != null) {
                                            sql2 = "select * from " + memtable + " where delete_flag <> 'Y'  and " + memcolom[0] + " like '" + new String(request.getParameter("searchid").getBytes("ISO8859-1"), "TIS-620") + "%' and " + memcolom[1] + " like '" + new String(request.getParameter("searchtxt").getBytes("ISO8859-1"), "TIS-620") + "%' " + stadment + " order by runno desc limit " + row_page + " offset " + start;
                                            rs2 = Conn.createStatement().executeQuery(sql2);
                                        } else if (request.getParameter("searchid") != null && request.getParameter("searchtxt") == null) {
                                            sql2 = "select * from " + memtable + " where delete_flag <> 'Y' and " + memcolom[0] + " like '" + new String(request.getParameter("searchid").getBytes("ISO8859-1"), "TIS-620") + "%' " + stadment + " order by runno desc limit " + row_page + " offset " + start;
                                            rs2 = Conn.createStatement().executeQuery(sql2);
                                        } else {
                                            sql2 = "select * from " + memtable + " where delete_flag <> 'Y' and " + memcolom[1] + " like '" + new String(request.getParameter("searchtxt").getBytes("ISO8859-1"), "TIS-620") + "%' " + stadment + " order by runno desc limit " + row_page + " offset " + start;
                                            rs2 = Conn.createStatement().executeQuery(sql2);
                                        }
                                        while (rs2.next()) {

                                            count++;
                                            getshowdata = "";
                                            for (int i = 0; i < memcolom.length; i++) {

                                                if (i != (memcolom.length - 1)) {
                                                    getshowdata += rs2.getString(memcolom[i]) + "|";
                                                    //System.out.println("Getshowdata = " + getshowdata);
                                                } else {

                                                    getshowdata += rs2.getString(memcolom[i]);
                                                    System.out.println("Getshowdata = " + getshowdata);
                                                    /*JOptionPane.showConfirmDialog(null, memcolom[i]);
                                                     if(memcolom[i].equals("remark")){
                                                     JOptionPane.showConfirmDialog(null, memcolom[i].indexOf("\n"));
                                                     }*/
                                                }
                                                //JOptionPane.showConfirmDialog(null, getshowdata);
                                            }
                                %>
                            <tr>
                                <%
                                    for (int y = 0; y < memcoloumShow.length; y++) {
                                        if (y == 0) {


                                %>
                                <td  class="detailLeft"><a  href="#" onClick="gettoShow('<%=getshowdata.replaceAll("\"", "3422042#34").replaceAll("\'", "3927047#39")%>', '<%=memID%>')"><%=rs2.getString(memcoloumShow[y])%></a></td>
                                    <%
                                    System.out.println("Detail = " + rs2.getString(memcoloumShow[y]));
                                    } else {

                                    %>

                                <td  class="detailLeft"><%= rs2.getString(memcoloumShow[y])%></td>
                                <%
                                        }
                                    }

                                %>
                            </tr>
                            <%	}

                            %>
            </table>
        </div >
        <div align="center">
            <%                if (screen > 1) {
                    if (request.getParameter("searchid") == null && request.getParameter("searchtxt") == null) {%>
            <a href="../SEARCHSCREEN/Search_Config2.jsp?screen=<%=screen - 1%>&page=<%=request.getParameter("page")%>&table=<%=request.getParameter("table")%>&stadment=<%=stadment%>">��͹��Ѻ</a>
            <%
            } else if (request.getParameter("searchid") != null && request.getParameter("searchtxt") != null) {%>
            <a href="../SEARCHSCREEN/Search_Config2.jsp?screen=<%=screen - 1%>&page=<%=request.getParameter("page")%>&table=<%=request.getParameter("table")%>&searchid=<%=request.getParameter("searchid")%>&searchtxt=<%=new String(request.getParameter("searchtxt").getBytes("ISO8859-1"), "TIS-620")%>&stadment=<%=stadment%>">��͹��Ѻ</a>
            <%
            } else if (request.getParameter("searchid") != null && request.getParameter("searchtxt") == null) {%>
            <a href="../SEARCHSCREEN/Search_Config2.jsp?screen=<%=screen - 1%>&page=<%=request.getParameter("page")%>&table=<%=request.getParameter("table")%>&searchid=<%=request.getParameter("searchid")%>&stadment=<%=stadment%>">��͹��Ѻ</a>
            <%
            } else {%>
            <a href="../SEARCHSCREEN/Search_Config2.jsp?screen=<%=screen - 1%>&page=<%=request.getParameter("page")%>&table=<%=request.getParameter("table")%>&searchtxt=<%=new String(request.getParameter("searchtxt").getBytes("ISO8859-1"), "TIS-620")%>&stadment=<%=stadment%>">��͹��Ѻ</a>
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
                if (request.getParameter("searchid") == null && request.getParameter("searchtxt") == null) {%>
            | <a href="../SEARCHSCREEN/Search_Config2.jsp?screen=<%=i%>&page=<%=request.getParameter("page")%>&table=<%=request.getParameter("table")%>&stadment=<%=stadment%>"><%=i%></a> |
            <%
            } else if (request.getParameter("searchid") != null && request.getParameter("searchtxt") != null) {%>
            | <a href="../SEARCHSCREEN/Search_Config2.jsp?screen=<%=i%>&page=<%=request.getParameter("page")%>&table=<%=request.getParameter("table")%>&searchid=<%=request.getParameter("searchid")%>&searchtxt=<%=new String(request.getParameter("searchtxt").getBytes("ISO8859-1"), "TIS-620")%>&stadment=<%=stadment%>"><%=i%></a> |
            <%
            } else if (request.getParameter("searchid") != null && request.getParameter("searchtxt") == null) {%>
            | <a href="../SEARCHSCREEN/Search_Config2.jsp?screen=<%=i%>&page=<%=request.getParameter("page")%>&table=<%=request.getParameter("table")%>&searchid=<%=request.getParameter("searchid")%>&stadment=<%=stadment%>"><%=i%></a> |
            <%
            } else {%>
            | <a href="../SEARCHSCREEN/Search_Config2.jsp?screen=<%=i%>&page=<%=request.getParameter("page")%>&table=<%=request.getParameter("table")%>&searchtxt=<%=new String(request.getParameter("searchtxt").getBytes("ISO8859-1"), "TIS-620")%>&stadment=<%=stadment%>"><%=i%></a> |
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
                if (request.getParameter("searchid") == null && request.getParameter("searchtxt") == null) {%>
            | <a href="../SEARCHSCREEN/Search_Config2.jsp?screen=<%=y%>&page=<%=request.getParameter("page")%>&table=<%=request.getParameter("table")%>&stadment=<%=stadment%>"><%=y%></a> |
            <%
            } else if (request.getParameter("searchid") != null && request.getParameter("searchtxt") != null) {%>
            | <a href="../SEARCHSCREEN/Search_Config2.jsp?screen=<%=y%>&page=<%=request.getParameter("page")%>&table=<%=request.getParameter("table")%>&searchid=<%=request.getParameter("searchid")%>&searchtxt=<%=new String(request.getParameter("searchtxt").getBytes("ISO8859-1"), "TIS-620")%>&stadment=<%=stadment%>"><%=y%></a> |
            <%
            } else if (request.getParameter("searchid") != null && request.getParameter("searchtxt") == null) {%>
            | <a href="../SEARCHSCREEN/Search_Config2.jsp?screen=<%=y%>&page=<%=request.getParameter("page")%>&table=<%=request.getParameter("table")%>&searchid=<%=request.getParameter("searchid")%>&stadment=<%=stadment%>"><%=y%></a> |
            <%
            } else {%>
            | <a href="../SEARCHSCREEN/Search_Config2.jsp?screen=<%=y%>&page=<%=request.getParameter("page")%>&table=<%=request.getParameter("table")%>&searchtxt=<%=new String(request.getParameter("searchtxt").getBytes("ISO8859-1"), "TIS-620")%>&stadment=<%=stadment%>"><%=y%></a> |
            <%
                            }
                        }
                    }
                }
                if (screen < total_page) {
                    if (request.getParameter("searchid") == null && request.getParameter("searchtxt") == null) {%>
            <a href="../SEARCHSCREEN/Search_Config2.jsp?screen=<%=screen + 1%>&page=<%=request.getParameter("page")%>&table=<%=request.getParameter("table")%>&stadment=<%=stadment%>">仢�ҧ˹��</a>
            <%
            } else if (request.getParameter("searchid") != null && request.getParameter("searchtxt") != null) {%>
            <a href="../SEARCHSCREEN/Search_Config2.jsp?screen=<%=screen + 1%>&page=<%=request.getParameter("page")%>&table=<%=request.getParameter("table")%>&searchid=<%=request.getParameter("searchid")%>&searchtxt=<%=new String(request.getParameter("searchtxt").getBytes("ISO8859-1"), "TIS-620")%>&stadment=<%=stadment%>">仢�ҧ˹��</a>
            <%
            } else if (request.getParameter("searchid") != null && request.getParameter("searchtxt") == null) {%>
            <a href="../SEARCHSCREEN/Search_Config2.jsp?screen=<%=screen + 1%>&page=<%=request.getParameter("page")%>&table=<%=request.getParameter("table")%>&searchid=<%=request.getParameter("searchid")%>&stadment=<%=stadment%>">仢�ҧ˹��</a>
            <%
            } else {%>
            <a href="../SEARCHSCREEN/Search_Config2.jsp?screen=<%=screen + 1%>&page=<%=request.getParameter("page")%>&table=<%=request.getParameter("table")%>&searchtxt=<%=new String(request.getParameter("searchtxt").getBytes("ISO8859-1"), "TIS-620")%>&stadment=<%=stadment%>">仢�ҧ˹��</a>
            <%
                            }
                        } else {
                            ;

                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        if (rs2 != null) {
                            rs2.close();
                        }
                        if (Conn != null) {
                            Conn.close();
                        }
                    }

                }
            %>
        </div></td>
    <td class="fcenterright"></td>
</tr>
<tr bordercolor="0069B3" style="height: 5px">
    <td width="20" class="ffootleft"></td>
    <td  class="ffootcenter" colspan="2" ></td>
    <td width="7" class="ffootright"></td>
</tr>
</table>
</div>
</form>
</body>
