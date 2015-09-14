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
import com.bw.Util.UtiDatabase;

/**
 *
 * @author Beckeck
 */
public class Process_Supplier_TransactionDB {

    public void generate_transaction_process(String date_from, String date_to, String process_id, String table, String doc_type, String r, String username) throws Exception {
        ArrayList<DataBean_Transaction_Process> obj_AL_process_transaction = new ArrayList<DataBean_Transaction_Process>();
        Connection con = new DBConnect().openNewConnection();
        UtiDatabase UtilDB = new UtiDatabase();
        ResultSet rs, rs1 = null;
        PreparedStatement p = null;
        //Random r = new Random();
        String SQL_DEL, Insert_SQL, SQL1;
        String SQL = "";
        int Record, count_loop = 0;
        DecimalFormat df = new DecimalFormat("#.00");
        double dtotal_price = 0.00;
        String ddtotal_price = "0.00";

        System.out.println("Start Process process_id : " + process_id);

        SQL_DEL = "";
        Insert_SQL = "";

        if (process_id.equalsIgnoreCase("PR_050") || process_id.equalsIgnoreCase("PR_051")) {
            SQL_DEL = " delete from t_transaction_supplier_stock where process_id = '" + process_id + "'";

            Insert_SQL = "insert into t_transaction_supplier_stock "
                    + "(process_id,doc_id,doc_date,doc_type,product_id,wh_id,price_unit,quantity,bag_qty,amount,create_date,create_by) "
                    + "values"
                    + "(?,?,?,?,?,?,?,?,?,?,?,?)";

            SQL = " select runno,doc_id,doc_date,line_no,product_id,price_unit,quantity,bag_qty,amount,wh_in from " + table
                    + " where delete_flag <> 'Y' "
                    + " and to_number(amount,'999999.99')>0 "
                    + " and to_date(format_date4(doc_date),'YYYY-MM-DD') between to_date(format_date3('" + date_from + "'),'YYYY-MM-DD') AND to_date(format_date3('" + date_to + "'),'YYYY-MM-DD')";

        } else if (process_id.equalsIgnoreCase("PR_025") || process_id.equalsIgnoreCase("PR_027")) {
            SQL_DEL = " delete from t_transaction_warehouse_stock where process_id = '" + process_id + "'";

            Insert_SQL = "insert into t_transaction_warehouse_stock "
                    + "(process_id,doc_id,doc_date,doc_type,product_id,wh_id,weight,quantity,bag_qty,amount,create_date,create_by) "
                    + "values"
                    + "(?,?,?,?,?,?,?,?,?,?,?,?)";

            SQL = " select runno,doc_id,doc_date,line_no,product_id,weight,quantity,bag_qty,amount,wh_in from " + table
                    + " where delete_flag <> 'Y' "
                    + " and to_number(amount,'999999.99')>0 "
                    + " and to_date(format_date4(doc_date),'YYYY-MM-DD') between to_date(format_date3('" + date_from + "'),'YYYY-MM-DD') AND to_date(format_date3('" + date_to + "'),'YYYY-MM-DD')";
        }

        SQL = SQL + " order by to_date(format_date4(doc_date),'YYYY-MM-DD')";

        UtilDB.delete(SQL_DEL, con, p);

        System.out.println("Main SQL = " + SQL);

        SQL1 = " select count(*) as num from " + table
                + " where delete_flag <> 'Y' "
                + " and to_date(format_date4(doc_date),'YYYY-MM-DD') between to_date(format_date3('" + date_from + "'),'YYYY-MM-DD') AND to_date(format_date3('" + date_to + "'),'YYYY-MM-DD')";

        //Record = numrow(SQL1, con);
        Record = UtilDB.numRowdatabase(SQL1);

        System.out.println("Record = " + Record);

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

                if (process_id.equals("PR_050") || process_id.equals("PR_051")) {
                    bean.setPrice_per_unit(rs.getString("price_unit"));
                } else {
                    bean.setWeight(rs.getString("weight"));
                }

                bean.setQuantity_total(rs.getString("quantity"));
                bean.setBag_qty_total(rs.getString("bag_qty"));
                bean.setAmount_total(rs.getString("amount"));

                System.out.println("product_id = " + rs.getString("product_id"));
                System.out.println("amount = " + rs.getString("amount"));

                obj_AL_process_transaction.add(bean);

                insert(obj_AL_process_transaction, con, Insert_SQL, p, process_id);

                count_loop++;
            }
        }
    }

    private void insert(ArrayList<DataBean_Transaction_Process> obj_AL, Connection con, String Insert_SQL, PreparedStatement p, String process_id) throws Exception {

        int i;
        try {
            p = con.prepareStatement(Insert_SQL);

            for (DataBean_Transaction_Process bean : obj_AL) {
                i = 1;
                p.setString(i++, bean.getProcess_id());
                p.setString(i++, bean.getDoc_id());
                //p.setString(i++, bean.getLine_no());
                p.setString(i++, bean.getDoc_date());
                p.setString(i++, bean.getDoc_type());
                p.setString(i++, bean.getProduct_id());
                p.setString(i++, bean.getWh_id());

                if (process_id.equals("PR_050") || process_id.equals("PR_051")) {
                    p.setString(i++, bean.getPrice_per_unit());
                } else {
                    p.setString(i++, bean.getWeight());
                }

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

}
