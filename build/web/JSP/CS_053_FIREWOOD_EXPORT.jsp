
<%@page contentType="text/html" pageEncoding="TIS-620"%>
<%@page import="com.bw.report.PrintCSV_FIREWOOD_EXPORT" %>
<%@page import="java.io.InputStream"%>
<%
PrintCSV_FIREWOOD_EXPORT obj = new PrintCSV_FIREWOOD_EXPORT();
obj.ExportCSV(request,response);
%>