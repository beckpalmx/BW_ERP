<%@page import ="com.bw.Util.ThaiUtil" %>
<%@page import="com.bw.DB.D_Casava_SkinDAO"%>
<%@page language="java" contentType="text/html; charset=TIS-620" pageEncoding="TIS-620"%>

<%
D_Casava_SkinDAO objdetail = new D_Casava_SkinDAO();
ThaiUtil objth = new ThaiUtil();
%>
<%=objdetail.showDetail(objth.EncodeTexttoTIS(request.getParameter("doc_id")))%>
