/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bw.DB;

import com.bw.Util.UtiDatabase;
import com.bw.bean.DataBean_Transaction_Process;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Random;

/**
 *
 * @author ball
 */
public class IMP_Process_transactionDB {

    UtiDatabase objuti;

    public void generater_transaction_process(String date_from, String date_to, String process_id, String table, String doc_type, String r, String username, String process_for) throws Exception {
        String Str_Writer = "", SQL = null;
        //DBConnect objcon = new DBConnect();
        Connection con_mysql = new DBConnect().openNewConnectionMySQL();
        Connection con_postgress = new DBConnect().openNewConnection();
        ResultSet rs = null;
        objuti = new UtiDatabase();
        java.util.Date date = new java.util.Date();
        System.out.println(new Timestamp(date.getTime()));
        java.sql.Timestamp timestamp = new java.sql.Timestamp(date.getTime());

        String table_h, table_d, prod_code = "";

        if (process_for.equalsIgnoreCase("CASAVA")) {
            table_h = "d_ticketbuy_doc";
            table_d = "d_ticketbuy";
            prod_code = " and (prod_code in ('01')) ";
        } else {
            table_h = "d_wood_fuel_doc";
            table_d = "d_wood_fuel";
            prod_code = " and (prod_code in ('03','06','07','08','15','16','17')) ";
        }

        System.out.println(date_from + " - " + date_to);

//        String date_from_format = date_from.substring(6,4) + "-" + date_from.substring(3,2) + "-" + date_from.substring(0,2) ;
//        String date_to_format = date_to.substring(6,4) + "-" + date_to.substring(3,2) + "-" + date_to.substring(0,2) ;
//        System.out.println("date_from_format = " + date_from_format);
//        System.out.println("date_to_format = " + date_to_format);        
        String SQL_Search, SQL_Search_Rec = "";

        try {

            //SQL = "select ticket_text,truck_no,date_in,time_in,date_out,time_out,load_in,load_out,net_wght,cred_name,prod_code,prod_name"
            SQL = "select * "
                    + ",substring(Date_In,1,2) as date1,substring(Date_In,4,2) as month1,(cast(substring(Date_In,7,4) as SIGNED )+543) as year1"
                    + ",substring(Date_Out,1,2) as date2,substring(Date_Out,4,2) as month2,(cast(substring(Date_Out,7,4) as SIGNED )+543) as year2"
                    + " from ticketbuy "
                    + " where ticket_text <> '' "
                    + prod_code
                    + " and str_to_date(date_in,'%d/%m/%Y')"
                    + " between str_to_date('" + objuti.Format_Date_For_Mysql(date_from) + "','%d-%m-%Y') and  str_to_date('" + objuti.Format_Date_For_Mysql(date_to) + "','%d-%m-%Y')"
                    + " order by ticket ";

            System.out.println("SQL = " + SQL);
            rs = con_mysql.createStatement().executeQuery(SQL);
            int i = 6;
            while (rs.next()) {

                SQL_Search_Rec = "Select Count(doc_id) As num from  " + table_h + " where doc_id ='" + objuti.NotNull(rs.getString("date1")) + "-" + objuti.NotNull(rs.getString("month1")) + "-" + objuti.NotNull(rs.getString("year1"))
                        + "' and delete_flag <> 'Y'  ";
                int rec_count = objuti.numRowdatabase(SQL_Search_Rec);
                if (rec_count == 0) {

                    System.out.println("SQL rec_count = " + SQL_Search_Rec);
                    System.out.println("rec_count = " + rec_count);

                    String sql_doc = "insert into " + table_h + " (doc_id,doc_date,doc_time,create_date,create_by) values (?,?,?,?,?)";

                    PreparedStatement p1 = null;
                    p1 = con_postgress.prepareStatement(sql_doc);
                    p1.setString(1, objuti.NotNull(rs.getString("date1")) + "-" + objuti.NotNull(rs.getString("month1")) + "-" + objuti.NotNull(rs.getString("year1")));
                    p1.setString(2, objuti.NotNull(rs.getString("date1")) + "-" + objuti.NotNull(rs.getString("month1")) + "-" + objuti.NotNull(rs.getString("year1")));
                    p1.setString(3, objuti.NotNull(rs.getString("time_in")));
                    p1.setTimestamp(4, timestamp);
                    p1.setString(5, "System Import");
                    p1.executeUpdate();

                }

                SQL_Search = "Select Count(ticket_text) As num from  " + table_d + " where ticket_text ='" + rs.getString("ticket_text") + "' and delete_flag <> 'Y'  ";
                int a = objuti.numRowdatabase(SQL_Search);
                if (a == 0) {
                    String sql1 = "insert into " + table_d + " (ticket_text,truck_no,date_in,time_in,date_out"
                            + ",time_out,cred_name,prod_code,prod_name,load_in,load_out,net_wght,cost_unt,date1,month1,year1,create_date,create_by,doc_id,doc_date,doc_time,date2,month2,year2,cred_code,cred_group,supply_type_id)"
                            + " values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                    System.out.println("sql1 = " + sql1);
                    PreparedStatement p = null;
                    p = con_postgress.prepareStatement(sql1);
                    p.setString(1, objuti.NotNull(rs.getString("ticket_text")));
                    p.setString(2, objuti.NotNull(rs.getString("truck_no")));
                    p.setString(3, objuti.NotNull(rs.getString("date1")) + "-" + objuti.NotNull(rs.getString("month1")) + "-" + objuti.NotNull(rs.getString("year1")));
                    //p.setString(3, objuti.NotNull(rs.getString("date_in")));                    
                    p.setString(4, objuti.NotNull(rs.getString("time_in")));
                    p.setString(5, objuti.NotNull(rs.getString("date2")) + "-" + objuti.NotNull(rs.getString("month2")) + "-" + objuti.NotNull(rs.getString("year2")));
                    //p.setString(5, objuti.NotNull(rs.getString("date_out")));
                    p.setString(6, objuti.NotNull(rs.getString("time_out")));
                    p.setString(7, objuti.NotNull(rs.getString("cred_name")));
                    p.setString(8, objuti.NotNull(rs.getString("prod_code")));
                    p.setString(9, objuti.NotNull(rs.getString("prod_name")));
                    p.setString(10, objuti.NotNull(rs.getString("load_in")));
                    p.setString(11, objuti.NotNull(rs.getString("load_out")));
                    p.setString(12, objuti.NotNull(rs.getString("net_wght")));
                    p.setString(13, objuti.NotNull(rs.getString("cost_unt")));
                    p.setString(14, objuti.NotNull(rs.getString("date1")));
                    p.setString(15, objuti.NotNull(rs.getString("month1")));
                    p.setString(16, objuti.NotNull(rs.getString("year1")));
                    p.setTimestamp(17, timestamp);
                    p.setString(18, "System Import");
                    p.setString(19, objuti.NotNull(rs.getString("date1")) + "-" + objuti.NotNull(rs.getString("month1")) + "-" + objuti.NotNull(rs.getString("year1")));
                    p.setString(20, objuti.NotNull(rs.getString("date1")) + "-" + objuti.NotNull(rs.getString("month1")) + "-" + objuti.NotNull(rs.getString("year1")));
                    p.setString(21, objuti.NotNull(rs.getString("time_in")));
                    p.setString(22, objuti.NotNull(rs.getString("date2")));
                    p.setString(23, objuti.NotNull(rs.getString("month2")));
                    p.setString(24, objuti.NotNull(rs.getString("year2")));
                    p.setString(25, objuti.NotNull(rs.getString("cred_code")));
                    p.setString(26, objuti.NotNull(rs.getString("cred_group")));

                    if (process_for.equalsIgnoreCase("CASAVA")) {

                        if (rs.getString("cred_group").trim().equals("ชาวไร่")) {
                            System.out.println(rs.getString("cred_group") + "1");
                            p.setString(27, "1");
                        } else if (rs.getString("cred_group").trim().equals("มันลาน")) {
                            System.out.println(rs.getString("cred_group") + "2");
                            p.setString(27, "2");
                        } else if (rs.getString("cred_group").trim().equals("อคส")) {
                            System.out.println(rs.getString("cred_group") + "3");
                            p.setString(27, "3");                                                //} else if (rs.getString("cust_group").trim().equals("")) {
                        } else {
                            System.out.println("-" + "4");
                            p.setString(27, "-");
                        }
                    } else {
                        p.setString(27, "-");
                    }

                    p.executeUpdate();
                } else {
                    String sql2 = "update " + table_d + " set ticket_text=?,truck_no=?,date_in=?,time_in=?,date_out=?"
                            //+ ",time_out=?,cred_name=?,prod_code=?,prod_name=?,load_in=?,load_out=?,net_wght=?,cost_unt=?,date1=?,month1=?,year1=?"
                            + ",time_out=?,cred_name=?,prod_code=?,prod_name=?,load_in=?,load_out=?,net_wght=?,date1=?,month1=?,year1=?,date2=?,month2=?,year2=?"
                            + ",update_date=?,update_by=?,cred_code=?,cred_group=?,supply_type_id=?"
                            + " where ticket_text = '" + rs.getString("ticket_text") + "'";
                    System.out.println("sql2 = " + sql2);
                    PreparedStatement p = null;
                    p = con_postgress.prepareStatement(sql2);
                    p.setString(1, objuti.NotNull(rs.getString("ticket_text")));
                    p.setString(2, objuti.NotNull(rs.getString("truck_no")));
                    p.setString(3, objuti.NotNull(rs.getString("date1")) + "-" + objuti.NotNull(rs.getString("month1")) + "-" + objuti.NotNull(rs.getString("year1")));
                    //p.setString(3, objuti.NotNull(rs.getString("date_in")));                    
                    p.setString(4, objuti.NotNull(rs.getString("time_in")));
                    p.setString(5, objuti.NotNull(rs.getString("date2")) + "-" + objuti.NotNull(rs.getString("month2")) + "-" + objuti.NotNull(rs.getString("year2")));
                    //p.setString(5, objuti.NotNull(rs.getString("date_out")));
                    p.setString(6, objuti.NotNull(rs.getString("time_out")));
                    p.setString(7, objuti.NotNull(rs.getString("cred_name")));
                    p.setString(8, objuti.NotNull(rs.getString("prod_code")));
                    p.setString(9, objuti.NotNull(rs.getString("prod_name")));
                    p.setString(10, objuti.NotNull(rs.getString("load_in")));
                    p.setString(11, objuti.NotNull(rs.getString("load_out")));
                    p.setString(12, objuti.NotNull(rs.getString("net_wght")));
                    //p.setString(13, objuti.NotNull(rs.getString("cost_unt")));                        
                    p.setString(13, objuti.NotNull(rs.getString("date1")));
                    p.setString(14, objuti.NotNull(rs.getString("month1")));
                    p.setString(15, objuti.NotNull(rs.getString("year1")));
                    p.setString(16, objuti.NotNull(rs.getString("date2")));
                    p.setString(17, objuti.NotNull(rs.getString("month2")));
                    p.setString(18, objuti.NotNull(rs.getString("year2")));
                    p.setTimestamp(19, timestamp);
                    p.setString(20, "System Import");
                    p.setString(21, objuti.NotNull(rs.getString("cred_code")));
                    p.setString(22, objuti.NotNull(rs.getString("cred_group")));

                    if (process_for.equalsIgnoreCase("CASAVA")) {

                        if (rs.getString("cred_group").trim().equals("ชาวไร่")) {
                            System.out.println(rs.getString("cred_group") + "1");
                            p.setString(23, "1");
                        } else if (rs.getString("cred_group").trim().equals("มันลาน")) {
                            System.out.println(rs.getString("cred_group") + "2");
                            p.setString(23, "2");
                        } else if (rs.getString("cred_group").trim().equals("อคส")) {
                            System.out.println(rs.getString("cred_group") + "3");
                            p.setString(23, "3");
                            //} else if (rs.getString("cred_group").trim().equals("")) {
                        } else {
                            System.out.println("-" + "4");
                            p.setString(23, "-");
                        }
                    } else {
                        p.setString(23, "-");
                    }

                    p.executeUpdate();

                }

                i++;
            }
            System.out.println("End Process ::: " + timestamp);

        } catch (Exception e) {
            e.printStackTrace(System.out);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (con_mysql != null) {
                con_mysql.close();
            }
        }

    }
}
