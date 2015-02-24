/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bw.DB;

import com.bw.Util.StringQuery;
import com.bw.bean.DataBeanD_production_analysis;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 *
 * @author B
 */
public class D_production_analysisDAO {

    private String SQL = "";
    private StringQuery obj_StringQuery;

    public void insert(DataBeanD_production_analysis DataBean) throws Exception {
        String[] String_insert = new String[]{
            "doc_id",
            "doc_date",
            "shift",
            "approver_id",
            "date_chk",
            "time_chk",
            "be_1",
            "be_2",
            "be_3",
            "be_4",
            "be_5",
            "be_6",
            "m_be",
            "m3",
            "mold",
            "ph",
            "s_1",
            "s_2",
            "s_3",
            "s_4",
            "s_5",
            "s_6",
            "s_7",
            "s_8",
            "s_9",
            "s_10",
            "w_1",
            "w_2",
            "w_3",
            "w_4",
            "w_5",
            "w_6",
            "w_7",
            "w_8",
            "w_9",
            "w_10",
            "d_1",
            "d_2",
            "d_3",
            "st_1",
            "st_2",
            "k_1",
            "m_1",
            "b_1",
            "create_by",
            "create_date"
        };
        obj_StringQuery = new StringQuery();
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        PreparedStatement p = null;
        int i = 1;
        try {
            p = con.prepareStatement(obj_StringQuery.Insert_String(String_insert, "d_production_analysis"));
            p.setString(i, DataBean.getDoc_id());i+=1;
            p.setString(i, DataBean.getDoc_date());i+=1;
            p.setString(i, DataBean.getShift());i+=1;
            p.setString(i, DataBean.getApprover_id());i+=1;
            p.setString(i, DataBean.getDate_chk());i+=1;
            p.setString(i, DataBean.getTime_chk());i+=1;
            p.setString(i, DataBean.getBe_1());i+=1;
            p.setString(i, DataBean.getBe_2());i+=1;
            p.setString(i, DataBean.getBe_3());i+=1;
            p.setString(i, DataBean.getBe_4());i+=1;
            p.setString(i, DataBean.getBe_5());i+=1;
            p.setString(i, DataBean.getBe_6());i+=1;
            p.setString(i, DataBean.getM_be());i+=1;
            p.setString(i, DataBean.getM3());i+=1;
            p.setString(i, DataBean.getMold());i+=1;
            p.setString(i, DataBean.getPh());i+=1;
            p.setString(i, DataBean.getS_1());i+=1;
            p.setString(i, DataBean.getS_2());i+=1;
            p.setString(i, DataBean.getS_3());i+=1;
            p.setString(i, DataBean.getS_4());i+=1;
            p.setString(i, DataBean.getS_5());i+=1;
            p.setString(i, DataBean.getS_6());i+=1;
            p.setString(i, DataBean.getS_7());i+=1;
            p.setString(i, DataBean.getS_8());i+=1;
            p.setString(i, DataBean.getS_9());i+=1;
            p.setString(i, DataBean.getS_10());i+=1;
            p.setString(i, DataBean.getW_1());i+=1;
            p.setString(i, DataBean.getW_2());i+=1;
            p.setString(i, DataBean.getW_3());i+=1;
            p.setString(i, DataBean.getW_4());i+=1;
            p.setString(i, DataBean.getW_5());i+=1;
            p.setString(i, DataBean.getW_6());i+=1;
            p.setString(i, DataBean.getW_7());i+=1;
            p.setString(i, DataBean.getW_8());i+=1;
            p.setString(i, DataBean.getW_9());i+=1;
            p.setString(i, DataBean.getW_10());i+=1;
            p.setString(i, DataBean.getD_1());i+=1;
            p.setString(i, DataBean.getD_2());i+=1;
            p.setString(i, DataBean.getD_3());i+=1;
            p.setString(i, DataBean.getSt_1());i+=1;
            p.setString(i, DataBean.getSt_2());i+=1;
            p.setString(i, DataBean.getK_1());i+=1;
            p.setString(i, DataBean.getM_1());i+=1;
            p.setString(i, DataBean.getB_1());i+=1;
            p.setString(i, DataBean.getBy());i+=1;
            p.setTimestamp(i, DataBean.getDate());
            p.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(p != null){
                p.close();
            }
            if(con != null){
                con.close();
            }
        }
    }

    public void update(DataBeanD_production_analysis DataBean) throws Exception {
        String[] String_insert = new String[]{
            "doc_date",
            "shift",
            "approver_id",
            "date_chk",
            "time_chk",
            "be_1",
            "be_2",
            "be_3",
            "be_4",
            "be_5",
            "be_6",
            "m_be",
            "m3",
            "mold",
            "ph",
            "s_1",
            "s_2",
            "s_3",
            "s_4",
            "s_5",
            "s_6",
            "s_7",
            "s_8",
            "s_9",
            "s_10",
            "w_1",
            "w_2",
            "w_3",
            "w_4",
            "w_5",
            "w_6",
            "w_7",
            "w_8",
            "w_9",
            "w_10",
            "d_1",
            "d_2",
            "d_3",
            "st_1",
            "st_2",
            "k_1",
            "m_1",
            "b_1",
            "update_by",
            "update_date"
        };
        obj_StringQuery = new StringQuery();
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        PreparedStatement p = null;
        int i = 1;
        try {
            p = con.prepareStatement(obj_StringQuery.Update_String(String_insert, "D_production_analysis",
                    "Where doc_id = '"+DataBean.getDoc_id()+"' and complete_flag = 'N' and delete_flag = 'N'"));
            p.setString(i, DataBean.getDoc_date());i+=1;
            p.setString(i, DataBean.getShift());i+=1;
            p.setString(i, DataBean.getApprover_id());i+=1;
            p.setString(i, DataBean.getDate_chk());i+=1;
            p.setString(i, DataBean.getTime_chk());i+=1;
            p.setString(i, DataBean.getBe_1());i+=1;
            p.setString(i, DataBean.getBe_2());i+=1;
            p.setString(i, DataBean.getBe_3());i+=1;
            p.setString(i, DataBean.getBe_4());i+=1;
            p.setString(i, DataBean.getBe_5());i+=1;
            p.setString(i, DataBean.getBe_6());i+=1;
            p.setString(i, DataBean.getM_be());i+=1;
            p.setString(i, DataBean.getM3());i+=1;
            p.setString(i, DataBean.getMold());i+=1;
            p.setString(i, DataBean.getPh());i+=1;
            p.setString(i, DataBean.getS_1());i+=1;
            p.setString(i, DataBean.getS_2());i+=1;
            p.setString(i, DataBean.getS_3());i+=1;
            p.setString(i, DataBean.getS_4());i+=1;
            p.setString(i, DataBean.getS_5());i+=1;
            p.setString(i, DataBean.getS_6());i+=1;
            p.setString(i, DataBean.getS_7());i+=1;
            p.setString(i, DataBean.getS_8());i+=1;
            p.setString(i, DataBean.getS_9());i+=1;
            p.setString(i, DataBean.getS_10());i+=1;
            p.setString(i, DataBean.getW_1());i+=1;
            p.setString(i, DataBean.getW_2());i+=1;
            p.setString(i, DataBean.getW_3());i+=1;
            p.setString(i, DataBean.getW_4());i+=1;
            p.setString(i, DataBean.getW_5());i+=1;
            p.setString(i, DataBean.getW_6());i+=1;
            p.setString(i, DataBean.getW_7());i+=1;
            p.setString(i, DataBean.getW_8());i+=1;
            p.setString(i, DataBean.getW_9());i+=1;
            p.setString(i, DataBean.getW_10());i+=1;
            p.setString(i, DataBean.getD_1());i+=1;
            p.setString(i, DataBean.getD_2());i+=1;
            p.setString(i, DataBean.getD_3());i+=1;
            p.setString(i, DataBean.getSt_1());i+=1;
            p.setString(i, DataBean.getSt_2());i+=1;
            p.setString(i, DataBean.getK_1());i+=1;
            p.setString(i, DataBean.getM_1());i+=1;
            p.setString(i, DataBean.getB_1());i+=1;
            p.setString(i, DataBean.getBy());i+=1;
            p.setTimestamp(i, DataBean.getDate());
            p.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(p != null){
                p.close();
            }
            if(con != null){
                con.close();
            }
        }
    }

    public void delete(DataBeanD_production_analysis DataBean) throws Exception {
        obj_StringQuery = new StringQuery();
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        PreparedStatement p = null;
        try{
            p = con.prepareStatement(obj_StringQuery.Flag_Status_String("delete_flag='Y',delete_by=?,delete_date=?", "d_production_analysis",
                    "WHERE doc_id = '"+DataBean.getDoc_id()+"' and delete_flag = 'N' and complete_flag = 'N'"));
            p.setString(1, DataBean.getBy());
            p.setTimestamp(2 , DataBean.getDate());
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
}
