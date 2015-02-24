/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bw.DB;

import com.bw.Calculator.Calculator_T_warehouse_item;
import com.bw.bean.DataBeanT_transaction_stock;
import com.bw.bean.DataBeanT_warehouse_item;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author B
 */
public class T_warehouse_itemDAO {

    private String SQL;
    public String bag_qty;
    public String price;
    public String wh_value;
    //insert ข้อมูลลง T_warehouse_item

    public void InsertT_warehouse_item(DataBeanT_warehouse_item dataBean, Connection con) throws Exception {
        PreparedStatement p = null;
        SQL = "INSERT INTO t_warehouse_item "
                + "(warehouse_id,product_id,price,wh_value,bag_weight,bag_qty,create_date,create_by)"
                + " VALUES(?,?,?,?,?,?,?,?)";
        try {
            p = con.prepareStatement(SQL);
            p.setString(1, dataBean.getWarehouse_id());
            p.setString(2, dataBean.getProduct_id());
            p.setString(3, dataBean.getPrice() == null? "1.00" :dataBean.getPrice());
            p.setString(4, dataBean.getWh_value() == null? "1.00" :dataBean.getWh_value() );
            p.setString(5, dataBean.getWeight());
            p.setString(6, dataBean.getBag_qty());
            p.setTimestamp(7, dataBean.getDate());
            p.setString(8, dataBean.getBy());
            p.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (p != null) {
                p.close();
            }
        }

    }

    public void UpdateT_warehouse_item(DataBeanT_transaction_stock dataBean, Connection con) throws Exception {
        Calculator_T_warehouse_item objcal = new Calculator_T_warehouse_item();
        Select_Twarehouse_data((dataBean.getDoc_type().equals("+")) ? dataBean.getWh_in() : dataBean.getWh_out(), dataBean.getWeight(), dataBean.getProduct_id());
        PreparedStatement p = null;
        SQL = "Update t_warehouse_item set bag_qty=?,update_date=?,update_by=?";
        SQL += ",wh_value=?,price=?";
        SQL += " where warehouse_id=? and bag_weight=? and product_id=?";
        try {
            //dataBean.setWeight();
            if (dataBean.getProcess_id().equals("PR_022")) {
                p = con.prepareStatement(SQL);
                p.setString(1, objcal.Cal_Positive(bag_qty, dataBean.getWeight()));
                p.setTimestamp(2, dataBean.getDate());
                p.setString(3, dataBean.getBy());
                p.setString(4, objcal.Cal_WH_Total_Value(wh_value, dataBean.getReceieve_value()));
                p.setString(5, objcal.Cost_per_Unit(objcal.Cal_WH_Total_Value(wh_value, dataBean.getReceieve_value()), objcal.Cal_Positive(bag_qty, dataBean.getWeight())));
                p.setString(6, (dataBean.getDoc_type().equals("-")) ? dataBean.getWh_in() : dataBean.getWh_out());
                p.setString(7, dataBean.getLocation_id());
                p.setString(8, dataBean.getProduct_id());
            } else {
                p = con.prepareStatement(SQL);
                p.setString(1, (dataBean.getDoc_type().equals("-")) ? objcal.Cal_Negative(bag_qty, dataBean.getBag_qty()) : objcal.Cal_Positive(bag_qty, dataBean.getBag_qty()));
                p.setTimestamp(2, dataBean.getDate());
                p.setString(3, dataBean.getBy());
                p.setString(4, dataBean.getWh_value() == null ? "1.00":dataBean.getWh_value());
                p.setString(5, dataBean.getCost_per_unit()== null ? "1.00" : dataBean.getCost_per_unit());
                p.setString(6, (dataBean.getDoc_type().equals("+")) ? dataBean.getWh_in() : dataBean.getWh_out());
                p.setString(7, dataBean.getWeight());
                p.setString(8, dataBean.getProduct_id());
                
            }
            p.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (p != null) {
                p.close();
            }/*if(con != null){
            con.close();
            }*/
        }
    }
    //เลือก warehouse_id,bag_weight,product_id  เพื่อเอา จำนวนกระสอบ ออกมา

    public void Select_Twarehouse_data(String warehouse_id, String bag_weight, String product_id) throws Exception {
        bag_qty = "0.00";
        price = "0.00";
        wh_value = "0.00";
        String SQL_select = "SELECT bag_qty,wh_value,price FROM t_warehouse_item WHERE warehouse_id ='" + warehouse_id + "' AND bag_weight ='" + bag_weight + "' AND product_id = '" + product_id + "'";
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        ResultSet rs = null;
        try {
            rs = con.createStatement().executeQuery(SQL_select);
            while (rs.next()) {
                bag_qty = rs.getString("bag_qty");
                wh_value = rs.getString("wh_value");
                price = rs.getString("price");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }
}
