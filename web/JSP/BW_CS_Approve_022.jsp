<%@page import="com.bw.DB.D_rawmatt_recieveDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    D_rawmatt_recieveDAO objDAO = new D_rawmatt_recieveDAO();
    out.print("ทำการอนุมัติสำเร็จ จำนวน = "+objDAO.Approve(request.getParameter("runno"), request.getParameter("doc_date")));
%>
