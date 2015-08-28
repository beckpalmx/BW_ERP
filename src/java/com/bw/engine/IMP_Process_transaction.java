/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bw.engine;

import com.bw.DB.DBConnect;
import com.bw.DB.IMP_SupplierDB;
import com.bw.DB.IMP_CustomerDB;
import com.bw.DB.IMP_Process_transactionDB;
import com.bw.DB.IMP_Process_transaction_casavaDB;
import com.bw.DB.IMP_Process_transaction_sale_DB;
import com.bw.DB.Process_Calculate_TransactionDB;
import java.sql.Connection;
import java.util.Random;

/**
 *
 * @author ball
 */
public class IMP_Process_transaction {

    /**
     * @param args the command line arguments
     */
    public String main_check(String doc_date_from, String doc_date_to, String username, String process_for) throws Exception {
        StringBuffer String_return = new StringBuffer();

        // TODO code application logic here
        try {

            Random r = new Random();
            IMP_SupplierDB obj_s = new IMP_SupplierDB();
            IMP_CustomerDB obj_c = new IMP_CustomerDB();
            IMP_Process_transactionDB obj = new IMP_Process_transactionDB();
            IMP_Process_transaction_casavaDB obj1 = new IMP_Process_transaction_casavaDB();
            IMP_Process_transaction_sale_DB obj2 = new IMP_Process_transaction_sale_DB();
            Process_Calculate_TransactionDB obj_process = new Process_Calculate_TransactionDB();
            String r_create = Long.toString(Math.abs(r.nextLong()), 36);

            //เรียกใช้งานให้ส่ง Parameter ตามนี้ obj.generater_transaction_process(date_from, date_to,process_id,table,doc_type); 
            if (!process_for.equalsIgnoreCase("FRESH-SKIN") && !process_for.equalsIgnoreCase("TAPIOCA")) {
                obj_s.generater_import_supplier(doc_date_from, doc_date_to, "IMPORT_WEIGHT_SCALE", "d_ticketbuy_doc", "+", r_create, username);
                obj.generater_transaction_process(doc_date_from, doc_date_to, "IMPORT_WEIGHT_SCALE", "d_ticketbuy_doc", "+", r_create, username, process_for);
            } else {
                obj_c.generater_import_customer(doc_date_from, doc_date_to, "IMPORT_WEIGHT_SCALE", "d_ticketbuy_doc", "+", r_create, username);
            }

            if (process_for.equalsIgnoreCase("CASAVA")) {
                obj1.generater_transaction_casava_process(doc_date_from, doc_date_to, "IMPORT_WEIGHT_SCALE", "d_ticketbuy_doc", "+", r_create, username);
                System.out.println("PROCESS_RAWMAT : " + process_for);
                obj_process.generater_transaction_process(doc_date_from, doc_date_to, "PROCESS_RAWMAT", "d_rawmatt_receive", "+", r_create, username, process_for);

            } else if (process_for.equalsIgnoreCase("FRESH-SKIN")) {
                obj2.generater_transaction_process(doc_date_from, doc_date_to, "IMPORT_WEIGHT_SCALE", "d_ticketsale_doc", "+", r_create, username, process_for);
            } else if (process_for.equalsIgnoreCase("TAPIOCA")) {
                obj2.generater_transaction_process(doc_date_from, doc_date_to, "IMPORT_WEIGHT_SCALE", "d_ticketsale_doc", "+", r_create, username, process_for);
            }

            System.out.println("End IMPORT_WEIGHT_SCALE ");
            //}
            System.out.println("END Transaction Process ... ");
            String_return.append("ประมวลผลเสร็จสิ้น");

        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        //String_return.append(" ");
        //System.out.println("END Transaction Process ... ");
        //String_return.append("ประมวลผลเสร็จสิ้น");
        return String_return.toString();

    }
}
