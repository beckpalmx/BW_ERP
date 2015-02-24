<META Http-Equiv="Cache-Control" Content="no-cache">
<META Http-Equiv="Pragma" Content="no-cache">
<%@page import ="com.bw.Util.ThaiUtil" %>
<%@page import="com.bw.DB.D_product_pack_detail_1DAO"%>
<%@ page language="java" contentType="text/html; charset=TIS-620" pageEncoding="TIS-620"%>
<%
            D_product_pack_detail_1DAO objdetail = new D_product_pack_detail_1DAO();
            ThaiUtil objth = new ThaiUtil();
            String doc_id = objth.EncodeTexttoTIS(request.getParameter("doc_id"));
            //int select_case = request.getParameter("A_doc_date") == null? 2 : 1;
            String Screen = request.getParameter("screen") == null?null:request.getParameter("screen");
            //String p_type = request.getParameter("A_p_type") == null && request.getParameter("A_doc_id") != null? "":request.getParameter("A_p_type");
%>

<%=objdetail.Show_Detail(doc_id,Screen)%>