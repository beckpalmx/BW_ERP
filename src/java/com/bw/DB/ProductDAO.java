/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bw.DB;

import com.bw.bean.ProductBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.swing.JOptionPane;

/**
 *
 * @author com02
 */
public class ProductDAO {
    public boolean insert(ProductBean proBean) throws Exception {
        DBConnect dbConnect = new DBConnect();
        Connection con = dbConnect.openNewConnection();
        String sql = "INSERT INTO mproduct(product_id,pgroup_id,ptype_id,pcat_id,name_t,price,min,max,safety,quantity,weight,location_id,value,remark,create_date) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement p = null;

        try {
            p = con.prepareStatement(sql);
            p.setString(1, proBean.getProduct_id());
            p.setString(2, proBean.getPgroup_id());
            p.setString(3, proBean.getPtype_id());
            p.setString(4, proBean.getPcat_id());
            p.setString(5, proBean.getName_t());
            p.setString(6, proBean.getPrice());
            p.setString(7, proBean.getMin());
            p.setString(8, proBean.getMax());
            p.setString(9, proBean.getSafety());
            p.setString(10, proBean.getQuantity());
            p.setString(11, proBean.getWarehouse_id());
            p.setString(12, proBean.getLocation_id());
            p.setString(13, proBean.getValue());
            p.setString(14, proBean.getRemark());
            p.setTimestamp(15, proBean.getCreate_date());

            p.executeUpdate();

            return true;

        } catch (Exception e) {
            return false;
        } finally {
            try {
                p.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace(System.out);
            }
        }
    }
    public void  updateDel(ProductBean proBean) throws Exception {
        DBConnect dbConnect = new DBConnect();
        Connection con = dbConnect.openNewConnection();
        String sql = "UPDATE mproduct SET delete_flag = 'Y' where product_id=?";
        PreparedStatement p = null;

        try {
            p = con.prepareStatement(sql);
            p.setString(1, proBean.getProduct_id());
            p.executeUpdate();
        } finally {
            try {
                p.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace(System.out);
            }
        }
    }
    public void  update(ProductBean proBean) throws Exception {
        DBConnect dbConnect = new DBConnect();
        Connection con = dbConnect.openNewConnection();
        String sql = "UPDATE mproduct SET pgroup_id=?,ptype_id=?,pcat_id=?,name_t=?,price=?,min=?,max=?,safety=?,quantity=?,weight=?,location_id=?,value=?,remark=?,update_date=? where product_id = ?";
        PreparedStatement p = null;

        try {
            p = con.prepareStatement(sql);
            p.setString(1, proBean.getPgroup_id());
            p.setString(2, proBean.getPtype_id());
            p.setString(3, proBean.getPcat_id());
            p.setString(4, proBean.getName_t());
            p.setString(5, proBean.getPrice());
            p.setString(6, proBean.getMin());
            p.setString(7, proBean.getMax());
            p.setString(8, proBean.getSafety());
            p.setString(9, proBean.getQuantity());
            p.setString(10, proBean.getWarehouse_id());
            p.setString(11, proBean.getLocation_id());
            p.setString(12, proBean.getValue());
            p.setString(13, proBean.getRemark());
            p.setTimestamp(14, proBean.getUpdate_date());
            p.setString(15, proBean.getProduct_id());
            p.executeUpdate();

        } finally {
            try {
                p.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace(System.out);
            }
        }
    }
    public ProductBean selectData(String id) throws Exception {
        
        ProductBean proBean = null;
        DBConnect dbConnect = new DBConnect();
        ResultSet rs = null;
        Connection con = dbConnect.openNewConnection();
        String sql = "SELECT * From mproduct where product_id = ? AND delete_flag <> 'Y'";
        PreparedStatement p = null;
            try {
                p = con.prepareStatement(sql);
                p.setString(1, id);
                rs = p.executeQuery();
                while (rs.next()) {
                    proBean = new ProductBean();
                    proBean.setProduct_id(rs.getString("product_id"));
                    proBean.setDelete_fag(rs.getString("delete_flag"));

                }

        }finally {
            try {
                p.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace(System.out);
            }
             return proBean ;
        }
    }
}
