<%@page import ="com.bw.Util.ThaiUtil" %>
<%@page import="com.bw.DB.VD_Casava_TicketDAO"%>
<%@page language="java" contentType="text/html; charset=TIS-620" pageEncoding="TIS-620"%>

<%
VD_Casava_TicketDAO objdetail = new VD_Casava_TicketDAO();
ThaiUtil objth = new ThaiUtil();
%>
<%=objdetail.showDetail(objth.EncodeTexttoTIS(request.getParameter("doc_id")))%>
