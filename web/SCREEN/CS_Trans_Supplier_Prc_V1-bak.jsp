<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>
<%@page import="java.sql.Date"%>
<%@page import="com.bw.Util.Serchselect" %>
<%@page import="com.bw.Util.UtiDatabase"%>
<%@page import="com.bw.DB.DBConnect"%>
<%@page import="java.text.DecimalFormat" %>
<%@page import="java.sql.Date"%>


<%!    String date_f, date_t;
%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=TIS-620">        
        <!--link href="../CSS/MENU.css" rel="stylesheet" type="text/css">
        <link href="../CSS/BT.css" rel="stylesheet" type="text/css"-->
        <link rel="stylesheet" href="../table.css" type="text/css"/>	        
        <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
        <script src="//code.jquery.com/jquery-1.9.1.js"></script>
        <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
        <link rel="stylesheet" href="/resources/demos/style.css">
        <link href="../CSS/cgc_button.css" rel="stylesheet" type="text/css"> 
        <link href="../CSS/component.css" rel="stylesheet" type="text/css">

        <link rel="stylesheet" href="../JS/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="../JS/bootstrap/css/bootstrap-theme.min.css">
        <script src="../JS/jquery/jquery-2.1.4.js"></script>
        <script src="../JS/bootstrap/js/bootstrap.min.js"></script>          

        <script src="../JS/bootstrap_select/js/bootstrap-select.js"></script>        
        <link rel="stylesheet" href="../JS/bootstrap_select/css/bootstrap-select.css">        
        <link rel="stylesheet" href="../JS/bootstrap_select/css/bootstrap-select.min.css">        
        <link rel="stylesheet" href="../JS/bootstrap_select/css/bootstrap-theme.min.css">    

        <script>
            $(function() {
                $("input[type=submit], a, button")
                        .button()
                        .click(function(event) {
                            event.preventDefault();
                        });
            });
        </script>     

        <script>
            $(function() {
                $("#progressbar").progressbar({
                    value: 100
                });
            });
        </script>        

        <title>BW  รายงานการเคลื่อนไหว</title>        
        <style type="text/css">
            <!--
            .myTable{
                border: thin inset; 
                font: xx-small/ Tahoma, Geneva, sans-serif;
                margin: auto;
                width: 80%;
                padding: 0px;

                alignment-adjust: central;
            }

            -->
        </style>


    </head>
    <body>
        <form name="report" method="post" action="../JSP/CS_REPORT.jsp" target="_blank">
            <%
                date_f = request.getParameter("date_f");
                date_t = request.getParameter("date_t");
            %>
            <input type="hidden" name="type_report" value="4">
            <input type="hidden" name="report_code" value="RP_RAWMAT_TRANS_V1">
            <input type="hidden" name="price_year" value="">
            <input type="hidden" name="pgroup_id" value="-">
            <input type="hidden" name="product_id" value="-">
            <input type="hidden" name="warehouse_id" value="-">
            <input type="hidden" name="branch" value="-">
            <input type="hidden" name="location_id" value="-">
            <input type="hidden" name="friction_house" value="-">                          
            <input type="hidden" id="date_form" name="date_form" value="<%=date_f%>">
            <input type="hidden" id="date_to" name="date_to" value="<%=date_t%>">          

            <%
                UtiDatabase objut = new UtiDatabase();
                DBConnect db = new DBConnect();
                Connection Conn = db.openNewConnection();
                Connection Conn2 = db.openNewConnection();
                ResultSet rec_periods = null;

                Timestamp ts = (new Timestamp(new java.util.Date().getTime()));
                System.out.println("ts = " + ts);

                Statement STateMent = null;
                Statement STateMentData = null;
                DecimalFormat formatter = new DecimalFormat("#0.00");

                String product_id = request.getParameter("product_id");
                String pgroup_id = request.getParameter("pgroup_id");
                // **** ลบข้อมูลตาราง ความเคลื่อนไหว
                String sqlDelete = " DELETE FROM tmp_stock_supplier_balance ;"
                        + " ALTER SEQUENCE seq_tmp_stock_supplier_balance RESTART WITH 1; ";
                STateMentData = Conn.createStatement();
                STateMentData.execute(sqlDelete);

                String SQL_PERIOD = "SELECT * FROM mperiod where doc_type = 'S'";

                String start_period = "";

                String SqlSelectSTK, SqlInsertSTK = "";

                rec_periods = Conn2.createStatement().executeQuery(SQL_PERIOD);

                if (rec_periods.next()) {
                    //start_period = rec_periods.getString("start_period");
                    start_period = rec_periods.getString("start_period").substring(6, 10) + rec_periods.getString("start_period").substring(2, 6) + rec_periods.getString("start_period").substring(0, 2);
                    System.out.println("Select DB start_period : " + start_period);
                }

                String sql_where = "";

                if (!request.getParameter("date_from").equals("") && !request.getParameter("date_to").equals("") && !request.getParameter("date_from").equals(null) && !request.getParameter("date_to").equals(null)) {
                    sql_where = " WHERE to_date(format_date(doc_date),'YYYY-MM-DD') between to_date(format_date3('"
                            + start_period + "'),'YYYY-MM-DD') AND to_date(format_date3('"
                            + request.getParameter("date_to") + "'),'YYYY-MM-DD') ";
                }

                if (!sql_where.equals("") && !sql_where.equals(null)) {
                    if (!product_id.equals("") && !product_id.equals(null)) {
                        sql_where = sql_where + " and product_id = '" + product_id + "' ";
                    }
                }

                if (!sql_where.equals("") && (!pgroup_id.equals("-"))) {

                    sql_where = sql_where + " and pgroup_id = '" + pgroup_id + "' ";

                }

                String SqlFeature = "group by doc_date,product_id,pname_t,pgroup_id,pgroup_name,unit_name,doc_type"
                        + " having sum(amount_total) <> 0"
                        + " order by to_date(format_date4(doc_date),'YYYY-MM-DD'), doc_type desc , pgroup_id desc , product_id ";

                //System.out.println("sql_where = " + sql_where);
                SqlSelectSTK = " select doc_date,product_id,pname_t,pgroup_id,pgroup_name,"
                        + " sum(amount_total) as amount_total_group,unit_name,doc_type"
                        + " from vt_transaction_supplier_stock "
                        + sql_where
                        + SqlFeature;

                System.out.println("SqlSelectSTK = " + SqlSelectSTK);
                STateMent = Conn.createStatement();
                ResultSet rec_wh_stock = STateMent.executeQuery(SqlSelectSTK);

                while (rec_wh_stock != null && (rec_wh_stock.next())) {

                    //double price_total = rec_wh_stock.getDouble("weight_toal_group") * rec_wh_stock.getDouble("price_per_unit_num");
                    System.out.println(rec_wh_stock.getString("doc_date") + " : " + rec_wh_stock.getString("product_id") + " : " + rec_wh_stock.getDouble("amount_total_group") + " : " + rec_wh_stock.getString("unit_name"));

                }

                Timestamp ts1 = (new Timestamp(new java.util.Date().getTime()));
                System.out.println("ts1 = " + ts1);


            %>               

            <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <a class="navbar-brand" href="#">
                            <img alt="North Eastern Starch (1987) Co.,Ltd" src="../IMAGES/bw-logo.png">
                        </a>
                    </div>
                </div>
            </nav> 

            <!--div class="CSS_Table_Example" style="width:1200px;height:150px;"-->
            <!--div class="jumbotron"-->
            <div class="container">
                <table border ="1"  cellpadding="0"  cellspacing="0" class="myTable">
                    <center><h2>รายงานความเคลื่อนไหวพัสดุ (กระสอบ - ถุง - พาเลท)</h2></center>
                    <center><h2><span class="label label-success">วันที่ : <%=date_f%> ถึง <%=date_t%></span></h2></center> 
                    <center><h2>จัดเตรียมข้อมูลเสร็จสิ้น กรุณากดปุ่ม พิมพ์รายงาน</h2></center>          
                    <center>   
                        <div class="progress">                                
                            <div class="progress-bar" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width:0%"></div>                                
                        </div>
                    </center>                                 

                </table>      

                <div class="CSS_Table_Example" style="width:1200px;height:150px;">    
                    <center>
                        <a href="#" onClick="javascript:document.report.submit();" class="cgcButton_19">พิมพ์รายงาน</a>
                        &nbsp;&nbsp;<a href="#" onClick="javascript:window.close();" class="cgcButton_19">ปิด</a>
                    </center>    
                </div>

                <div class="CSS_Table_Example" style="width:1200px;height:150px;">    
                    <left>                            
                        <div class="alert alert-info">
                            <a href="#" class="close" data-dismiss="alert">×</a>

                            <table class="table table-bordered">
                                <tr>
                                    <td class="row5" width="20%">
                                <left>เริ่มประมวลผล เวลา :</left> 
                                </td>
                                <td class="row5" width="20%">
                                <left><%=ts%></left>                                     
                                </td>
                                </tr>
                                <tr>
                                    <td class="row5" width="20%">
                                <left>สิ้นสุดการประมวลผล เวลา :</left> 
                                </td>
                                <td class="row5" width="20%">
                                <left><%=ts1%></left>                                     
                                </td>
                                </tr>                        
                            </table>                                    
                        </div>
                    </left>    
                </div>                    

            </div>
            <!--/div-->

        </form>

        <script>

            var value = 0;

            function barAnim() {
                value += 5;
                $(".progress-bar").css("width", value + "%").attr("aria-valuenow", value);
//if (value == 25 || value == 55 || value == 85) {
                if (value === 75 || value === 95) {
                    return setTimeout(barAnim, 500);
                }
//if (value >= 100) {
//    alert(value + " % Complete");
//}
                return value >= 100 || setTimeout(barAnim, 20);
            }

            setTimeout(barAnim, 20);
        </script> 

    </body>    
</html>

