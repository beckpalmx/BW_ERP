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
import com.bw.Util.Decimal_Place;

/**
 *
 * @author ball
 */
public class Process_Calculate_TransactionDB {

    UtiDatabase objuti;

    public void generater_transaction_process(String date_from, String date_to, String process_id, String table, String doc_type, String r, String username, String process_for) throws Exception {

        String SQL = null;
        DBConnect dbConnect = new DBConnect();
        ResultSet rs = null;
        Connection con = dbConnect.openNewConnection();
        PreparedStatement p = null;

        java.util.Date date = new java.util.Date();
        System.out.println(new Timestamp(date.getTime()));
        java.sql.Timestamp timestamp = new java.sql.Timestamp(date.getTime());

        System.out.println(date_from + " - " + date_to);

        String[] percent_avg_array = new String[2];
        String[] amount_tapioca_array = new String[2];
        String s_percent_avg = "0";
        String SQL_Update = "";
        String s_amount_tapioca = "0";

        try {

            SQL = "select runno,doc_id,doc_date,percent_avg,balance_weight,amount_tapioca,delete_flag from " + table
                    + " where delete_flag = 'N'"
                    + " and to_date(format_date(doc_date),'YYYY-MM-DD') between to_date(format_date2('" + date_from + "'),'YYYY-MM-DD') AND to_date(format_date2('" + date_to + "'),'YYYY-MM-DD')";
            System.out.println("SQL = " + SQL);

            rs = con.createStatement().executeQuery(SQL);
            while (rs.next()) {
                percent_avg_array = rs.getString("percent_avg").split("\\.");
                System.out.print(" Runno = " + rs.getInt("runno"));
                System.out.print(" percent_avg = " + rs.getString("percent_avg"));
                System.out.print(" 1 Decimal = " + (percent_avg_array[0]));
                System.out.print(" 2 Decimal = " + (percent_avg_array[1]));
                System.out.println(" 3 Decimal = " + Decimal_Place.Decimal_position(Integer.parseInt(percent_avg_array[1])));
                
                if (percent_avg_array[1].substring(0, 1).equals("0")) {
                    s_percent_avg = percent_avg_array[0] + ".00";
                } else {
                    s_percent_avg = percent_avg_array[0] + "." + Integer.toString(Decimal_Place.Decimal_position(Integer.parseInt(percent_avg_array[1])));
                }

                System.out.print(" balance_weight = " + rs.getDouble("balance_weight"));
                System.out.print(" s_percent_avg = " + s_percent_avg);

                double amount_tapioca = (rs.getDouble("balance_weight") * Double.parseDouble(s_percent_avg)) / 100;                
                
                System.out.println("A amount_tapioca = " + amount_tapioca);
                
                amount_tapioca = Math.round(amount_tapioca);
                
                System.out.println("B amount_tapioca = " + amount_tapioca);
                
                //amount_tapioca_array  = Double.toString(amount_tapioca).split("\\.");
                
              //if (amount_tapioca_array[1].substring(0, 1).equals("0")) {
//                    s_amount_tapioca = amount_tapioca_array[0] + ".00";
//                } else {
//                    s_amount_tapioca = amount_tapioca_array[0] + Integer.toString(Decimal_Place.Decimal_position(Integer.parseInt(amount_tapioca_array[1])));
//                }                
                

                //System.out.print(" amount_tapioca = " + rs.getDouble("amount_tapioca"));

                /* Update Percent ของ แป้งที่ซื้อ */
                SQL_Update = " Update " + table + " set "
                        + "percent_tapioca = '" + s_percent_avg
                        + "',amount_tapioca = '" + Double.toString(amount_tapioca)
                        + "',doc_type='U' "
                        + " where runno = " + rs.getInt("runno");
                System.out.println("SQL_Update = " + SQL_Update);
                p = con.prepareStatement(SQL_Update);
                p.executeUpdate();
            }

            System.out.println("End Process ::: " + timestamp);

        } catch (Exception e) {
            e.printStackTrace(System.out);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (con != null) {
                con.close();
            }
        }

    }
}
