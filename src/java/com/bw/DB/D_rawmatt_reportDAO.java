/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bw.DB;

import com.bw.Calculator.Calculator_BW;
import com.bw.bean.DataBeanD_rawmatt_report;
import com.bw.Util.StringQuery;
import com.bw.Util.UtiDatabase;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author B
 */
public class D_rawmatt_reportDAO {
    private StringQuery obj_StringQuery;
    public void insert(DataBeanD_rawmatt_report DataBean)throws Exception{
        String[] String_insert = new String[]{
            "doc_id",
            "doc_date",
            "wh_out",
            "wh_in",
            "cassava_date",
            "amount_cassava",
            "percent_tapioca",
            "amount_tapioca",
            "peel_fresh_date",
            "percent_moisture",
            "total_peel_fresh",
            "amount_peel_fresh",
            "soil_crust_date",
            "amount_soil_crust",
            "total_cassava",
            "total_tapioca",
            "reporter_id",
            "purchase_id",
            "production_id",
            "cassava_time_from",
            "cassava_time_to",
            "amount_cassava_product",
            "percent_tapioca_product",
            "amount_tapioca_product",
            "create_by",
            "create_date",
            "update_date"
        };
        obj_StringQuery = new StringQuery();
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        PreparedStatement p = null;
        int i = 1;
        try {
            p = con.prepareStatement(obj_StringQuery.Insert_String(String_insert, "d_rawmatt_report"));
            p.setString(i, DataBean.getDoc_id());i+=1;
            p.setString(i, DataBean.getDoc_date());i+=1;
            p.setString(i, DataBean.getWh_out());i+=1;
            p.setString(i, DataBean.getWh_in());i+=1;
            p.setString(i, DataBean.getCassava_date());i+=1;
            p.setString(i, DataBean.getAmount_cassava());i+=1;
            p.setString(i, DataBean.getPercent_tapioca());i+=1;
            p.setString(i, DataBean.getAmount_tapioca());i+=1;
            p.setString(i, DataBean.getPeel_fresh_date());i+=1;
            p.setString(i, DataBean.getPercent_moisture());i+=1;
            p.setString(i, DataBean.getTotal_peel_fresh());i+=1;
            p.setString(i, DataBean.getAmount_peel_fresh());i+=1;
            p.setString(i, DataBean.getSoil_crust_date());i+=1;
            p.setString(i, DataBean.getAmount_soil_crust());i+=1;
            p.setString(i, DataBean.getTotal_cassava());i+=1;
            p.setString(i, DataBean.getTotal_tapioca());i+=1;
            p.setString(i, DataBean.getReporter_id());i+=1;
            p.setString(i, DataBean.getPurchase_id());i+=1;
            p.setString(i, DataBean.getProduction_id());i+=1;
            p.setString(i, DataBean.getDoc_time_from());i+=1;
            p.setString(i, DataBean.getDoc_time_to());i+=1;
            p.setString(i, DataBean.getAmount_cassava_product());i+=1;
            p.setString(i, DataBean.getPercent_tapioca_product());i+=1;
            p.setString(i, DataBean.getAmount_tapioca_product());i+=1;
            p.setString(i, DataBean.getBy());i+=1;
            p.setTimestamp(i, DataBean.getDate());i+=1;
            p.setTimestamp(i, DataBean.getDate());i+=1;
            p.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace(System.out);
        } finally {
            if(p != null){
                p.close();
            }
            if(con != null){
                con.close();
            }
        }
    }
    public void  update(DataBeanD_rawmatt_report DataBean)throws Exception{
        String[] String_update = new String[]{
            "doc_date",
            "wh_out",
            "wh_in",
            "cassava_date",
            "amount_cassava",
            "percent_tapioca",
            "amount_tapioca",
            "peel_fresh_date",
            "percent_moisture",
            "total_peel_fresh",
            "amount_peel_fresh",
            "soil_crust_date",
            "amount_soil_crust",
            "total_cassava",
            "total_tapioca",
            "reporter_id",
            "purchase_id",
            "production_id",
            "cassava_time_from",
            "cassava_time_to",
            "amount_cassava_product",
            "percent_tapioca_product",
            "amount_tapioca_product",
            "update_by",
            "update_date"
        };
        obj_StringQuery = new StringQuery();
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        PreparedStatement p = null;
        int i = 1;
        try{
            p = con.prepareStatement(obj_StringQuery.Update_String(String_update, "d_rawmatt_report",
                    "Where doc_id = '"+DataBean.getDoc_id()+ " and delete_flag = 'N'"));
            p.setString(i, DataBean.getDoc_date());i+=1;
            p.setString(i, DataBean.getWh_out());i+=1;
            p.setString(i, DataBean.getWh_in());i+=1;
            p.setString(i, DataBean.getCassava_date());i+=1;
            p.setString(i, DataBean.getAmount_cassava());i+=1;
            p.setString(i, DataBean.getPercent_tapioca());i+=1;
            p.setString(i, DataBean.getAmount_tapioca());i+=1;
            p.setString(i, DataBean.getPeel_fresh_date());i+=1;
            p.setString(i, DataBean.getPercent_moisture());i+=1;
            p.setString(i, DataBean.getTotal_peel_fresh());i+=1;
            p.setString(i, DataBean.getAmount_peel_fresh());i+=1;
            p.setString(i, DataBean.getSoil_crust_date());i+=1;
            p.setString(i, DataBean.getAmount_soil_crust());i+=1;
            p.setString(i, DataBean.getTotal_cassava());i+=1;
            p.setString(i, DataBean.getTotal_tapioca());i+=1;
            p.setString(i, DataBean.getReporter_id());i+=1;
            p.setString(i, DataBean.getPurchase_id());i+=1;
            p.setString(i, DataBean.getProduction_id());i+=1;
            p.setString(i, DataBean.getDoc_time_from());i+=1;
            p.setString(i, DataBean.getDoc_time_to());i+=1;
            p.setString(i, DataBean.getAmount_cassava_product());i+=1;
            p.setString(i, DataBean.getPercent_tapioca_product());i+=1;
            p.setString(i, DataBean.getAmount_tapioca_product());i+=1;
            p.setString(i, DataBean.getBy());i+=1;
            p.setTimestamp(i, DataBean.getDate());i+=1;
            p.executeUpdate();
        }catch(Exception e){
            e.printStackTrace(System.out);
        }finally{
            if(p != null){
                p.close();
            }
            if(con != null){
                con.close();
            }
        }
    }
    public void delete(DataBeanD_rawmatt_report DataBean) throws Exception {
        obj_StringQuery = new StringQuery();
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        PreparedStatement p = null;
        try{
            p = con.prepareStatement(obj_StringQuery.Flag_Status_String("delete_flag='Y',delete_by=?,delete_date=?", "d_rawmatt_report",
                    "WHERE doc_id = '"+DataBean.getDoc_id()+"' and delete_flag = 'N' and complete_flag = 'N'"));
            p.setString(1, DataBean.getBy());
            p.setTimestamp(2 , DataBean.getDate());
            p.executeUpdate();
        }catch(Exception e){
            e.printStackTrace(System.out);
        }finally{
            if(p != null){
                p.close();
            }
            if(con != null){
                con.close();
            }
        }
    }
    public String Sum_Weight(DataBeanD_rawmatt_report dataBean)throws Exception{
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        ResultSet rs = null;
         String STR_Return = "";
         UtiDatabase objuti = new UtiDatabase();
         String SQL_REC_COUNT = "SELECT count(doc_date) as num from d_rawmatt_receive WHERE doc_date = '" + dataBean.getDoc_date() + "' AND delete_flag = 'N' " ; 
         System.out.println("REC COUNT = " + SQL_REC_COUNT); 
                String SQL_EXEC = "SELECT "
                        + "trim(to_char(sum(to_number(balance_weight,'99999990.00')),'99999990.00')) as sum_balance_weight,"
                        + "trim(to_char(sum(to_number(total_weight,'99999990.00')),'99999990.00')) as sum_total_weight,"
                        + "trim(to_char(sum(to_number(amount_tapioca,'99999990.00')),'99999990.00')) as sum_amount_tapioca_account,"
                        + "trim(to_char((sum(to_number(amount_tapioca,'99999990.00'))/sum(to_number(balance_weight,'99999990.00')))*100,'99999990.00')) as percent_tapioca,"
                        + "trim(to_char((sum(to_number(total_weight,'99999990.00'))*((sum(to_number(amount_tapioca,'99999990.00'))/sum(to_number(balance_weight,'99999990.00')))*100))/100,'99999990.00')) as sum_amount_tapioca_product "
                        + "FROM "
                        +"d_rawmatt_receive "
                        + "WHERE to_timestamp((format_date(doc_date) ||':'|| doc_time),'YYYY-MM-DD:HH24.MI') "
                        + "between to_timestamp((format_date('"+dataBean.getDoc_date()+"') ||':'|| '"+dataBean.getDoc_time_from()+"'),'YYYY-MM-DD:HH24.MI') "
                        + "and to_timestamp((format_date('"+dataBean.getDoc_date()+"') ||':'|| '"+dataBean.getDoc_time_to()+"'),'YYYY-MM-DD:HH24.MI') " 
                        + "and delete_flag = 'N' " ; 
                        //+ "and delete_flag = 'N' AND complete_flag = 'N'" ; 
                
        try{           
            if (objuti.numRowdatabase("SELECT count(doc_date) as num from d_rawmatt_receive WHERE doc_date = '" + dataBean.getDoc_date() + "' AND delete_flag = 'N' ") != 0) {                                        
                rs = con.createStatement().executeQuery(SQL_EXEC);
                System.out.println(SQL_EXEC); 
                while (rs.next()) {
                    STR_Return = rs.getString("sum_balance_weight")+","+rs.getString("percent_tapioca")+","+rs.getString("sum_amount_tapioca_account")
                            +","+rs.getString("sum_total_weight")+","+rs.getString("percent_tapioca")+","+rs.getString("sum_amount_tapioca_product");
                }
            } else {
                STR_Return = "0.00";
            }
            
            System.out.println("STR_Return = " + STR_Return);

        }catch(Exception e){
            e.printStackTrace(System.out);
        }finally{
            if(rs != null){
                rs.close();
            }
            if(con != null){
                con.close();
            }
            return STR_Return;
        }
    }

}
