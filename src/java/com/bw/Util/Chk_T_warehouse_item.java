package com.bw.Util;

import com.bw.DB.DBConnect;
import java.sql.Connection;
import java.sql.ResultSet;

public class Chk_T_warehouse_item {

    private boolean chk;
    private String SQL;
    private double weight_input;
    private double weight;
    private static int return_value;

    public boolean chk_rawmat_item(String Location_id, String Product_id, String Wh_id, String Weight_input) throws Exception {
        weight_input = Double.parseDouble(Weight_input);
        //chk = true;
        UtiDatabase objuti = new UtiDatabase();
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        ResultSet rs = null;
        //and location_id = '" + Location_id + "' and product_id ='" + Product_id + "'
        //JOptionPane.showConfirmDialog(null, objuti.numRowdatabase(SQL));
        try {
            SQL = "select count(*) as num from t_warehouse_item where warehouse_id = '" + Wh_id + "'";
            if (objuti.numRowdatabase(SQL) != 0) {
            } else {
            }
            /*
            SQL = "select count(*) as num from t_warehouse_item where warehouse_id = '" + Wh_id + "'";
            if (objuti.numRowdatabase(SQL) != 0) {

            SQL = "select weight from t_warehouse_item where warehouse_id = '" + Wh_id + "' and location_id = '" + Location_id + "' and product_id ='" + Product_id + "'";
            rs = con.createStatement().executeQuery(SQL);
            while (rs.next()) {
            weight = Double.parseDouble(rs.getString("weight"));
            }
            if (weight_input > weight) {
            chk = true;
            } else {
            chk = false;
            }
            } else {
            chk = true;
            }*/
        } finally {
            try {
            } catch (Exception e) {
                if (objuti.numRowdatabase(SQL) != 0) {
                    rs.close();
                }
                con.close();
            }

        }
        //JOptionPane.showConfirmDialog(null, chk);
        return chk;
    }
    /*
    public Chk_T_warehouse_item(String Location_id, String Product_id, String Wh_id, String Weight_input) throws Exception {
    weight_input = Double.parseDouble(Weight_input);
    UtiDatabase objuti = new UtiDatabase();
    DBConnect objcon = new DBConnect();
    Connection con = objcon.openNewConnection();
    ResultSet rs = null;
    try {
    SQL = "select count(*) as num from t_warehouse_item where warehouse_id = '" + Wh_id + "'";
    if (objuti.numRowdatabase(SQL) != 0) {
    SQL = "select count(*) as num from t_warehouse_item where warehouse_id = '" + Wh_id + "' and location_id = '" + Location_id + "'";
    if (objuti.numRowdatabase(SQL) != 0) {
    SQL = "select count(*) as num from t_warehouse_item where warehouse_id = '" + Wh_id + "' and location_id = '" + Location_id + "' and product_id ='" + Product_id + "'";
    if (objuti.numRowdatabase(SQL) != 0) {
    SQL = "select weight from t_warehouse_item where warehouse_id = '" + Wh_id + "' and location_id = '" + Location_id + "' and product_id ='" + Product_id + "'";
    rs = con.createStatement().executeQuery(SQL);
    while (rs.next()) {
    weight = Double.parseDouble(rs.getString("weight"));
    }
    if (weight_input > weight) {
    return_value = -5;
    } else {
    return_value = 0;
    }
    } else {
    return_value = -4;
    }
    } else {
    return_value = -3;
    }
    } else {
    return_value = -2;
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
    //objcon = null;
    //System.gc();
    }
    }
     */

    public Chk_T_warehouse_item(String Warehouse_id, String Product_id) throws Exception {
        UtiDatabase objuti = new UtiDatabase();
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        ResultSet rs = null;
        try {
            SQL = "select count(*) as num from t_warehouse_item_total where warehouse_id = '" + Warehouse_id + "'";
            if (objuti.numRowdatabase(SQL) != 0) {
                SQL = "select count(*) as num from t_warehouse_item_total where warehouse_id = '" + Warehouse_id + "' and product_id = '" + Product_id + "'";
                if (objuti.numRowdatabase(SQL) != 0) {
                    return_value = 0;
                } else {
                    return_value = -4;
                }
            } else {
                return_value = -2;
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
    //*************************************************BW*********************************************************

    public Chk_T_warehouse_item(String Warehouse_id, String Product_id, String bag_weight, String bag_qty) throws Exception {
        weight_input = Double.parseDouble(bag_qty);
        UtiDatabase objuti = new UtiDatabase();
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        ResultSet rs = null;
        try {
            SQL = "select count(*) as num from t_warehouse_item where warehouse_id = '" + Warehouse_id + "'";
            if (objuti.numRowdatabase(SQL) != 0) {
                SQL = "select count(*) as num from t_warehouse_item where warehouse_id = '" + Warehouse_id + "' and product_id = '" + Product_id + "'";
                if (objuti.numRowdatabase(SQL) != 0) {
                    SQL = "select count(*) as num from t_warehouse_item where warehouse_id = '" + Warehouse_id + "' and product_id = '" + Product_id + "' and bag_weight ='" + bag_weight + "'";
                    if (objuti.numRowdatabase(SQL) != 0) {
                        SQL = "select bag_qty from t_warehouse_item where warehouse_id = '" + Warehouse_id + "' and product_id = '" + Product_id + "' and bag_weight ='" + bag_weight + "'";
                        rs = con.createStatement().executeQuery(SQL);
                        while (rs.next()) {
                            weight = Double.parseDouble(rs.getString("bag_qty"));
                        }
                        if (weight_input > weight) {
                            return_value = -5;
                        } else {
                            return_value = 0;
                        }
                    } else {
                        return_value = -4;
                    }
                } else {
                    return_value = -3;
                }
            } else {
                return_value = -2;
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

    public int Return_value() {
        return return_value;
    }
}
