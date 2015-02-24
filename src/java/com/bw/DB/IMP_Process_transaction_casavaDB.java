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
import java.text.*;

/**
 *
 * @author ball
 */
public class IMP_Process_transaction_casavaDB {

    UtiDatabase objuti;

    public void generater_transaction_casava_process(String date_from, String date_to, String process_id, String table, String doc_type, String r, String username) throws Exception {
        String Str_Writer = "", SQL = null, percent_ref = "0.00";
        //DBConnect objcon = new DBConnect();
        Connection con_mysql = new DBConnect().openNewConnectionMySQL();
        Connection con_postgress = new DBConnect().openNewConnection();
        ResultSet rs = null;
        objuti = new UtiDatabase();

        java.util.Date date = new java.util.Date();
        System.out.println(new Timestamp(date.getTime()));
        java.sql.Timestamp timestamp = new java.sql.Timestamp(date.getTime());

        System.out.println(date_from + " - " + date_to);

        String SQL_Search, SQL_Search_Rec = "";

        try {

            //SQL = "select ticket_text,truck_no,date_in,time_in,date_out,time_out,load_in,load_out,net_wght,cred_name,prod_code,prod_name"
            SQL = "select * "
                    + ",substring(Date_In,1,2) as date1,substring(Date_In,4,2) as month1,(cast(substring(Date_In,7,4) as SIGNED )+543) as year1"
                    + ",substring(Date_Out,1,2) as date2,substring(Date_Out,4,2) as month2,(cast(substring(Date_Out,7,4) as SIGNED )+543) as year2"
                    //+ ",cost_unt,cred_code,cred_group"
                    + " from ticketbuy"
                    + " where ticket_text <> '' and (prod_code = '01') and "
                    + " str_to_date(date_in,'%d/%m/%Y')"
                    + " between str_to_date('" + objuti.Format_Date_For_Mysql(date_from) + "','%d-%m-%Y') and  str_to_date('" + objuti.Format_Date_For_Mysql(date_to) + "','%d-%m-%Y')"
                    + " order by ticket ";

            System.out.println("SQL = " + SQL);
            rs = con_mysql.createStatement().executeQuery(SQL);
            int i = 6;
            while (rs.next()) {

                SQL_Search = "Select Count(doc_id) As num from  d_rawmatt_receive where doc_id ='" + rs.getString("ticket_text") + "' and delete_flag <> 'Y'  ";
                int a = objuti.numRowdatabase(SQL_Search);
                double d_breake_val = 0.00;
                String s_breake_val = "";

                if (a == 0) {
                    String sql1 = "insert into d_rawmatt_receive (doc_id,car_no,car_date_in,car_time_in,car_date_out"
                            + ",car_time_out,supplier_id,product_id,car_in_weight,car_out_weight,total_weight,price_accept,price_ref"
                            + ",percent_1,percent_2,percent_3,percent_4,percent_5,percent_6,percent_7,percent_8,percent_avg"
                            + ",brake_value,brake_income"
                            + ",soil_deduct,contamination_deduct,other_deduct,dump_deduct"
                            + ",deduct_weight,balance_weight,total_payment,amount_payment,amount_deduct,remark"
                            + ",supplyer_type"
                            //+ ",create_date"
                            + ",create_by,doc_date,doc_time,wh_in,pc_ref)"
                            + " values (?,?,?,?,? ,?,?,?,?,? ,?,?,?,?,? ,?,?,?,?,? ,?,?,?,?,? ,?,?,?,?,? ,?,?,?,?,? ,?,?,?,?,?)";
                    //System.out.println("sql1 = " + sql1);
                    PreparedStatement p = null;
                    p = con_postgress.prepareStatement(sql1);
                    p.setString(1, objuti.NotNull(rs.getString("ticket_text")));
                    p.setString(2, objuti.NotNull(rs.getString("truck_no")));
                    p.setString(3, objuti.NotNull(rs.getString("date1")) + "-" + objuti.NotNull(rs.getString("month1")) + "-" + objuti.NotNull(rs.getString("year1")));
                    p.setString(4, objuti.NotNull(rs.getString("time_in")));
                    p.setString(5, objuti.NotNull(rs.getString("date2")) + "-" + objuti.NotNull(rs.getString("month2")) + "-" + objuti.NotNull(rs.getString("year2")));
                    p.setString(6, objuti.NotNull(rs.getString("time_out")));
                    p.setString(7, objuti.NotNull(rs.getString("cred_code")));
                    //p.setString(8, objuti.NotNull(rs.getString("prod_code")));
                    p.setString(8, "001");
                    p.setString(9, objuti.NotNull(rs.getString("load_in")));
                    p.setString(10, objuti.NotNull(rs.getString("load_out")));
                    p.setString(11, objuti.NotNull(rs.getString("net_wght")));
                    p.setString(12, objuti.NotNull(rs.getString("cost_unt")));
                    p.setString(13, objuti.NotNull(rs.getString("priceref")));
                    p.setString(14, objuti.NotNull(rs.getString("percen1")));
                    p.setString(15, objuti.NotNull(rs.getString("percen2")));
                    p.setString(16, objuti.NotNull(rs.getString("percen3")));
                    p.setString(17, objuti.NotNull(rs.getString("percen4")));
                    p.setString(18, objuti.NotNull(rs.getString("percen5")));
                    p.setString(19, objuti.NotNull(rs.getString("percen6")));
                    p.setString(20, objuti.NotNull(rs.getString("percen7")));
                    p.setString(21, objuti.NotNull(rs.getString("percen8")));

                    percent_ref = objuti.NotNull(rs.getString("percen"));
                    
                    System.out.println("percent = " + rs.getString("percen"));
                    
                    if (percent_ref.indexOf('.') != -1) {
                        p.setString(22, percent_ref);
                        System.out.println("1 percent_ref = " + percent_ref);
                    } else {
                        p.setString(22, percent_ref + ".00");
                        System.out.println("2 percent_ref = " + percent_ref);
                    }                    

                    System.out.println("Ticket Text = " + rs.getString("ticket_text"));

                    d_breake_val = Double.parseDouble(rs.getString("cost_break")) * 100;
                    s_breake_val = Double.toString(d_breake_val);
                    String[] Str_Cond = new String[2];
                    int x = 0;
                    for (String retval : s_breake_val.split("\\.", 2)) {

                        Str_Cond[x] = retval;
                        if (x == 0) {
                            s_breake_val = retval;
                            System.out.println("Insert XXX s_breake_val = " + s_breake_val);
                        }

                        //System.out.println("value = " + x + " : " + Str_Cond[x]);
                        x++;
                    }
                    System.out.println("Insert YYY s_breake_val = " + s_breake_val);

                    p.setString(23, (s_breake_val));

                    p.setString(24, objuti.NotNull(rs.getString("break")));
                    p.setString(25, objuti.NotNull(rs.getString("delground1")));
                    p.setString(26, objuti.NotNull(rs.getString("delmixer1")));
                    p.setString(27, objuti.NotNull(rs.getString("delother1")));
                    p.setString(28, objuti.NotNull(rs.getString("dump")));
                    p.setString(29, objuti.NotNull(rs.getString("totalcut")));
                    p.setString(30, objuti.NotNull(rs.getString("net_wght1")));
                    p.setString(31, objuti.NotNull(rs.getString("buynet")));
                    p.setString(32, objuti.NotNull(rs.getString("buynet1")));
                    p.setString(33, objuti.NotNull(rs.getString("totalcut_price")));
                    //p.setString(34, "Invoice No : " + objuti.NotNull(rs.getString("invoice_no")));
                    p.setString(34, "-");

                    if (rs.getString("cred_group").trim().equals("ชาวไร่")) {
                        //System.out.println(rs.getString("cred_group") + "1");
                        p.setString(35, "1");
                    } else if (rs.getString("cred_group").trim().equals("มันลาน")) {
                        //System.out.println(rs.getString("cred_group") + "2");
                        p.setString(35, "2");
                    } else if (rs.getString("cred_group").trim().equals("อคส")) {
                        //System.out.println(rs.getString("cred_group") + "3");
                        p.setString(35, "3");
                        //} else if (rs.getString("cred_group").trim().equals("")||rs.getString("cred_group").trim()==null) {
                    } else {
                        //System.out.println("-" + "4");
                        p.setString(35, "-");
                    }

                    System.out.println("Insert Timestamp = " + timestamp);

                    //p.setTimestamp(36, timestamp);
                    p.setString(36, "System Import");
                    //p.setString(38, objuti.NotNull(rs.getString("date1")) + "-" + objuti.NotNull(rs.getString("month1")) + "-" + objuti.NotNull(rs.getString("year1")));
                    p.setString(37, objuti.NotNull(rs.getString("date1")) + "-" + objuti.NotNull(rs.getString("month1")) + "-" + objuti.NotNull(rs.getString("year1")));
                    p.setString(38, objuti.NotNull(rs.getString("time_in")));
                    p.setString(39, "W001");
                    p.setString(40, "34");
                    p.executeUpdate();
                } else {
                    String sql2 = "update d_rawmatt_receive set doc_id=?,car_no=?,car_date_in=?,car_time_in=?,car_date_out=?"
                            + ",car_time_out=?,supplier_id=?,product_id=?,car_in_weight=?,car_out_weight=?,total_weight=?,price_accept=?,price_ref=?"
                            + ",percent_1=?,percent_2=?,percent_3=?,percent_4=?,percent_5=?,percent_6=?,percent_7=?,percent_8=?,percent_avg=?"
                            + ",brake_value=?,brake_income=?"
                            + ",soil_deduct=?,contamination_deduct=?,other_deduct=?,dump_deduct=?"
                            + ",deduct_weight=?,balance_weight=?,total_payment=?,amount_payment=?,amount_deduct=?,remark=?"
                            + ",supplyer_type=?"
                            //+ ",update_date=?"
                            + ",update_by=?,doc_date=?,doc_time=?,wh_in=?,pc_ref=?"
                            + " where doc_id = '" + rs.getString("ticket_text") + "'";
                    System.out.println("sql2 = " + sql2);
                    PreparedStatement p = null;
                    p = con_postgress.prepareStatement(sql2);
                    p.setString(1, objuti.NotNull(rs.getString("ticket_text")));
                    p.setString(2, objuti.NotNull(rs.getString("truck_no")));
                    p.setString(3, objuti.NotNull(rs.getString("date1")) + "-" + objuti.NotNull(rs.getString("month1")) + "-" + objuti.NotNull(rs.getString("year1")));
                    p.setString(4, objuti.NotNull(rs.getString("time_in")));
                    p.setString(5, objuti.NotNull(rs.getString("date2")) + "-" + objuti.NotNull(rs.getString("month2")) + "-" + objuti.NotNull(rs.getString("year2")));
                    p.setString(6, objuti.NotNull(rs.getString("time_out")));
                    p.setString(7, objuti.NotNull(rs.getString("cred_code")));
                    //p.setString(8, objuti.NotNull(rs.getString("prod_code")));
                    p.setString(8, "001");
                    p.setString(9, objuti.NotNull(rs.getString("load_in")));
                    p.setString(10, objuti.NotNull(rs.getString("load_out")));
                    p.setString(11, objuti.NotNull(rs.getString("net_wght")));
                    p.setString(12, objuti.NotNull(rs.getString("cost_unt")));
                    p.setString(13, objuti.NotNull(rs.getString("priceref")));
                    p.setString(14, objuti.NotNull(rs.getString("percen1")));
                    p.setString(15, objuti.NotNull(rs.getString("percen2")));
                    p.setString(16, objuti.NotNull(rs.getString("percen3")));
                    p.setString(17, objuti.NotNull(rs.getString("percen4")));
                    p.setString(18, objuti.NotNull(rs.getString("percen5")));
                    p.setString(19, objuti.NotNull(rs.getString("percen6")));
                    p.setString(20, objuti.NotNull(rs.getString("percen7")));
                    p.setString(21, objuti.NotNull(rs.getString("percen8")));

                    percent_ref = objuti.NotNull(rs.getString("percen"));
                    
                    System.out.println("percent = " + rs.getString("percen"));
                    
                    if (percent_ref.indexOf('.') != -1) {
                        p.setString(22, percent_ref);
                        System.out.println("1 percent_ref = " + percent_ref);
                    } else {
                        p.setString(22, percent_ref + ".00");
                        System.out.println("2 percent_ref = " + percent_ref);
                    }                    

                    System.out.println("Ticket Text = " + rs.getString("ticket_text"));

                    d_breake_val = Double.parseDouble(rs.getString("cost_break")) * 100;
                    s_breake_val = Double.toString(d_breake_val);
                    String[] Str_Cond = new String[2];
                    int x = 0;
                    for (String retval : s_breake_val.split("\\.", 2)) {

                        Str_Cond[x] = retval;
                        if (x == 0) {
                            s_breake_val = retval;
                            System.out.println("Update XXX s_breake_val = " + s_breake_val);
                        }

                        //System.out.println("value = " + x + " : " + Str_Cond[x]);
                        x++;
                    }
                    System.out.println("Update YYY s_breake_val = " + s_breake_val);

                    p.setString(23, (s_breake_val));

                    p.setString(24, objuti.NotNull(rs.getString("break")));
                    p.setString(25, objuti.NotNull(rs.getString("delground1")));
                    p.setString(26, objuti.NotNull(rs.getString("delmixer1")));
                    p.setString(27, objuti.NotNull(rs.getString("delother1")));
                    p.setString(28, objuti.NotNull(rs.getString("dump")));
                    p.setString(29, objuti.NotNull(rs.getString("totalcut")));
                    p.setString(30, objuti.NotNull(rs.getString("net_wght1")));
                    p.setString(31, objuti.NotNull(rs.getString("buynet")));
                    p.setString(32, objuti.NotNull(rs.getString("buynet1")));
                    p.setString(33, objuti.NotNull(rs.getString("totalcut_price")));
                    //p.setString(34, "Invoice No : " + objuti.NotNull(rs.getString("invoice_no")));
                    p.setString(34, "-");

                    if (rs.getString("cred_group").trim().equals("ชาวไร่")) {
                        System.out.println(rs.getString("cred_group") + "1");
                        p.setString(35, "1");
                    } else if (rs.getString("cred_group").trim().equals("มันลาน")) {
                        System.out.println(rs.getString("cred_group") + "2");
                        p.setString(35, "2");
                    } else if (rs.getString("cred_group").trim().equals("อคส")) {
                        System.out.println(rs.getString("cred_group") + "3");
                        p.setString(35, "3");
                        //} else if (rs.getString("cred_group").trim().equals("")||rs.getString("cred_group").trim()==null) {
                    } else {
                        System.out.println("-" + "4");
                        p.setString(35, "-");
                    }
                    System.out.println("Update Timestamp = " + timestamp);
                    //p.setTimestamp(36, timestamp);
                    p.setString(36, "System Import");
                    //p.setString(38, objuti.NotNull(rs.getString("date1")) + "-" + objuti.NotNull(rs.getString("month1")) + "-" + objuti.NotNull(rs.getString("year1")));
                    p.setString(37, objuti.NotNull(rs.getString("date1")) + "-" + objuti.NotNull(rs.getString("month1")) + "-" + objuti.NotNull(rs.getString("year1")));
                    p.setString(38, objuti.NotNull(rs.getString("time_in")));
                    p.setString(39, "W001");
                    p.setString(40, "34");
                    p.executeUpdate();

                }

                i++;
            }
            System.out.println("End Process ::: " + timestamp);

        } catch (Exception e) {
            e.printStackTrace();
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
