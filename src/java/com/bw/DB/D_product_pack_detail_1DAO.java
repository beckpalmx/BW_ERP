/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bw.DB;

import com.bw.Calculator.Calculator_BW;
import com.bw.Util.StringQuery;
import com.bw.Util.UtiDatabase;
import com.bw.bean.DataBeanD_product_pack_datail_1;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author B
 */
public class D_product_pack_detail_1DAO {

    public void insert(DataBeanD_product_pack_datail_1 DataBean)throws Exception{
        String[] String_input = new String[]{
            "doc_id",
            "line_no",
            "cust_id",
            "lot_no",
            "order_prod_pack",
            "total_prod_pack",
            "withdraw_tot_weight",
            "prod_tot_weight",
            "create_by",
            "create_date",
        };
        StringQuery objStringQuery = new StringQuery();
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        PreparedStatement p = null;
        Calculator_BW obj_cal = new Calculator_BW();
        int i = 1;
        try{
            p = con.prepareStatement(objStringQuery.Insert_String(String_input, "d_product_pack_detail_1"));
            p.setString(i, DataBean.getDoc_id());i += 1;
            p.setString(i, DataBean.getLine_no());i += 1;
            p.setString(i, DataBean.getCust_id());i += 1;
            p.setString(i, DataBean.getLot_no());i += 1;
            p.setString(i, DataBean.getOrder_prod_pack());i += 1;
            p.setString(i, DataBean.getTotal_prod_pack());i += 1;
            p.setString(i, obj_cal.Sum_Weight(DataBean.getDoc_id(),DataBean.getLine_no(), "d_product_pack_detail_2", "weight", con));i += 1;
            p.setString(i, obj_cal.Sum_Weight(DataBean.getDoc_id(),DataBean.getLine_no(), "d_product_pack_detail_3", "weight", con));i += 1;
            p.setString(i, DataBean.getBy());i += 1;
            p.setTimestamp(i, DataBean.getDate());i += 1;
            p.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(p !=null){
                p.close();
            }
            if(con != null){
                con.close();
            }
        }
    }
    public void update(DataBeanD_product_pack_datail_1 DataBean)throws Exception{
        String[] String_input = new String[]{
            "cust_id",
            "lot_no",
            "order_prod_pack",
            "total_prod_pack",
            "withdraw_tot_weight",
            "prod_tot_weight",
            "update_by",
            "update_date"
        };
        StringQuery objStringQuery = new StringQuery();
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        Calculator_BW obj_cal = new Calculator_BW();
        PreparedStatement p = null;
        int i = 1;
        try{
            p = con.prepareStatement(objStringQuery.Update_String(String_input, "d_product_pack_detail_1",
                    "Where doc_id = ? and line_no = ? and delete_flag = 'N' and complete_flag = 'N'"));
            p.setString(i, DataBean.getCust_id());i += 1;
            p.setString(i, DataBean.getLot_no());i += 1;
            p.setString(i, DataBean.getOrder_prod_pack());i += 1;
            p.setString(i, DataBean.getTotal_prod_pack());i += 1;
            p.setString(i, obj_cal.Sum_Weight(DataBean.getDoc_id(),DataBean.getLine_no(), "d_product_pack_detail_2", "weight", con));i += 1;
            p.setString(i, obj_cal.Sum_Weight(DataBean.getDoc_id(),DataBean.getLine_no(), "d_product_pack_detail_3", "weight", con));i += 1;
            p.setString(i, DataBean.getBy());i += 1;
            p.setTimestamp(i, DataBean.getDate());i += 1;
            p.setString(i, DataBean.getDoc_id());i += 1;
            p.setString(i, DataBean.getLine_no());i += 1;
            p.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(p !=null){
                p.close();
            }
            if(con != null){
                con.close();
            }
        }
    }
    public void Delete_line_no(String Select_line_no, DataBeanD_product_pack_datail_1 DataBean, String Table_Detail) throws Exception {
        StringBuffer old_line_no = new StringBuffer();
        String Str_old_line_no = "";
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        ResultSet rs = null;
        PreparedStatement p = null;
        StringQuery objStringQuery = new StringQuery();
        UtiDatabase objuti = new UtiDatabase();
        int numrow = 0;
        try {
            if (Select_line_no.length() != 0) {
                String[] Number_Line_no = Select_line_no.split(",");
                p = con.prepareStatement(objStringQuery.Flag_Status_String("delete_flag='Y',delete_by=?,delete_date=?", Table_Detail,
                        "where doc_id =? and line_no = ? and complete_flag = 'N' and delete_flag = 'N'"));
                for (int loop = 0; loop < Number_Line_no.length; loop++) {
                    p.setString(1, DataBean.getBy());
                    p.setTimestamp(2, DataBean.getDate());
                    p.setString(3, DataBean.getDoc_id());
                    p.setString(4, Number_Line_no[loop]);
                    p.addBatch();
                }
                p.executeBatch();
                p.clearBatch();
                p = con.prepareStatement(objStringQuery.Flag_Status_String("delete_flag='Y',delete_by=?,delete_date=?", "d_product_pack_detail_2",
                        "where doc_id =? and doc_line_no = ? and complete_flag = 'N' and delete_flag = 'N'"));
                for (int loop = 0; loop < Number_Line_no.length; loop++) {
                    p.setString(1, DataBean.getBy());
                    p.setTimestamp(2, DataBean.getDate());
                    p.setString(3, DataBean.getDoc_id());
                    p.setString(4, Number_Line_no[loop]);
                    p.addBatch();
                }
                p.executeBatch();
                p.clearBatch();
                p = con.prepareStatement(objStringQuery.Flag_Status_String("delete_flag='Y',delete_by=?,delete_date=?", "d_product_pack_detail_3",
                        "where doc_id =? and doc_line_no = ? and complete_flag = 'N' and delete_flag = 'N'"));
                for (int loop = 0; loop < Number_Line_no.length; loop++) {
                    p.setString(1, DataBean.getBy());
                    p.setTimestamp(2, DataBean.getDate());
                    p.setString(3, DataBean.getDoc_id());
                    p.setString(4, Number_Line_no[loop]);
                    p.addBatch();
                }
                p.executeBatch();
                p.clearBatch();
                numrow = objuti.numRowdatabase("Select count(doc_id) as num from " + Table_Detail + " where doc_id = '" + DataBean.getDoc_id() + "' and delete_flag = 'N' and complete_flag = 'N'");
                if (numrow != 0) {
                    rs = con.createStatement().executeQuery("SELECT line_no from " + Table_Detail + " where doc_id = '" + DataBean.getDoc_id() + "' and delete_flag = 'N' and complete_flag = 'N'");
                    while (rs.next()) {
                        old_line_no.append(rs.getString("line_no"));
                        old_line_no.append(",");
                    }
                    Str_old_line_no = old_line_no.toString().substring(0, old_line_no.toString().length()-1);
                    Number_Line_no = null;
                    p  = null;
                    Number_Line_no = Str_old_line_no.split(",");
                    p = con.prepareStatement(objStringQuery.Flag_Status_String("line_no=?", Table_Detail,
                            "where doc_id =? and line_no = ? and complete_flag = 'N' and delete_flag = 'N'"));
                    for (int loop = 0; loop < Number_Line_no.length; loop++) {
                        p.setString(1, Integer.toString(loop+1));
                        p.setString(2, DataBean.getDoc_id());
                        p.setString(3, Number_Line_no[loop]);
                        p.addBatch();
                    }
                    p.executeBatch();
                    p.clearBatch();
                    p = con.prepareStatement(objStringQuery.Flag_Status_String("doc_line_no=?", "d_product_pack_detail_2",
                            "where doc_id =? and doc_line_no = ? and complete_flag = 'N' and delete_flag = 'N'"));
                    for (int loop = 0; loop < Number_Line_no.length; loop++) {
                        p.setString(1, Integer.toString(loop+1));
                        p.setString(2, DataBean.getDoc_id());
                        p.setString(3, Number_Line_no[loop]);
                        p.addBatch();
                    }
                    p.executeBatch();
                    p.clearBatch();
                    p = con.prepareStatement(objStringQuery.Flag_Status_String("doc_line_no=?", "d_product_pack_detail_3",
                            "where doc_id =? and doc_line_no = ? and complete_flag = 'N' and delete_flag = 'N'"));
                    for (int loop = 0; loop < Number_Line_no.length; loop++) {
                        p.setString(1, Integer.toString(loop+1));
                        p.setString(2, DataBean.getDoc_id());
                        p.setString(3, Number_Line_no[loop]);
                        p.addBatch();
                    }
                    p.executeBatch();
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (p != null) {
                p.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }

    public void Delete_all_line_no(DataBeanD_product_pack_datail_1 DataBean, String Table_Detail) throws Exception {
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        StringQuery objStringQuery = new StringQuery();
        PreparedStatement p = null;
        try {
            p = con.prepareStatement(objStringQuery.Flag_Status_String("delete_flag='Y',delete_by=?,delete_date=? ", Table_Detail,
                    "Where doc_id = ? and delete_flag = 'N' and  complete_flag = 'N'"));
            p.setString(1, DataBean.getBy());
            p.setTimestamp(2, DataBean.getDate());
            p.setString(3, DataBean.getDoc_id());
            p.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (p != null) {
                p.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }
    public DataBeanD_product_pack_datail_1 Return_Edit(String doc_id,String line_no)throws Exception{
        DataBeanD_product_pack_datail_1 return_bean = new DataBeanD_product_pack_datail_1();
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        ResultSet rs = null;
        String SQL = "";
        try{
            SQL = "SELECT "
                    + "cust_id,line_no,lot_no,order_prod_pack,total_prod_pack,withdraw_tot_weight,prod_tot_weight"
                    + " FROM d_product_pack_detail_1 "
                    + "WHERE doc_id = '"+doc_id+"' and line_no = '"+line_no+"' and delete_flag = 'N' and complete_flag = 'N'";
            rs = con.createStatement().executeQuery(SQL);
            while(rs.next()){
                return_bean.setCust_id(rs.getString("cust_id"));
                return_bean.setLot_no(rs.getString("lot_no"));
                return_bean.setOrder_prod_pack(rs.getString("order_prod_pack"));
                return_bean.setTotal_prod_pack(rs.getString("total_prod_pack"));
                return_bean.setWithdraw_tot_weight(rs.getString("withdraw_tot_weight"));
                return_bean.setProd_tot_weight(rs.getString("prod_tot_weight"));
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(rs != null){
                rs.close();
            }
            if(con != null){
                con.close();
            }
            return return_bean;
        }
    }
    public String Show_Detail(String doc_id, String Screen) throws Exception {
        int start, row_page = 10, total = 0, screen;
        UtiDatabase objuti = new UtiDatabase();
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        StringBuffer Return_String = new StringBuffer();
        ResultSet rs = null;
        String SQL = "";
        total = objuti.numRowdatabase("Select Count(doc_id) As num from  d_product_pack_detail_1 where doc_id ='" + doc_id + "' and delete_flag = 'N' and complete_flag ='N' ");
        try {

            if (total != 0) {
                int total_page = (int) Math.ceil((double) total / (double) row_page);
                screen = Screen == null ? 1 : Integer.parseInt(Screen);
                if (screen >= 1 && screen <= total) {
                    start = (screen - 1) * row_page;
                    SQL = "select "
                            + "runno,doc_id,line_no,cust_id,lot_no,order_prod_pack,total_prod_pack,withdraw_tot_weight,prod_tot_weight "
                            + "from d_product_pack_detail_1 "
                            + "where doc_id = '" + doc_id + "' and delete_flag = 'N' and complete_flag = 'N' "
                            + "order by  to_number(line_no,'999') LIMIT " + row_page + " OFFSET " + start;
                    Return_String.append("<table width='100%' align='center' border='0' cellpadding='0' cellspacing='1' class='inner'>\n");
                    rs = con.createStatement().executeQuery(SQL);
                    while (rs.next()) {
                        Return_String.append("<tr>\n");
                        Return_String.append("<td class='forborder' width='3px'><input type='checkbox' id='ckbox' value='"+rs.getString("line_no")+"' name='ckbox' onclick=\"cancle_chkboxAll('chk_all',this.checked)\"></td>");
                        Return_String.append("<td class='forborder' width='7%'><a href=\"#\" onclick=\"OpenEdit(URLsend('line_no_" + rs.getString("line_no") + ",A_doc_id','../SCREEN/BW_CS_Detail_030_21.jsp'))\"><input type='hidden' id='line_no_" + rs.getString("line_no") + "' value=\"" + rs.getString("line_no") + "\"><input type='hidden' id='doc_id' value=\"" + rs.getString("doc_id") + "\"><input type='hidden' id='runno_" + rs.getString("runno") + "'' value=\"" + rs.getString("runno") + "\">" + rs.getString("line_no") + "</a></td>\n");
                        Return_String.append("<td class='forborder' width='20%'>" + objuti.NotNull(rs.getString("cust_id")) + "&nbsp;</td>\n");
                        Return_String.append("<td class='forborder' width='7%'>" + objuti.NotNull(rs.getString("lot_no")) + "</td>\n");
                        Return_String.append("<td class='forborder' width='15%'>" + objuti.NotNull(rs.getString("order_prod_pack")) + "</td>\n");
                        Return_String.append("<td class='forborder' width='15%'>" + objuti.NotNull(rs.getString("total_prod_pack")) + "</td>\n");
                        Return_String.append("<td class='forborder' width='15%'>" + objuti.NotNull(rs.getString("withdraw_tot_weight"))+ "&nbsp;</td>\n");
                        Return_String.append("<td class='forborder' width='15%'>" + objuti.NotNull(rs.getString("prod_tot_weight"))+ "&nbsp;</td>\n");
                        Return_String.append("</tr>\n");
                    }
                    rs = null;
                    SQL = "select "
                            + "doc_id,delete_flag,complete_flag,"
                            + "trim(to_char(sum(to_number(withdraw_tot_weight,'99999999999990.000')),'99999999999990.000')) as sum_withdraw_tot_weight,"
                            + "trim(to_char(sum(to_number(prod_tot_weight,'99999999999990.000')),'99999999999990.000')) as sum_prod_tot_weight"
                            + " from d_product_pack_detail_1 "
                            + "where doc_id = '"+doc_id+"' and delete_flag = 'N' and complete_flag = 'N' group by doc_id,delete_flag, complete_flag";
                    rs = con.createStatement().executeQuery(SQL);
                    while(rs.next()){
                        Return_String.append("<tr>\n");
                        Return_String.append("<td  class='row3' colspan='5'></td>\n");
                        Return_String.append("<td class='row3' width='15%'>รวม&nbsp;</td>\n");
                        Return_String.append("<td class='forborder' width='15%'><input type = 'text' value = '" + objuti.NotNull(rs.getString("sum_withdraw_tot_weight"))+ "' size = '13' id = 'sum_withdraw_tot_weight' name = 'sum_withdraw_tot_weight'>&nbsp;</td>\n");
                        Return_String.append("<td class='forborder' width='15%'><input type = 'text' value = '" + objuti.NotNull(rs.getString("sum_prod_tot_weight"))+ "' size = '13' id = 'sum_prod_tot_weight' name = 'sum_prod_tot_weight'>&nbsp;</td>\n");
                        Return_String.append("</tr>\n");
                    }
                    Return_String.append("</table>");
                }
                Return_String.append("<div align='center'>\n");
                if ((screen % 10) != 0 && screen <= 10) {
                    for (int count = 1; count <= 10 && count <= total_page; count++) {
                        if (count == screen) {
                            Return_String.append(" [" + count + "] |");
                        } else {
                            Return_String.append(" <a href='#'  onclick = \"showTableNonPopup_Detail('show','A_doc_id','s_screen_"+count+"','../SHOWDETAILSCREEN/BW_CS_Show024.jsp?doc_id=')\"><input type = 'hidden' id='s_screen_"+count+"' name='s_screen_"+count+"' value =\""+count+"\">" + count + "</a> |");
                        }

                    }
                    //**************************************************Select**************************************
                    Return_String.append("<select id='select_screen' name = 'select_screen'>");
                    for(int count = 1; count <= 10 && count <= total_page; count++){
                        if (count == screen) {
                            Return_String.append("<option selected  value=\'"+count+"\' onclick = \"showTableNonPopup_Detail('show','A_doc_id','select_screen','../SHOWDETAILSCREEN/BW_CS_Show024.jsp?doc_id=')\">"+count+"</option>");
                        }else{
                            Return_String.append("<option   value=\'"+count+"\' onclick = \"showTableNonPopup_Detail('show','A_doc_id','select_screen','../SHOWDETAILSCREEN/BW_CS_Show024.jsp?doc_id=')\">"+count+"</option>");
                        }
                    }
                    Return_String.append("</select>");
                    //**************************************************Select**************************************
                } else {
                    for (int count = (screen - 5); count <= (screen + 5) && count <= total_page; count++) {
                        if (count == screen) {
                            Return_String.append("| [" + count + "] |");
                        } else {
                            Return_String.append(" <a href='#' onclick = \"showTableNonPopup_Detail('show','A_doc_id','s_screen_"+count+"','../SHOWDETAILSCREEN/BW_CS_Show024.jsp?doc_id=')\"><input type = 'hidden' id='s_screen_"+count+"' name='s_screen_"+count+"' value ='"+count+"'>" + count + "</a> |");
                        }
                    }
                    //**************************************************Select**************************************
                    Return_String.append("<select id='select_screen' name = 'select_screen'>");
                    for(int count = (screen - 5); count <= (screen + 5) && count <= total_page; count++){
                        if (count == screen) {
                            Return_String.append("<option selected  value=\'"+count+"\' onclick = \"showTableNonPopup_Detail('show','A_doc_id','select_screen','../SHOWDETAILSCREEN/BW_CS_Show024.jsp?doc_id=')\">"+count+"</option>");
                        }else{
                            Return_String.append("<option   value=\'"+count+"\' onclick = \"showTableNonPopup_Detail('show','A_doc_id','select_screen','../SHOWDETAILSCREEN/BW_CS_Show024.jsp?doc_id=')\">"+count+"</option>");
                        }
                    }
                    Return_String.append("</select>");
                    //**************************************************Select**************************************
                }
                Return_String.append("</div>\n");

            } else {
                Return_String.append("ไม่พบข้อมูลที่ต้องการ");
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
            return Return_String.toString();

        }



    }
}
