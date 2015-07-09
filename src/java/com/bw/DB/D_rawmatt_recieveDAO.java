/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bw.DB;

import com.bw.bean.DataBeanD_rawmatt_recieve;
import com.bw.Util.StringQuery;
import com.bw.Util.UtiDatabase;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import com.bw.Util.Decimal_Place;

/**
 *
 * @author B
 */
public class D_rawmatt_recieveDAO {

    private String SQL = "";
    private StringQuery obj_StringQuery;
    private UtiDatabase objuti;

    public void insert(DataBeanD_rawmatt_recieve DataBean) throws Exception {
        String[] String_insert = new String[]{
            "doc_id",
            "doc_date",
            "doc_time",
            "car_no",
            "supplier_id",
            "supplyer_type",
            "car_date_in",
            "car_time_in",
            "car_date_out",
            "car_time_out",
            "potato_type",
            "percent_1",
            "percent_2",
            "percent_3",
            "percent_4",
            "percent_5",
            "percent_6",
            "percent_7",
            "percent_8",
            "percent_avg",
            "pc_ref",
            "price_ref",
            "price_accept",
            "soil_deduct",
            "contamination_deduct",
            "other_deduct",
            "dump_deduct",
            "brake_income",
            "product_id",
            "wh_in",
            "car_in_weight",
            "car_out_weight",
            "total_weight",
            "deduct_weight",
            "balance_weight",
            "total_payment",
            "amount_deduct",
            "amount_payment",
            "remark",
            "reporter_id",
            "checker_id",
            "approve_id",
            "create_by",
            "create_date",
            "brake_value",
            "percent_tapioca",
            "amount_tapioca",
            "complete_flag"                
        };
        obj_StringQuery = new StringQuery();
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        PreparedStatement p = null;
        UtiDatabase objuti = new UtiDatabase();
        int i = 1;
        try {
            p = con.prepareStatement(obj_StringQuery.Insert_String(String_insert, "d_rawmatt_receive"));
            p.setString(i, DataBean.getDoc_id());
            i += 1;
            p.setString(i, DataBean.getDoc_date());
            i += 1;
            p.setString(i, DataBean.getDoc_time());
            i += 1;
            p.setString(i, DataBean.getCar_no());
            i += 1;
            p.setString(i, DataBean.getSupplier_id());
            i += 1;
            p.setString(i, DataBean.getSupplyer_type());
            i += 1;
            p.setString(i, DataBean.getCar_date_in());
            i += 1;
            p.setString(i, DataBean.getCar_time_in());
            i += 1;
            p.setString(i, DataBean.getCar_date_out());
            i += 1;
            p.setString(i, DataBean.getCar_time_out());
            i += 1;
            p.setString(i, DataBean.getPotato_type());
            i += 1;
            p.setString(i, objuti.NotNull(DataBean.getPercent_1(), "0"));
            i += 1;
            p.setString(i, objuti.NotNull(DataBean.getPercent_2(), "0"));
            i += 1;
            p.setString(i, objuti.NotNull(DataBean.getPercent_3(), "0"));
            i += 1;
            p.setString(i, objuti.NotNull(DataBean.getPercent_4(), "0"));
            i += 1;
            p.setString(i, objuti.NotNull(DataBean.getPercent_5(), "0"));
            i += 1;
            p.setString(i, objuti.NotNull(DataBean.getPercent_6(), "0"));
            i += 1;
            p.setString(i, objuti.NotNull(DataBean.getPercent_7(), "0"));
            i += 1;
            p.setString(i, objuti.NotNull(DataBean.getPercent_8(), "0"));
            i += 1;
            p.setString(i, DataBean.getPercent_avg());
            i += 1;
            p.setString(i, DataBean.getPc_ref());
            i += 1;
            p.setString(i, DataBean.getPrice_ref());
            i += 1;
            p.setString(i, DataBean.getPrice_accept());
            i += 1;
            p.setString(i, DataBean.getSoil_deduct());
            i += 1;
            p.setString(i, DataBean.getContamination_deduct());
            i += 1;
            p.setString(i, DataBean.getOther_deduct());
            i += 1;
            p.setString(i, DataBean.getDump_deduct());
            i += 1;
            p.setString(i, DataBean.getBrake_income());
            i += 1;
            p.setString(i, DataBean.getProduct_id());
            i += 1;
            p.setString(i, DataBean.getWh_in());
            i += 1;
            p.setString(i, DataBean.getCar_in_weight());
            i += 1;
            p.setString(i, DataBean.getCar_out_weight());
            i += 1;
            p.setString(i, DataBean.getTotal_weight());
            i += 1;
            p.setString(i, DataBean.getDeduct_weight());
            i += 1;
            p.setString(i, DataBean.getBalance_weight());
            i += 1;
            p.setString(i, DataBean.getTotal_payment());
            i += 1;
            p.setString(i, DataBean.getAmount_deduct());
            i += 1;
            p.setString(i, DataBean.getAmount_payment());
            i += 1;
            p.setString(i, DataBean.getRemark());
            i += 1;
            p.setString(i, DataBean.getReporter_id());
            i += 1;
            p.setString(i, DataBean.getChecker_id());
            i += 1;
            p.setString(i, DataBean.getApprove_id());
            i += 1;
            p.setString(i, DataBean.getBy());
            i += 1;
            p.setTimestamp(i, DataBean.getDate());
            i += 1;
            p.setString(i, DataBean.getBrake_value());
            i += 1;
            p.setString(i, DataBean.getPercent_tapioca());
            i += 1;
            p.setString(i, DataBean.getAmount_tapioca());
            i += 1;
            p.setString(i, DataBean.getComplete_flag());
            i += 1;            
            p.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (p != null) {
                p.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }

    public void update(DataBeanD_rawmatt_recieve DataBean) throws Exception {
        String[] String_insert = new String[]{
            "doc_date",
            "doc_time",
            "car_no",
            "supplier_id",
            "supplyer_type",
            "car_date_in",
            "car_time_in",
            "car_date_out",
            "car_time_out",
            "potato_type",
            "percent_1",
            "percent_2",
            "percent_3",
            "percent_4",
            "percent_5",
            "percent_6",
            "percent_7",
            "percent_8",
            "percent_avg",
            "pc_ref",
            "price_ref",
            "price_accept",
            "soil_deduct",
            "contamination_deduct",
            "other_deduct",
            "dump_deduct",
            "brake_income",
            "product_id",
            "wh_in",
            "car_in_weight",
            "car_out_weight",
            "total_weight",
            "deduct_weight",
            "balance_weight",
            "total_payment",
            "amount_deduct",
            "amount_payment",
            "remark",
            "reporter_id",
            "checker_id",
            "approve_id",
            "update_by",
            "update_date",
            "brake_value",
            "percent_tapioca",
            "amount_tapioca",
            "complete_flag"            
        };
        obj_StringQuery = new StringQuery();
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        PreparedStatement p = null;
        UtiDatabase objuti = new UtiDatabase();
        int i = 1;
        try {
            p = con.prepareStatement(obj_StringQuery.Update_String(String_insert, "d_rawmatt_receive",
                    "Where doc_id = '" + DataBean.getDoc_id() + "' and complete_flag = 'N' and delete_flag = 'N'"));
            p.setString(i, DataBean.getDoc_date());
            i += 1;
            p.setString(i, DataBean.getDoc_time());
            i += 1;
            p.setString(i, DataBean.getCar_no());
            i += 1;
            p.setString(i, DataBean.getSupplier_id());
            i += 1;
            p.setString(i, DataBean.getSupplyer_type());
            i += 1;
            p.setString(i, DataBean.getCar_date_in());
            i += 1;
            p.setString(i, DataBean.getCar_time_in());
            i += 1;
            p.setString(i, DataBean.getCar_date_out());
            i += 1;
            p.setString(i, DataBean.getCar_time_out());
            i += 1;
            p.setString(i, DataBean.getPotato_type());
            i += 1;
            p.setString(i, objuti.NotNull(DataBean.getPercent_1(), "0"));
            i += 1;
            p.setString(i, objuti.NotNull(DataBean.getPercent_2(), "0"));
            i += 1;
            p.setString(i, objuti.NotNull(DataBean.getPercent_3(), "0"));
            i += 1;
            p.setString(i, objuti.NotNull(DataBean.getPercent_4(), "0"));
            i += 1;
            p.setString(i, objuti.NotNull(DataBean.getPercent_5(), "0"));
            i += 1;
            p.setString(i, objuti.NotNull(DataBean.getPercent_6(), "0"));
            i += 1;
            p.setString(i, objuti.NotNull(DataBean.getPercent_7(), "0"));
            i += 1;
            p.setString(i, objuti.NotNull(DataBean.getPercent_8(), "0"));
            i += 1;
            p.setString(i, DataBean.getPercent_avg());
            i += 1;
            p.setString(i, DataBean.getPc_ref());
            i += 1;
            p.setString(i, DataBean.getPrice_ref());
            i += 1;
            p.setString(i, DataBean.getPrice_accept());
            i += 1;
            p.setString(i, DataBean.getSoil_deduct());
            i += 1;
            p.setString(i, DataBean.getContamination_deduct());
            i += 1;
            p.setString(i, DataBean.getOther_deduct());
            i += 1;
            p.setString(i, DataBean.getDump_deduct());
            i += 1;
            p.setString(i, DataBean.getBrake_income());
            i += 1;
            p.setString(i, DataBean.getProduct_id());
            i += 1;
            p.setString(i, DataBean.getWh_in());
            i += 1;
            p.setString(i, DataBean.getCar_in_weight());
            i += 1;
            p.setString(i, DataBean.getCar_out_weight());
            i += 1;
            p.setString(i, DataBean.getTotal_weight());
            i += 1;
            p.setString(i, DataBean.getDeduct_weight());
            i += 1;
            p.setString(i, DataBean.getBalance_weight());
            i += 1;
            p.setString(i, DataBean.getTotal_payment());
            i += 1;
            p.setString(i, DataBean.getAmount_deduct());
            i += 1;
            p.setString(i, DataBean.getAmount_payment());
            i += 1;
            p.setString(i, DataBean.getRemark());
            i += 1;
            p.setString(i, DataBean.getReporter_id());
            i += 1;
            p.setString(i, DataBean.getChecker_id());
            i += 1;
            p.setString(i, DataBean.getApprove_id());
            i += 1;
            p.setString(i, DataBean.getBy());
            i += 1;
            p.setTimestamp(i, DataBean.getDate());
            i += 1;
            p.setString(i, DataBean.getBrake_value());
            i += 1;
            p.setString(i, DataBean.getPercent_tapioca());
            i += 1;
            p.setString(i, DataBean.getAmount_tapioca());
            i += 1;
            p.setString(i, DataBean.getComplete_flag());
            i += 1;            
            p.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (p != null) {
                p.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }

    public void delete(DataBeanD_rawmatt_recieve DataBean) throws Exception {
        String[] str_approve = new String[]{
            "complete_flag"
        };
        obj_StringQuery = new StringQuery();
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        PreparedStatement p = null;
        try {
            p = con.prepareStatement(obj_StringQuery.Flag_Status_String("delete_flag='Y',delete_by=?,delete_date=?", "d_rawmatt_receive",
                    "WHERE doc_id = '" + DataBean.getDoc_id() + "' and delete_flag = 'N' and complete_flag = 'N'"));
            p.setString(1, DataBean.getBy());
            p.setTimestamp(2, DataBean.getDate());
            p.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (p != null) {
                p.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }

    public String Return_M_cassava_Price(String supply_type_id, String percent_cassava, String percent_avg, String input_date) throws Exception {
        Connection con = new DBConnect().openNewConnection();
        String out_putstring = "", SQL1 = "";        
        String[] percent_avg_array = percent_avg.split("\\.");
        ResultSet rs = null;
        try {
            SQL1 = "Select "
                    + "(select price_value_begin from m_cassava_price_detail where cassava_price_id = '" + supply_type_id + "' and percent_cassava = '" + percent_cassava + "' and delete_flag = 'N') as price_ref,"
                    + "(select "
                    + (Integer.parseInt(percent_avg_array[1]) >= 0 && Integer.parseInt(percent_avg_array[1]) <= 49 ? "price_value_begin" : "price_value_end")
                    + " from m_cassava_price_detail where cassava_price_id = '" + supply_type_id + "' and percent_cassava = '" + percent_avg_array[0] + "' and delete_flag = 'N') as price_accept "
                    + "From m_cassava_price_detail "
                    + "Where cassava_price_id = '" + supply_type_id + "' "
                    + "group by price_ref,price_accept ";

            System.out.println(SQL1);
            System.out.println("percent_avg = " + percent_avg);
            rs = con.createStatement().executeQuery(SQL1);

            while (rs.next()) {
                out_putstring = rs.getString("price_ref") + "," + rs.getString("price_accept");
                //System.out.println(rs.getString("price_ref"));
            }

            //out_putstring += ","+percent_avg_array[0]+"."+(Integer.parseInt(percent_avg_array[1]) >= 0 && Integer.parseInt(percent_avg_array[1]) <= 49 ?"0":"5");
            System.out.println("Decimal = " + Integer.parseInt(percent_avg_array[1]));
            System.out.println("Decimal = " + (percent_avg_array[1]));
            
            //int dec = 0 ;
            
                if (percent_avg_array[1].substring(0, 1).equals("0")) {
                    out_putstring = percent_avg_array[0] + ".00";
                } else {
                    out_putstring = percent_avg_array[0] + "." + Integer.toString(Decimal_Place.Decimal_position(Integer.parseInt(percent_avg_array[1])));
                }

            
            //dec = Decimal_Place.Decimal_position(Integer.parseInt(percent_avg_array[1]));
            
            
            //System.out.print("Decimal = " + dec);
            //out_putstring = percent_avg_array[0] + "." + (Integer.parseInt(percent_avg_array[1]) >= 0 && Integer.parseInt(percent_avg_array[1]) <= 49 ? "0" : "5");
            //out_putstring = percent_avg_array[0] + "." + Integer.toString(dec);
            System.out.println("out_putstring = " + out_putstring);
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (con != null) {
                con.close();
            }
            return out_putstring;
        }
    }

    public int Approve(String value_runno, String doc_date) throws Exception {
        Connection con = new DBConnect().openNewConnection();
        PreparedStatement p = null;
        int count = 0;
        obj_StringQuery = new StringQuery();
        try {
            p = con.prepareStatement(obj_StringQuery.Flag_Status_String("complete_flag='Y'", "d_rawmatt_receive",
                    "WHERE runno in (" + value_runno + ") and doc_date = '" + doc_date + "' and complete_flag = 'N'"));
            count = p.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (p != null) {
                p.close();
            }
            con.close();
            return count;
        }
    }

    public String Show_Detail(String doc_date) throws Exception {
        objuti = new UtiDatabase();
        StringBuffer Return_String = new StringBuffer();
        int count = 1;
        Connection con = new DBConnect().openNewConnection();
        ResultSet rs = null;
        Return_String.append("<table width='100%' align='center' border='0' cellpadding='0' cellspacing='1' class='inner3'>\n");
        try {
            if (objuti.numRowdatabase("select count(doc_id) as num from vd_rawmatt_receive where doc_date = '" + doc_date + "' and delete_flag = 'N' and complete_flag = 'N'") != 0) {
                rs = con.createStatement().executeQuery("select * from vd_rawmatt_receive where doc_date = '" + doc_date + "' and delete_flag = 'N' and complete_flag = 'N' order by runno");
                while (rs.next()) {
                    Return_String.append("<tr>\n");
                    Return_String.append("<td class='forborder' width='7%' align='center'><input type='checkbox' id='ckbox_" + rs.getString("runno") + "' value='" + rs.getString("runno") + "' name='ckbox' onclick=\"cancle_chkboxAll('chk_all',this.checked)\"></td>");
                    //Return_String.append("<td class='forborder' width='7%'><a href=\"#\" onclick=\"OpenEdit(URLsend('line_no_" + rs.getString("line_no") + ",A_doc_id','../SCREEN/BW_CS_Detail_027.jsp'))\"><input type='hidden' id='line_no_" + rs.getString("line_no") + "' value=\"" + rs.getString("line_no") + "\"><input type='hidden' id='doc_id' value=\"" + rs.getString("doc_id") + "\"><input type='hidden' id='runno_" + rs.getString("runno") + "'' value=\"" + rs.getString("runno") + "\">" + rs.getString("line_no") + "</a></td>\n");
                    Return_String.append("<td class='forborder' width='3%'>" + count + "</td>\n");
                    Return_String.append("<td class='forborder' width='14%'>" + objuti.NotNull(rs.getString("doc_id")) + "</td>\n");
                    Return_String.append("<td class='forborder' width='10%'>" + objuti.NotNull(rs.getString("doc_date")) + "</td>\n");
                    Return_String.append("<td class='forborder' width='10%'>" + objuti.NotNull(rs.getString("doc_time")) + "</td>\n");
                    Return_String.append("<td class='forborder' width='15%'>" + objuti.NotNull(rs.getString("supplier_name")) + "</td>\n");
                    Return_String.append("<td class='forborder' width='13%'>" + objuti.NotNull(rs.getString("product_name")) + "</td>\n");
                    Return_String.append("<td class='forborder' width='13%'>" + objuti.NotNull(rs.getString("supplyer_name")) + "&nbsp;</td>\n");
                    Return_String.append("<td class='forborder' width='15%'>" + objuti.NotNull(rs.getString("total_weight")) + "&nbsp;</td>\n");
                    Return_String.append("</tr>\n");
                    count += 1;
                }
            } else {
                Return_String.append("<tr>\n");
                Return_String.append("<td class='forborder' width='100%'align='center'>ไม่พบข้อมูลที่ต้องการ</td>\n");
                Return_String.append("</tr>\n");
            }
            Return_String.append("</table>");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            con.close();
            return Return_String.toString();
        }
    }
}
