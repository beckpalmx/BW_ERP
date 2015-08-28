/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bw.DB;

import com.bw.Util.StringQuery;
import com.bw.Util.UtiDatabase;
import com.bw.bean.DataBeanD_production_header;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author B
 */
public class D_production_headerDAO {
    UtiDatabase objuti;
    StringQuery objStringQuery ;
    public void insert(DataBeanD_production_header DataBean)throws Exception{
        String[] String_input = new String[]{
            "doc_id",
            "doc_date",
            "roast_qty",
            "pack_qty",
            "date_1",
            "date_2",
            "date_3",
            "date_4",
            "date_5",
            "date_6",
            "date_7",
            "date_8",
            "percent_p1",
            "percent_p2",
            "percent_p3",
            "percent_p4",
            "percent_y1",
            "percent_y2",
            "percent_y3",
            "percent_y4",
            "reporter_id",
            "checker_id",
            "approver_id",
            "create_by",
            "create_date"
        };
        objuti = new UtiDatabase();
        objStringQuery = new StringQuery();
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        PreparedStatement p = null;
        int i = 1;

        try{
            p = con.prepareStatement(objStringQuery.Insert_String(String_input, "d_production_header"));
            p.setString(i,DataBean.getDoc_id());i+=1;
            p.setString(i, DataBean.getDoc_date());i+=1;
            p.setString(i, DataBean.getRoast_qty());i+=1;
            p.setString(i, DataBean.getPack_qty());i+=1;
            p.setString(i, DataBean.getDate_1());i+=1;
            p.setString(i, DataBean.getDate_2());i+=1;
            p.setString(i, DataBean.getDate_3());i+=1;
            p.setString(i, DataBean.getDate_4());i+=1;
            p.setString(i, DataBean.getDate_5());i+=1;
            p.setString(i, DataBean.getDate_6());i+=1;
            p.setString(i, DataBean.getDate_7());i+=1;
            p.setString(i, DataBean.getDate_8());i+=1;
            p.setString(i, DataBean.getPercent_p1());i+=1;
            p.setString(i, DataBean.getPercent_p2());i+=1;
            p.setString(i, DataBean.getPercent_p3());i+=1;
            p.setString(i, DataBean.getPercent_p4());i+=1;
            p.setString(i, DataBean.getPercent_y1());i+=1;
            p.setString(i, DataBean.getPercent_y2());i+=1;
            p.setString(i, DataBean.getPercent_y3());i+=1;
            p.setString(i, DataBean.getPercent_y4());i+=1;
            p.setString(i, DataBean.getReporter_id());i+=1;
            p.setString(i, DataBean.getChecker_id());i+=1;
            p.setString(i, DataBean.getApprove_id());i+=1;
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
    public void update(DataBeanD_production_header DataBean)throws Exception{
        String[] String_input = new String[]{
            "doc_date",
            "roast_qty",
            "pack_qty",
            "date_1",
            "date_2",
            "date_3",
            "date_4",
            "date_5",
            "date_6",
            "date_7",
            "date_8",
            "percent_p1",
            "percent_p2",
            "percent_p3",
            "percent_p4",
            "percent_y1",
            "percent_y2",
            "percent_y3",
            "percent_y4",
            "reporter_id",
            "checker_id",
            "approver_id",
            "update_by",
            "update_date"
        };
        objuti = new UtiDatabase();
        objStringQuery = new StringQuery();
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        PreparedStatement p = null;
        int i = 1;
        try{
            p = con.prepareStatement(objStringQuery.Update_String(String_input, "d_production_header","WHERE doc_id = ? and delete_flag = 'N' and complete_flag = 'N'"));
            p.setString(i, DataBean.getDoc_date());i+=1;
            p.setString(i, DataBean.getRoast_qty());i+=1;
            p.setString(i, DataBean.getPack_qty());i+=1;
            p.setString(i, DataBean.getDate_1());i+=1;
            p.setString(i, DataBean.getDate_2());i+=1;
            p.setString(i, DataBean.getDate_3());i+=1;
            p.setString(i, DataBean.getDate_4());i+=1;
            p.setString(i, DataBean.getDate_5());i+=1;
            p.setString(i, DataBean.getDate_6());i+=1;
            p.setString(i, DataBean.getDate_7());i+=1;
            p.setString(i, DataBean.getDate_8());i+=1;
            p.setString(i, DataBean.getPercent_p1());i+=1;
            p.setString(i, DataBean.getPercent_p2());i+=1;
            p.setString(i, DataBean.getPercent_p3());i+=1;
            p.setString(i, DataBean.getPercent_p4());i+=1;
            p.setString(i, DataBean.getPercent_y1());i+=1;
            p.setString(i, DataBean.getPercent_y2());i+=1;
            p.setString(i, DataBean.getPercent_y3());i+=1;
            p.setString(i, DataBean.getPercent_y4());i+=1;
            p.setString(i, DataBean.getReporter_id());i+=1;
            p.setString(i, DataBean.getChecker_id());i+=1;
            p.setString(i, DataBean.getApprove_id());i+=1;
            p.setString(i, DataBean.getBy());i+=1;
            p.setTimestamp(i, DataBean.getDate());i+=1;
            p.setString(i,DataBean.getDoc_id());i+=1;
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
    public void delete(DataBeanD_production_header DataBean)throws Exception{
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
        objuti =new UtiDatabase();
        objStringQuery = new StringQuery();
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        PreparedStatement p = null;
        try{
            for(int i = 0 ; i < Table_name.length;i++){
                SQL_Qury = "select count(doc_id) as num from "+Table_name[i]+" where doc_id = '"+DataBean.getDoc_id()+"' and delete_flag = 'N' and complete_flag = 'N'";
                if(objuti.numRowdatabase(SQL_Qury) != 0){
                    p = con.prepareStatement(objStringQuery.Flag_Status_String("delete_flag='Y',delete_by=?,delete_date=?", Table_name[i],
                    "WHERE doc_id = '"+DataBean.getDoc_id()+"' and delete_flag = 'N' and complete_flag = 'N'"));
                    p.setString(1, DataBean.getBy());
                    p.setTimestamp(2, DataBean.getDate());
                    p.executeUpdate();
                }
            }
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
    public DataBeanD_production_header Return_Edit(String doc_id)throws Exception{
        DataBeanD_production_header return_bean = new  DataBeanD_production_header();
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        ResultSet rs = null;
        String SQL = "";
        objuti = new UtiDatabase();
        try{
            SQL = "SELECT "
                    + "doc_id,doc_date,roast_qty,pack_qty,date_1,date_2,date_3,date_4,date_5,date_6,date_7,date_8,"
                    + "percent_p1,percent_p2,percent_p3,percent_p4,"
                    + "percent_y1,percent_y2,percent_y3,percent_y4,"
                    + "reporter_id,checker_id,approver_id,"
                    + "(select total_prod_1 from d_product_roast_header where doc_id = d_production_header.doc_id and delete_flag = 'N' and complete_flag = 'N') as total_rost_qty,"
                    + "(select sum_prod_tot_weight from d_product_pack_header where doc_id = d_production_header.doc_id and delete_flag = 'N' and complete_flag = 'N')as total_pack_qty"
                    + " FROM d_production_header "
                    + "WHERE doc_id = '"+doc_id+"' and delete_flag = 'N' and complete_flag = 'N'";
            rs = con.createStatement().executeQuery(SQL);
            while(rs.next()){
                return_bean.setDoc_id(rs.getString("doc_id"));
                return_bean.setDoc_date(rs.getString("doc_date"));
                return_bean.setRoast_qty(objuti.NotNull(rs.getString("total_rost_qty"),"0"));
                return_bean.setPack_qty(objuti.NotNull(rs.getString("total_pack_qty"),"0"));
                return_bean.setDate_1(rs.getString("date_1"));
                return_bean.setDate_2(rs.getString("date_2"));
                return_bean.setDate_3(rs.getString("date_3"));
                return_bean.setDate_4(rs.getString("date_4"));
                return_bean.setDate_5(rs.getString("date_5"));
                return_bean.setDate_6(rs.getString("date_6"));
                return_bean.setDate_7(rs.getString("date_7"));
                return_bean.setDate_8(rs.getString("date_8"));
                return_bean.setPercent_p1(rs.getString("percent_p1"));
                return_bean.setPercent_p2(rs.getString("percent_p2"));
                return_bean.setPercent_p3(rs.getString("percent_p3"));
                return_bean.setPercent_p4(rs.getString("percent_p4"));
                return_bean.setPercent_y1(rs.getString("percent_y1"));
                return_bean.setPercent_y2(rs.getString("percent_y2"));
                return_bean.setPercent_y3(rs.getString("percent_y3"));
                return_bean.setPercent_y4(rs.getString("percent_y4"));
                return_bean.setReporter_id(rs.getString("reporter_id"));
                return_bean.setChecker_id(rs.getString("checker_id"));
                return_bean.setApprove_id(rs.getString("approver_id"));
                
            }
        }catch(Exception e){
            e.printStackTrace(System.out);
        }finally{
            if(rs != null){
                rs.close();
            }
            if(con != null){
                con.close();
            }
            return return_bean;
        }
    }
    public String getValue_Yield(String date_input_from,String date_input_to)throws Exception{
        Connection con = new DBConnect().openNewConnection();
        ResultSet rs = null;
        String str_output = null;
        try{
            rs = con.createStatement().executeQuery("select percent_diff,percent_yield from d_product_report_daily_header where cassava_date = '"+date_input_from+"' and cassava_date2 = '"+date_input_to+"' and delete_flag = 'N'");
            while(rs.next()){
                str_output = rs.getString("percent_diff")+","+rs.getString("percent_yield");
            }
        }catch(Exception e){
            e.printStackTrace(System.out);
        }finally{
            if(rs != null){
                rs.close();
            }
            con.close();
            return str_output == null ? "0.000,0.000":str_output;
        }
    }
}
