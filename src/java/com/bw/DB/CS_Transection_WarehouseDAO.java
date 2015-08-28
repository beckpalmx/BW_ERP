/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bw.DB;

import com.bw.Calculator.Calculator_T_warehouse_item;
import com.bw.Util.Chk_T_warehouse_item;
import com.bw.Util.UtiDatabase;
import com.bw.bean.DataBeanCS_Transection_Warehouse;
import com.bw.bean.DataBeanError_Stock_Item;
import com.bw.bean.DataBeanT_transaction_stock;
import com.bw.bean.DataBeanT_warehouse_item;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Administrator
 */
public class CS_Transection_WarehouseDAO {

    private String SQL;
    private static UtiDatabase objuti;
    private int count;
    private int case_stedment;
    public static DataBeanT_transaction_stock Bean_transction = new DataBeanT_transaction_stock();
    public static DataBeanT_warehouse_item Bean_warehouse = new DataBeanT_warehouse_item();
    public static T_transaction_stockDAO Obj_transction = new T_transaction_stockDAO();
    public static T_warehouse_itemDAO Obj_warehouse = new T_warehouse_itemDAO();
    public static T_warehouse_item_totalDAO obj_total = new T_warehouse_item_totalDAO();
    public static ArrayList<DataBeanError_Stock_Item> objAL_error = new ArrayList<DataBeanError_Stock_Item>();

    public String Alert_Return() {
        String Alert = "";
        if (objAL_error.isEmpty()) {
            Alert = "ทำการอนุมัติเอกสารสมบูรณ์";
        } else {
            for (int i = 0; i < objAL_error.size(); i++) {
                Alert += "ลำดับที่ " + objAL_error.get(i).getLine_no()
                        + " รหัสเอกสารที่ " + objAL_error.get(i).getDoc_id()
                        + " ไม่สามารถทำรายการนี้ได้เนื่องจาก = "
                        + objAL_error.get(i).getStatus() + "\n";
            }
        }
        objAL_error.clear();
        return Alert;
    }

    public void Work_Transection_Warehouse(HttpServletRequest request) throws Exception {
        count = 0;
        case_stedment =
                (request.getParameter("process_id").equalsIgnoreCase("PR_022"))
                ? 1
                : (request.getParameter("process_id").equalsIgnoreCase("PR_023"))
                ? 2
                : (request.getParameter("process_id").equalsIgnoreCase("PR_025"))
                ? 3
                : 0;
        Case_Work(case_stedment, request);
    }

    public static void Case_Work(int case_stedment, HttpServletRequest request) throws Exception {
        switch (case_stedment) {
            case 1:
                break;
            case 2:
                Positive_Warehouse(request);
                break;
            case 3:
                Neagtive_Warehouse(request);
                break;
            default:
                break;
        }
    }

    public static void Positive_Warehouse(HttpServletRequest request) throws Exception {
        String line_complete = "";
        Connection con = new DBConnect().openNewConnection();
        ArrayList<DataBeanCS_Transection_Warehouse> objAL = new ArrayList<DataBeanCS_Transection_Warehouse>();
        String SQL = "select * from " + request.getParameter("table_s1") + " where runno in (" + request.getParameter("line_no") + ")";
        Calculator_T_warehouse_item objcal = new Calculator_T_warehouse_item();
        try {
            Result_Detail_Approve(objAL, SQL, con);
            for (DataBeanCS_Transection_Warehouse bean : objAL) {
                Bean_transction.setProcess_id(request.getParameter("process_id"));
                Bean_transction.setBy(request.getParameter("username"));
                Bean_transction.setDate(new Timestamp(new java.util.Date().getTime()));
                Bean_transction.setDoc_id(bean.getDoc_id());
                Bean_transction.setDoc_date(bean.getDoc_date());
                Bean_transction.setProduct_id(bean.getProduct_id());
                Bean_transction.setWh_in(bean.getWarehouse_id());
                Bean_transction.setWeight(bean.getBag_weight());
                Bean_transction.setBag_withdraw(bean.getBag_withdraw());
                Bean_transction.setBag_qty(bean.getBag_amount());
                Bean_transction.setDoc_type("+");
                Obj_transction.InsertT_transaction_stock(Bean_transction, con);
                //*********************Beging Warehouse ************************
                Chk_T_warehouse_item objck = new Chk_T_warehouse_item(bean.getWarehouse_id(), bean.getProduct_id(), bean.getBag_weight(), bean.getBag_amount());
                if (objck.Return_value() != 0 && objck.Return_value() != -5) {
                    Bean_warehouse.setBy(request.getParameter("username"));
                    Bean_warehouse.setDate(new Timestamp(new java.util.Date().getTime()));
                    Bean_warehouse.setWarehouse_id(bean.getWarehouse_id());
                    Bean_warehouse.setProduct_id(bean.getProduct_id());
                    Bean_warehouse.setWeight(bean.getBag_weight());
                    Bean_warehouse.setBag_qty(bean.getBag_amount());
                    Obj_warehouse.InsertT_warehouse_item(Bean_warehouse, con);
                } else {
                    Obj_warehouse.UpdateT_warehouse_item(Bean_transction, con);
                }
                line_complete += "\'" + bean.getLine_no() + "\',";

            }
            line_complete = line_complete.substring(0, line_complete.length() - 1);
            Update_Complete_Flag(line_complete, request, con);
        } catch (Exception e) {
            e.printStackTrace(System.out);
        } finally {
            if (!objAL.isEmpty()) {
                objAL.clear();
            }
            if (con != null) {
                con.close();
            }
        }
    }

    public static void Neagtive_Warehouse(HttpServletRequest request) throws Exception {
        String line_complete = "";
        Connection con = new DBConnect().openNewConnection();
        ArrayList<DataBeanCS_Transection_Warehouse> objAL = new ArrayList<DataBeanCS_Transection_Warehouse>();
        String SQL = "select * from " + request.getParameter("table_s1") + " where runno in (" + request.getParameter("line_no") + ")";
        Calculator_T_warehouse_item objcal = new Calculator_T_warehouse_item();
        try {
            Result_Detail_Approve(objAL, SQL, con);
            for (DataBeanCS_Transection_Warehouse bean : objAL) {
                Chk_T_warehouse_item objck = new Chk_T_warehouse_item(bean.getWarehouse_id(), bean.getProduct_id(), bean.getBag_weight(), bean.getBag_amount());
                if (objck.Return_value() == 0) {
                    Bean_transction.setProcess_id(request.getParameter("process_id"));
                    Bean_transction.setBy(request.getParameter("username"));
                    Bean_transction.setDate(new Timestamp(new java.util.Date().getTime()));
                    Bean_transction.setDoc_id(bean.getDoc_id());
                    Bean_transction.setDoc_date(bean.getDoc_date());
                    Bean_transction.setProduct_id(bean.getProduct_id());
                    Bean_transction.setWh_out(bean.getWarehouse_id());
                    Bean_transction.setWeight(bean.getBag_weight());
                    Bean_transction.setBag_withdraw(bean.getBag_withdraw());
                    Bean_transction.setBag_qty(bean.getBag_amount());
                    Bean_transction.setDoc_type("-");
                    Obj_transction.InsertT_transaction_stock(Bean_transction, con);
                    //*********************Beging Warehouse ************************
                    //objck = new Chk_T_warehouse_item(bean.getWarehouse_id(), bean.getProduct_id(), bean.getBag_weight(), bean.getBag_amount());
                    Obj_warehouse.UpdateT_warehouse_item(Bean_transction, con);
                    line_complete += "\'" + bean.getLine_no() + "\',";
                } else {
                    DataBeanError_Stock_Item beanerror = new DataBeanError_Stock_Item();
                    beanerror.setLine_no(bean.getLine_no());
                    beanerror.setDoc_id(bean.getDoc_id());
                    beanerror.setStatus(objck.Return_value() + "");
                    objAL_error.add(beanerror);
                }
            }
            if(!line_complete.equals("")){
                line_complete = line_complete.substring(0, line_complete.length() - 1);
                Update_Complete_Flag(line_complete, request, con);
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
        } finally {
            if (!objAL.isEmpty()) {
                objAL.clear();
            }
            if (con != null) {
                con.close();
            }
        }
    }

    public static void Result_Detail_Approve(ArrayList<DataBeanCS_Transection_Warehouse> objAL, String SQL, Connection con) throws Exception {
        ResultSet rs = null;
        try {
            rs = con.createStatement().executeQuery(SQL);
            while (rs.next()) {
                DataBeanCS_Transection_Warehouse dataBean = new DataBeanCS_Transection_Warehouse();
                dataBean.setLine_no(rs.getString("line_no"));
                dataBean.setDoc_id(rs.getString("doc_id"));
                dataBean.setDoc_date(rs.getString("doc_date"));
                dataBean.setWarehouse_id(rs.getString("wh_in"));
                dataBean.setProduct_id(rs.getString("product_id"));
                dataBean.setBag_weight(rs.getString("weight"));
                dataBean.setBag_amount(rs.getString("amount"));
                dataBean.setBag_withdraw(rs.getString("bag_qty"));
                objAL.add(dataBean);
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
        } finally {
            if (rs != null) {
                rs.close();
            }
        }
    }

    public String ShowDetail(String Process_id, String Doc_id, String Table_name) throws Exception {
        StringBuffer stroutput = new StringBuffer();
        objuti = new UtiDatabase();
        SQL = "SELECT * FROM " + Table_name + " WHERE doc_id = '" + Doc_id + "' and delete_flag <> 'Y' and complete_flag <> 'Y' order by runno";
        Connection con = new DBConnect().openNewConnection();
        try {
            stroutput = Show_Header_detail(stroutput, 1, SQL, con);
        } catch (Exception e) {
            e.printStackTrace(System.out);
        } finally {
            if (con != null) {
                con.close();
            }
            return stroutput.toString();
        }
    }

    private static StringBuffer Show_Header_detail(StringBuffer inputstr, int Process_number, String SQL, Connection con) throws Exception {
        String[] Str_fill = null;
        String[] Str_coloum = null;
        ResultSet rs = null;
        switch (Process_number) {
            case 1:
                Str_fill = new String[]{"No.", "รายการเบิกสินค้า", "คลัง", "กะ", "น้ำหนักบรรจุ(Kg)", "จำนวน(ก/ส)", "รายการเบิกสินค้า", "คลัง", "น้ำหนักบรรจุ(Kg)", "จำนวน(ก/ส)"};
                Str_coloum = new String[]{"line_no", "product_id", "wh_in", "shift", "weight", "bag_qty", "product_id", "wh_in", "weight", "amount"};
                break;
            case 2:
                break;
            default:
                break;

        }
        inputstr.append("<table width=\"100%\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"1\" class=\"inner3\">");
        inputstr.append("<tr>");
        inputstr.append("<td class=\"headergrid\" colspan=\"7\">เอกสาร</td>");
        inputstr.append("<td class=\"headergrid\" colspan=\"4\">คลังสินค้า</td>");
        inputstr.append("</tr>");
        inputstr.append("<tr>");
        inputstr.append("<td class=\"row3\" width=\"3%\"><input type=\"checkbox\" name=\"chk_all\" id=\"chk_all\" value=\"chk_all\" onClick=\"ckall(this.checked);\"/></td>");
        inputstr.append("<td class=\"row3\" width=\"3%\">" + Str_fill[0] + "&nbsp;</td>");
        inputstr.append("<td class=\"row3\" width=\"14%\">" + Str_fill[1] + "&nbsp;</td>");
        inputstr.append("<td class=\"row3\" width=\"10%\">" + Str_fill[2] + "&nbsp;</td>");
        inputstr.append("<td class=\"row3\" width=\"10%\">" + Str_fill[3] + "&nbsp;</td>");
        inputstr.append("<td class=\"row3\" width=\"10%\">" + Str_fill[4] + "&nbsp;</td>");
        inputstr.append("<td class=\"row3\" width=\"10%\">" + Str_fill[5] + "&nbsp;</td>");
        inputstr.append("<td class=\"row3\" width=\"13%\">" + Str_fill[6] + "&nbsp;</td>");
        inputstr.append("<td class=\"row3\" width=\"10%\">" + Str_fill[7] + "&nbsp;</td>");
        inputstr.append("<td class=\"row3\" width=\"7%\">" + Str_fill[8] + "&nbsp;</td>");
        inputstr.append("<td class=\"row3\" width=\"10%\">" + Str_fill[9] + "&nbsp;</td>");
        inputstr.append("</tr>");
        try {
            rs = con.createStatement().executeQuery(SQL);
            while (rs.next()) {
                inputstr.append("<tr>\n");
                inputstr.append("<td class='forborder' width='3%'><input type='checkbox' id='ckbox_" + rs.getString("line_no") + "' name='ckbox' value ='" + rs.getString("runno") + "' onclick=\"cancle_chkboxAll('chk_all',this.checked)\"></td>\n");
                inputstr.append("<td class='forborder' width='3%'>" + rs.getString(Str_coloum[0]) + "</td>\n");
                inputstr.append("<td class='forborder' width='14%'>" + rs.getString(Str_coloum[1]) + "</td>\n");
                inputstr.append("<td class='forborder' width='10%'>" + rs.getString(Str_coloum[2]) + "</td>\n");
                inputstr.append("<td class='forborder' width='10%'>" + rs.getString(Str_coloum[3]) + "</td>\n");
                inputstr.append("<td class='forborder' width='10%'>" + rs.getString(Str_coloum[4]) + "</td>\n");
                inputstr.append("<td class='forborder' width='10%'>" + rs.getString(Str_coloum[5]) + "</td>\n");
                inputstr.append("<td class='forborder' width='13%'>" + rs.getString(Str_coloum[6]) + "</td>\n");
                inputstr.append("<td class='forborder' width='10%'>" + rs.getString(Str_coloum[7]) + "</td>\n");
                inputstr.append("<td class='forborder' width='7%'>" + rs.getString(Str_coloum[8]) + "</td>\n");
                inputstr.append("<td class='forborder' width='10%'>" + rs.getString(Str_coloum[9]) + "</td>\n");
                inputstr.append("</tr>\n");
            }
            inputstr.append("</table>");
        } catch (Exception e) {
            e.printStackTrace(System.out);
        } finally {
            if (rs != null) {
                rs.close();
            }
            return inputstr;
        }

    }

    private static void Update_Complete_Flag(String line_complete, HttpServletRequest request, Connection con) throws Exception {
        String SQL = "update " + request.getParameter("table_s1") + " set complete_flag = 'Y' where doc_id = '" + request.getParameter("doc_id") + "' and line_no in(" + line_complete + ") and delete_flag = 'N' and complete_flag = 'N'";
        PreparedStatement p = null;
        try {
            p = con.prepareStatement(SQL);
            p.executeUpdate();
            p.clearParameters();
            SQL ="SELECT count(doc_id) as num From " + request.getParameter("table_s1") + " WHERE doc_id = '" + request.getParameter("doc_id") + "' AND complete_flag = 'N' AND delete_flag = 'N'";
            if (objuti.numRowdatabase(SQL) == 0) {
                p = con.prepareStatement("update " + request.getParameter("table_h") + " set complete_flag = 'Y' where doc_id = '" + request.getParameter("doc_id") + "' ");
                p.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
        } finally {
            if (p != null) {
                p.close();
            }
        }
    }
}
