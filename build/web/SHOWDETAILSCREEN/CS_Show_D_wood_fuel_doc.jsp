<%@page import ="com.bw.Util.ThaiUtil" %>
<%@page import="com.bw.DB.D_ticketbuyDAO"%>
<%@page language="java" contentType="text/html; charset=TIS-620" pageEncoding="TIS-620"%>

<%
D_ticketbuyDAO objdetail = new D_ticketbuyDAO();
ThaiUtil objth = new ThaiUtil();
%>
<%=objdetail.showDetail(objth.EncodeTexttoTIS(request.getParameter("doc_id")))%>
