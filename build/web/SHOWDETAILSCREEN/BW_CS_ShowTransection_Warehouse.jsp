<%@page import="com.bw.DB.CS_Transection_WarehouseDAO"%>
<META Http-Equiv="Cache-Control" Content="no-cache">
<META Http-Equiv="Pragma" Content="no-cache">
<%@page language="java" contentType="text/html; charset=TIS-620" pageEncoding="TIS-620"%>
<%@page import ="com.bw.Util.ThaiUtil" %>
<%@page import="com.bw.DB.M_product_specDAO"%>

<%=new CS_Transection_WarehouseDAO().ShowDetail(request.getParameter("process_id"),request.getParameter("doc_id"),request.getParameter("table"))%>
