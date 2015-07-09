/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bw.Util;

/**
 *
 * @author BALL
 */
public class SelectSearch_Doc_id {

    private String strURLShow;
    private String[] strColoum, strColoumShow, strFillName;
    private String strID;

    public String[] SelectColoum(int inputpage, String inputdatabase) //function จะ Return ค่าของข้อมูลที่จะนำออกไปแสดงข้อมูล
    {
        switch (inputpage) {
            case 24:
                strColoum = new String[]{"doc_id", "doc_date", "doc_time", "dp_id", "reporter_id", "approver_id", "company_id", "department_name", "reporter_name", "approver_name"};
                break;
            case 25:
                strColoum = new String[]{"doc_id", "doc_date", "doc_time", "dp_id", "reporter_id", "approver_id", "wh_leader_id", "account_id", "company_id", "department_name", "reporter_name", "approver_name", "wh_leader_name", "account_name", "doc_type"};
                break;
            case 26:
                strColoum = new String[]{"doc_id", "doc_date", "doc_time", "dp_id", "reporter_id", "approver_id", "company_id", "department_name", "reporter_name", "approver_name"};
                break;
            case 27:
                strColoum = new String[]{"doc_id", "doc_date", "doc_time", "dp_id", "reporter_id", "approver_id", "wh_leader_id", "account_id", "company_id", "department_name", "reporter_name", "approver_name", "wh_leader_name", "account_name", "doc_type"};
                break;
            case 29:
                strColoum = new String[]{"doc_id", "doc_date", "p_type"};
                break;
            case 31:
                strColoum = new String[]{"doc_id", "doc_date", "po_no", "send_date", "send_date_to", "cust_id", "lot_no", "po_cust", "payment_condition", "spc_order", "product_id", "weight_content", "prd_qty", "bag_qty", "content", "bag_weight", "spec_id", "so2", "adding", "adding_qty", "remark_adding", "mark_sign", "mark_sign_desc", "remark", "base_plate", "base_plate_qty", "wrap_on_pallet", "pallet_qty", "reporter_id", "approver_id", "quality_id", "production_id", "account_id", "cust_name", "product_name", "spec_name", "reporter_name", "approver_name", "quality_name", "production_name", "account_name", "initial"};
                break;
            case 32:
                strColoum = new String[]{"doc_id", "doc_date", "doc_time", "shift", "p_type", "production_id", "product_lot_id", "lot_no", "size", "bag_no", "remark", "random_chk", "pass_chk", "not_pass_chk", "naocl_chk", "withdraw_chk", "approver_id", "cust_name", "approver_name", "job_initial"};
                break;
            case 33:
                strColoum = new String[]{"doc_id", "doc_date", "cassava_date", "amount_cassava", "percent_tapioca", "amount_tapioca", "fresh_skin", "soil_skin", "total_cassava", "percent_tapioca", "amount_tapioca1", "start_m_date", "start_m_time", "end_m_date", "end_m_time", "m_time", "total_stop_milling_hour", "total_milling_time", "milling_ratio", "start_r_date", "start_r_time", "end_r_date", "end_r_time", "r_time", "total_roast_time", "epower_milling_from", "epower_milling_to", "epower_unit", "water_use", "water_per_tapioca", "kw_per_tapioca", "starch_date", "starch_date2", "starch_balance", "cassava_prd_date", "cassava_prd_date2", "qty_prd", "percent_prd", "percent_diff", "percent_yield", "yield_val", "percent_prd1", "percent_diff1", "percent_yield1", "yield_val1", "reporter_id", "total_stop_kw", "total_stop_roast_hour", "total_raw_weight", "total_prd_weight", "total_starch_weight", "cassava_date2","reporter_id_desc"};
                break;
            case 50:
                if (inputdatabase.equals("vd_product_accept_suppliers_header")) {
                    strColoum = new String[]{"doc_id", "doc_date", "doc_time", "dp_id", "reporter_id", "approver_id", "company_id", "department_name", "reporter_name", "approver_name"};
                } else {
                    strColoum = new String[]{"doc_id", "doc_date", "doc_time", "dp_id", "reporter_id", "approver_id", "company_id", "department_name", "reporter_name", "approver_name"};
                }
                break;
            case 51:
                if (inputdatabase.equals("vd_product_withdraw_suppliers_header")) {
                    strColoum = new String[]{"doc_id", "doc_date", "doc_time", "dp_id", "reporter_id", "approver_id", "company_id", "department_name", "reporter_name", "approver_name"};
                } else {
                    strColoum = new String[]{"doc_id", "doc_date", "doc_time", "dp_id", "reporter_id", "approver_id", "company_id", "department_name", "reporter_name", "approver_name"};
                }
                break;
            case 115:
                strColoum = new String[]{"doc_id", "doc_date", "doc_time", "doc_type", "remark"};
                break;
            case 202:
                if (inputdatabase.equalsIgnoreCase("m_cassava_price")) {
                    strColoum = new String[]{"cassava_price_id", "cassava_price_setting_id", "eff_date", "end_date"};
                } else {
                    strColoum = new String[]{"cassava_price_id", "eff_date", "end_date"};
                }
                break;
            case 2022:
                strColoum = new String[]{"cassava_price_id", "eff_date", "end_date"};
                break;
            case 205:
                strColoum = new String[]{"spec_id", "name_t", "remark"};
                break;
            case 301://หน้า BW_CS_031
                strColoum = new String[]{"spec_id", "name_t"};
                break;
            case 302://หน้า BW_CS_032
                strColoum = new String[]{"doc_id", "cust_name", "initial", "lot_no", "product_id", "product_name", "weight_content"};
            default:
                break;
        }
        // JOptionPane.showConfirmDialog(null, strColoum);
        return strColoum;
    }

    public String SelectID(int inputpage, String inputdatabase)//function Return ค่าของ Textfill ของหน้าที่จะนำไปลงข้อมูล
    {
        switch (inputpage) {
            case 24:
                strID = "A_doc_id|A_doc_date|A_doc_time|A_dp_id|A_reporter_id|A_approver_id|A_company_id|dp_id_desc|reporter_id_desc|approver_id_desc";
                break;
            case 25:
                strID = "A_doc_id|A_doc_date|A_doc_time|A_dp_id|A_reporter_id|A_approver_id|A_wh_leader_id|A_account_id|A_company_id|dp_id_desc|reporter_id_desc|approver_id_desc|wh_leader_id_desc|account_id_desc|A_doc_confirm";
                break;
            case 26:
                strID = "A_doc_id|A_doc_date|A_doc_time|A_dp_id|A_reporter_id|A_approver_id|A_company_id|dp_id_desc|reporter_id_desc|approver_id_desc";
                break;
            case 27:
                strID = "A_doc_id|A_doc_date|A_doc_time|A_dp_id|A_reporter_id|A_approver_id|A_wh_leader_id|A_account_id|A_company_id|dp_id_desc|reporter_id_desc|approver_id_desc|wh_leader_id_desc|account_id_desc|A_doc_confirm";
                break;
            case 29:
                strID = "A_doc_id|A_doc_date|A_p_type";
                break;
            case 31:
                strID = "A_doc_id|A_doc_date|A_po_no|A_send_date_from|A_send_date_to|A_cust_id|A_lot_no|A_po_cust|A_payment_condition|A_spc_order|A_product_id|A_weight_content|A_prd_qty|A_bag_qty|A_content|A_bag_weight|A_spec_id|A_so2|A_adding|A_adding_qty|A_remark_adding|A_mark_sign|A_mark_sign_desc|A_remark|A_base_plate|A_base_plate_qty|A_wrap_on_pallet|A_pallet_qty|A_reporter_id|A_approver_id|A_quality_id|A_production_id|A_account_id|cust_id_desc|product_id_desc|spec_id_desc|reporter_id_desc|approver_id_desc|quality_id_desc|production_id_desc|account_id_desc|A_initial";
                break;
            case 32:
                strID = "A_doc_id|A_doc_date|A_doc_time|A_shift|A_p_type|A_production_id|A_product_lot_id|A_lot_no|A_size|A_bag_no|A_remark|A_random_chk|A_pass_chk|A_not_pass_chk|A_naocl_chk|A_withdraw_chk|A_approver_id|cust_name|approver_id_desc|initial";
                break;
            case 33:
                strID = "A_doc_id|A_doc_date|A_cassava_date|A_amount_cassava|A_percent_tapioca|A_amount_tapioca|A_fresh_skin|A_soil_skin|A_total_cassava|A_percent_tapioca1|A_amount_tapioca1|A_start_m_date|A_start_m_time|A_end_m_date|A_end_m_time|A_m_time|A_total_stop_milling_hour|A_total_milling_time|A_milling_ratio|A_start_r_date|A_start_r_time|A_end_r_date|A_end_r_time|A_r_time|A_total_roast_time|A_epower_milling_from|A_epower_milling_to|A_epower_unit|A_water_use|A_water_per_tapioca|A_kw_per_tapioca|A_starch_date_from|A_starch_date_to|A_starch_balance|A_cassava_prd_date|A_cassava_prd_date2|A_qty_prd|A_percent_prd|A_percent_diff|A_percent_yield|A_yield_val|A_percent_prd1|A_percent_diff1|A_percent_yield1|A_yield_val1|A_reporter_id|A_total_stop_kw|total_stop_roast_hour|total_raw_weight|total_prd_weight|total_starch_weight|A_cassava_date2|reporter_id_desc";
                break;
            case 50:
                if (inputdatabase.equals("vd_product_accept_suppliers_header")) {
                    strID = "A_doc_id|A_doc_date|A_doc_time|A_dp_id|A_reporter_id|A_approver_id|A_company_id|dp_id_desc|reporter_id_desc|approver_id_desc";
                } else {
                    strID = "A_doc_id|A_doc_date|A_doc_time|A_dp_id|A_reporter_id|A_approver_id|A_company_id|dp_id_desc|reporter_id_desc|approver_id_desc";
                }
                break;
            case 51:
                if (inputdatabase.equals("vd_product_withdraw_suppliers_header")) {
                    strID = "A_doc_id|A_doc_date|A_doc_time|A_dp_id|A_reporter_id|A_approver_id|A_company_id|dp_id_desc|reporter_id_desc|approver_id_desc";
                } else {
                    strID = "A_doc_id|A_doc_date|A_doc_time|A_dp_id|A_reporter_id|A_approver_id|A_company_id|dp_id_desc|reporter_id_desc|approver_id_desc";
                }
                break;
            case 115:
                strID = "doc_id|doc_date|doc_time|doc_type|remark";
                break;
            case 202:
                if (inputdatabase.equalsIgnoreCase("m_cassava_price")) {
                    strID = "A_cassava_price_id|A_cassava_price_setting_id|A_eff_date|A_end_date";
                } else {
                    strID = "A_cassava_price_setting_id|A_eff_date|A_end_date";
                }
                break;
            case 2022:
                strID = "A_cassava_price_id|A_eff_date|A_end_date";
                break;
            case 205:
                strID = "A_spec_id|A_name_t|A_remark";
                break;
            case 301:
                strID = "A_spec_id|spec_id_desc";
                break;
            case 302:
                strID = "A_production_id|cust_name|initial|A_lot_no|A_product_lot_id|product_name|A_size";
                break;
            default:
                break;
        }
        //total_bag_withdraw_wh|total_weight_withdraw_wh|total_bag_wh|total_weight_wh
        return strID;
    }

    public String[] SelectFillName(int inputpage, String inputdatabase)//function แสดงชื่อ Fill ของ Table(HTML)
    {
        switch (inputpage) {
            case 24:
                strFillName = new String[]{"เลขที่เอกสาร", "วันที่บันทึกเอกสาร"};
                break;
            case 25:
                strFillName = new String[]{"เลขที่เอกสาร", "วันที่บันทึกเอกสาร"};
                break;
            case 26:
                strFillName = new String[]{"เลขที่เอกสาร", "วันที่บันทึกเอกสาร"};
                break;
            case 27:
                strFillName = new String[]{"เลขที่เอกสาร", "วันที่บันทึกเอกสาร"};
                break;
            case 29:
                strFillName = new String[]{"เลขที่เอกสาร", "วันที่บันทึกเอกสาร", "ประเภทแป้ง"};
                break;
            case 31:
                strFillName = new String[]{"เลขที่เอกสาร", "วันที่บันทึกเอกสาร"};
                break;
            case 32:
                strFillName = new String[]{"เลขที่เอกาสาร", "วันทีบันทึกเอกสาร", "ชื่อย่อลูกค้า"};
                break;
            case 33:
                strFillName = new String[]{"เลขที่เอกสาร", "วันที่บันทึกเอกสาร"};
                break;
            case 50:
                strFillName = new String[]{"เลขที่เอกสาร", "วันที่บันทึกเอกสาร"};
                break;
            case 51:
                strFillName = new String[]{"เลขที่เอกสาร", "วันที่บันทึกเอกสาร"};
                break;
            case 115:
                strFillName = new String[]{"เลขที่เอกสาร", "วันที่บันทึกเอกสาร"};
                break;
            case 202:
                strFillName = new String[]{"เลขที่", "วันที่รับซื้อ", "วันที่ปิดรับ"};
                break;
            case 2022:
                strFillName = new String[]{"เลขที่", "วันที่รับซื้อ", "วันที่ปิดรับ"};
                break;
            case 205:
                strFillName = new String[]{"รหัสคุณสมบัติแป้ง", "ชื่อคุณสมบัติแป้ง"};
                break;
            case 301:
                strFillName = new String[]{"รหัสคุณสมบัติแป้ง", "ชื่อคุณสมบัติแป้ง"};
                break;
            case 302:
                strFillName = new String[]{"รหัสใบแจ้งการผลิต", "ชื่อลูกค้า"};
                break;
            default:
                break;
        }
        // JOptionPane.showConfirmDialog(null, strFillName);
        return strFillName;

    }

    public String[] SelectColoumShow(int inputpage, String inputdatabase)//function แสดงข้อมูลใน Table(HTML)
    {
        switch (inputpage) {
            case 24:
                strColoumShow = new String[]{"doc_id", "doc_date"};
                break;
            case 25:
                strColoumShow = new String[]{"doc_id", "doc_date"};
                break;
            case 26:
                strColoumShow = new String[]{"doc_id", "doc_date"};
                break;
            case 27:
                strColoumShow = new String[]{"doc_id", "doc_date"};
                break;
            case 29:
                strColoumShow = new String[]{"doc_id", "doc_date", "p_type"};
                break;
            case 31:
                strColoumShow = new String[]{"doc_id", "doc_date"};
                break;
            case 32:
                strColoumShow = new String[]{"doc_id", "doc_date", "job_initial"};
                break;
            case 33:
                strColoumShow = new String[]{"doc_id", "doc_date"};
                break;
            case 50:
                strColoumShow = new String[]{"doc_id", "doc_date"};
                break;
            case 51:
                strColoumShow = new String[]{"doc_id", "doc_date"};
                break;
            case 115:
                strColoumShow = new String[]{"doc_id", "doc_date"};
                break;
            case 202:
                strColoumShow = new String[]{"cassava_price_id", "eff_date", "end_date"};
                break;
            case 2022:
                strColoumShow = new String[]{"cassava_price_id", "eff_date", "end_date"};
                break;
            case 205:
                strColoumShow = new String[]{"spec_id", "name_t"};
                break;
            case 301:
                strColoumShow = new String[]{"spec_id", "name_t"};
                break;
            case 302:
                strColoumShow = new String[]{"doc_id", "doc_date"};
                break;
            default:
                break;
        }
        //JOptionPane.showConfirmDialog(null, strColoumShow);
        return strColoumShow;
    }

    public String SelectURLShowDetail(int inputpage, String inputdatabase) {
        switch (inputpage) {
            case 24:
                strURLShow = "../SHOWDETAILSCREEN/BW_CS_Show024.jsp?doc_id=";
                break;
            case 25:
                strURLShow = "../SHOWDETAILSCREEN/BW_CS_Show025.jsp?doc_id=";
                break;
            case 26:
                strURLShow = "../SHOWDETAILSCREEN/BW_CS_Show026.jsp?doc_id=";
                break;
            case 27:
                strURLShow = "../SHOWDETAILSCREEN/BW_CS_Show027.jsp?doc_id=";
                break;
            case 29:
                strURLShow = "../SHOWDETAILSCREEN/BW_CS_Show029.jsp?A_doc_id=";
                break;
            case 31:
                strURLShow = "../SHOWDETAILSCREEN/BW_CS_Show031_Spec.jsp?doc_id=,../SHOWDETAILSCREEN/BW_CS_Show031_Other.jsp?doc_id=";
                break;
            case 32:
                strURLShow = "../SHOWDETAILSCREEN/BW_CS_Show032_Spec.jsp?doc_id=,../SHOWDETAILSCREEN/BW_CS_Show032_Other.jsp?doc_id=";
                break;
            case 33:
                strURLShow = "../SHOWDETAILSCREEN/BW_CS_Show033_1.jsp?doc_id=,../SHOWDETAILSCREEN/BW_CS_Show033_2.jsp?doc_id=,../SHOWDETAILSCREEN/BW_CS_Show033_3.jsp?doc_id=,../SHOWDETAILSCREEN/BW_CS_Show033_4.jsp?doc_id=,../SHOWDETAILSCREEN/BW_CS_Show033_5.jsp?doc_id=";
                System.out.println("Case 33 : " + strURLShow);
                break;
            case 50:
                if (inputdatabase.equals("vd_product_accept_suppliers_header")) {
                    strURLShow = "../SHOWDETAILSCREEN/BW_CS_Show050.jsp?doc_id=";
                } else {
                    strURLShow = "../SHOWDETAILSCREEN/BW_CS_Show050_WH.jsp?doc_id=";
                }
                break;
            case 51:
                if (inputdatabase.equals("vd_product_withdraw_suppliers_header")) {
                    strURLShow = "../SHOWDETAILSCREEN/BW_CS_Show051.jsp?doc_id=";
                } else {
                    strURLShow = "../SHOWDETAILSCREEN/BW_CS_Show051_WH.jsp?doc_id=";
                }
                break;
            case 115:
                if (inputdatabase.equals("d_wood_fuel_doc")) {
                    strURLShow = "../SHOWDETAILSCREEN/CS_Show_D_wood_fuel_doc.jsp?doc_id=";
                } else if (inputdatabase.equals("vd_casava_skin__fresh")) {
                    strURLShow = "../SHOWDETAILSCREEN/CS_Show_D_casava_skin_doc.jsp?doc_id=";
                } else if (inputdatabase.equals("vd_casava_skin__fresh_soil_doc")) {
                    strURLShow = "../SHOWDETAILSCREEN/CS_Show_VD_casava_skin_doc.jsp?doc_id=";   
                } else if (inputdatabase.equals("vd_casava_skin__ticket")) {
                    strURLShow = "../SHOWDETAILSCREEN/CS_Show_VD_casava_skin_ticket.jsp?doc_id=";
                }                       
                break;
            case 202:
                if (inputdatabase.equals("m_cassava_price")) {
                    strURLShow = "../SHOWDETAILSCREEN/BW_CS_Show202.jsp?doc_id=";
                } else {
                    strURLShow = "../SHOWDETAILSCREEN/BW_CS_Show202_2.jsp?doc_id=";
                }
                break;
            case 2022:
                strURLShow = "../SHOWDETAILSCREEN/BW_CS_Show202_2.jsp?doc_id=";
                break;
            case 205:
                strURLShow = "../SHOWDETAILSCREEN/BW_CS_Show205.jsp?doc_id=";
                break;
            case 301:
                strURLShow = "../SHOWDETAILSCREEN/BW_CS_Show205_fig.jsp?doc_id=";
                break;
            case 302:
                strURLShow = "../SHOWDETAILSCREEN/BW_CS_Show032_Spec.jsp?production_id=,../SHOWDETAILSCREEN/BW_CS_Show032_Other.jsp?production_id=";
                break;
            default:
                break;
        }

        return strURLShow;
    }
}
