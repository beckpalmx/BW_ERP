
<%@page import="com.bw.DB.CS_Transection_WarehouseDAO"%>
<%@page import="com.bw.Util.Chk_T_warehouse_item"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.bw.Util.ThaiUtil"%>
<%@page import="com.bw.Util.UtiDatabase"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bw.bean.DataBeanCS_048"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.bw.bean.UserBean"%>
<%!    
%>
<%
            CS_Transection_WarehouseDAO obj = new CS_Transection_WarehouseDAO();
            obj.Work_Transection_Warehouse(request);
%>
<%=obj.Alert_Return()%>