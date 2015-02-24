<%@page import="com.bw.DB.D_rawmatt_recieveDAO"%>
<META Http-Equiv="Cache-Control" Content="no-cache">
<META Http-Equiv="Pragma" Content="no-cache">
<%@page import ="com.bw.Util.ThaiUtil" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
            D_rawmatt_recieveDAO objdetail = new D_rawmatt_recieveDAO();
            ThaiUtil objth = new ThaiUtil();
            //String Screen = request.getParameter("screen") == null?null:request.getParameter("screen");
%>

<%=objdetail.Show_Detail(objth.EncodeTexttoTIS(request.getParameter("doc_date")))%>