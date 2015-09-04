/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bw.engine;

import com.bw.DB.Process_Supplier_TransactionDB;
import java.util.Random;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

/**
 *
 * @author
 */
public class Process_Supplier_Transaction {

    /**
     * @param args the command line arguments
     */
    public String main_check(String doc_date_from, String doc_date_to, String username, String process_for) throws Exception {
        StringBuffer String_return = new StringBuffer();
        SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy h:mm:ss");
        Timestamp cur_time = new Timestamp(new java.util.Date().getTime());
        String start_time = sdf.format(cur_time);

        // TODO code application logic here
        try {

            Random r = new Random();
            Process_Supplier_TransactionDB obj = new Process_Supplier_TransactionDB();
            String r_create = Long.toString(Math.abs(r.nextLong()), 36);

            //เรียกใช้งานให้ส่ง Parameter ตามนี้ obj.generate_transaction_process(date_from, date_to,process_id,table,doc_type); 
            if (process_for.equalsIgnoreCase("SUPPLIER_STOCK")) {
                System.out.println("Start Process ");
                System.out.println("doc_date_from = " + doc_date_from);
                System.out.println("doc_date_to = " + doc_date_to);
                obj.generate_transaction_process("2558-01-01", doc_date_to, "PR_050", "vd_product_accept_suppliers_detail", "+", r_create, username);
                obj.generate_transaction_process("2558-01-01", doc_date_to, "PR_051", "vd_product_withdraw_suppliers_detail_wh", "-", r_create, username);
            }

            System.out.println("END Transaction Process ... ");

        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        
        Timestamp cur_time2 = new Timestamp(new java.util.Date().getTime());
        String stop_time = sdf.format(cur_time2);
        System.out.println("END Transaction Process ... " + '\n');
        String_return.append("ประมวลผลเสร็จสิ้น " + '\n');
        String_return.append("เริ่มประมวลผลเวลา : " + start_time + '\n');
        String_return.append("เสร็จสิ้นเวลา :           " + stop_time);

        return String_return.toString();

    }
}
