<%-- 
    Document   : BW_PROCESS_CALCULATE_RAWMAT
    Created on : Sep 16, 2014, 4:14:43 PM
    Author     : beckpalmx
--%>

<%@page import="com.bw.engine.Process_Calculate_Transaction"%>
<%@page import="com.bw.Util.ThaiUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%Process_Calculate_Transaction objcom = new Process_Calculate_Transaction();%>
<%!    String date_from, date_to,username,process_for,doc_date_from,doc_date_to;
%>            
<%
    date_from = (String) request.getParameter("doc_date_from");
    date_to = (String) request.getParameter("doc_date_to");
    
    doc_date_from = (String) request.getParameter("date_from_format");
    doc_date_to = (String) request.getParameter("date_to_format");
    
    username = (String) request.getParameter("A_username");
    process_for = (String) request.getParameter("process_for");
    System.out.println(request.getParameter("doc_date_from"));
    System.out.println(request.getParameter("doc_date_to"));
%>
<%=
    objcom.main_check(doc_date_from, doc_date_to,username,process_for)
%>
