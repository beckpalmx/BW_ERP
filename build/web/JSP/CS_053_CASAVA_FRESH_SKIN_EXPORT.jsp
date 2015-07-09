
<%@page contentType="text/html" pageEncoding="TIS-620"%>
<%@page import="com.bw.report.PrintCSV_CASAVA_FRESH_SKIN_EXPORT" %>
<%@page import="java.io.InputStream"%>
<%
PrintCSV_CASAVA_FRESH_SKIN_EXPORT obj = new PrintCSV_CASAVA_FRESH_SKIN_EXPORT();
obj.ExportCSV(request,response);
%>