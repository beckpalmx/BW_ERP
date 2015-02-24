/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bw.Calculator;

import com.bw.DB.DBConnect;
import com.bw.Util.UtiDatabase;
import java.sql.Connection;
import java.sql.ResultSet;

/**
 *
 * @author B
 */
public class Calculator_BW {

    UtiDatabase objuti;

    public String Sum_Weight(String Search_doc_id, String Table_name, String Sum_Column_name, Connection con) throws Exception {
        String STR_Return = "";
        objuti = new UtiDatabase();
        ResultSet rs = null;

        try {
            if (objuti.numRowdatabase("SELECT count(doc_id) as num from " + Table_name + " WHERE doc_id = '" + Search_doc_id + "' AND delete_flag = 'N' AND complete_flag = 'N'") != 0) {

                String SQL_SUM = "SELECT trim(to_char(sum(to_number(" + Sum_Column_name + ",'99999999999990.000')),'99999999999990.000')) as total FROM "
                        + Table_name + " WHERE doc_id = '" + Search_doc_id + "' AND delete_flag = 'N' AND complete_flag = 'N'";
                
                System.out.println("SQL_SUM = " + SQL_SUM);

                rs = con.createStatement().executeQuery(SQL_SUM);

                while (rs.next()) {
                    STR_Return = rs.getString("total");
                }
            } else {
                STR_Return = "0.000";
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs = null;
            }
            return STR_Return;
        }
    }
    //-------------------------------------รวมน้กหนักหน้าผลิตประจำวันBW_CS_030_21

    public String Sum_Weight(String Search_doc_id, String line_no, String Table_name, String Sum_Column_name, Connection con) throws Exception {
        String STR_Return = "";
        objuti = new UtiDatabase();
        ResultSet rs = null;

        try {
            if (objuti.numRowdatabase("SELECT count(doc_id) as num from " + Table_name + " WHERE doc_id = '" + Search_doc_id + "' and doc_line_no = '" + line_no + "' AND delete_flag = 'N' AND complete_flag = 'N'") != 0) {
                rs = con.createStatement().executeQuery("SELECT trim(to_char(sum(to_number(" + Sum_Column_name + ",'99999999999990.000')),'99999999999990.000')) as total FROM "
                        + Table_name + " "
                        + "WHERE doc_id = '" + Search_doc_id + "' AND doc_line_no = '" + line_no + "' AND delete_flag = 'N' AND complete_flag = 'N'");
                System.out.println("Table_name = " + Table_name);
                while (rs.next()) {
                    STR_Return = rs.getString("total");
                }
            } else {
                STR_Return = "0.000";
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs = null;
            }
            return STR_Return;
        }
    }

    public String Sum_Time(String Search_doc_id, String Table_name, String date_from, String date_to, String time_from, String time_to, Connection con) throws Exception {
        String STR_Return = "";
        objuti = new UtiDatabase();
        ResultSet rs = null;

        try {
            if (objuti.numRowdatabase("SELECT count(doc_id) as num from " + Table_name + " WHERE doc_id = '" + Search_doc_id + "'  AND delete_flag = 'N' AND complete_flag = 'N'") != 0) {
                rs = con.createStatement().executeQuery("SELECT trim(to_char(to_number(to_char(sum((to_timestamp(format_date(" + date_to + ")|| ':' || " + time_to + ",'YYYY-MM-DD:HH24.MI') - to_timestamp(format_date(" + date_from + ")|| ':' || " + time_from + ",'YYYY-MM-DD:HH24.MI'))),'DDD'),'999')*24.00 + "
                        + "(to_number(to_char(sum((to_timestamp( format_date(" + date_to + ")|| ':' ||" + time_to + ",'YYYY-MM-DD:HH24.MI') - to_timestamp( format_date(" + date_from + ")|| ':' || " + time_from + ",'YYYY-MM-DD:HH24.MI'))),'HH24.MI'),'00.00')),'99999900.00')) as total FROM "
                        + Table_name + " "
                        + "WHERE doc_id = '" + Search_doc_id + "'  AND delete_flag = 'N' AND complete_flag = 'N'");
                System.out.println("Table_name = " + Table_name);
                while (rs.next()) {
                    STR_Return = rs.getString("total");
                }
            } else {
                STR_Return = "00.00";
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs = null;
            }
            return STR_Return;
        }
    }

    public String Diff_time(String Time_from, String Time_to) {
        String out_put_diff;
        if (Time_from.equals("") || Time_to.equals("")) {
            out_put_diff = "00.00";
        } else {
            String[] array_Time_from = Time_from.split("\\.");
            String[] array_Time_to = Time_to.split("\\.");

            int hh_from = Integer.parseInt(array_Time_from[0]);
            int min_from = Integer.parseInt(array_Time_from[1]);
            int hh_to = Integer.parseInt(array_Time_to[0]);
            int min_to = Integer.parseInt(array_Time_to[1]);
            int hh_out = 0;
            int min_out = 0;
            if (min_to < min_from) {
                hh_to -= 1;
                min_out = (min_to + 60) - min_from;
                hh_out = hh_to - hh_from;
            } else {
                min_out = min_to - min_from;
                hh_out = hh_to - hh_from;
            }
            out_put_diff = hh_out < 10 ? "0" + Integer.toString(hh_out) + "." : Integer.toString(hh_out) + ".";
            out_put_diff += min_out < 10 ? "0" + Integer.toString(min_out) : Integer.toString(min_out);
        }

        return out_put_diff;
    }
}
