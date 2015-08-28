/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bw.DB;

import com.bw.Calculator.Calculator_BW;
import com.bw.Calculator.Calculator_D_product_report_daily;
import com.bw.Util.StringQuery;
import com.bw.Util.UtiDatabase;
import com.bw.bean.DataBeanD_product_roast_header;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author B
 */
public class D_product_roast_headerDAO {

    UtiDatabase objuti;
    StringQuery objStringQuery;

    public void insert(DataBeanD_product_roast_header DataBean) throws Exception {
        String[] String_input = new String[]{
            "doc_id",
            "doc_date",
            "prod_roast_per_hr",
            "temp_roast_in",
            "temp_roast_out",
            "temp_water_in",
            "temp_water_out",
            "firewood_use",
            "firewood_per_ton",
            "biogas_use",
            "biogas_per_ton",
            "elec_stream_t1",
            "elec_stream_st1",
            "elec_stream_t2",
            "elec_stream_st2",
            "total_withdraw",
            "total_prod_1",
            "total_production",
            "tot_roast_hr",
            "total_1",
            "total_2",
            "total_3",
            "create_by",
            "create_date"
        };
        Calculator_BW objcal = new Calculator_BW();
        objuti = new UtiDatabase();
        objStringQuery = new StringQuery();
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        PreparedStatement p = null;
        int i = 1;

        try {
            DataBean.setTotal_1(objcal.Sum_Weight(DataBean.getDoc_id(), "d_product_roast_detail_2", "weight", con));
            DataBean.setTotal_2(objcal.Sum_Weight(DataBean.getDoc_id(), "d_product_roast_detail_3", "weight", con));
            DataBean.setTotal_3(objcal.Sum_Weight(DataBean.getDoc_id(), "d_product_roast_detail_4", "weight", con));
            DataBean.setTotal_roast_hr(objcal.Sum_Time(DataBean.getDoc_id(), "d_product_roast_detail_1", "date_from", "date_to", "time_from", "time_to", con));
            DataBean.setTotal_withdraw(Cal_total_withdraw(DataBean.getTotal_1(), DataBean.getTotal_2()));
            DataBean.setTotal_prod_1(Cal_total_prod_1(DataBean.getTotal_3(), DataBean.getTotal_2()));
            DataBean.setProd_roast_per_hr(Cal_prod_roast_per_hr(DataBean.getTotal_prod_1(), DataBean.getTotal_roast_hr()));
            DataBean.setTotal_production(Cal_total_production(DataBean.getTotal_3(), DataBean.getTotal_withdraw()));
            p = con.prepareStatement(objStringQuery.Insert_String(String_input, "d_product_roast_header"));
            p.setString(i, DataBean.getDoc_id());i += 1;
            p.setString(i, DataBean.getDoc_date());i += 1;
            p.setString(i, DataBean.getProd_roast_per_hr());i += 1;
            p.setString(i, DataBean.getTemp_roast_in());i += 1;
            p.setString(i, DataBean.getTemp_roast_out());i += 1;
            p.setString(i, DataBean.getTemp_water_in());i += 1;
            p.setString(i, DataBean.getTemp_water_out());i += 1;
            p.setString(i, DataBean.getFirewood_use());i += 1;
            p.setString(i, DataBean.getFirewood_per_ton());i += 1;
            p.setString(i, DataBean.getBiogas_use());i += 1;
            p.setString(i, DataBean.getBiogas_per_ton());i += 1;
            p.setString(i, DataBean.getElec_stream_t1());i += 1;
            p.setString(i, DataBean.getElec_stream_st1());i += 1;
            p.setString(i, DataBean.getElec_stream_t2());i += 1;
            p.setString(i, DataBean.getElec_stream_st2());i += 1;
            p.setString(i, DataBean.getTotal_withdraw());i += 1;
            p.setString(i, DataBean.getTotal_prod_1());i += 1;
            p.setString(i, DataBean.getTotal_production());i += 1;
            p.setString(i, DataBean.getTotal_roast_hr());i += 1;
            p.setString(i, DataBean.getTotal_1());i += 1;
            p.setString(i, DataBean.getTotal_2());i += 1;
            p.setString(i, DataBean.getTotal_3());i += 1;
            p.setString(i, DataBean.getBy());i += 1;
            p.setTimestamp(i, DataBean.getDate());i += 1;
            p.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace(System.out);
        } finally {
            if (p != null) {
                p.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }

    public void update(DataBeanD_product_roast_header DataBean) throws Exception {
        String[] String_input = new String[]{
            "doc_date",
            "prod_roast_per_hr",
            "temp_roast_in",
            "temp_roast_out",
            "temp_water_in",
            "temp_water_out",
            "firewood_use",
            "firewood_per_ton",
            "biogas_use",
            "biogas_per_ton",
            "elec_stream_t1",
            "elec_stream_st1",
            "elec_stream_t2",
            "elec_stream_st2",
            "total_withdraw",
            "total_prod_1",
            "total_production",
            "tot_roast_hr",
            "total_1",
            "total_2",
            "total_3",
            "update_by",
            "update_date"
        };
        Calculator_BW objcal = new Calculator_BW();
        objuti = new UtiDatabase();
        objStringQuery = new StringQuery();
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        PreparedStatement p = null;
        int i = 1;
        try {
            DataBean.setTotal_1(objcal.Sum_Weight(DataBean.getDoc_id(), "d_product_roast_detail_2", "weight", con));
            DataBean.setTotal_2(objcal.Sum_Weight(DataBean.getDoc_id(), "d_product_roast_detail_3", "weight", con));
            DataBean.setTotal_3(objcal.Sum_Weight(DataBean.getDoc_id(), "d_product_roast_detail_4", "weight", con));
            DataBean.setTotal_roast_hr(objcal.Sum_Time(DataBean.getDoc_id(), "d_product_roast_detail_1", "date_from", "date_to", "time_from", "time_to", con));
            DataBean.setTotal_withdraw(Cal_total_withdraw(DataBean.getTotal_1(), DataBean.getTotal_2()));
            DataBean.setTotal_prod_1(Cal_total_prod_1(DataBean.getTotal_3(), DataBean.getTotal_2()));
            DataBean.setProd_roast_per_hr(Cal_prod_roast_per_hr(DataBean.getTotal_prod_1(), DataBean.getTotal_roast_hr()));
            DataBean.setTotal_production(Cal_total_production(DataBean.getTotal_3(), DataBean.getTotal_withdraw()));
            DataBean.setFirewood_per_ton(Cal_firewood_per_ton(DataBean.getFirewood_use(), DataBean.getTotal_prod_1()));
            DataBean.setBiogas_per_ton(Cal_biogas_per_ton(DataBean.getBiogas_use(), DataBean.getTotal_prod_1()));
            p = con.prepareStatement(objStringQuery.Update_String(String_input, "d_product_roast_header", "WHERE doc_id = ? and delete_flag = 'N' and complete_flag = 'N'"));
            p.setString(i, DataBean.getDoc_date());i += 1;
            p.setString(i, DataBean.getProd_roast_per_hr());i += 1;
            p.setString(i, DataBean.getTemp_roast_in());i += 1;
            p.setString(i, DataBean.getTemp_roast_out());i += 1;
            p.setString(i, DataBean.getTemp_water_in());i += 1;
            p.setString(i, DataBean.getTemp_water_out());i += 1;
            p.setString(i, DataBean.getFirewood_use());i += 1;
            p.setString(i, DataBean.getFirewood_per_ton());i += 1;
            p.setString(i, DataBean.getBiogas_use());i += 1;
            p.setString(i, DataBean.getBiogas_per_ton());i += 1;
            p.setString(i, DataBean.getElec_stream_t1());i += 1;
            p.setString(i, DataBean.getElec_stream_st1());i += 1;
            p.setString(i, DataBean.getElec_stream_t2());i += 1;
            p.setString(i, DataBean.getElec_stream_st2());i += 1;
            p.setString(i, DataBean.getTotal_withdraw());i += 1;
            p.setString(i, DataBean.getTotal_prod_1());i += 1;
            p.setString(i, DataBean.getTotal_production());i += 1;
            p.setString(i, DataBean.getTotal_roast_hr());i += 1;
            p.setString(i, DataBean.getTotal_1());i += 1;
            p.setString(i, DataBean.getTotal_2());i += 1;
            p.setString(i, DataBean.getTotal_3());i += 1;
            p.setString(i, DataBean.getBy());i += 1;
            p.setTimestamp(i, DataBean.getDate());i += 1;
            p.setString(i, DataBean.getDoc_id());i += 1;
            p.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace(System.out);
        } finally {
            if (p != null) {
                p.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }

    public void delete(DataBeanD_product_roast_header DataBean) throws Exception {
        String[] Table_name = new String[]{
            "d_production_header",
            "d_product_roast_header",
            "d_product_pack_header",
            "d_product_milling_header",
            "d_product_roast_detail_1",
            "d_product_roast_detail_2",
            "d_product_roast_detail_3",
            "d_product_roast_detail_4",
            "d_product_pack_detail_1",
            "d_product_pack_detail_2",
            "d_product_pack_detail_3",
            "d_product_milling_detail_1",
            "d_product_milling_detail_2"
        };
        String SQL_Qury = "";
        objuti = new UtiDatabase();
        objStringQuery = new StringQuery();
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        PreparedStatement p = null;
        try {
            for (int i = 0; i < Table_name.length; i++) {
                SQL_Qury = "select count(doc_id) as num from " + Table_name[i] + " where doc_id '" + DataBean.getDoc_id() + "' and delete_flag = 'N' and complete_flag = 'N'";
                if (objuti.numRowdatabase(SQL_Qury) != 0) {
                    p = con.prepareStatement(objStringQuery.Flag_Status_String("delete_flag='Y',delete_by=?,delete_date=?", Table_name[i],
                            "WHERE doc_id = '" + DataBean.getDoc_id() + "' and delete_flag = 'N' and complete_flag = 'N'"));
                    p.setString(1, DataBean.getBy());
                    p.setTimestamp(2, DataBean.getDate());
                    p.executeUpdate();
                }
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
        } finally {
            if (p != null) {
                p.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }

    public DataBeanD_product_roast_header Return_Value(String doc_id, String doc_date) throws Exception {
        DataBeanD_product_roast_header bean_header = new DataBeanD_product_roast_header();
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        Calculator_BW obj_total = new Calculator_BW();
        ResultSet rs = null;
        objuti = new UtiDatabase();
        String SQL = "";
        try {
            SQL = "SELECT doc_id,doc_date,prod_roast_per_hr,temp_roast_in,temp_roast_out,temp_water_in,temp_water_out,"
                    + "firewood_use,firewood_per_ton,biogas_use,biogas_per_ton,elec_stream_t1,elec_stream_st1,"
                    + "elec_stream_t2,elec_stream_st2,total_withdraw,total_prod_1,total_production,tot_roast_hr,"
                    + "total_1,total_2,total_3"
                    + " FROM d_product_roast_header "
                    + "WHERE doc_id = '" + doc_id + "' and doc_date = '" + doc_date + "' and delete_flag = 'N' and complete_flag = 'N'";
            rs = con.createStatement().executeQuery(SQL);
            while (rs.next()) {
                bean_header.setProd_roast_per_hr(objuti.NotNull(rs.getString("prod_roast_per_hr"), "0"));
                bean_header.setTemp_roast_in(objuti.NotNull(rs.getString("temp_roast_in"), "0"));
                bean_header.setTemp_roast_out(objuti.NotNull(rs.getString("temp_roast_out"), "0"));
                bean_header.setTemp_water_in(objuti.NotNull(rs.getString("temp_water_in"), "0"));
                bean_header.setTemp_water_out(objuti.NotNull(rs.getString("temp_water_out"), "0"));
                bean_header.setFirewood_use(objuti.NotNull(rs.getString("firewood_use"), "0"));
                bean_header.setFirewood_per_ton(objuti.NotNull(rs.getString("firewood_per_ton"), "0"));
                bean_header.setBiogas_use(objuti.NotNull(rs.getString("biogas_use"), "0"));
                bean_header.setBiogas_per_ton(objuti.NotNull(rs.getString("biogas_per_ton"), "0"));
                bean_header.setElec_stream_t1(objuti.NotNull(rs.getString("elec_stream_t1"), "0"));
                bean_header.setElec_stream_st1(objuti.NotNull(rs.getString("elec_stream_st1"), "0"));
                bean_header.setElec_stream_t2(objuti.NotNull(rs.getString("elec_stream_t2"), "0"));
                bean_header.setElec_stream_st2(objuti.NotNull(rs.getString("elec_stream_st2"), "0"));
                bean_header.setTotal_withdraw(objuti.NotNull(rs.getString("total_withdraw"), "0"));
                bean_header.setTotal_prod_1(objuti.NotNull(rs.getString("total_prod_1"), "0"));
                bean_header.setTotal_production(objuti.NotNull(rs.getString("total_production"), "0"));
                bean_header.setTotal_roast_hr(objuti.NotNull(rs.getString("tot_roast_hr"), "0"));
            }
            bean_header.setTotal_1(obj_total.Sum_Weight(doc_id, "d_product_roast_detail_2", "weight", con));
            bean_header.setTotal_2(obj_total.Sum_Weight(doc_id, "d_product_roast_detail_3", "weight", con));
            bean_header.setTotal_3(obj_total.Sum_Weight(doc_id, "d_product_roast_detail_4", "weight", con));
        } catch (Exception e) {
            e.printStackTrace(System.out);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (con != null) {
                con.close();
            }
            return bean_header;
        }
    }
    public String Cal_prod_roast_per_hr(String total_prod_1,String tot_roast_hr){
        double total_prod = 0.00,total_roast = 0.00;
        total_prod = new Calculator_D_product_report_daily().parserDouble(total_prod_1);
        total_roast = new Calculator_D_product_report_daily().parserDouble(tot_roast_hr);
        if(total_roast <= 0){
            return "00.00";
        }else{
            return new Calculator_D_product_report_daily().Tostring(new Calculator_D_product_report_daily().Round(total_prod/total_roast, 2));
        }

    }
    public String Cal_total_withdraw(String total_1,String total_2){
        return new Calculator_D_product_report_daily().Tostring(new Calculator_D_product_report_daily().Round(Double.parseDouble(total_1) + Double.parseDouble(total_2), 3));
    }
    public String Cal_total_prod_1(String total_3,String total_2){
        return new Calculator_D_product_report_daily().Tostring(new Calculator_D_product_report_daily().Round(Double.parseDouble(total_3) - Double.parseDouble(total_2), 3));
    }
    public String Cal_total_production(String total_3,String total_withdraw){
        return new Calculator_D_product_report_daily().Tostring(new Calculator_D_product_report_daily().Round(Double.parseDouble(total_3) - Double.parseDouble(total_withdraw),3));
    }
    public String Cal_firewood_per_ton(String firewood_use,String total_prod_1){
        if(Double.parseDouble(total_prod_1) == 0){
            return "0.000";
        }else{
            return new Calculator_D_product_report_daily().Tostring(new Calculator_D_product_report_daily().Round(Double.parseDouble(firewood_use) / Double.parseDouble(total_prod_1),3));
        }
    }
    public String Cal_biogas_per_ton(String biogas_use,String total_prod_1){
        if(Double.parseDouble(total_prod_1) == 0){
            return "0.000";
        }else{
            return new Calculator_D_product_report_daily().Tostring(new Calculator_D_product_report_daily().Round(Double.parseDouble(biogas_use) / Double.parseDouble(total_prod_1),3));
        }

    }
}
