/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bw.DB;

import com.bw.Calculator.Calculator_BW;
import com.bw.Util.StringQuery;
import com.bw.Util.UtiDatabase;
import com.bw.bean.DataBeanD_product_milling_header;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author B
 */
public class D_product_milling_headerDAO {
    UtiDatabase objuti;
    StringQuery objStringQuery ;
    public void insert(DataBeanD_product_milling_header DataBean)throws Exception{
        String[] String_input = new String[]{
            "doc_id",
            "cod_in",
            "cod_out",
            "cassava_roots_qty",
            "total_2",
            "create_by",
            "create_date"
        };
        Calculator_BW objcal = new  Calculator_BW();
        objuti = new UtiDatabase();
        objStringQuery = new StringQuery();
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        PreparedStatement p = null;
        int i = 1;
        try{
            DataBean.setTotal_2(objcal.Sum_Time(DataBean.getDoc_id(), "d_product_milling_detail_2", "date_from", "date_to", "time_from", "time_to", con));
            p = con.prepareStatement(objStringQuery.Insert_String(String_input, "d_product_milling_header"));
            p.setString(i,DataBean.getDoc_id());i+=1;
            p.setString(i, DataBean.getCod_in());i+=1;
            p.setString(i, DataBean.getCod_out());i+=1;
            p.setString(i, DataBean.getCassava_roots_qty());i+=1;
            p.setString(i, DataBean.getTotal_2());i+=1;
            p.setString(i, DataBean.getBy());i+=1;
            p.setTimestamp(i, DataBean.getDate());i+=1;
            p.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(p != null){
                p.close();
            }
            if(con != null){
                con.close();
            }
        }
    }
    public void update(DataBeanD_product_milling_header DataBean)throws Exception{
        String[] String_input = new String[]{
            "cod_in",
            "cod_out",
            "cassava_roots_qty",
            "total_2",
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
        try{
            DataBean.setTotal_2(objcal.Sum_Time(DataBean.getDoc_id(), "d_product_milling_detail_2", "date_from", "date_to", "time_from", "time_to", con));
            p = con.prepareStatement(objStringQuery.Update_String(String_input, "d_product_milling_header","WHERE doc_id = ? and delete_flag = 'N' and complete_flag = 'N'"));
            p.setString(i, DataBean.getCod_in());i+=1;
            p.setString(i, DataBean.getCod_out());i+=1;
            p.setString(i, DataBean.getCassava_roots_qty());i+=1;
            p.setString(i, DataBean.getTotal_2());i+=1;
            p.setString(i, DataBean.getBy());i+=1;
            p.setTimestamp(i, DataBean.getDate());i+=1;
            p.setString(i,DataBean.getDoc_id());i+=1;
            p.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(p != null){
                p.close();
            }
            if(con != null){
                con.close();
            }
        }
    }
    public void delete(DataBeanD_product_milling_header DataBean)throws Exception{
        objStringQuery = new StringQuery();
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        PreparedStatement p = null;
        try{
            p = con.prepareStatement(objStringQuery.Flag_Status_String("delete_flag='Y',delete_by=?,delete_date=?", "d_product_milling_header",
                    "WHERE doc_id = '"+DataBean.getDoc_id()+"' and delete_flag = 'N' and complete_flag = 'N'"));
            p.setString(1, DataBean.getBy());
            p.setTimestamp(2, DataBean.getDate());
            p.executeUpdate();
            p = null;
            p = con.prepareStatement(objStringQuery.Flag_Status_String("delete_flag='Y',delete_by=?,delete_date=?", "d_product_milling_detail_1",
                    "WHERE doc_id = '"+DataBean.getDoc_id()+"' and delete_flag = 'N' and complete_flag = 'N'"));
            p.setString(1, DataBean.getBy());
            p.setTimestamp(2, DataBean.getDate());
            p.executeUpdate();
            p = null;
            p = con.prepareStatement(objStringQuery.Flag_Status_String("delete_flag='Y',delete_by=?,delete_date=?", "d_product_milling_detail_2",
                    "WHERE doc_id = '"+DataBean.getDoc_id()+"' and delete_flag = 'N' and complete_flag = 'N'"));
            p.setString(1, DataBean.getBy());
            p.setTimestamp(2, DataBean.getDate());
            p.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(p != null){
                p.close();
            }
            if(con != null){
                con.close();
            }
        }
    }
    public DataBeanD_product_milling_header ReturnEdit(String doc_id)throws Exception{
        DataBeanD_product_milling_header DataBean = new DataBeanD_product_milling_header();
        Connection con = new DBConnect().openNewConnection();
        ResultSet rs = null;
        objuti = new UtiDatabase();
        try{
            if(objuti.numRowdatabase("select count(doc_id) as num from d_product_milling_header where doc_id = '"+doc_id+"' and delete_flag = 'N' and complete_flag = 'N'") != 0){
                rs = con.createStatement().executeQuery("select total_2,cod_in,cod_out,cassava_roots_qty from d_product_milling_header where doc_id = '"+doc_id+"' and delete_flag = 'N' and complete_flag = 'N'");
                while(rs.next()){
                    DataBean.setCod_in(rs.getString("cod_in"));
                    DataBean.setCod_out(rs.getString("cod_out"));
                    DataBean.setCassava_roots_qty(rs.getString("cassava_roots_qty"));
                    DataBean.setTotal_2(rs.getString("total_2"));
                }

            }else{
                DataBean.setCod_in("0.00");
                DataBean.setCod_out("0.00");
                DataBean.setCassava_roots_qty("0.00");
                DataBean.setTotal_2("00.00");
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(rs != null){
                rs.close();
            }
            if(con != null){
                con.close();
            }
            return DataBean;
        }
    }
}
