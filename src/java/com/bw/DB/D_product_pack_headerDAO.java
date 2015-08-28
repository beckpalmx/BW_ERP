/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bw.DB;

import com.bw.Util.StringQuery;
import com.bw.Util.UtiDatabase;
import com.bw.bean.DataBeanD_product_pack_header;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 *
 * @author B
 */
public class D_product_pack_headerDAO {
    //private UtiDatabase objuti;
    private StringQuery objStringQuery;
    public void insert(DataBeanD_product_pack_header DataBean)throws Exception{
        String[] String_input = new String[]{
            "doc_id",
            "sum_withdraw_tot_weight",
            "sum_prod_tot_weight",
            "create_by",
            "create_date"
        };
        //objuti = new UtiDatabase();
        objStringQuery = new StringQuery();
        Connection con = new DBConnect().openNewConnection();
        PreparedStatement p = null;
        int i = 1;
        try {

            p = con.prepareStatement(objStringQuery.Insert_String(String_input, "d_product_pack_header"));
            p.setString(i, DataBean.getDoc_id());i += 1;
            p.setString(i, DataBean.getWithdraw_tot_weight());i += 1;
            p.setString(i, DataBean.getProd_tot_weight());i += 1;
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
    public void update(DataBeanD_product_pack_header DataBean)throws Exception{
        String[] String_input = new String[]{
            "sum_withdraw_tot_weight",
            "sum_prod_tot_weight",
            "update_by",
            "update_date"
        };
        //objuti = new UtiDatabase();
        objStringQuery = new StringQuery();
        Connection con = new DBConnect().openNewConnection();
        PreparedStatement p = null;
        int i = 1;
        try {
            p = con.prepareStatement(objStringQuery.Update_String(String_input, "d_product_pack_header", "WHERE doc_id = ? and delete_flag = 'N' and complete_flag = 'N'"));
            p.setString(i, DataBean.getWithdraw_tot_weight());i += 1;
            p.setString(i, DataBean.getProd_tot_weight());i += 1;
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
    public void delete(DataBeanD_product_pack_header DataBean)throws Exception{
        objStringQuery = new StringQuery();
        Connection con = new DBConnect().openNewConnection();
        PreparedStatement p = null;
        try{
            p = con.prepareStatement(objStringQuery.Flag_Status_String("delete_flag='Y',delete_by=?,delete_date=?", "d_product_pack_header",
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
}
