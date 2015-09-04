/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bw.DB;

import com.bw.bean.DataBean_Transaction_Process;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.text.DecimalFormat;

/**
 *
 * @author Beckeck
 */
public class Process_Supplier_TransactionDB {

    public void generate_transaction_process(String date_from, String date_to, String process_id, String table, String doc_type, String r, String username) throws Exception {
        ArrayList<DataBean_Transaction_Process> obj_AL_process_transaction = new ArrayList<DataBean_Transaction_Process>();
        Connection con = new DBConnect().openNewConnection();
        ResultSet rs, rs1 = null;
        PreparedStatement p = null;
        //Random r = new Random();
        String SQL_DEL, SQL_DEL1, SQL1, SQL2, token, SQL_TimeStamp;
        String SQL = "";
        int Record, count_loop = 0;
        DecimalFormat df = new DecimalFormat("#.00");
        double dtotal_price = 0.00;
        String ddtotal_price = "0.00";

        System.out.println("Start Process process_id : " + process_id);
        SQL_DEL = " delete from vt_transaction_supplier_stock where process_id = '" + process_id + "'";

        delete(SQL_DEL, con, p);

        if (process_id.equalsIgnoreCase("PR_050") || process_id.equalsIgnoreCase("PR_051")) {

            SQL = " select runno,doc_id,doc_date,line_no,product_id,price_unit,quantity,bag_qty,amount,wh_in from " + table
                    + " where delete_flag <> 'Y' "
                    + " and to_number(amount,'999999.99')>0 "
                    + " and to_date(format_date4(doc_date),'YYYY-MM-DD') between to_date(format_date3('" + date_from + "'),'YYYY-MM-DD') AND to_date(format_date3('" + date_to + "'),'YYYY-MM-DD')";

        } else if (process_id.equalsIgnoreCase("PR_")) {

            SQL = " select runno,doc_id,doc_date,line_no,product_id as wh_product_id,weight as wh_weight_final,wh_in as wh_warehouse_id,location_id as wh_location_id,iodine,pgroup_id from " + table
                    + " where delete_flag <> 'Y' "
                    + " and to_number(weight,'999999.99')>0 "
                    + " and to_date(format_date4(doc_date),'YYYY-MM-DD') between to_date(format_date3('" + date_from + "'),'YYYY-MM-DD') AND to_date(format_date3('" + date_to + "'),'YYYY-MM-DD')";

        }

        SQL = SQL + " order by to_date(format_date4(doc_date),'YYYY-MM-DD')";

        System.out.println("Main SQL = " + SQL);

        SQL1 = " select count(*) from " + table
                + " where delete_flag <> 'Y' "
                + " and to_date(format_date4(doc_date),'YYYY-MM-DD') between to_date(format_date3('" + date_from + "'),'YYYY-MM-DD') AND to_date(format_date3('" + date_to + "'),'YYYY-MM-DD')";

        Record = numrow(SQL1, con);

        if (Record >= 1) {
            rs = con.createStatement().executeQuery(SQL);
            DataBean_Transaction_Process bean = new DataBean_Transaction_Process();
            while (rs.next()) {

                bean.setProcess_id(process_id);
                bean.setDoc_id(rs.getString("doc_id"));
                bean.setDoc_date(rs.getString("doc_date"));
                bean.setDoc_type(doc_type);
                bean.setProduct_id(rs.getString("product_id"));
                bean.setWh_id(rs.getString("wh_in"));
                bean.setPrice_per_unit(rs.getString("price_unit"));
                bean.setQuantity_total(rs.getString("quantity"));
                bean.setBag_qty_total(rs.getString("bag_qty"));
                bean.setAmount_total(rs.getString("amount"));

                System.out.println("product_id = " + rs.getString("product_id"));
                System.out.println("amount = " + rs.getString("amount"));

                obj_AL_process_transaction.add(bean);

                insert(obj_AL_process_transaction, con, p);

                count_loop++;
            }
        }
    }

    private static int numrow(String SQL, Connection con) throws Exception {
        ResultSet rs = null;
        int numrow = 0;
        try {
            rs = con.createStatement().executeQuery(SQL);
            while (rs.next()) {
                numrow = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
        } finally {
            if (rs != null) {
                rs.close();
            }
            return numrow;
        }
    }

    private void insert(ArrayList<DataBean_Transaction_Process> obj_AL, Connection con, PreparedStatement p) throws Exception {

        int i;
        try {
            p = con.prepareStatement("insert into t_transaction_supplier_stock "
                    + "(process_id,doc_id,doc_date,doc_type,product_id,wh_id,price_unit,quantity,bag_qty,amount,create_date,create_by) "
                    + "values"
                    + "(?,?,?,?,?,?,?,?,?,?,?,?)");

            for (DataBean_Transaction_Process bean : obj_AL) {
                i = 1;
                p.setString(i++, bean.getProcess_id());
                p.setString(i++, bean.getDoc_id());
                //p.setString(i++, bean.getLine_no());
                p.setString(i++, bean.getDoc_date());
                p.setString(i++, bean.getDoc_type());
                p.setString(i++, bean.getProduct_id());
                p.setString(i++, bean.getWh_id());
                p.setString(i++, bean.getPrice_per_unit());
                p.setString(i++, bean.getQuantity_total());
                p.setString(i++, bean.getBag_qty_total());
                p.setString(i++, bean.getAmount_total());
                p.setTimestamp(i++, new Timestamp(new java.util.Date().getTime()));
                p.setString(i++, ("System"));
                p.addBatch();
                //p.executeUpdate();
            }
            p.executeBatch();
        } catch (Exception e) {
            e.printStackTrace(System.out);
        } finally {
            if (p != null) {
                p.clearBatch();
                p.clearParameters();
            }
            obj_AL.clear();
        }
    }

    private void InsTimeStamp(String SQL_TimeStamp, Connection con, PreparedStatement p) throws Exception {
        try {
            p = con.prepareStatement(SQL_TimeStamp);
            p.executeUpdate();
            p.clearParameters();
        } catch (Exception e) {
            e.printStackTrace(System.out);
        } finally {
            p = null;
        }
    }

    private void delete(String SQL_DEL, Connection con, PreparedStatement p) throws Exception {
        try {
            //System.out.println("Function Delete : " + SQL_DEL);
            p = con.prepareStatement(SQL_DEL);
            p.executeUpdate();
            p.clearParameters();
        } catch (Exception e) {
            e.printStackTrace(System.out);
        } finally {
            p = null;
        }
    }
}
