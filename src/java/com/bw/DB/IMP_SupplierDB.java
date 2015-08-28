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
public class IMP_SupplierDB {

    UtiDatabase objuti;

    public void generater_import_supplier(String date_from, String date_to, String process_id, String table, String doc_type, String r, String username) throws Exception {
        String Str_Writer = "", SQL = null;
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

            SQL = "select * from creditor ";
            System.out.println("SQL = " + SQL);

            rs = con_mysql.createStatement().executeQuery(SQL);

            while (rs.next()) {

                SQL_Search_Rec = "Select Count(supplier_id) As num from  msupplier where supplier_id ='" + objuti.NotNull(rs.getString("code")) + "' and delete_flag <> 'Y'  ";
                int rec_count = objuti.numRowdatabase(SQL_Search_Rec);
                if (rec_count == 0) {

                    System.out.println("SQL rec_count = " + SQL_Search_Rec);
                    System.out.println("rec_count = " + rec_count);

                    String sql_doc = "insert into msupplier (supplier_id,name_t,remark,address1_t,create_date,create_by) values (?,?,?,?,?,?)";

                    PreparedStatement p1 = null;
                    p1 = con_postgress.prepareStatement(sql_doc);
                    p1.setString(1, objuti.NotNull(rs.getString("code")));
                    p1.setString(2, objuti.NotNull(rs.getString("name")));
                    p1.setString(3, objuti.NotNull(rs.getString("id_code")));
                    p1.setString(4, objuti.NotNull(rs.getString("h_no")) + " - "                            
                            + objuti.NotNull(rs.getString("h_mo")) + " "
                            + objuti.NotNull(rs.getString("h_soi")) + " "
                            + objuti.NotNull(rs.getString("h_tb")) + " "
                            + objuti.NotNull(rs.getString("h_ap")) + " "
                            + objuti.NotNull(rs.getString("h_jv")));
                    p1.setTimestamp(5, timestamp);
                    p1.setString(6, "System Import");
                    p1.executeUpdate();
                }
            }
            System.out.println("Supplier End Process ::: " + timestamp);

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
