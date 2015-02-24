<META Http-Equiv="Cache-Control" Content="no-cache">
<META Http-Equiv="Pragma" Content="no-cache">
<%@page import ="com.bw.Util.ThaiUtil" %>
<%@page import="com.bw.DB.D_product_not_quality_detailDAO"%>
<%@ page language="java" contentType="text/html; charset=TIS-620" pageEncoding="TIS-620"%>
<%
            D_product_not_quality_detailDAO objdetail = new D_product_not_quality_detailDAO();
            ThaiUtil objth = new ThaiUtil();
            String doc_id = request.getParameter("A_doc_date") == null? objth.EncodeTexttoTIS(request.getParameter("A_doc_id")) : objth.EncodeTexttoTIS(request.getParameter("A_doc_date"));
            int select_case = request.getParameter("A_doc_date") == null? 2 : 1;
            String Screen = request.getParameter("screen") == null?null:request.getParameter("screen");
            String p_type = request.getParameter("A_p_type") == null && request.getParameter("A_doc_id") != null? "":request.getParameter("A_p_type");
%>

<%=objdetail.Show_Detail(doc_id,select_case,Screen,p_type)%>