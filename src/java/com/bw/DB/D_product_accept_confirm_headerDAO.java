/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bw.DB;

import com.bw.Util.UtiDatabase;
import com.bw.bean.DataBeanD_product_accept_header;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 *
 * @author B
 */
public class D_product_accept_confirm_headerDAO {

    public void update(DataBeanD_product_accept_header DataBean) throws Exception {
        Connection con = new DBConnect().openNewConnection();
        PreparedStatement p = null;
        try {
            if (DataBean.getReturn_flag().equalsIgnoreCase("N")) {
                p = con.prepareStatement("UPDATE "
                        + "d_product_accept_confirm_header SET "
                        + "update_by=?,update_date=?,wh_leader_id=?,account_id=?,doc_type=? "
                        + "where doc_id = ? and delete_flag = 'N' and complete_flag = 'N'");
                p.setString(1, DataBean.getBy());
                p.setTimestamp(2, DataBean.getDate());
                p.setString(3, DataBean.getWh_leader_id());
                p.setString(4, DataBean.getAccount_id());
                p.setString(5, DataBean.getDoc_type());
                p.setString(6, DataBean.getDoc_id());
                p.executeUpdate();
            } else {
                String[] Retrun_table = new String[]{"d_product_accept_header", "d_product_accept_detail"};
                String[] Delete_table = new String[]{"d_product_accept_confirm_header", "d_product_accept_confirm_detail"};
                UtiDatabase objuti = new UtiDatabase();
                objuti.Return_Document(DataBean.getDoc_id(), Retrun_table, Delete_table);
            }

            if (DataBean.getDoc_type().equalsIgnoreCase("Y")) {                               
                //Add Method for complete flag 
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

    public void update_suppliers(DataBeanD_product_accept_header DataBean) throws Exception {
        Connection con = new DBConnect().openNewConnection();
        PreparedStatement p = null;
        try {
            if (DataBean.getReturn_flag().equalsIgnoreCase("N")) {
                p = con.prepareStatement("UPDATE "
                        + "d_product_accept_suppliers_header_wh SET "
                        + "update_by=?,update_date=?,wh_leader_id=?,account_id=?,doc_type=? "
                        + "where doc_id = ? and delete_flag = 'N' and complete_flag = 'N'");
                p.setString(1, DataBean.getBy());
                p.setTimestamp(2, DataBean.getDate());
                p.setString(3, DataBean.getWh_leader_id());
                p.setString(4, DataBean.getAccount_id());
                p.setString(5, DataBean.getDoc_type());
                p.setString(6, DataBean.getDoc_id());
                p.executeUpdate();
            } else {
                String[] Retrun_table = new String[]{"d_product_accept_suppliers_header", "d_product_accept_suppliers_detail"};
                String[] Delete_table = new String[]{"d_product_accept_suppliers_header_wh", "d_product_accept_suppliers_detail_wh"};
                UtiDatabase objuti = new UtiDatabase();
                objuti.Return_Document(DataBean.getDoc_id(), Retrun_table, Delete_table);
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
}
