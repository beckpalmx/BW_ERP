/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bw.DB;

import com.bw.bean.DataBeanCS_Transection_Warehouse;
import com.bw.bean.DataBeanT_transaction_stock;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;

/**
 *
 * @author B
 */
public class T_transaction_stockDAO {

    private String SQL;
//ทำการบันทึกข้อมูลลง Transection Stock
    public void InsertT_transaction_stock(DataBeanT_transaction_stock dataBean,Connection con) throws Exception {
        //DBConnect objcon = new DBConnect();
        //Connection con = objcon.openNewConnection();
        PreparedStatement p = null;
        SQL = (dataBean.getDoc_type().equals("+"))
                ?"INSERT INTO t_transaction_stock "
                + "(doc_no,doc_date,process_id,product_id,wh_in,doc_type,weight,bag_qty,bag_withdraw,create_date,create_by) "
                + "VALUES(?,?,?,?,?,?,?,?,?,?,?)"
                :"INSERT INTO t_transaction_stock "
                + "(doc_no,doc_date,process_id,product_id,wh_out,doc_type,weight,bag_qty,bag_withdraw,create_date,create_by) "
                + "VALUES(?,?,?,?,?,?,?,?,?,?,?)";
        
        try {
                p = con.prepareStatement(SQL);
                p.setString(1, dataBean.getDoc_id());
                p.setString(2, dataBean.getDoc_date());
                p.setString(3, dataBean.getProcess_id());
                p.setString(4, dataBean.getProduct_id());
                p.setString(5, (dataBean.getDoc_type().equals("+") || dataBean.getProcess_id().equals("PR_022"))?dataBean.getWh_in():dataBean.getWh_out());
                p.setString(6, dataBean.getDoc_type());// เป็น + หรือ - เท่านั้น
                p.setString(7, dataBean.getWeight());
                p.setString(8, dataBean.getBag_qty());
                p.setString(9, dataBean.getBag_withdraw());
                p.setTimestamp(10, dataBean.getDate());
                p.setString(11, dataBean.getBy());
                p.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace(System.out);
        } finally {
            if (p != null) {
                p.close();
            }
            /*if (con != null) {
                con.close();
            }*/
        }
    }
    
}
