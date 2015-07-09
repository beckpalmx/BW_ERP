/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bw.engine;

import com.bw.DB.DBConnect;
import com.bw.DB.IMP_SupplierDB;
import com.bw.DB.IMP_CustomerDB;
import com.bw.DB.Process_Calculate_TransactionDB;
import java.sql.Connection;
import java.util.Random;

/**
 *
 * @author ball
 */
public class Process_Calculate_Transaction {

    /**
     * @param args the command line arguments
     */
    public String main_check(String doc_date_from, String doc_date_to, String username, String process_for) throws Exception {
        StringBuffer String_return = new StringBuffer();

        // TODO code application logic here
        try {

            Random r = new Random();
            Process_Calculate_TransactionDB obj = new Process_Calculate_TransactionDB();
            String r_create = Long.toString(Math.abs(r.nextLong()), 36);

            //เรียกใช้งานให้ส่ง Parameter ตามนี้ obj.generater_transaction_process(date_from, date_to,process_id,table,doc_type); 
            
            if (process_for.equalsIgnoreCase("PROCESS_RAWMAT")) {
                //System.out.println("Start Process ");
                obj.generater_transaction_process(doc_date_from, doc_date_to, "PROCESS_RAWMAT", "d_rawmatt_receive", "+", r_create, username, process_for);
            }

            //System.out.println("End Process ");
            //}
            System.out.println("END Transaction Process ... ");
            String_return.append("ประมวลผลเสร็จสิ้น");

        } catch (Exception e) {
            e.printStackTrace();
        }
        //String_return.append(" ");
        //System.out.println("END Transaction Process ... ");
        //String_return.append("ประมวลผลเสร็จสิ้น");
        return String_return.toString();

    }
}
