/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bw.DB;

import com.bw.bean.DataBeanM_supply_type;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 *
 * @author B
 */
public class M_supplyer_typeDAO {
    private int returnvalue;
    public int insert(DataBeanM_supply_type dataBean) throws Exception {
        DBConnect dbConnect = new DBConnect();
        Connection con = dbConnect.openNewConnection();
        String sql = "INSERT INTO m_supplyer_type(supply_type_id,name_t,remark,create_date,create_by) values(?,?,?,?,?)";
        PreparedStatement p = null;

        try {
            p = con.prepareStatement(sql);
            p.setString(1, dataBean.getSupply_type_id());
            p.setString(2, dataBean.getName_t());
            p.setString(3, dataBean.getRemark());
            p.setTimestamp(4, dataBean.getDate());
            p.setString(5, dataBean.getBy());
            returnvalue = p.executeUpdate();

        } finally {
            try {
                p.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace(System.out);
            }
        }
        return returnvalue;
    }
    public int  update(DataBeanM_supply_type dataBean) throws Exception {
        DBConnect dbConnect = new DBConnect();
        Connection con = dbConnect.openNewConnection();
        String sql = "UPDATE m_supplyer_type SET name_t=?,remark=?,update_date=?,update_by=? where supply_type_id = ? and delete_flag <> 'Y'";
        PreparedStatement p = null;

        try {
            p = con.prepareStatement(sql);
            p.setString(1, dataBean.getName_t());
            p.setString(2, dataBean.getRemark());
            p.setTimestamp(3, dataBean.getDate());
            p.setString(4, dataBean.getBy());
            p.setString(5, dataBean.getSupply_type_id());
            returnvalue = p.executeUpdate();
        } finally {
            try {
                p.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace(System.out);
            }
        }
        return returnvalue;
    }
    public int  updateDel(DataBeanM_supply_type dataBean) throws Exception {
        DBConnect dbConnect = new DBConnect();
        Connection con = dbConnect.openNewConnection();
        String sql = "UPDATE m_supplyer_type SET delete_flag = 'Y',delete_by=?,delete_date=? where supply_type_id=? and delete_flag = 'N'";
        PreparedStatement p = null;

        try {
            p = con.prepareStatement(sql);
            p.setString(1, dataBean.getBy());
            p.setTimestamp(2, dataBean.getDate());
            p.setString(3, dataBean.getSupply_type_id());
            returnvalue =p.executeUpdate();
        } finally {
            try {
                p.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace(System.out);
            }
        }
        return returnvalue;
    }
}
