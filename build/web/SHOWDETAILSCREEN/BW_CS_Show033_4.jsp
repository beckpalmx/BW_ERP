<META Http-Equiv="Cache-Control" Content="no-cache">
<META Http-Equiv="Pragma" Content="no-cache">
<%@page import ="com.bw.Util.ThaiUtil" %>
<%@page import="com.bw.DB.D_product_report_daily_detail_prdDAO"%>
<%@ page language="java" contentType="text/html; charset=TIS-620" pageEncoding="TIS-620"%>
<%
            D_product_report_daily_detail_prdDAO objdetail = new D_product_report_daily_detail_prdDAO();
            ThaiUtil objth = new ThaiUtil();
            String Screen = request.getParameter("screen") == null?null:request.getParameter("screen");
            System.out.println("Display Screen = " + Screen + request.getParameter("doc_id"));
%>

<%=objdetail.Show_Detail(objth.EncodeTexttoTIS(request.getParameter("doc_id")),Screen )%>