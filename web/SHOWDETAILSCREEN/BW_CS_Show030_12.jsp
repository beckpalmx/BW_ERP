<META Http-Equiv="Cache-Control" Content="no-cache">
<META Http-Equiv="Pragma" Content="no-cache">
<%@page import ="com.bw.Util.ThaiUtil" %>
<%@page import="com.bw.DB.D_product_roast_detail_2DAO"%>
<%@ page language="java" contentType="text/html; charset=TIS-620" pageEncoding="TIS-620"%>
<%
            D_product_roast_detail_2DAO objdetail = new D_product_roast_detail_2DAO();
            ThaiUtil objth = new ThaiUtil();
            String doc_id = objth.EncodeTexttoTIS(request.getParameter("doc_id"));
%>

<%=objdetail.Show_Detail(doc_id,1,"d_product_roast_detail_2")%>