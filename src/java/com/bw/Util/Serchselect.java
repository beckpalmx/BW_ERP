package com.bw.Util;

import javax.swing.JOptionPane;

//import javax.swing.JOptionPane;
public class Serchselect {

    private String strTable;
    private String[] strColoum, strColoumShow, strFillName;
    private String strID;
    private SelectSerchData ssd;

    public String SelectTable(String inputdatabase) //function �зӡ�� return ��Ңͧ Table ����ͧ������Ң�����˹��Brown(�Ը��˪�͹ ../JSP/Search_Config.jsp?page=1&table=?)
    {
        ssd = new SelectSerchData();
        strTable = ssd.SelectSerchTable(inputdatabase);
        return strTable;
    }

    public String[] SelectColoum(int inputpage, String inputdatabase) //function จะ Return ค่าของข้อมูลที่จะนำออกไปแสดงข้อมูล
    {
        switch (inputpage) {
            case 0:
                if (inputdatabase.equals("Mproduct")) {
                    strColoum = new String[]{"product_id", "name_t"};
                } else if (inputdatabase.equals("vproduct")) {
                    strColoum = new String[]{"product_id", "name_t"};
                }
                break;
            case 1:
                if (inputdatabase.equals("Process")) {
                    strColoum = new String[]{"process_id", "name_t"};
                } else if (inputdatabase.equals("Department")) {
                    strColoum = new String[]{"dept_id", "name_t"};
                } else {
                    strColoum = new String[]{"screen_id", "screen_name", "process_id", "process_name", "iso_no", "effective_date", "dept_id", "dept_name", "qc_check", "remark"};
                }
                break;
            case 2:
                strColoum = new String[]{"main_menu_id", "name_t", "remark"};
                break;
            case 3:
                if (inputdatabase.equals("Screen")) {
                    strColoum = new String[]{"screen_id", "name_t"};
                } else if (inputdatabase.equals("Mainmenu")) {
                    strColoum = new String[]{"main_menu_id", "name_t"};
                } else if (inputdatabase.equals("Lookup")) {
                    strColoum = new String[]{"lookup_name", "table_name"};
                } else {
                    strColoum = new String[]{"sub_menu_id", "name_t", "main_menu_id", "mmenu_main_name_t", "screen_id", "mscreen_name_t", "remark", "doc_no", "doc_eff_date", "lookup_name", "page_type"};
                }
                break;
            case 4:
                strColoum = new String[]{"priviledge_id", "name_t", "remark", "main_menu_id", "sub_menu_id"};
                break;
            case 5:
                if (inputdatabase.equals("Vuser_account")) {
                    strColoum = new String[]{"username", "fullname", "password", "emp_id", "priviledge_id", "priviledge_name", "remark", "use_status", "user_dept", "user_dept_name", "dept_id", "dept_name"};
                } else if (inputdatabase.equals("Vemployee")) {
                    strColoum = new String[]{"emp_id", "fullname"};
                } else if (inputdatabase.equals("mdepartment_doc_id")) {
                    strColoum = new String[]{"dept_doc_id", "name_t"};
                } else {
                    strColoum = new String[]{"priviledge_id", "name_t"};
                }
                break;
            case 7:
                strColoum = new String[]{"procgrp_id", "name_t", "remark"};
                break;
            case 8:
                if (inputdatabase.equals("Process_group")) {
                    strColoum = new String[]{"procgrp_id", "name_t"};
                } else if (inputdatabase.equals("Warehouse") || inputdatabase.equals("Wh_bg") || inputdatabase.equals("Wh_en")) {
                    strColoum = new String[]{"warehouse_id", "name_t"};
                } else {
                    strColoum = new String[]{"process_id", "name_t", "procgrp_id", "process_grp_name", "warehouse_id", "warehouse_name", "wh_bg", "wh_bg_name", "wh_en", "wh_en_name", "remark"};
                }
                break;
            case 9:
                if (inputdatabase.equals("Driver")) {
                    strColoum = new String[]{"driver_id", "name_t", "remark"};
                }
                break;
            case 10:
                if (inputdatabase.equals("Driver")) {
                    strColoum = new String[]{"driver_id", "name_t"};
                } else {
                    strColoum = new String[]{"oh_id", "name_t", "driver_id", "driver_desc", "account_code", "remark"};
                }
                break;
            case 11:
                if (inputdatabase.equals("Vmprocess")) {
                    strColoum = new String[]{"process_id", "name_t"};
                } else {
                    strColoum = new String[]{"std_id", "name_t", "remark", "process_id"};
                }
                break;
            case 12:
                if (inputdatabase.equals("Driver")) {
                    strColoum = new String[]{"driver_id", "name_t"};
                } else if (inputdatabase.equals("Vmoverhead")) {
                    strColoum = new String[]{"oh_id", "name_t", "driver_id", "driver_desc"};
                } else if (inputdatabase.equals("CostMain")) {
                    strColoum = new String[]{"std_id", "name_t"};
                } else if (inputdatabase.equals("Vcostsub")) {
                    strColoum = new String[]{"std_sub_id", "name_t", "std_id", "mstd_cost_main_name_t", "oh_id", "moverhead_name_t", "driver_id", "mdriver_name_t", "cost_value", "doc_type", "remark"};
                }
                break;
            case 13:
                strColoum = new String[]{"dept_id", "name_t", "remark"};
                break;
            case 14:
                if (inputdatabase.equals("vemployee_fullname")) {
                    strColoum = new String[]{"emp_id", "fname", "lname", "dept_id", "depart_name", "status", "remark"};
                } else {
                    strColoum = new String[]{"dept_id", "name_t"};
                }
                break;
            case 15:
                if (inputdatabase.equals("mcountry")) {
                    strColoum = new String[]{"country_code", "name_t"};
                } else if (inputdatabase.equals("mtambol")) {
                    strColoum = new String[]{"tambol_code", "name_t"};
                } else if (inputdatabase.equals("mamphor")) {
                    strColoum = new String[]{"amp_code", "name_t"};
                } else if (inputdatabase.equals("mprovince")) {
                    strColoum = new String[]{"prov_code", "name_t"};
                } else {
                    strColoum = new String[]{"customer_id", "name_t", "address1_t", "tambol_code", "t_name", "amp_code", "amp_namt", "prov_code", "prov_tname", "country_code", "country_name", "zipcode", "tel", "fax", "contact_name", "remark"};
                }
                break;
            case 16:
                if (inputdatabase.equals("mcountry")) {
                    strColoum = new String[]{"country_code", "name_t"};
                } else if (inputdatabase.equals("mtambol")) {
                    strColoum = new String[]{"tambol_code", "name_t"};
                } else if (inputdatabase.equals("mamphor")) {
                    strColoum = new String[]{"amp_code", "name_t"};
                } else if (inputdatabase.equals("mprovince")) {
                    strColoum = new String[]{"prov_code", "name_t"};
                } else if (inputdatabase.equals("vmsupplier")) {
                    strColoum = new String[]{"supplier_id", "name_t"};
                } else {
                    strColoum = new String[]{"supplier_id", "name_t", "address1_t", "tambol_code", "t_name", "amp_code", "amp_namt", "prov_code", "prov_tname", "zipcode", "tel", "fax", "contact_name", "remark"};
                }
                break;
            case 17:
                strColoum = new String[]{"pgroup_id", "name_t", "remark"};
                break;
            case 18:
                strColoum = new String[]{"pcat_id", "name_t", "remark"};
                break;
            case 19:
                strColoum = new String[]{"ptype_id", "name_t", "remark"};
                break;
            case 20:
                strColoum = new String[]{"warehouse_id", "name_t", "remark"};
                break;
            case 109:
                strColoum = new String[]{"doc_id", "cust_name"};
                break;
            case 204:
                strColoum = new String[]{"be", "sg", "remark"};
                break;
            case 206:
                strColoum = new String[]{"cassava_type_id", "name_t", "remark"};
                break;
            case 207:
                strColoum = new String[]{"supply_type_id", "name_t", "remark"};
                break;
            case 53:
                if (inputdatabase.equals("mdata_export")) {
                    strColoum = new String[]{"export_id", "name_t", "lookup_name", "complete_flag", "retro_flag", "cancel_flag"};
                } else if (inputdatabase.indexOf("d_") != -1) {
                    strColoum = new String[]{"runno", "doc_id"};
                }
                break;
            case 116:
                strColoum = new String[]{"product_id", "name_t", "pgroup_name", "pcat_name"};
                break;
            case 30:
                if (inputdatabase.equals("Vemployee") || inputdatabase.equals("Vemployee1") || inputdatabase.equals("Vemployee2")) {
                    strColoum = new String[]{"emp_id", "fullname"};
                } else if (inputdatabase.equals("vproduct")) {
                    strColoum = new String[]{"product_id", "name_t"};
                } else {
                    strColoum = new String[]{"doc_id", "doc_date", "roast_qty", "pack_qty", "date_1", "date_2", "date_3", "date_4", "percent_p1", "percent_p2", "percent_p3", "percent_p4", "percent_y1", "percent_y2", "percent_y3", "percent_y4", "reporter_id", "checker_id", "approver_id", "date_5", "date_6", "date_7", "date_8", "reporter_id_desc", "checker_id_desc", "approver_id_desc"};
                }
                break;
            case 33:
                if (inputdatabase.equalsIgnoreCase("m_sg_config")) {
                    strColoum = new String[]{"be", "sg"};
                }
                break;
            case 301:
                if (inputdatabase.equals("mwarehouse")) {
                    strColoum = new String[]{"warehouse_id", "name_t"};
                } else {
                    strColoum = new String[]{"product_id", "name_t"};
                }
                break;
            case 203:
                strColoum = new String[]{"shift_id", "name_t", "remark"};
                break;
            case 201:
                strColoum = new String[]{"prd_place", "name_t", "remark"};
                break;
            case 200:
                strColoum = new String[]{"machine_id", "name_t", "remark"};
                break;
            case 21:
                System.out.println("inputdatabase = " + inputdatabase);
                if (inputdatabase.equals("vproduct") || inputdatabase.equals("vm_supplier_stock")) {
                    strColoum = new String[]{"product_id", "name_t", "pgroup_id", "pgroup_name", "pcat_id", "pcat_name", "ptype_id", "ptype_name", "price", "min", "max", "safety", "weight", "location_id", "value", "remark","unit_id","unit_name"};
                } else if (inputdatabase.equals("mproduct_group")) {
                    strColoum = new String[]{"pgroup_id", "name_t"};
                } else if (inputdatabase.equals("mproduct_cat")) {
                    strColoum = new String[]{"pcat_id", "name_t"};
                } else if (inputdatabase.equals("mproduct_type")) {
                    strColoum = new String[]{"ptype_id", "name_t"};
                } else {
                    strColoum = new String[]{"unit_id", "name_t"};
                    System.out.println("strColoum = " + strColoum);
                }
                break;
            case 114:
                strColoum = new String[]{"doc_id", "doc_date"};
                break;
            case 103:
                if (inputdatabase.equals("mdepartment")) {
                    strColoum = new String[]{"dept_id", "name_t"};
                } else {
                    strColoum = new String[]{"emp_id", "fullname"};
                }
                break;
            case 105:
                strColoum = new String[]{"emp_id", "fullname"};
                break;
            case 106:
                if (inputdatabase.equals("Vd_job_order_header")) {
                    strColoum = new String[]{"doc_id", "cust_id", "cust_name", "spec_size", "spec_i2"};
                }
                break;
            case 108:
                if (inputdatabase.equals("Vd_job_order_header")) {
                    strColoum = new String[]{"doc_id", "cust_name"};
                } else if (inputdatabase.equals("Mproduct_cat")) {
                    strColoum = new String[]{"pcat_id", "name_t"};
                }
                break;
            case 112:
                if (inputdatabase.equals("Vd_job_order_header")) {
                    strColoum = new String[]{"doc_id", "cust_id", "cust_name"};
                } else if (inputdatabase.equals("Vproduct")) {
                    strColoum = new String[]{"product_id", "name_t"};
                }
                break;
            case 51:
                if (inputdatabase.equals("vd_product_receive_header")) {
                    strColoum = new String[]{"doc_id", "doc_date", "palate_no", "remark"};
                }
                break;
            case 31:
                if (inputdatabase.equals("Mwarehouse")) {
                    strColoum = new String[]{"warehouse_id", "name_t"};
                } else if (inputdatabase.equals("Vemployee") || inputdatabase.equals("Vemployee1") || inputdatabase.equals("Vemployee2") || inputdatabase.equals("Vemployee3") || inputdatabase.equals("Vemployee4")) {
                    strColoum = new String[]{"emp_id", "fullname"};
                } else if (inputdatabase.equals("Vcustomer")) {
                    strColoum = new String[]{"customer_id", "name_t", "initial"};
                } else {
                    strColoum = new String[]{"product_id", "name_t"};
                }
                break;
            case 50:
                if (inputdatabase.equals("d_carbon_withdraw_header_wh")) {
                    strColoum = new String[]{"doc_id", "doc_date"};
                }
                break;
            case 22:
                if (inputdatabase.equalsIgnoreCase("Vsupplier")) {
                    strColoum = new String[]{"supplier_id", "name_t"};
                } else if (inputdatabase.equalsIgnoreCase("Vproduct")) {
                    strColoum = new String[]{"product_id", "name_t"};
                } else if (inputdatabase.equalsIgnoreCase("Vd_rawmatt_receive")) {
                    strColoum = new String[]{"doc_id", "doc_date", "car_no", "supplier_id", "supplyer_type", "car_date_in", "car_time_in", "car_date_out", "car_time_out", "potato_type", "percent_1", "percent_2", "percent_3", "percent_4", "percent_5", "percent_6", "percent_7", "percent_8", "percent_avg", "pc_ref", "price_ref", "price_accept", "soil_deduct", "contamination_deduct", "other_deduct", "dump_deduct", "brake_income", "product_id", "wh_in", "car_in_weight", "car_out_weight", "total_weight", "deduct_weight", "balance_weight", "total_payment", "amount_deduct", "amount_payment", "remark", "reporter_id", "checker_id", "approve_id", "supplier_name", "product_name", "warehouse_name", "reporter_name", "checker_name", "approve_name", "brake_value", "percent_tapioca", "amount_tapioca", "doc_time", "complete_flag"};
                } else if (inputdatabase.equalsIgnoreCase("Vemployee") || inputdatabase.equalsIgnoreCase("Vemployee1") || inputdatabase.equalsIgnoreCase("Vemployee2")) {
                    strColoum = new String[]{"emp_id", "fullname"};
                } else {
                    strColoum = new String[]{"warehouse_id", "name_t"};
                }
                break;
            case 23:
                if (inputdatabase.equalsIgnoreCase("Vemployee") || inputdatabase.equalsIgnoreCase("Vemployee1") || inputdatabase.equalsIgnoreCase("Vemployee2")) {
                    strColoum = new String[]{"emp_id", "fullname"};
                } else {
                    strColoum = new String[]{"doc_id", "doc_date", "wh_out", "wh_in", "cassava_date", "amount_cassava", "percent_tapioca", "amount_tapioca", "peel_fresh_date", "percent_moisture", "total_peel_fresh", "amount_peel_fresh", "soil_crust_date", "amount_soil_crust", "total_cassava", "total_tapioca", "reporter_id", "purchase_id", "production_id", "reporter_name", "purchase_name", "production_name", "cassava_time_from", "cassava_time_to", "amount_cassava_product", "percent_tapioca_product", "amount_tapioca_product"};
                }
                break;
            case 24:
                if (inputdatabase.equalsIgnoreCase("mdepartment")) {
                    strColoum = new String[]{"dept_id", "name_t"};
                } else if (inputdatabase.equalsIgnoreCase("Vemployee") || inputdatabase.equalsIgnoreCase("Vemployee1") || inputdatabase.equalsIgnoreCase("Vemployee2") || inputdatabase.equalsIgnoreCase("Vemployee3")) {
                    strColoum = new String[]{"emp_id", "fullname"};
                } else if (inputdatabase.equalsIgnoreCase("vproduct")||inputdatabase.equalsIgnoreCase("vm_supplier_stock")) {
                    strColoum = new String[]{"product_id", "name_t"};
                }
                break;
            case 25:
                if (inputdatabase.equals("Warehouse") || inputdatabase.equals("Warehouse1") || inputdatabase.equals("Warehouse2")) {
                    strColoum = new String[]{"warehouse_id", "name_t"};
                } else {
                    strColoum = new String[]{"emp_id", "fullname"};
                }
                break;
            case 26:
                if (inputdatabase.equals("Warehouse")) {
                    strColoum = new String[]{"warehouse_id", "name_t"};
                }
                break;
            case 27:
                strColoum = new String[]{"emp_id", "fullname"};
                break;
            case 28:
                if (inputdatabase.equalsIgnoreCase("Vemployee")) {
                    strColoum = new String[]{"emp_id", "fullname"};
                } else {
                    strColoum = new String[]{"doc_id", "doc_date", "shift", "approver_id", "date_chk", "time_chk", "be_1", "be_2", "be_3", "be_4", "be_5", "be_6", "m_be", "m3", "mold", "ph", "s_1", "s_2", "s_3", "s_4", "s_5", "s_6", "s_7", "s_8", "s_9", "s_10", "w_1", "w_2", "w_3", "w_4", "w_5", "w_6", "w_7", "w_8", "w_9", "w_10", "d_1", "d_2", "d_3", "st_1", "st_2", "k_1", "approver_name", "m_1", "b_1"};
                }

                break;
            case 29:
                if (inputdatabase.equals("Vemployee") || inputdatabase.equals("Vemployee1")) {
                    strColoum = new String[]{"emp_id", "fullname"};
                } else {
                    strColoum = new String[]{"product_id", "name_t"};
                }
                break;
            case 32:
                if (inputdatabase.equals("Vemployee")) {
                    strColoum = new String[]{"emp_id", "fullname"};
                }
                break;
            case 34:
                if (inputdatabase.equals("Vemployee") || inputdatabase.equals("Vemployee1") || inputdatabase.equals("Vemployee2")) {
                    strColoum = new String[]{"emp_id", "fullname"};
                }
                break;
            case 35:
                if (inputdatabase.equals("Mproduct_cat")) {
                    strColoum = new String[]{"pcat_id", "name_t"};
                } else if (inputdatabase.equals("Vd_job_order_header")) {
                    strColoum = new String[]{"doc_id", "cust_name"};
                } else if (inputdatabase.equals("m_carbon_size")) {
                    strColoum = new String[]{"name_t"};
                } else {
                    strColoum = new String[]{"name_t"};
                }
                break;
            case 36:
                if (inputdatabase.equals("Vproduct")) {
                    strColoum = new String[]{"product_id", "name_t"};
                } else if (inputdatabase.equals("Vd_job_order_header")) {
                    strColoum = new String[]{"doc_id", "cust_name", "spec_size", "spec_i2"};
                }
                break;
            case 37:
                if (inputdatabase.equals("Mwarehouse")) {
                    strColoum = new String[]{"warehouse_id", "name_t"};
                } else if (inputdatabase.equals("munit_code")) {
                    strColoum = new String[]{"unit_id", "name_t"};
                }
                break;
            case 38:
                if (inputdatabase.equals("Vd_job_order_header")) {
                    strColoum = new String[]{"doc_id", "cust_name"};
                }
                break;
            case 39:
                if (inputdatabase.equals("Vproduct")) {
                    strColoum = new String[]{"product_id", "name_t"};
                }
                break;
            case 40:
                if (inputdatabase.equals("Vd_job_order_header")) {
                    strColoum = new String[]{"doc_id", "cust_name"};
                } else if (inputdatabase.equals("Vemployee") || inputdatabase.equals("Vemployee1")) {
                    strColoum = new String[]{"emp_id", "fullname"};
                }
                break;
            case 41:
                if (inputdatabase.equals("mproduction_place")) {
                    strColoum = new String[]{"prd_place", "name_t"};
                } else if (inputdatabase.equals("Mwarehouse")) {
                    strColoum = new String[]{"warehouse_id", "name_t"};
                } else {
                    strColoum = new String[]{"size_id", "name_t"};
                }
                break;
            case 42:
                if (inputdatabase.equals("Vd_job_order_header")) {
                    strColoum = new String[]{"doc_id", "cust_id", "cust_name", "cust_addr", "country_name", "po_no"};
                } else if (inputdatabase.equals("Vemployee") || inputdatabase.equals("Vemployee1") || inputdatabase.equals("Vemployee2")) {
                    strColoum = new String[]{"emp_id", "fullname"};
                }
                break;
            case 43:
                if (inputdatabase.equals("Vproduct")) {
                    strColoum = new String[]{"product_id", "name_t"};
                } else {
                    strColoum = new String[]{"doc_id", "cust_name"};
                }
                break;
            case 44:
                if (inputdatabase.equals("m_carbon_size")) {
                    strColoum = new String[]{"size_id", "name_t"};
                } else if (inputdatabase.equals("Mwarehouse")) {
                    strColoum = new String[]{"warehouse_id", "name_t"};
                }
                break;
            case 45:
                if (inputdatabase.equals("Vemployee")) {
                    strColoum = new String[]{"emp_id", "fullname"};
                } else {
                    strColoum = new String[]{"unit_id", "name_t"};
                }
                break;
            case 46:
                if (inputdatabase.equals("Vd_rawmatt_receive")) {
                    strColoum = new String[]{"doc_id", "car_no", "product_id", "supplier_id", "supplier_name", "car_date_in"};
                } else if (inputdatabase.equals("Vemployee") || inputdatabase.equals("Vemployee1") || inputdatabase.equals("Vemployee2")) {
                    strColoum = new String[]{"emp_id", "fullname"};
                }
                break;
            case 48: // Calculate
                if (inputdatabase.equals("vmprocess")) {
                    strColoum = new String[]{"process_id", "name_t", "main_table", "sub_table1", "sub_table2"};
                } else if (inputdatabase.equals("mwarehouse")) {
                    strColoum = new String[]{"warehouse_id", "name_t"};
                } else {
                    strColoum = new String[]{"doc_id", "doc_date"};
                }
                break;
            case 482: // Calculate
                if (inputdatabase.equals("vmprocess")) {
                    strColoum = new String[]{"process_id", "name_t", "main_table", "sub_table1", "sub_table2"};
                } else if (inputdatabase.equals("mwarehouse")) {
                    strColoum = new String[]{"warehouse_id", "name_t"};
                } else {
                    strColoum = new String[]{"doc_id", "doc_date"};
                }
                break;
            case 49: // Calculate
                if (inputdatabase.equals("vd_carbon_burn_out_header_wh")) {
                    strColoum = new String[]{"doc_id", "doc_date"};
                }
                break;
            case 101: // Report
                if (inputdatabase.equals("Vd_rawmatt_receive")) {
                    strColoum = new String[]{"doc_id"};
                }
                break;
            case 100: // Report
                if (inputdatabase.equals("Vd_rawmatt_receive")) {
                    strColoum = new String[]{"doc_id"};
                }
                break;

            default:
                break;
        }
        // JOptionPane.showConfirmDialog(null, strColoum);
        return strColoum;
    }

    public String SelectID(int inputpage, String inputdatabase)//function Return ค่าของ Textfill ของหน้าที่จะนำไปลงข้อมูล
    {

        switch (inputpage) {
            case 0:
                if (inputdatabase.equals("Mproduct")) {
                    strID = "product_id|name_t";
                }
                break;
            case 1:
                if (inputdatabase.equals("Process")) {
                    strID = "process_id|name_t_process";
                } else if (inputdatabase.equals("Department")) {
                    strID = "dept_id|name_t_dept";
                } else {
                    strID = "screen_id|name_t_screen|process_id|name_t_process|iso_no|effective_date|dept_id|name_t_dept|qc_check|remark_screen";
                }
                break;
            case 2:
                strID = "main_menu_id|name_t|remark";
                break;
            case 3:
                if (inputdatabase.equals("Screen")) {
                    strID = "screen_id|screen_id_desc";
                } else if (inputdatabase.equals("Mainmenu")) {
                    strID = "main_menu_id|main_menu_id_desc";
                } else if (inputdatabase.equals("Lookup")) {
                    strID = "lookup|hid";
                } else {
                    strID = "sub_menu_id|name_t|main_menu_id|main_menu_id_desc|screen_id|screen_id_desc|remark|doc_no|effective_date|lookup|typesub";
                }
                break;
            case 5:
                if (inputdatabase.equals("Vuser_account")) {
                    strID = "username|name_emp|password|emp_id|priviledge_id|name_priviledge|remark|status|user_dept|user_dept_desc|dept_id|dept_id_desc";
                } else if (inputdatabase.equals("Vemployee")) {
                    strID = "emp_id|name_emp";
                } else if (inputdatabase.equals("mdepartment_doc_id")) {
                    strID = "user_dept|user_dept_desc";
                } else {
                    strID = "priviledge_id|name_priviledge";
                }
                break;
            case 7:
                strID = "procgrp_id|name_t|remark";
                break;
            case 8:
                if (inputdatabase.equals("Process_group")) {
                    strID = "procgrp_id|procgrp_id_desc";
                } else if (inputdatabase.equals("Warehouse")) {
                    strID = "warehouse_id|warehouse_id_desc";
                } else if (inputdatabase.equals("Wh_bg")) {
                    strID = "wh_bg|wh_bg_desc";
                } else if (inputdatabase.equals("Wh_en")) {
                    strID = "wh_en|wh_en_desc";
                } else {
                    strID = "process_id|name_t|procgrp_id|procgrp_id_desc|warehouse_id|warehouse_id_desc|wh_bg|wh_bg_desc|wh_en|wh_en_desc|remark";
                }
                break;
            case 9:
                strID = "driver_id|name_t|remark";
                break;
            case 10:
                if (inputdatabase.equals("Driver")) {
                    strID = "driver_id|driver_id_desc";
                } else {
                    strID = "oh_id|name_t|driver_id|driver_id_desc|account_code|remark";
                }
                break;
            case 11:
                if (inputdatabase.equals("Vmprocess")) {
                    strID = "process_id|process_id_desc";
                } else {
                    strID = "std_id|name_t|remark|process_id";
                }
                break;
            case 12:
                if (inputdatabase.equals("Driver")) {
                    strID = "driver_id|driver_id_desc";
                } else if (inputdatabase.equals("Vmoverhead")) {
                    strID = "oh_id|oh_id_desc|driver_id|driver_id_desc";
                } else if (inputdatabase.equals("CostMain")) {
                    strID = "std_id|std_id_desc";
                } else if (inputdatabase.equals("Vcostsub")) {
                    strID = "std_sub_id|name_t|std_id|std_id_desc|oh_id|oh_id_desc|driver_id|driver_id_desc|cost_value|type_cost|remark";
                }
                break;
            case 13:
                strID = "dept_id|dept_name|remark";
                break;
            case 14:
                if (inputdatabase.equals("vemployee_fullname")) {
                    strID = "emp_id|name|lname|dept_id|dept_name|status|remark_emp";
                } else {
                    strID = "dept_id|dept_name";
                }
                break;
            case 15:
                if (inputdatabase.equals("mcountry")) {
                    strID = "country_id|country_name";
                } else if (inputdatabase.equals("mtambol")) {
                    strID = "tambol_code|tambol_name";
                } else if (inputdatabase.equals("mamphor")) {
                    strID = "amp_code|amp_name";
                } else if (inputdatabase.equals("mprovince")) {
                    strID = "prov_code|prov_name";
                } else {
                    strID = "customer_id|name_t|address1_t|tambol_code|tambol_name|amp_code|amp_name|prov_code|prov_name|country_id|country_name|zipcode|tel|fax|contact_name|remark";
                }
                break;
            case 16:
                if (inputdatabase.equals("mtambol")) {
                    strID = "tambol_code|tambol_name";
                } else if (inputdatabase.equals("mamphor")) {
                    strID = "amp_code|amp_name";
                } else if (inputdatabase.equals("mprovince")) {
                    strID = "prov_code|prov_name";
                } else if (inputdatabase.equals("vmsupplier")) {
                    strID = "supplier_id|name_t";
                } else {
                    strID = "supplier_id|name_t|address1_t|tambol_code|tambol_name|amp_code|amp_name|prov_code|prov_name|zipcode|tel|fax|contact_name|remark";
                }
                break;
            case 17:
                strID = "pgroup_id|name_t_pgroup|remark_pgroup";
                break;
            case 18:
                strID = "pcat_id|name_t_pcat|remark_pcat";
                break;
            case 19:
                strID = "ptype_id|name_t_ptype|remark_ptype";
                break;
            case 20:
                strID = "warehouse_id|name_t_warehouse|remark_wh";
                break;
            case 109:
                strID = "job_id|job_id_desc";
                break;
            case 204:
                strID = "be|sg|remark";
                break;
            case 206:
                strID = "cassava_type_id|name_t|remark";
                break;
            case 207:
                strID = "supply_type_id|name_t|remark";
                break;
            case 53:
                if (inputdatabase.equals("mdata_export")) {
                    strID = "export_id|export_id_desc|lookup_name|complete_flag|retro_flag|cancel_flag";
                }
                break;
            case 116:
                strID = "product_id|product_id_desc|pgroup_name|pcat_name";
                break;
            case 30:
                if (inputdatabase.equals("Vemployee")) {
                    strID = "A_reporter_id|reporter_id_desc";
                } else if (inputdatabase.equals("Vemployee1")) {
                    strID = "A_checker_id|checker_id_desc";
                } else if (inputdatabase.equals("Vemployee2")) {
                    strID = "A_approver_id|approver_id_desc";
                } else if (inputdatabase.equals("vproduct")) {
                    strID = "A_cust_id|cust_id_desc";
                } else {
                    strID = "A_doc_id|A_doc_date|A_roast_qty|A_pack_qty|A_date_1|A_date_2|A_date_3|A_date_4|A_percent_p1|A_percent_p2|A_percent_p3|A_percent_p4|A_percent_y1|A_percent_y2|A_percent_y3|A_percent_y4|A_reporter_id|A_checker_id|A_approver_id|A_date_5|A_date_6|A_date_7|A_date_8|reporter_id_desc|checker_id_desc|approver_id_desc";
                }
                break;
            case 33:
                if (inputdatabase.equalsIgnoreCase("m_sg_config")) {
                    strID = "A_be_val|A_sg_val";
                }
                break;
            case 301:
                if (inputdatabase.equals("mwarehouse")) {
                    strID = "wh_id|wh_id_desc";
                } else {
                    strID = "product_id|product_id_desc";
                }
                break;
            case 203:
                strID = "shift_id|name_t|remark";
                break;
            case 201:
                strID = "prd_place|name_t|remark";
                break;
            case 200:
                strID = "machine_id|name_t|remark";
                break;
            case 21:
                System.out.println("inputdatabase = " + inputdatabase);
                if (inputdatabase.equals("vproduct") || inputdatabase.equals("vm_supplier_stock")) {
                    strID = "product_id|name_t_product|pgroup_id|name_t_pgroup|pcat_id|name_t_pcat|ptype_id|name_t_ptype|price|min|max|safety|warehouse_id|location_id|value|remark_product|unit_id|unit_name";
                } else if (inputdatabase.equals("mproduct_group")) {
                    strID = "pgroup_id|name_t_pgroup";
                } else if (inputdatabase.equals("mproduct_cat")) {
                    strID = "pcat_id|name_t_pcat";
                } else if (inputdatabase.equals("mproduct_type")) {
                    strID = "ptype_id|name_t_ptype";
                } else {
                    strID = "unit_id|unit_name";
                }

                break;
            case 114:
                strID = "doc_id|doc_date";
                break;
            case 103:
                if (inputdatabase.equals("mdepartment")) {
                    strID = "prd_emp_id|prd_emp_id_desc";
                } else if (inputdatabase.equals("Vemployee1")) {
                    strID = "sending_id|sending_id_desc";
                } else {
                    strID = "wh_emp_id|wh_emp_id_desc";
                }
                break;
            case 105:
                if (inputdatabase.equals("Vemployee")) {
                    strID = "reporter_id|reporter_id_desc";
                } else {
                    strID = "checker_id|checker_id_desc";
                }
                break;
            case 106:
                if (inputdatabase.equals("Vd_job_order_header")) {
                    strID = "prd_no|cust_id|cust_id_desc|size|quantity";
                }
                break;
            case 108:
                if (inputdatabase.equals("Vd_job_order_header")) {
                    strID = "prd_no|prd_no_desc";
                } else if (inputdatabase.equals("Mproduct_cat")) {
                    strID = "c_type|c_type_desc";
                }

                break;
            case 112:
                if (inputdatabase.equals("Vd_job_order_header")) {
                    strID = "job_no|cust_id|cust_id_desc";
                } else if (inputdatabase.equals("Vproduct")) {
                    strID = "product_id|product_id_desc";
                }
                break;
            case 51:
                if (inputdatabase.equals("vd_product_receive_header")) {
                    strID = "doc_id|doc_date|palate_no|remark";
                }
                break;
            case 50:
                if (inputdatabase.equals("d_carbon_withdraw_header_wh")) {
                    strID = "doc_id|doc_date";
                }
                break;
            case 22:
                if (inputdatabase.equalsIgnoreCase("Vsupplier")) {
                    strID = "A_supplier_id|supplier_id_desc";
                } else if (inputdatabase.equalsIgnoreCase("Vproduct")) {
                    strID = "A_product_id|product_id_desc";
                } else if (inputdatabase.equalsIgnoreCase("Vd_rawmatt_receive")) {
                    strID = "A_doc_id|A_doc_date|A_car_no|A_supplier_id|A_supplyer_type|A_car_date_in|A_car_time_in|A_car_date_out|A_car_time_out|A_potato_type|A_percent_1|A_percent_2|A_percent_3|A_percent_4|A_percent_5|A_percent_6|A_percent_7|A_percent_8|A_percent_avg|A_pc_ref|A_price_ref|A_price_accept|A_soil_deduct|A_contamination_deduct|A_other_deduct|A_dump_deduct|A_brake_income|A_product_id|A_wh_in|A_car_in_weight|A_car_out_weight|A_total_weight|A_deduct_weight|A_balance_weight|A_total_payment|A_amount_deduct|A_amount_payment|A_remark|A_reporter_id|A_checker_id|A_approve_id|supplier_id_desc|product_id_desc|wh_in_desc|reporter_id_desc|checker_id_desc|approve_id_desc|A_brake_value|A_per_cent_tapioca|A_amount_tapioca|A_doc_time|A_complete_flag";
                } else if (inputdatabase.equalsIgnoreCase("Vemployee")) {
                    strID = "A_reporter_id|reporter_id_desc";
                } else if (inputdatabase.equalsIgnoreCase("Vemployee1")) {
                    strID = "A_checker_id|checker_id_desc";
                } else if (inputdatabase.equalsIgnoreCase("Vemployee2")) {
                    strID = "A_approve_id|approve_id_desc";
                } else {
                    strID = "A_wh_in|wh_in_desc";
                }
                break;
            case 23:
                if (inputdatabase.equalsIgnoreCase("Vemployee")) {
                    strID = "A_reporter_id|reporter_id_desc";
                } else if (inputdatabase.equalsIgnoreCase("Vemployee1")) {
                    strID = "A_purchase_id|purchase_id_desc";
                } else if (inputdatabase.equalsIgnoreCase("Vemployee2")) {
                    strID = "A_production_id|production_id_desc";
                } else {
                    strID = "A_doc_id|A_doc_date|A_wh_out|A_wh_in|A_cassava_date|A_amount_cassava_a|A_percent_tapioca_a|A_amount_tapioca_a|A_peel_fresh_date|A_percent_moisture|A_total_peel_fresh|A_amount_peel_fresh|A_soil_crust_date|A_amount_soil_crust|A_total_cassava|A_total_tapioca|A_reporter_id|A_purchase_id|A_production_id|reporter_id_desc|purchase_id_desc|production_id_desc|A_doc_time_from|A_doc_time_to|A_amount_cassava_p|A_percent_tapioca_p|A_amount_tapioca_p";
                }
                break;
            case 24:
                if (inputdatabase.equals("mdepartment")) {
                    strID = "A_dp_id|dp_id_desc";
                } else if (inputdatabase.equalsIgnoreCase("Vemployee")) {
                    strID = "A_reporter_id|reporter_id_desc";
                } else if (inputdatabase.equalsIgnoreCase("Vemployee1")) {
                    strID = "A_approver_id|approver_id_desc";
                } else if (inputdatabase.equalsIgnoreCase("Vemployee2")) {
                    strID = "A_wh_leader_id|wh_leader_id_desc";
                } else if (inputdatabase.equalsIgnoreCase("Vemployee3")) {
                    strID = "A_account_id|account_id_desc";
                } else if (inputdatabase.equalsIgnoreCase("vproduct")||inputdatabase.equalsIgnoreCase("vm_supplier_stock")) {
                    strID = "A_product_id|product_id_desc";
                }
                break;
            case 25:
                if (inputdatabase.equals("Warehouse")) {
                    strID = "loc_1_desc|loc_1_name";
                } else if (inputdatabase.equals("Warehouse1")) {
                    strID = "loc_2_desc|loc_2_name";
                } else if (inputdatabase.equals("Warehouse2")) {
                    strID = "loc_3_desc|loc_3_name";
                } else {
                    strID = "runner_id|runner_id_desc";
                }
                break;
            case 26:
                if (inputdatabase.equals("Warehouse")) {
                    strID = "silo_no|silo_desc";
                }
                break;
            case 27:
                if (inputdatabase.equals("Vemployee")) {
                    strID = "runner_id|runner_id_desc";
                } else {
                    strID = "operate_id|operate_id_desc";
                }
                break;
            case 28:
                if (inputdatabase.equalsIgnoreCase("Vemployee")) {
                    strID = "A_approver_id|approver_id_desc";
                } else {
                    strID = "A_doc_id|A_doc_date|A_shift|A_approver_id|A_date_chk|A_time_chk|A_be_1|A_be_2|A_be_3|A_be_4|A_be_5|A_be_6|A_m_be|A_m3|A_mold|A_ph|A_s_1|A_s_2|A_s_3|A_s_4|A_s_5|A_s_6|A_s_7|A_s_8|A_s_9|A_s_10|A_w_1|A_w_2|A_w_3|A_w_4|A_w_5|A_w_6|A_w_7|A_w_8|A_w_9|A_w_10|A_d_1|A_d_2|A_d_3|A_st_1|A_st_2|A_k_1|approver_id_desc|A_m_1|A_b_1";
                }
                break;
            case 29:
                if (inputdatabase.equals("Vemployee")) {
                    strID = "runner_id|runner_id_desc";
                } else {
                    strID = "report_id|report_id_desc";
                }
                break;
            case 31:
                if (inputdatabase.equals("Vcustomer")) {
                    strID = "A_cust_id|cust_id_desc|A_initial";
                } else if (inputdatabase.equals("Vemployee")) {
                    strID = "A_reporter_id|reporter_id_desc";
                } else if (inputdatabase.equals("Vemployee1")) {
                    strID = "A_approver_id|approver_id_desc";
                } else if (inputdatabase.equals("Vemployee2")) {
                    strID = "A_quality_id|quality_id_desc";
                } else if (inputdatabase.equals("Vemployee3")) {
                    strID = "A_production_id|production_id_desc";
                } else if (inputdatabase.equals("Vemployee4")) {
                    strID = "A_account_id|account_id_desc";
                } else {
                    strID = "A_product_id|product_id_desc";
                }
                break;
            case 32:
                if (inputdatabase.equals("Vemployee")) {
                    strID = "A_approver_id|approver_id_desc";
                }
                break;
            case 34:
                if (inputdatabase.equals("Vemployee")) {
                    strID = "prd_emp_id|prd_emp_id_desc";
                } else if (inputdatabase.equals("Vemployee1")) {
                    strID = "wh_emp_id|wh_emp_id_desc";
                } else if (inputdatabase.equals("Vemployee2")) {
                    strID = "wh_sup_id|wh_sup_id_desc";
                }
                break;
            case 35:
                if (inputdatabase.equals("Mproduct_cat")) {
                    strID = "pcat_id|pcat_id_desc";
                } else if (inputdatabase.equals("Vd_job_order_header")) {
                    strID = "job_id|job_id_desc";
                } else if (inputdatabase.equals("m_carbon_size")) {
                    strID = "size_use";
                } else {
                    strID = "machine";
                }
                break;
            case 36:
                if (inputdatabase.equals("Vproduct")) {
                    strID = "product_id|product_id_desc";
                } else if (inputdatabase.equals("Vd_job_order_header")) {
                    strID = "job_id|job_id_desc|size|ctc_i2";
                }
                break;
            case 37:
                if (inputdatabase.equals("Mwarehouse")) {
                    strID = "wh_id|wh_id_desc";
                } else if (inputdatabase.equals("munit_code")) {
                    strID = "unit_id|unit_id_desc";
                }
                break;
            case 38:
                if (inputdatabase.equals("Vd_job_order_header")) {
                    strID = "job_id|job_id_desc";
                }
                break;
            case 39:
                if (inputdatabase.equals("Vproduct")) {
                    strID = "product_id|product_id_desc";
                }
                break;
            case 40:
                if (inputdatabase.equals("Vd_job_order_header")) {
                    strID = "job_id|job_id_desc";
                } else if (inputdatabase.equals("Vemployee")) {
                    strID = "emp_id|emp_id_desc";
                } else if (inputdatabase.equals("Vemployee1")) {
                    strID = "runner_id|runner_id_desc";
                }
                break;
            case 41:
                if (inputdatabase.equals("mproduction_place")) {
                    strID = "place_prd|place_prd_desc";
                } else if (inputdatabase.equals("Mwarehouse")) {
                    strID = "wh_id|wh_id_desc";
                } else {
                    strID = "size|size_desc";
                }
                break;
            case 42:
                if (inputdatabase.equals("Vd_job_order_header")) {
                    strID = "job_id|cust_id|job_id_desc|cust_address_desc|cust_country_desc|po_no_desc";
                }
                if (inputdatabase.equals("Vemployee")) {
                    strID = "approver|approver_desc";
                } else if (inputdatabase.equals("Vemployee1")) {
                    strID = "payment_prod|payment_prod_desc";
                } else if (inputdatabase.equals("Vemployee2")) {
                    strID = "receiver|receiver_desc";
                }
                break;
            case 43:
                if (inputdatabase.equals("Vproduct")) {
                    strID = "product_id|product_id_desc";
                } else {
                    strID = "job_id|job_id_desc";
                }
                break;
            case 44:
                if (inputdatabase.equals("m_carbon_size")) {
                    strID = "size|size_desc";
                } else if (inputdatabase.equals("Mwarehouse")) {
                    strID = "wh_id|wh_id_desc";
                }
                break;
            case 45:
                if (inputdatabase.equals("Vemployee")) {
                    strID = "emp_id|emp_id_desc";
                } else {
                    strID = "unit_id|unit_id_desc";
                }
                break;
            case 46:
                if (inputdatabase.equals("Vd_rawmatt_receive")) {
                    strID = "doc_id|car_no|c_type|sender_id|sender_id_desc|car_date_in";
                } else if (inputdatabase.equals("Vemployee")) {
                    strID = "sender_id|sender_id_desc";
                } else if (inputdatabase.equals("Vemployee1")) {
                    strID = "report_id|report_id_desc";
                } else if (inputdatabase.equals("Vemployee2")) {
                    strID = "approve_id|approve_id_desc";
                }
                break;

            case 48:
                if (inputdatabase.equals("vmprocess")) {
                    strID = "process_id|name_t|table_h|table_s1|table_s2";
                } else {
                    strID = "doc_id|doc_date";
                }
                break;
            case 482:
                if (inputdatabase.equals("vmprocess")) {
                    strID = "process_id|process_name|table_h|table_s1|table_s2";
                } else {
                    strID = "doc_id|doc_date";
                }
                break;
            case 49:
                if (inputdatabase.equals("vd_carbon_burn_out_header_wh")) {
                    strID = "doc_id|doc_date";
                }
                break;
            case 101:
                if (inputdatabase.equals("Vd_rawmatt_receive")) {
                    strID = "doc_id_t";
                }
                break;
            case 100:
                if (inputdatabase.equals("Vd_rawmatt_receive")) {
                    strID = "doc_id_f";
                }
                break;
            default:
                break;
        }
        //JOptionPane.showConfirmDialog(null, strID);
        return strID;
    }

    public String[] SelectFillName(int inputpage, String inputdatabase)//function แสดงชื่อ Fill ของ Table(HTML)
    {
        switch (inputpage) {
            case 0:
                if (inputdatabase.equals("vproduct")) {
                    strFillName = new String[]{"รหัสสินค้า", "ชื่อสินค้า"};
                }
                break;
            case 13:
                strFillName = new String[]{"รหัสแผนก", "ชื่อแผนก"};
                break;
            case 14:
                if (inputdatabase.equals("vemployee_fullname")) {
                    strFillName = new String[]{"รหัสพนักงาน", "ชื่อ-นามสกุล"};
                } else {
                    strFillName = new String[]{"รหัสแผนก", "ชื่อแผนก"};
                }
                break;
            case 15:
                if (inputdatabase.equals("mcountry")) {
                    strFillName = new String[]{"รหัสประเทศ", "ชื่อประเทศ"};
                } else if (inputdatabase.equals("mtambol")) {
                    strFillName = new String[]{"รหัสตำบล", "ชื่อตำบล"};
                } else if (inputdatabase.equals("mamphor")) {
                    strFillName = new String[]{"รหัสอำเภอ", "ชื่ออำเภอ"};
                } else if (inputdatabase.equals("mprovince")) {
                    strFillName = new String[]{"รหัสจังหวัด", "ชื่อจังหวัด"};
                } else {
                    strFillName = new String[]{"รหัสลูกค้า", "ชื่อลูกค้า"};
                }
                break;
            case 16:
                if (inputdatabase.equals("mtambol")) {
                    strFillName = new String[]{"รหัสตำบล", "ชื่อประเทศ"};
                } else if (inputdatabase.equals("mamphor")) {
                    strFillName = new String[]{"รหัสอำเภอ", "ชื่ออำเภอ"};
                } else if (inputdatabase.equals("mprovince")) {
                    strFillName = new String[]{"รหัสจังหวัด", "ชื่อจังหวัด"};
                } else {
                    strFillName = new String[]{"รหัสsupplier", "รหัสsupplier"};
                }
                break;
            case 17:
                strFillName = new String[]{"รหัสกลุ่มสินค้า", "ชื่อกลุ่มสินค้า"};
                break;
            case 18:
                strFillName = new String[]{"รหัสชนิดสินค้า", "ชื่อชนิดสินค้า"};
                break;
            case 19:
                strFillName = new String[]{"รหัสประเภทสินค้า", "ชื่อประเภทสินค้า"};
                break;
            case 20:
                strFillName = new String[]{"รหัสคลังสินค้า", "ชื่อคลังสินค้า"};
                break;
            case 21:
                System.out.println("inputdatabase = " + inputdatabase);
                if (inputdatabase.equals("vproduct") || inputdatabase.equals("vm_supplier_stock")) {
                    strFillName = new String[]{"รหัสสินค้า", "ชื่อสินค้า", "ประภทสินค้า"};
                } else if (inputdatabase.equals("mproduct_group")) {
                    strFillName = new String[]{"รหัสกลุ่มสินค้า", "ชื่อกลุ่มสินค้า"};
                } else if (inputdatabase.equals("mproduct_cat")) {
                    strFillName = new String[]{"รหัสชนิดสินค้า", "ชื่อชนิดสินค้า"};
                } else if (inputdatabase.equals("mproduct_type")) {
                    strFillName = new String[]{"รหัสประเภทสินค้า", "ชื่อประเภทสินค้า"};
                } else {
                    strFillName = new String[]{"รหัสหน่วยนับ", "ชื่อหน่วยนับ"};
                }
                break;
            case 109:
                strFillName = new String[]{"เลขที่ใบแจ้งผลิต", "ชื่อลูกค้า"};
                break;
            case 204:
                strFillName = new String[]{"ค่า Be'", "ค่า S.G."};
                break;
            case 206:
                strFillName = new String[]{"รหัสประเภทพันธุ์มัน", "ชื่อพันธุ์มัน"};
                break;
            case 207:
                strFillName = new String[]{"รหัสประเภทSupplyer", "ชื่อประเภทSupplyer"};
                break;
            case 53:
                if (inputdatabase.equals("mdata_export")) {
                    strFillName = new String[]{"รหัสExport", "Export Name"};
                } else if (inputdatabase.indexOf("d_") != -1) {
                    strFillName = new String[]{"เลขที่เอกสาร", "ลำดับเอกสาร"};
                }
                break;
            case 116:
                strFillName = new String[]{"รหัสสินค้า", "ชื่อสินค้า", "กลุ่มสินค้า"};
                break;
            case 30:
                if (inputdatabase.equals("Vemployee") || inputdatabase.equals("Vemployee1") || inputdatabase.equals("Vemployee2")) {
                    strFillName = new String[]{"รหัสพนักงาน", "ชื่อ", "รหัสแผนก", "ชื่อแผนก"};
                } else if (inputdatabase.equals("vproduct")) {
                    strFillName = new String[]{"รหัสสินค้า", "ชื่อสินค้า"};
                } else {
                    strFillName = new String[]{"เลขที่เอกสาร", "วันที่บันทึกเอกสาร"};
                }
                break;
            case 33:
                if (inputdatabase.equalsIgnoreCase("m_sg_config")) {
                    strFillName = new String[]{"ค่าbe", "ค่าsg"};
                }
                break;
            case 301:
                if (inputdatabase.equals("mwarehouse")) {
                    strFillName = new String[]{"รหัสคลัง", "ชื่อคลัง"};
                } else {
                    strFillName = new String[]{"รหัสสินค้า", "ชื่อสินค้า", "ประภทสินค้า"};
                }
                break;

            case 114:
                strFillName = new String[]{"เลขที่เอกสาร", "วันที่เอกสาร"};
                break;
            case 103:

                if (inputdatabase.equals("mdepartment")) {
                    strFillName = new String[]{"รหัสแผนก", "ชื่อแผนก"};
                } else {
                    strFillName = new String[]{"รหัสพนักงาน", "ชื่อ", "รหัสแผนก", "ชื่อแผนก"};
                }
                break;
            case 105:
                strFillName = new String[]{"รหัสพนักงาน", "ชื่อ", "รหัสแผนก", "ชื่อแผนก"};
                break;
            case 106:
                strFillName = strFillName = new String[]{"รหัสใบแจ้งการผลิต", "บริษัทสั่งผลิต", "วันที่บันทึกเอกสาร"};
                break;
            case 108:
                if (inputdatabase.equals("Vd_job_order_header")) {
                    strFillName = new String[]{"รหัสใบแจ้งการผลิต", "บริษัทสั่งผลิต", "วันที่บันทึกเอกสาร"};
                } else if (inputdatabase.equals("Mproduct_cat")) {
                    strFillName = new String[]{"รหัสชนิดถ่าน", "ชื่อชนิดถ่าน"};
                }
                break;
            case 112:
                if (inputdatabase.equals("Vd_job_order_header")) {
                    strFillName = new String[]{"รหัสใบแจ้งการผลิต", "บริษัทสั่งผลิต", "วันที่บันทึกเอกสาร"};
                } else if (inputdatabase.equals("Vproduct")) {
                    strFillName = new String[]{"รหัสสินค้า", "ชื่อสินค้า"};
                }
                break;
            case 51:
                if (inputdatabase.equals("vd_product_receive_header")) {
                    strFillName = new String[]{"เลขที่เอกสาร", "วันที่บันทึกเอกสาร"};
                }
                break;
            case 31:
                if (inputdatabase.equals("Mwarehouse")) {
                    strFillName = new String[]{"รหัสคลังสินค้า", "ชื่อคลังสินค้า"};
                } else if (inputdatabase.equals("Vemployee") || inputdatabase.equals("Vemployee1") || inputdatabase.equals("Vemployee2") || inputdatabase.equals("Vemployee3") || inputdatabase.equals("Vemployee4")) {
                    strFillName = new String[]{"รหัสพนักงาน", "ชื่อพนักงาน", "รหัสแผนก", "ชื่อแผนก"};
                } else if (inputdatabase.equals("Vcustomer")) {
                    strFillName = new String[]{"รหัสลูกค้า", "ชื่อลูกค้า"};
                } else {
                    strFillName = new String[]{"รหัสสินค้า", "ชื่อสินค้า"};
                }
                break;
            case 50:
                if (inputdatabase.equals("d_carbon_withdraw_header_wh")) {
                    strFillName = new String[]{"เลขที่เอกสาร", "วันที่บันทึกเอกสาร"};
                }
                break;
            case 22:
                if (inputdatabase.equalsIgnoreCase("Vsupplier")) {
                    strFillName = new String[]{"รหัสSupplier", "ชื่อSupplier"};
                } else if (inputdatabase.equalsIgnoreCase("Vproduct")) {
                    strFillName = new String[]{"รหัสสินค้า", "ชื่อสินค้า"};
                } else if (inputdatabase.equalsIgnoreCase("Vd_rawmatt_receive")) {
                    strFillName = new String[]{"เลขที่เอกสาร", "วันที่บันทึกเอกสาร", "ชื่อผู้ขาย"};
                } else if (inputdatabase.equalsIgnoreCase("Vemployee")) {
                    strFillName = new String[]{"รหัสพนักงาน", "ชื่อ", "รหัสแผนก", "ชื่อแผนก"};
                } else if (inputdatabase.equalsIgnoreCase("Vemployee1")) {
                    strFillName = new String[]{"รหัสพนักงาน", "ชื่อ", "รหัสแผนก", "ชื่อแผนก"};
                } else if (inputdatabase.equalsIgnoreCase("Vemployee2")) {
                    strFillName = new String[]{"รหัสพนักงาน", "ชื่อ", "รหัสแผนก", "ชื่อแผนก"};
                } else {
                    strFillName = new String[]{"รหัสคลังสินค้า", "ชื่อคลังสินค้า"};
                }
                break;
            case 23:
                if (inputdatabase.equalsIgnoreCase("Vemployee") || inputdatabase.equalsIgnoreCase("Vemployee1") || inputdatabase.equalsIgnoreCase("Vemployee2")) {
                    strFillName = new String[]{"รหัสพนักงาน", "ชื่อ", "รหัสแผนก", "ชื่อแผนก"};
                } else if (inputdatabase.equalsIgnoreCase("Mproduct_type")) {
                    strFillName = new String[]{"รหัสประเภท", "ชื่อประเภท"};
                } else {
                    strFillName = new String[]{"รหัสเอกสาร", "วันที่บันทึกเอกสาร"};
                }
                break;
            case 24:
                if (inputdatabase.equals("mdepartment")) {
                    strFillName = new String[]{"รหัสแผนก", "ชื่อแผนก"};
                } else if (inputdatabase.equalsIgnoreCase("Vemployee") || inputdatabase.equalsIgnoreCase("Vemployee1") || inputdatabase.equalsIgnoreCase("Vemployee2") || inputdatabase.equalsIgnoreCase("Vemployee3")) {
                    strFillName = new String[]{"รหัสพนักงาน", "ชื่อ", "รหัสแผนก", "ชื่อแผนก"};
                } else if (inputdatabase.equalsIgnoreCase("vproduct")||inputdatabase.equalsIgnoreCase("vm_supplier_stock")) {
                    strFillName = new String[]{"รหัสสินค้า", "ชื่อสินค้า"};
                }
                break;
            case 25:
                if (inputdatabase.equals("Warehouse") || inputdatabase.equals("Warehouse1") || inputdatabase.equals("Warehouse2")) {
                    strFillName = new String[]{"รหัสคลังสินค้า", "ชื่อคลังสินค้า"};
                } else {
                    strFillName = new String[]{"รหัสพนักงาน", "ชื่อ", "รหัสแผนก", "ชื่อแผนก"};
                }
                break;
            case 26:
                if (inputdatabase.equals("Warehouse")) {
                    strFillName = new String[]{"รหัสคลังสินค้า", "ชื่อคลังสินค้า"};
                }
                break;
            case 27:
                strFillName = new String[]{"รหัสพนักงาน", "ชื่อ", "รหัสแผนก", "ชื่อแผนก"};
                break;
            case 28:
                if (inputdatabase.equalsIgnoreCase("Vemployee")) {
                    strFillName = new String[]{"รหัสพนักงาน", "ชื่อ", "รหัสแผนก", "ชื่อแผนก"};
                } else {
                    strFillName = new String[]{"รหัสเอกสาร", "วันที่บันทึกเอกสาร"};
                }
                break;
            case 29:
                if (inputdatabase.equals("Vemployee") || inputdatabase.equals("Vemployee1")) {
                    strFillName = new String[]{"รหัสพนักงาน", "ชื่อ", "รหัสแผนก", "ชื่อแผนก"};
                } else {
                    strFillName = new String[]{"รหัสสินค้า", "ชื่อสินค้า"};
                }
                break;
            case 32:
                if (inputdatabase.equals("Vemployee")) {
                    strFillName = new String[]{"รหัสพนักงาน", "ชื่อ", "รหัสแผนก", "ชื่อแผนก"};
                }
                break;
            case 34:
                if (inputdatabase.equals("Vemployee") || inputdatabase.equals("Vemployee1") || inputdatabase.equals("Vemployee2")) {
                    strFillName = new String[]{"รหัสพนักงาน", "ชื่อ", "รหัสแผนก", "ชื่อแผนก"};
                }
                break;
            case 35:
                if (inputdatabase.equals("Mproduct_cat")) {
                    strFillName = new String[]{"รหัสชนิดถ่าน", "ชื่อชนิดถ่าน"};
                } else if (inputdatabase.equals("Vd_job_order_header")) {
                    strFillName = new String[]{"รหัสใบแจ้งการผลิต", "บริษัทสั่งผลิต"};
                } else if (inputdatabase.equals("m_carbon_size")) {
                    strFillName = new String[]{"ชื่อขนาด"};
                } else {
                    strFillName = new String[]{"ชื่อเครื่องผลิต/แหล่งผลิต"};
                }
                break;
            case 36:
                if (inputdatabase.equals("Vproduct")) {
                    strFillName = new String[]{"รหัสสินค้า", "ชื่อสินค้า"};
                } else if (inputdatabase.equals("Vd_job_order_header")) {
                    strFillName = new String[]{"รหัสใบแจ้งการผลิต", "บริษัทสั่งผลิต"};
                }
                break;
            case 37:
                if (inputdatabase.equals("Mwarehouse")) {
                    strFillName = new String[]{"รหัสคลังสินค้า", "ชื่อคลังสินค้า"};
                } else if (inputdatabase.equals("munit_code")) {
                    strFillName = new String[]{"รหัสหน่วยนับ", "ชื่อหน่วยนับ"};
                }
                break;
            case 38:
                if (inputdatabase.equals("Vd_job_order_header")) {
                    strFillName = new String[]{"รหัสใบแจ้งการผลิต", "บริษัทสั่งผลิต", "วันที่บันทึกเอกสาร"};
                }
                break;
            case 39:
                if (inputdatabase.equals("Vproduct")) {
                    strFillName = new String[]{"รหัสสินค้า", "ชื่อสินค้า"};
                }
                break;
            case 40:
                if (inputdatabase.equals("Vd_job_order_header")) {
                    strFillName = new String[]{"รหัสใบแจ้งการผลิต", "บริษัทสั่งผลิต", "วันที่บันทึกเอกสาร"};
                } else if (inputdatabase.equals("Vemployee") || inputdatabase.equals("Vemployee1")) {
                    strFillName = new String[]{"รหัสพนักงาน", "ชื่อ", "รหัสแผนก", "ชื่อแผนก"};
                }
                break;
            case 41:
                if (inputdatabase.equals("mproduction_place")) {
                    strFillName = new String[]{"ชื่อแหล่งผลิต"};
                } else if (inputdatabase.equals("Mwarehouse")) {
                    strFillName = new String[]{"รหัสคลังสินค้า", "ชื่อคลังสินค้า"};
                } else {
                    strFillName = new String[]{"ชื่อขนาดถ่าน"};
                }
                break;
            case 42:
                if (inputdatabase.equals("Vd_job_order_header")) {
                    strFillName = new String[]{"รหัสใบแจ้งการผลิต", "บริษัทสั่งผลิต", "วันที่บันทึกเอกสาร"};
                } else if (inputdatabase.equals("Vemployee") || inputdatabase.equals("Vemployee1") || inputdatabase.equals("Vemployee2")) {
                    strFillName = new String[]{"รหัสพนักงาน", "ชื่อ", "รหัสแผนก", "ชื่อแผนก"};
                }
                break;
            case 43:
                if (inputdatabase.equals("Vproduct")) {
                    strFillName = new String[]{"รหัสสินค้า", "ชื่อสินค้า"};
                } else {
                    strFillName = new String[]{"รหัสใบแจ้งการผลิต", "บริษัทสั่งผลิต"};
                }
                break;
            case 44:
                if (inputdatabase.equals("m_carbon_size")) {
                    strFillName = new String[]{"ชื่อขนาดถ่าน"};
                } else if (inputdatabase.equals("Mwarehouse")) {
                    strFillName = new String[]{"รหัสคลังสินค้า", "ชื่อคลังสินค้า"};
                }
                break;
            case 45:
                if (inputdatabase.equals("Vemployee")) {
                    strFillName = new String[]{"รหัสพนักงาน", "ชื่อ", "รหัสแผนก", "ชื่อแผนก"};
                } else {
                    strFillName = new String[]{"รหัสหน่วยนับ", "ชื่อหน่วยนับ"};
                }
                break;
            case 46:
                if (inputdatabase.equals("Vd_rawmatt_receive")) {
                    strFillName = new String[]{"เลขที่เอกสาร", "เลขที่ใบชั้งถ่าน", "เลขทะเบียรถ"};
                } else if (inputdatabase.equals("Vemployee") || inputdatabase.equals("Vemployee1") || inputdatabase.equals("Vemployee2")) {
                    strFillName = new String[]{"รหัสพนักงาน", "ชื่อ", "รหัสแผนก", "ชื่อแผนก"};
                }
                break;
            case 48:
                if (inputdatabase.equals("vmprocess")) {
                    strFillName = new String[]{"รหัส Process", "ชื่อ Process", "คลังรับ", "คลังจ่าย"};
                } else if (inputdatabase.equals("mwarehouse")) {
                    strFillName = new String[]{"รหัสคลัง", "ชื่อคลัง"};
                } else {
                    strFillName = new String[]{"เลขที่เอกสาร", "วันที่บันทึกเอกสาร"};
                }
                break;
            case 482:
                if (inputdatabase.equals("vmprocess")) {
                    strFillName = new String[]{"รหัส Process", "ชื่อ Process", "คลังรับ", "คลังจ่าย"};
                } else if (inputdatabase.equals("mwarehouse")) {
                    strFillName = new String[]{"รหัสคลัง", "ชื่อคลัง"};
                } else {
                    strFillName = new String[]{"เลขที่เอกสาร", "วันที่บันทึกเอกสาร"};
                }
                break;
            case 49:
                if (inputdatabase.equals("vd_carbon_burn_out_header_wh")) {
                    strFillName = new String[]{"เลขที่เอกสาร", "วันที่"};
                }
                break;
            case 101:
                if (inputdatabase.equals("Vd_rawmatt_receive")) {
                    strFillName = new String[]{"เลขที่เอกสาร", "วันที่"};
                }
                break;
            case 100:
                if (inputdatabase.equals("Vd_rawmatt_receive")) {
                    strFillName = new String[]{"เลขที่เอกสาร", "วันที่"};
                }
                break;
            case 3:
                if (inputdatabase.equals("Lookup")) {
                    strFillName = new String[]{"Lookup name", "Remark"};
                }
                break;
            default:
                break;
        }
        return strFillName;

    }

    public String[] SelectColoumShow(int inputpage, String inputdatabase)//function แสดงข้อมูลใน Table(HTML)
    {

        switch (inputpage) {
            case 0:
                if (inputdatabase.equals("vproduct")) {
                    strColoumShow = new String[]{"product_id", "name_t"};
                }
                break;
            case 13:
                strColoumShow = new String[]{"dept_id", "name_t"};
                break;
            case 14:
                if (inputdatabase.equals("vemployee_fullname")) {
                    strColoumShow = new String[]{"emp_id", "fullname"};
                } else {
                    strColoumShow = new String[]{"dept_id", "name_t"};
                }
                break;
            case 15:
                if (inputdatabase.equals("mcountry")) {
                    strColoumShow = new String[]{"country_code", "name_t"};
                } else if (inputdatabase.equals("mtambol")) {
                    strColoumShow = new String[]{"tambol_code", "name_t"};
                } else if (inputdatabase.equals("mamphor")) {
                    strColoumShow = new String[]{"amp_code", "name_t"};
                } else if (inputdatabase.equals("mprovince")) {
                    strColoumShow = new String[]{"prov_code", "name_t"};
                } else {
                    strColoumShow = new String[]{"customer_id", "name_t"};
                }
                break;

            case 16:
                if (inputdatabase.equals("mtambol")) {
                    strColoumShow = new String[]{"tambol_code", "name_t"};
                } else if (inputdatabase.equals("mamphor")) {
                    strColoumShow = new String[]{"amp_code", "name_t"};
                } else if (inputdatabase.equals("mprovince")) {
                    strColoumShow = new String[]{"prov_code", "name_t"};
                } else {
                    strColoumShow = new String[]{"supplier_id", "name_t"};
                }
                break;
            case 17:
                strColoumShow = new String[]{"pgroup_id", "name_t"};
                break;
            case 18:
                strColoumShow = new String[]{"pcat_id", "name_t"};
                break;
            case 19:
                strColoumShow = new String[]{"ptype_id", "name_t"};
                break;
            case 20:
                strColoumShow = new String[]{"warehouse_id", "name_t"};
                break;
            case 21:
                System.out.println("inputdatabase = " + inputdatabase);
                if (inputdatabase.equals("vproduct") || inputdatabase.equals("vm_supplier_stock")) {
                    strColoumShow = new String[]{"product_id", "name_t", "ptype_name"};
                } else if (inputdatabase.equals("mproduct_group")) {
                    strColoumShow = new String[]{"pgroup_id", "name_t"};
                } else if (inputdatabase.equals("mproduct_cat")) {
                    strColoumShow = new String[]{"pcat_id", "name_t"};
                } else if (inputdatabase.equals("mproduct_type")) {
                    strColoumShow = new String[]{"ptype_id", "name_t"};
                } else {
                    strColoumShow = new String[]{"unit_id", "name_t"};
                }

                break;
            case 109:
                strColoumShow = new String[]{"doc_id", "cust_name"};
                break;
            case 204:
                strColoumShow = new String[]{"be", "sg"};
                break;
            case 206:
                strColoumShow = new String[]{"cassava_type_id", "name_t"};
                break;
            case 207:
                strColoumShow = new String[]{"supply_type_id", "name_t"};
                break;
            case 53:
                if (inputdatabase.equals("mdata_export")) {
                    strColoumShow = new String[]{"export_id", "name_t"};
                } else if (inputdatabase.indexOf("d_") != -1) {
                    strColoumShow = new String[]{"doc_id", "runno"};
                }
                break;
            case 116:
                strColoumShow = new String[]{"product_id", "name_t", "pcat_name"};
                break;
            case 30:
                if (inputdatabase.equals("Vemployee") || inputdatabase.equals("Vemployee1") || inputdatabase.equals("Vemployee2")) {
                    strColoumShow = new String[]{"emp_id", "fullname", "dept_id", "depart_name"};
                } else if (inputdatabase.equals("vproduct")) {
                    strColoumShow = new String[]{"product_id", "name_t"};
                } else {
                    strColoumShow = new String[]{"doc_id", "doc_date"};
                }
                break;
            case 33:
                if (inputdatabase.equalsIgnoreCase("m_sg_config")) {
                    strColoumShow = new String[]{"be", "sg"};
                }
                break;
            case 301:
                if (inputdatabase.equals("mwarehouse")) {
                    strColoumShow = new String[]{"warehouse_id", "name_t"};
                } else {
                    strColoumShow = new String[]{"product_id", "name_t", "ptype_name"};
                }
                break;

            case 114:
                strColoumShow = new String[]{"doc_id", "doc_date"};
                break;
            case 103:
                if (inputdatabase.equals("mdepartment")) {
                    strColoumShow = new String[]{"dept_id", "name_t"};
                } else {
                    strColoumShow = new String[]{"emp_id", "fullname", "dept_id", "depart_name"};
                }
                break;
            case 105:
                strColoumShow = new String[]{"emp_id", "fullname", "dept_id", "depart_name"};
                break;
            case 106:
                strColoumShow = new String[]{"doc_id", "cust_name", "doc_date"};
                break;
            case 108:
                if (inputdatabase.equals("Vd_job_order_header")) {
                    strColoumShow = new String[]{"doc_id", "cust_name", "doc_date"};
                } else if (inputdatabase.equals("Mproduct_cat")) {
                    strColoumShow = new String[]{"pcat_id", "name_t"};
                }
                break;
            case 112:
                if (inputdatabase.equals("Vd_job_order_header")) {
                    strColoumShow = new String[]{"doc_id", "cust_name", "doc_date"};
                } else if (inputdatabase.equals("Vproduct")) {
                    strColoumShow = new String[]{"product_id", "name_t"};
                }
                break;
            case 51:
                if (inputdatabase.equals("vd_product_receive_header")) {
                    strColoumShow = new String[]{"doc_id", "doc_date"};
                }
                break;
            case 31:
                if (inputdatabase.equals("Mwarehouse")) {
                    strColoumShow = new String[]{"warehouse_id", "name_t"};
                } else if (inputdatabase.equals("Vemployee") || inputdatabase.equals("Vemployee1") || inputdatabase.equals("Vemployee2") || inputdatabase.equals("Vemployee3") || inputdatabase.equals("Vemployee4")) {
                    strColoumShow = new String[]{"emp_id", "fullname", "dept_id", "depart_name"};
                } else if (inputdatabase.equals("Vcustomer")) {
                    strColoumShow = new String[]{"customer_id", "name_t"};
                } else {
                    strColoumShow = new String[]{"product_id", "name_t"};
                }
                break;
            case 50:
                if (inputdatabase.equals("d_carbon_withdraw_header_wh")) {
                    strColoumShow = new String[]{"doc_id", "doc_date"};
                }
                break;
            case 22:
                if (inputdatabase.equalsIgnoreCase("Vsupplier")) {
                    strColoumShow = new String[]{"supplier_id", "name_t"};
                } else if (inputdatabase.equalsIgnoreCase("Vproduct")) {
                    strColoumShow = new String[]{"product_id", "name_t"};
                } else if (inputdatabase.equalsIgnoreCase("Vd_rawmatt_receive")) {
                    strColoumShow = new String[]{"doc_id", "doc_date", "supplier_name"};

                } else if (inputdatabase.equalsIgnoreCase("Vemployee") || inputdatabase.equalsIgnoreCase("Vemployee1") || inputdatabase.equalsIgnoreCase("Vemployee2")) {
                    strColoumShow = new String[]{"emp_id", "fullname", "dept_id", "depart_name"};
                } else {
                    strColoumShow = new String[]{"warehouse_id", "name_t"};
                }
                break;
            case 23:
                if (inputdatabase.equalsIgnoreCase("Vemployee") || inputdatabase.equalsIgnoreCase("Vemployee1") || inputdatabase.equalsIgnoreCase("Vemployee2")) {
                    strColoumShow = new String[]{"emp_id", "fullname", "dept_id", "depart_name"};
                } else {
                    strColoumShow = new String[]{"doc_id", "doc_date"};
                }
                break;
            case 24:
                if (inputdatabase.equals("mdepartment")) {
                    strColoumShow = new String[]{"dept_id", "name_t"};
                } else if (inputdatabase.equalsIgnoreCase("Vemployee") || inputdatabase.equalsIgnoreCase("Vemployee1") || inputdatabase.equalsIgnoreCase("Vemployee2") || inputdatabase.equalsIgnoreCase("Vemployee3")) {
                    strColoumShow = new String[]{"emp_id", "fullname", "dept_id", "depart_name"};
                } else if (inputdatabase.equalsIgnoreCase("vproduct")||inputdatabase.equalsIgnoreCase("vm_supplier_stock")) {
                    strColoumShow = new String[]{"product_id", "name_t"};
                }
                break;
            case 25:
                if (inputdatabase.equals("Warehouse") || inputdatabase.equals("Warehouse1") || inputdatabase.equals("Warehouse2")) {
                    strColoumShow = new String[]{"warehouse_id", "name_t"};
                } else {
                    strColoumShow = new String[]{"emp_id", "fullname", "dept_id", "depart_name"};
                }
                break;
            case 26:
                if (inputdatabase.equals("Warehouse")) {
                    strColoumShow = new String[]{"warehouse_id", "name_t"};
                }
                break;
            case 27:
                strColoumShow = new String[]{"emp_id", "fullname", "dept_id", "depart_name"};
                break;
            case 28:
                if (inputdatabase.equalsIgnoreCase("Vemployee")) {
                    strColoumShow = new String[]{"emp_id", "fullname", "dept_id", "depart_name"};
                } else {
                    strColoumShow = new String[]{"doc_id", "doc_date"};
                }
                break;
            case 29:
                if (inputdatabase.equals("Vemployee") || inputdatabase.equals("Vemployee1")) {
                    strColoumShow = new String[]{"emp_id", "fullname", "dept_id", "depart_name"};
                } else {
                    strColoumShow = new String[]{"product_id", "name_t"};
                }
                break;
            case 32:
                if (inputdatabase.equals("Vemployee")) {
                    strColoumShow = new String[]{"emp_id", "fullname", "dept_id", "depart_name"};
                }
                break;
            case 34:
                if (inputdatabase.equals("Vemployee") || inputdatabase.equals("Vemployee1") || inputdatabase.equals("Vemployee2")) {
                    strColoumShow = new String[]{"emp_id", "fullname", "dept_id", "depart_name"};
                }
                break;
            case 35:
                if (inputdatabase.equals("Mproduct_cat")) {
                    strColoumShow = new String[]{"pcat_id", "name_t"};
                } else if (inputdatabase.equals("Vd_job_order_header")) {
                    strColoumShow = new String[]{"doc_id", "cust_name"};
                } else if (inputdatabase.equals("m_carbon_size")) {
                    strColoumShow = new String[]{"name_t"};
                } else {
                    strColoumShow = new String[]{"name_t"};
                }
                break;
            case 36:
                if (inputdatabase.equals("Vproduct")) {
                    strColoumShow = new String[]{"product_id", "name_t"};
                } else if (inputdatabase.equals("Vd_job_order_header")) {
                    strColoumShow = new String[]{"doc_id", "cust_name"};
                }
                break;
            case 37:
                if (inputdatabase.equals("Mwarehouse")) {
                    strColoumShow = new String[]{"warehouse_id", "name_t"};
                } else if (inputdatabase.equals("munit_code")) {
                    strColoumShow = new String[]{"unit_id", "name_t"};
                }
                break;
            case 38:
                if (inputdatabase.equals("Vd_job_order_header")) {
                    strColoumShow = new String[]{"doc_id", "cust_name", "doc_date"};
                }
                break;
            case 39:
                if (inputdatabase.equals("Vproduct")) {
                    strColoumShow = new String[]{"product_id", "name_t"};
                }
                break;
            case 40:
                if (inputdatabase.equals("Vd_job_order_header")) {
                    strColoumShow = new String[]{"doc_id", "cust_name", "doc_date"};
                } else if (inputdatabase.equals("Vemployee") || inputdatabase.equals("Vemployee1")) {
                    strColoumShow = new String[]{"emp_id", "fullname", "dept_id", "depart_name"};
                }
                break;
            case 41:
                if (inputdatabase.equals("mproduction_place")) {
                    strColoumShow = new String[]{"name_t"};
                } else if (inputdatabase.equals("Mwarehouse")) {
                    strColoumShow = new String[]{"warehouse_id", "name_t"};
                } else {
                    strColoumShow = new String[]{"name_t"};
                }
                break;
            case 42:
                if (inputdatabase.equals("Vd_job_order_header")) {
                    strColoumShow = new String[]{"doc_id", "cust_name", "doc_date"};
                } else if (inputdatabase.equals("Vemployee") || inputdatabase.equals("Vemployee1") || inputdatabase.equals("Vemployee2")) {
                    strColoumShow = new String[]{"emp_id", "fullname", "dept_id", "depart_name"};
                }
                break;
            case 43:
                if (inputdatabase.equals("Vproduct")) {
                    strColoumShow = new String[]{"product_id", "name_t"};
                } else {
                    strColoumShow = new String[]{"doc_id", "cust_name"};
                }
                break;
            case 44:
                if (inputdatabase.equals("m_carbon_size")) {
                    strColoumShow = new String[]{"name_t"};
                } else if (inputdatabase.equals("Mwarehouse")) {
                    strColoumShow = new String[]{"warehouse_id", "name_t"};
                }
                break;
            case 45:
                if (inputdatabase.equals("Vemployee")) {
                    strColoumShow = new String[]{"emp_id", "fullname", "dept_id", "depart_name"};
                } else {
                    strColoumShow = new String[]{"unit_id", "name_t"};
                }
                break;
            case 46:
                if (inputdatabase.equals("Vd_rawmatt_receive")) {
                    strColoumShow = new String[]{"doc_id", "scale_no", "car_no"};
                }
                if (inputdatabase.equals("Vemployee") || inputdatabase.equals("Vemployee1") || inputdatabase.equals("Vemployee2")) {
                    strColoumShow = new String[]{"emp_id", "fullname", "dept_id", "depart_name"};
                }
                break;

            case 48:
                if (inputdatabase.equals("vmprocess")) {
                    strColoumShow = new String[]{"process_id", "name_t", "wh_bg_name", "wh_en_name"};
                } else if (inputdatabase.equals("mwarehouse")) {
                    strColoumShow = new String[]{"warehouse_id", "name_t"};
                } else {
                    strColoumShow = new String[]{"doc_id", "doc_date"};
                }
                break;
            case 482:
                if (inputdatabase.equals("vmprocess")) {
                    strColoumShow = new String[]{"process_id", "name_t", "wh_bg_name", "wh_en_name"};
                } else if (inputdatabase.equals("mwarehouse")) {
                    strColoumShow = new String[]{"warehouse_id", "name_t"};
                } else {
                    strColoumShow = new String[]{"doc_id", "doc_date"};
                }
                break;
            case 49:
                if (inputdatabase.equals("vd_carbon_burn_out_header_wh")) {
                    strColoumShow = new String[]{"doc_id", "doc_date"};
                }
                break;
            case 101:
                if (inputdatabase.equals("Vd_rawmatt_receive")) {
                    strColoumShow = new String[]{"doc_id", "doc_date"};
                }
                break;
            case 100:
                if (inputdatabase.equals("Vd_rawmatt_receive")) {
                    strColoumShow = new String[]{"doc_id", "doc_date"};
                }
                break;

            case 3:
                if (inputdatabase.equals("Lookup")) {
                    strColoumShow = new String[]{"lookup_name", "table_name"};
                }
                break;
            default:
                break;
        }
        return strColoumShow;
    }
}
