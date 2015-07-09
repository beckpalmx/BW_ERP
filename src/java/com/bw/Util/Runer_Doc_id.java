/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bw.Util;

import com.bw.DB.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/**
 *
 * @author B
 */
public class Runer_Doc_id {

    //vd_running_doc_id เป็น Table ที่ใช้สำหรับ เป็น running เอกสารของระบบ ของแต่ละ screen ว่า run ถึงเอกสารใดแล้ว
    //<editor-fold defaultstate="collapsed" desc="running ที่เอาเฉพาะ table">
    public String Run_id(String Table_name_Header) throws Exception {
        Connection con = new DBConnect().openNewConnection();
        UtiDatabase objuti = new UtiDatabase();
        String return_str = "", mem_rs = "", mem_date_now = "", SQL1 = "";
        mem_date_now = Return_Date_Now();
        SQL1 = "Select count(doc_id) as num from " + Table_name_Header + " where doc_id like '" + mem_date_now + "%' and delete_flag = 'N' ";

        try {
            if (objuti.numRowdatabase(SQL1) != 0) {
                mem_rs = Return_Doc_id(Table_name_Header, con);
                return_str = Return_Format_id(mem_rs);
            } else {
                return_str = mem_date_now + "-0001";
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {

            if (con != null) {
                con.close();
            }
        }
        return return_str;
    }

    //</editor-fold>
    //<editor-fold defaultstate="collapsed" desc="running ที่เอาเฉพาะ table และ วันที่">
    //วันที่ = วัน-เดือน-ปี(ไทย)
    public String Run_id(String Table_name_Header, String Date_Input) throws Exception {
        Connection con = new DBConnect().openNewConnection();
        UtiDatabase objuti = new UtiDatabase();
        String return_str = "", mem_rs = "", mem_date_now = "", SQL1 = "";
        mem_date_now = Format_Date_Thai(Date_Input);
        SQL1 = "Select count(doc_id) as num from " + Table_name_Header + " where doc_id like '" + mem_date_now + "%' ";
        System.out.println("SQL1 = " + SQL1);
        try {
            if (objuti.numRowdatabase(SQL1) != 0) {
                mem_rs = Return_Doc_id(Table_name_Header, mem_date_now, con);
                return_str = Return_Format_id(mem_rs);
            } else {
                return_str = mem_date_now + "-0001";
            }
            
            System.out.println("return_str = "  + return_str);
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {

            if (con != null) {
                con.close();
            }
        }
        return return_str;
    }

    //</editor-fold>
    //<editor-fold defaultstate="collapsed" desc="running ที่เอาเฉพาะ รหัสหน้าจอ และ วันที่ และ รหัสย่อแผนกที่ใช้">
    //รหัสย่อแผนกที่ใช้นำมาจาก CS_005
    //รหัสหน้าจอนำมาจาก Screen ID= A_screen_id
    public String Run_id_DB(String screen_id, String doc_date, String dept_id) throws Exception {
        String id = null;
        Connection con = new DBConnect().openNewConnection();
        try {
            id = Query_d_running_doc_id(con, doc_date, Format_Date_Thai(doc_date), dept_id, screen_id);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            con.close();
            return id;
        }
    }

    //</editor-fold>
    //<editor-fold defaultstate="collapsed" desc="return วันที่ ปีเดือนวัน(ไทย)">
    public static String Return_Date_Now() {
        Date date = new Date();
        DateFormat format = new SimpleDateFormat("yyMMdd", new Locale("th", "TH"));
        return format.format(date);
    }

    //</editor-fold>
    //<editor-fold defaultstate="collapsed" desc="return format running">
    //เช่น 550101-0001 = 550101-0002
    public static String Return_Format_id(String last_id) {
        DecimalFormat df = new DecimalFormat("0000");
        String sub_str = last_id.substring(0, 7);
        int sub_runner = Integer.parseInt(last_id.substring(7, 11)) + 1;
        return sub_str + df.format(sub_runner);
    }

    //</editor-fold>
    //<editor-fold defaultstate="collapsed" desc="return รหัสเอกสารที่ต้องการแต่ Table">
    public static String Return_Doc_id(String Table_name_header, Connection con) throws Exception {
        String[] Retrun_header = new String[2];
        String SQL = "", Retrun = "";
        ResultSet rs = null;
        try {
            SQL = "Select to_number(doc_id,'999999-9999') as doc_number,doc_id doc_id from ";
            SQL += Table_name_header;
            SQL += " order by to_number(doc_id,'999999-9999') desc limit 1";
            rs = con.createStatement().executeQuery(SQL);
            while (rs.next()) {
                Retrun = Retrun_header[1] = rs.getString("doc_id");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
        }
        return Retrun;
    }

    //</editor-fold>
    //<editor-fold defaultstate="collapsed" desc="return รหัสเอกสารที่ต้องการแต่ Table และ วันที่">
    public static String Return_Doc_id(String Table_name_header, String Date_Input, Connection con) throws Exception {
        String[] Retrun_header = new String[2];
        String SQL = "", Retrun = "";
        ResultSet rs = null;
        try {
            SQL = "Select to_number(doc_id,'999999-9999') as doc_number,doc_id doc_id from ";
            SQL += Table_name_header;
            SQL += " Where doc_id like '" + Date_Input + "%' order by to_number(doc_id,'999999-9999') desc limit 1";
            rs = con.createStatement().executeQuery(SQL);
            while (rs.next()) {
                Retrun = Retrun_header[1] = rs.getString("doc_id");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
        }
        return Retrun;        
    }

    //</editor-fold>
    //<editor-fold defaultstate="collapsed" desc="แปลงวันที่เป็นไทย">
    //Date_input = วัน-เดือน-ปี exp=>12-01-2555
    public static String Format_Date_Thai(String Date_Input) {
        return Date_Input.substring(8, 10) + Date_Input.substring(3, 5) + Date_Input.substring(0, 2);
    }

    //</editor-fold>
    //<editor-fold defaultstate="collapsed" desc="return รหัสเอกสารที่ต้องการแต่ รหัสย่อแผนก และ วันที่ และรหัสหน้าจอ">
    public String Query_d_running_doc_id(Connection con, String doc_date, String doc_date_format, String dept_id, String screen_id) throws Exception {
        PreparedStatement p = null;
        ResultSet rs = null;
        UtiDatabase objuti = new UtiDatabase();
        String return_string = null, SQL = null;
        try {
            SQL = "select count(*) as num from vd_running_doc_id where run_doc_id = '" + doc_date_format + "' and dp_id = '" + dept_id + "' and m_screen_id = '" + screen_id + "'";
            if (objuti.numRowdatabase(SQL) != 0) {
                SQL = "select format_run_count from vd_running_doc_id where run_doc_id = '" + doc_date_format + "' and dp_id = '" + dept_id + "' and m_screen_id = '" + screen_id + "'";
                rs = con.createStatement().executeQuery(SQL);
                while (rs.next()) {
                    return_string = doc_date_format + "-" + dept_id + "-" + rs.getString("format_run_count");
                }
                p = con.prepareStatement("update d_running_doc_id  set run_count = trim(to_char(to_number(run_count,'9990')+1,'9990')) where run_doc_id = '" + doc_date_format + "' and dp_id = '" + dept_id + "' and m_screen_id = '" + screen_id + "'");
                p.executeUpdate();
            } else {
                p = con.prepareStatement("insert into d_running_doc_id(run_doc_id,run_doc_date,dp_id,run_count,m_screen_id) values(?,?,?,?,?)");
                p.setString(1, doc_date_format);
                p.setString(2, doc_date);
                p.setString(3, dept_id);
                p.setString(4, "1");
                p.setString(5, screen_id);
                p.executeUpdate();
                return_string = doc_date_format + "-" + dept_id + "-0001";
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (p != null) {
                p.close();
            }
            if (rs != null) {
                rs.close();
            }
            return return_string;
        }
    }

    //</editor-fold>
    //<editor-fold defaultstate="collapsed" desc="runing หน้าใบแจ้งการผลิต">
    //****************************runing หน้าใบแจ้งการผลิต********************************************
    public static String Run_id_job(String Table_name_Header, String Doc_date) throws Exception {
        Connection con = new DBConnect().openNewConnection();
        UtiDatabase objuti = new UtiDatabase();
        String return_str = "", mem_date_now = "", SQL1 = "";
        mem_date_now = Return_Format_job_id(Doc_date);
        SQL1 = "Select count(doc_id) as num from " + Table_name_Header + " where doc_id like '%" + mem_date_now + "%' ";
        try {
            if (objuti.numRowdatabase(SQL1) != 0) {
                return_str = Return_job_id(mem_date_now, con) + mem_date_now + "P";
            } else {
                return_str = "01" + mem_date_now + "P";
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                con.close();
            }
        }
        return return_str;
    }

    public static String Return_Date_Now(String string_format_date) {
        Date date = new Date();
        DateFormat format = new SimpleDateFormat(string_format_date);
        return format.format(date);
    }

    private static String Return_Format_job_id(String string_doc_date) {
        return string_doc_date.substring(0, 2) + string_doc_date.substring(3, 5) + string_doc_date.substring(8, 10);
    }

    public static String Return_job_id(String datenow, Connection con) throws Exception {
        String SQL = "", Retrun = "";
        ResultSet rs = null;
        try {
            SQL = "select substring_running(doc_id) as str_runing_job_id "
                    + "from d_job_order_header "
                    + "where doc_id like '%" + datenow + "%' order by runno desc limit 1";
            rs = con.createStatement().executeQuery(SQL);
            while (rs.next()) {
                Retrun = rs.getString("str_runing_job_id");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            return Retrun;
        }
    }
    //************************************************************************

    //</editor-fold>
}
