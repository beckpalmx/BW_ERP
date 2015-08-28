/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bw.DB;

import com.bw.Calculator.Calculator_BW;
import com.bw.Calculator.Calculator_D_product_report_daily;
import com.bw.Util.StringQuery;
import com.bw.Util.UtiDatabase;
import com.bw.bean.DataBeanD_product_report_daily_header;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author B
 */
public class D_product_report_daily_headerDAO {

    UtiDatabase objuti;
    StringQuery objStringQuery;

    public void insert(DataBeanD_product_report_daily_header DataBean) throws Exception {
        String[] String_input = new String[]{
            "doc_id",
            "doc_date",
            "cassava_date",
            "cassava_date2",
            "amount_cassava",
            "percent_tapioca",
            "amount_tapioca",
            "fresh_skin",
            "soil_skin",
            "total_cassava",
            "amount_tapioca1",
            "start_m_date",
            "start_m_time",
            "end_m_date",
            "end_m_time",
            "m_time",
            "total_stop_milling_hour",
            "total_milling_time",
            "milling_ratio",
            "start_r_date",
            "start_r_time",
            "end_r_date",
            "end_r_time",
            "r_time",
            "total_roast_time",
            "epower_milling_from",
            "epower_milling_to",
            "epower_unit",
            "water_use",
            "water_per_tapioca",
            "kw_per_tapioca",
            "starch_date",
            "starch_date2",
            "starch_balance",
            /*"cassava_of_date",
             "starch_bal",
             "qty_tank",
             "starch_bal_x_qty_tank",
             "qty_litr",*/
            "cassava_prd_date",
            "cassava_prd_date2",
            "qty_prd",
            "percent_prd",
            "percent_diff",
            "percent_yield",
            "yield_val",
            "percent_prd1",
            "percent_diff1",
            "percent_yield1",
            "yield_val1",
            "reporter_id",
            "create_by",
            "create_date"
        };
        objuti = new UtiDatabase();
        objStringQuery = new StringQuery();
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        Calculator_BW objcal = new Calculator_BW();
        PreparedStatement p = null;
        int i = 1;
        try {
            p = con.prepareStatement(objStringQuery.Insert_String(String_input, "d_product_report_daily_header"));
            p.setString(i, DataBean.getDoc_id());
            i += 1;
            p.setString(i, DataBean.getDoc_date());
            i += 1;
            p.setString(i, DataBean.getCassava_date());
            i += 1;
            p.setString(i, DataBean.getCassava_date2());
            i += 1;
            p.setString(i, DataBean.getAmount_cassava());
            i += 1;
            p.setString(i, DataBean.getPercent_tapioca());
            i += 1;
            p.setString(i, DataBean.getAmount_tapioca());
            i += 1;
            p.setString(i, DataBean.getFresh_skin());
            i += 1;
            p.setString(i, DataBean.getSoil_skin());
            i += 1;
            p.setString(i, DataBean.getTotal_cassava());
            i += 1;
            p.setString(i, DataBean.getAmount_tapioca1());
            i += 1;
            p.setString(i, DataBean.getStart_m_date());
            i += 1;
            p.setString(i, DataBean.getStart_m_time());
            i += 1;
            p.setString(i, DataBean.getEnd_m_date());
            i += 1;
            p.setString(i, DataBean.getEnd_m_time());
            i += 1;
            p.setString(i, DataBean.getM_time());
            i += 1;
            p.setString(i, objcal.Sum_Time(DataBean.getDoc_id(), "d_product_report_daily_detail_stop_milling", "sm_from_date", "sm_to_date", "sm_from_time", "sm_to_time", con));
            i += 1;
            p.setString(i, DataBean.getTotal_milling_time());
            i += 1;
            p.setString(i, DataBean.getMilling_ratio());
            i += 1;
            p.setString(i, DataBean.getStart_r_date());
            i += 1;
            p.setString(i, DataBean.getStart_r_time());
            i += 1;
            p.setString(i, DataBean.getEnd_r_date());
            i += 1;
            p.setString(i, DataBean.getEnd_r_time());
            i += 1;
            p.setString(i, DataBean.getR_time());
            i += 1;
            p.setString(i, DataBean.getTotal_roast_time());
            i += 1;
            p.setString(i, DataBean.getEpower_milling_from());
            i += 1;
            p.setString(i, DataBean.getEpower_milling_to());
            i += 1;
            p.setString(i, DataBean.getEpower_unit());
            i += 1;
            p.setString(i, DataBean.getWater_use());
            i += 1;
            p.setString(i, DataBean.getWater_per_tapioca());
            i += 1;
            p.setString(i, DataBean.getKw_per_tapioca());
            i += 1;
            p.setString(i, DataBean.getStarch_date());
            i += 1;
            p.setString(i, DataBean.getStarch_date2());
            i += 1;
            p.setString(i, DataBean.getStarch_balance());
            i += 1;
            /*p.setString(i, DataBean.getCassava_of_date());i+=1;
             p.setString(i, DataBean.getStarch_bal());i+=1;
             p.setString(i, DataBean.getQty_tank());i+=1;
             p.setString(i, DataBean.getStarch_bal_x_qty_tank());i+=1;
             p.setString(i, DataBean.getQty_litr());i+=1;*/
            p.setString(i, DataBean.getCassava_prd_date());
            i += 1;
            p.setString(i, DataBean.getCassava_prd_date2());
            i += 1;
            p.setString(i, DataBean.getQty_prd());
            i += 1;
            p.setString(i, DataBean.getPercent_prd());
            i += 1;
            p.setString(i, DataBean.getPercent_diff());
            i += 1;
            p.setString(i, DataBean.getPercent_yield());
            i += 1;
            p.setString(i, DataBean.getYield_val());
            i += 1;
            p.setString(i, DataBean.getPercent_prd1());
            i += 1;
            p.setString(i, DataBean.getPercent_yield1());
            i += 1;
            p.setString(i, DataBean.getPercent_diff1());
            i += 1;
            p.setString(i, DataBean.getYield_val1());
            i += 1;
            p.setString(i, DataBean.getReporter_id());
            i += 1;
            p.setString(i, DataBean.getBy());
            i += 1;
            p.setTimestamp(i, DataBean.getDate());
            i += 1;
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

    public void update(DataBeanD_product_report_daily_header DataBean) throws Exception {
        String[] String_input = new String[]{
            "doc_date",
            "cassava_date",
            "cassava_date2",
            "amount_cassava",
            "percent_tapioca",
            "amount_tapioca",
            "fresh_skin",
            "soil_skin",
            "total_cassava",
            "amount_tapioca1",
            "start_m_date",
            "start_m_time",
            "end_m_date",
            "end_m_time",
            "m_time",
            "total_stop_milling_hour",
            "total_stop_kw",
            "total_milling_time",
            "milling_ratio",
            "start_r_date",
            "start_r_time",
            "end_r_date",
            "end_r_time",
            "r_time",
            "total_stop_roast_hour",
            "total_roast_time",
            "epower_milling_from",
            "epower_milling_to",
            "epower_unit",
            "water_use",
            "kw_use",
            "water_per_tapioca",
            "kw_per_tapioca",
            "total_raw_weight",
            "total_prd_weight",
            "starch_date",
            "starch_date2",
            "starch_balance",
            /*"cassava_of_date",
             "starch_bal",
             "qty_tank",
             "starch_bal_x_qty_tank",
             "qty_litr",*/
            "total_starch_weight",
            "cassava_prd_date",
            "cassava_prd_date2",
            "qty_prd",
            "percent_prd",
            "percent_diff",
            "percent_yield",
            "yield_val",
            "percent_prd1",
            "percent_diff1",
            "percent_yield1",
            "yield_val1",
            "reporter_id",
            "update_by",
            "update_date"
        };
        Calculator_BW objcal = new Calculator_BW();
        Calculator_D_product_report_daily objcal_daily = new Calculator_D_product_report_daily();
        objuti = new UtiDatabase();
        objStringQuery = new StringQuery();
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        PreparedStatement p = null;
        int i = 1;
        try {
            //*************setData*********************
            DataBean.setTotal_stop_milling_hour(objcal.Sum_Time(DataBean.getDoc_id(), "d_product_report_daily_detail_stop_milling", "sm_from_date", "sm_to_date", "sm_from_time", "sm_to_time", con));
            DataBean.setTotal_stop_roast_hour(objcal.Sum_Time(DataBean.getDoc_id(), "d_product_report_daily_detail_stop_roast", "sr_from_date", "sr_to_date", "sr_from_time", "sr_to_time", con));
            DataBean.setTotal_stop_kw(objcal.Sum_Weight(DataBean.getDoc_id(), "d_product_report_daily_detail_stop_milling", "kw_rest", con));
            DataBean.setTotal_raw_weight(objcal.Sum_Weight(DataBean.getDoc_id(), "d_product_report_daily_detail_raw", "amount", con));
            DataBean.setTotal_prd_weight(objcal.Sum_Weight(DataBean.getDoc_id(), "d_product_report_daily_detail_prd", "amount", con));
            DataBean.setTotal_starch_weight(objcal.Sum_Weight(DataBean.getDoc_id(), "d_product_report_daily_detail_starch", "amount", con));
            //***************Calculator**************************
            DataBean.setTotal_milling_time(objcal_daily.Calculator_Total_milling_time(DataBean.getM_time(), DataBean.getTotal_stop_milling_hour()));
            DataBean.setMilling_ratio(objcal_daily.Calculator_Milling_ratio(DataBean.getAmount_cassava(), DataBean.getTotal_milling_time()));
            DataBean.setTotal_roast_time(objcal_daily.Calculator_Total_roast_time(DataBean.getR_time(), DataBean.getTotal_stop_roast_hour()));
            DataBean.setKw_use(objcal_daily.Calculator_Epower_unit(DataBean.getEpower_unit(), DataBean.getTotal_stop_kw()));//กิโลวัตต์ที่ใช้จริง(หน่วย)
            //***************Calculator ผลผลิตตัดมันของวันที่************************************
            DataBean.setQty_prd(objcal_daily.Calculator_Qty_prd(DataBean.getTotal_prd_weight(), DataBean.getTotal_starch_weight(), DataBean.getTotal_raw_weight(), DataBean.getStarch_balance()));
            DataBean.setPercent_prd(objcal_daily.Calculator_Percent_prd(DataBean.getQty_prd(), DataBean.getAmount_cassava()));
            DataBean.setPercent_diff(objcal_daily.Calculator_Percent_diff(DataBean.getPercent_prd(), DataBean.getPercent_tapioca()));
            DataBean.setPercent_yield(objcal_daily.Calculator_Percent_yield(DataBean.getQty_prd(), DataBean.getAmount_tapioca()));
            DataBean.setYield_val(objcal_daily.Calculator_Yield_val(DataBean.getPercent_yield()));
            //1*****************************************************************************
            DataBean.setPercent_prd1(objcal_daily.Calculator_Percent_prd(DataBean.getQty_prd(), DataBean.getTotal_cassava()));
            DataBean.setPercent_diff1(objcal_daily.Calculator_Percent_diff(DataBean.getPercent_prd(), DataBean.getPercent_tapioca()));
            DataBean.setPercent_yield1(objcal_daily.Calculator_Percent_yield(DataBean.getQty_prd(), DataBean.getAmount_tapioca1()));
            DataBean.setYield_val1(objcal_daily.Calculator_Yield_val(DataBean.getPercent_yield()));
            //*******************************************************************************
            DataBean.setWater_per_tapioca(objcal_daily.Calculator_Water_per_tapioca(DataBean.getWater_use(), DataBean.getQty_prd()));
            DataBean.setKw_per_tapioca(objcal_daily.Calculator_kw_per_tapioca(DataBean.getKw_use(), DataBean.getQty_prd()));
            //*******************************************************************************
            p = con.prepareStatement(objStringQuery.Update_String(String_input, "d_product_report_daily_header", "WHERE doc_id = ? and delete_flag = 'N' and complete_flag = 'N'"));
            p.setString(i, DataBean.getDoc_date());
            i += 1;
            p.setString(i, DataBean.getCassava_date());
            i += 1;
            p.setString(i, DataBean.getCassava_date2());
            i += 1;
            p.setString(i, DataBean.getAmount_cassava());
            i += 1;
            p.setString(i, DataBean.getPercent_tapioca());
            i += 1;
            p.setString(i, DataBean.getAmount_tapioca());
            i += 1;
            p.setString(i, DataBean.getFresh_skin());
            i += 1;
            p.setString(i, DataBean.getSoil_skin());
            i += 1;
            p.setString(i, DataBean.getTotal_cassava());
            i += 1;
            p.setString(i, DataBean.getAmount_tapioca1());
            i += 1;
            p.setString(i, DataBean.getStart_m_date());
            i += 1;
            p.setString(i, DataBean.getStart_m_time());
            i += 1;
            p.setString(i, DataBean.getEnd_m_date());
            i += 1;
            p.setString(i, DataBean.getEnd_m_time());
            i += 1;
            p.setString(i, DataBean.getM_time());
            i += 1;
            p.setString(i, DataBean.getTotal_stop_milling_hour());
            i += 1;
            p.setString(i, DataBean.getTotal_stop_kw());
            i += 1;
            p.setString(i, DataBean.getTotal_milling_time());
            i += 1;
            p.setString(i, DataBean.getMilling_ratio());
            i += 1;
            p.setString(i, DataBean.getStart_r_date());
            i += 1;
            p.setString(i, DataBean.getStart_r_time());
            i += 1;
            p.setString(i, DataBean.getEnd_r_date());
            i += 1;
            p.setString(i, DataBean.getEnd_r_time());
            i += 1;
            p.setString(i, DataBean.getR_time());
            i += 1;
            p.setString(i, DataBean.getTotal_stop_roast_hour());
            i += 1;
            p.setString(i, DataBean.getTotal_roast_time());
            i += 1;
            p.setString(i, DataBean.getEpower_milling_from());
            i += 1;
            p.setString(i, DataBean.getEpower_milling_to());
            i += 1;
            p.setString(i, DataBean.getEpower_unit());
            i += 1;
            p.setString(i, DataBean.getWater_use());
            i += 1;
            p.setString(i, DataBean.getKw_use());
            i += 1;
            p.setString(i, DataBean.getWater_per_tapioca());
            i += 1;
            p.setString(i, DataBean.getKw_per_tapioca());
            i += 1;
            p.setString(i, DataBean.getTotal_raw_weight());
            i += 1;
            p.setString(i, DataBean.getTotal_prd_weight());
            i += 1;
            p.setString(i, DataBean.getStarch_date());
            i += 1;
            p.setString(i, DataBean.getStarch_date2());
            i += 1;
            p.setString(i, DataBean.getStarch_balance());
            i += 1;
            /*p.setString(i, DataBean.getCassava_of_date());i+=1;
             p.setString(i, DataBean.getStarch_bal());i+=1;
             p.setString(i, DataBean.getQty_tank());i+=1;
             p.setString(i, DataBean.getStarch_bal_x_qty_tank());i+=1;
             p.setString(i, DataBean.getQty_litr());i+=1;*/
            p.setString(i, DataBean.getTotal_starch_weight());
            i += 1;
            p.setString(i, DataBean.getCassava_prd_date());
            i += 1;
            p.setString(i, DataBean.getCassava_prd_date2());
            i += 1;
            p.setString(i, DataBean.getQty_prd());
            i += 1;
            p.setString(i, DataBean.getPercent_prd());
            i += 1;
            p.setString(i, DataBean.getPercent_diff());
            i += 1;
            p.setString(i, DataBean.getPercent_yield());
            i += 1;
            p.setString(i, DataBean.getYield_val());
            i += 1;
            p.setString(i, DataBean.getPercent_prd1());
            i += 1;
            p.setString(i, DataBean.getPercent_yield1());
            i += 1;
            p.setString(i, DataBean.getPercent_diff1());
            i += 1;
            p.setString(i, DataBean.getYield_val1());
            i += 1;
            p.setString(i, DataBean.getReporter_id());
            i += 1;
            p.setString(i, DataBean.getBy());
            i += 1;
            p.setTimestamp(i, DataBean.getDate());
            i += 1;
            p.setString(i, DataBean.getDoc_id());
            i += 1;
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

    public void delete(DataBeanD_product_report_daily_header DataBean) throws Exception {
        objStringQuery = new StringQuery();
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        PreparedStatement p = null;
        String[] Str_table = new String[]{"d_product_report_daily_header", "d_product_report_daily_detail_prd", "d_product_report_daily_detail_raw", "d_product_report_daily_detail_starch", "d_product_report_daily_detail_stop_milling", "d_product_report_daily_detail_stop_roast"};
        try {
            for (int i = 0; i < Str_table.length; i++) {
                p = con.prepareStatement(objStringQuery.Flag_Status_String("delete_flag='Y',delete_by=?,delete_date=?", Str_table[i],
                        "WHERE doc_id = '" + DataBean.getDoc_id() + "' and delete_flag = 'N' and complete_flag = 'N'"));
                p.setString(1, DataBean.getBy());
                p.setTimestamp(2, DataBean.getDate());
                p.executeUpdate();
                p.clearParameters();
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

    public String Calculator_Amount_Cassava(DataBeanD_product_report_daily_header DataBean) throws Exception {
        Connection con = new DBConnect().openNewConnection();
        ResultSet rs = null;
        String SQL = "", String_return = "0,0,0,0,0,0,0,0";
        objuti = new UtiDatabase();
        try {
            SQL = "select count(cassava_date) as num  from d_rawmatt_report where "
                    + "to_date(to_char(to_number(to_char(to_date(cassava_date,'DD-MM-YYYY'),'YYYY'),'0000')- 543,'0000')||'-'||to_char(to_date(cassava_date,'DD-MM-YYYY'),'MM-DD'),'YYYY-MM-DD') "
                    + "between "
                    + "to_date(to_char(to_number(to_char(to_date('" + DataBean.getCassava_date() + "','DD-MM-YYYY'),'YYYY'),'0000')- 543,'0000')||'-'||to_char(to_date('" + DataBean.getCassava_date() + "','DD-MM-YYYY'),'MM-DD'),'YYYY-MM-DD') "
                    + "and "
                    + "to_date(to_char(to_number(to_char(to_date('" + DataBean.getCassava_of_date() + "','DD-MM-YYYY'),'YYYY'),'0000')- 543,'0000')||'-'||to_char(to_date('" + DataBean.getCassava_of_date() + "','DD-MM-YYYY'),'MM-DD'),'YYYY-MM-DD') "
                    + " and delete_flag = 'N' and complete_flag = 'N'";
            
            //System.out.println("Calc Cassava SQL = " + SQL);
            
            if (objuti.numRowdatabase(SQL) != 0) {
                                
                 SQL = "select "
                 + "trim(to_char(to_number(trim(to_char(sum(to_number(amount_cassava,'99999999999999.00')/1000.00),'99999999999990.000')),'99999999999990.000'),'99999999999990.000'))as sum_amount_cassava,"
                 + "trim(to_char((to_number(trim(to_char(sum(to_number(amount_tapioca,'99999999999999.00')/1000.00),'99999999999990.000')),'99999999999990.000') / (sum(to_number(amount_cassava,'99999999999999.00'))/1000.00))*100,'99999999999990.000'))  as sum_percent_tapioca,"
                 + "trim(to_char(to_number(trim(to_char(sum(to_number(amount_tapioca,'99999999999999.00')/1000.00),'99999999999990.000')),'99999999999990.000'),'99999999999990.000')) as sum_amount_tapioca,"
                 + "trim(to_char(to_number(trim(to_char(sum(to_number(total_peel_fresh,'99999999999990.00')/1000.00),'99999999999990.000')),'99999999999990.000'),'99999999999990.000')) as sum_total_peel_fresh,"
                 + "trim(to_char(to_number(trim(to_char(sum(to_number(amount_peel_fresh,'99999999999990.00')/1000.00),'99999999999990.000')),'99999999999990.000'),'99999999999990.000')) as sum_amount_peel_fresh,"
                 + "trim(to_char(to_number(trim(to_char(sum(to_number(amount_soil_crust,'99999999999990.00')/1000.00),'99999999999990.000')),'99999999999990.000'),'99999999999990.000')) as sum_amount_soil_crust,"
                 + "trim(to_char(to_number(trim(to_char(sum(to_number(total_cassava,'99999999999990.00')/1000.00),'99999999999990.000')),'99999999999990.000'),'99999999999990.000')) as sum_total_cassava,"
                 + "trim(to_char(to_number(trim(to_char(sum(to_number(total_tapioca,'99999999999990.00')/1000.00),'99999999999990.000')),'99999999999990.000'),'99999999999990.000')) as sum_total_tapioca "
                 + "from d_rawmatt_report "
                 + "where "
                 + "to_date(to_char(to_number(to_char(to_date(cassava_date,'DD-MM-YYYY'),'YYYY'),'0000')- 543,'0000')||'-'||to_char(to_date(cassava_date,'DD-MM-YYYY'),'MM-DD'),'YYYY-MM-DD') "
                 + "between "
                 + "to_date(to_char(to_number(to_char(to_date('" + DataBean.getCassava_date() + "','DD-MM-YYYY'),'YYYY'),'0000')- 543,'0000')||'-'||to_char(to_date('" + DataBean.getCassava_date() + "','DD-MM-YYYY'),'MM-DD'),'YYYY-MM-DD') "
                 + "and "
                 + "to_date(to_char(to_number(to_char(to_date('" + DataBean.getCassava_of_date() + "','DD-MM-YYYY'),'YYYY'),'0000')- 543,'0000')||'-'||to_char(to_date('" + DataBean.getCassava_of_date() + "','DD-MM-YYYY'),'MM-DD'),'YYYY-MM-DD') "
                 + "and delete_flag = 'N' and complete_flag = 'N'";
                 
/*
                SQL = "select trim(to_char((to_number(amount_cassava,'9999999.999')/1000),'9,999,999.999')) as sum_amount_cassava"                        
                        + ",trim(percent_tapioca) as  sum_percent_tapioca"
                        + ",trim(to_char((to_number(amount_tapioca,'9999999.999')/1000),'9,999,999.999')) as sum_amount_tapioca"                                                
                        + ",trim(to_char((to_number(total_peel_fresh,'9999999.999')/1000),'9,999,999.999')) as sum_amount_peel_fresh"                        
                        + ",trim(to_char((to_number(amount_soil_crust,'9999999.999')/1000),'9,999,999.999')) as sum_amount_soil_crust"                        
                        + ",trim(to_char((to_number(total_cassava,'9999999.999')/1000),'9,999,999.999')) as sum_total_cassava"                        
                        + ",trim(to_char((to_number(total_tapioca,'9999999.999')/1000),'9,999,999.999')) as sum_total_tapioca "
                        + " from d_rawmatt_report "
                        + "where "
                        + "to_date(to_char(to_number(to_char(to_date(cassava_date,'DD-MM-YYYY'),'YYYY'),'0000')- 543,'0000')||'-'||to_char(to_date(cassava_date,'DD-MM-YYYY'),'MM-DD'),'YYYY-MM-DD') "
                        + "between "
                        + "to_date(to_char(to_number(to_char(to_date('" + DataBean.getCassava_date() + "','DD-MM-YYYY'),'YYYY'),'0000')- 543,'0000')||'-'||to_char(to_date('" + DataBean.getCassava_date() + "','DD-MM-YYYY'),'MM-DD'),'YYYY-MM-DD') "
                        + "and "
                        + "to_date(to_char(to_number(to_char(to_date('" + DataBean.getCassava_of_date() + "','DD-MM-YYYY'),'YYYY'),'0000')- 543,'0000')||'-'||to_char(to_date('" + DataBean.getCassava_of_date() + "','DD-MM-YYYY'),'MM-DD'),'YYYY-MM-DD') "
                        + "and delete_flag = 'N' and complete_flag = 'N'";
        
*/      

                rs = con.createStatement().executeQuery(SQL);
                System.out.println("Calc Casava Detail SQL = " + SQL);
                while (rs.next()) {
                    String_return = objuti.NotNull(rs.getString("sum_amount_cassava"), "0.000") + ",";
                    String_return += objuti.NotNull(rs.getString("sum_percent_tapioca"), "0.000") + ",";
                    String_return += objuti.NotNull(rs.getString("sum_amount_tapioca"), "0.000") + ",";
                    String_return += objuti.NotNull(rs.getString("sum_amount_peel_fresh"), "0.000") + ",";
                    String_return += objuti.NotNull(rs.getString("sum_amount_soil_crust"), "0.000") + ",";
                    String_return += objuti.NotNull(rs.getString("sum_total_cassava"), "0.000") + ",";
                    String_return += objuti.NotNull(rs.getString("sum_percent_tapioca"), "0.000") + ",";
                    String_return += objuti.NotNull(rs.getString("sum_total_tapioca"), "0.000");
                }
            }
            System.out.println("String_return = " + String_return);
        } catch (Exception e) {
            e.printStackTrace(System.out);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (con != null) {
                con.close();
            }
            return String_return;
        }
    }

    public String Calculator_Starch_Balance(String date_from_input, String date_to_input) throws Exception {
        String return_value = null;
        Connection con = new DBConnect().openNewConnection();
        ResultSet rs = null;
        try {
            //System.out.print("select total_starch_weight from d_product_report_daily_header where to_date(format_date(doc_date),'YYYY-MM-DD') between to_date(format_date('"+date_from_input+"'),'YYYY-MM-DD') and to_date(format_date('"+date_to_input+"'),'YYYY-MM-DD') and delete_flag = 'N' ");
            rs = con.createStatement().executeQuery("select trim(to_char(sum(to_number(total_starch_weight,'9999990.000')),'9999990.000')) as sum_total_starch_weight from d_product_report_daily_header where to_date(format_date(doc_date),'YYYY-MM-DD') between to_date(format_date('" + date_from_input + "'),'YYYY-MM-DD') and to_date(format_date('" + date_to_input + "'),'YYYY-MM-DD') and delete_flag = 'N' ");
            while (rs.next()) {
                return_value = rs.getString("sum_total_starch_weight");
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
        } finally {
            if (rs != null) {
                rs.close();
            }
            con.close();
            return return_value == null ? "0.000" : return_value;
        }
    }
}
