<META Http-Equiv="Cache-Control" Content="no-cache">
<META Http-Equiv="Pragma" Content="no-cache">
<%@page import ="com.bw.Util.ThaiUtil" %>
<%@page import="com.bw.DB.D_product_analysis_detailDAO"%>
<%@ page language="java" contentType="text/html; charset=TIS-620" pageEncoding="TIS-620"%>
<%
            D_product_analysis_detailDAO objdetail = new D_product_analysis_detailDAO();
            ThaiUtil objth = new ThaiUtil();
            String doc_id = request.getParameter("production_id") == null? objth.EncodeTexttoTIS(request.getParameter("doc_id")) : objth.EncodeTexttoTIS(request.getParameter("production_id"));
            int select_case = request.getParameter("production_id") == null? 2 : 1;
%>

<%=objdetail.Show_Detail(doc_id,select_case)%>