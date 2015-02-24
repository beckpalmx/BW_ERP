/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bw.DB;

import com.bw.Util.StringQuery;
import com.bw.Util.UtiDatabase;
import com.bw.bean.DataBeanD_product_report_daily_detail_prd;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Administrator
 */
public class D_product_report_daily_detail_prdDAO {
    public void insert(DataBeanD_product_report_daily_detail_prd DataBean)throws Exception{
        String[] String_input = new String[]{
            "doc_id",
            "line_no",
            "product_id",
            "weight",
            "bag_qty",
            "amount",
            "remark",
            "create_by",
            "create_date"
        };
        StringQuery objStringQuery = new StringQuery();
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        PreparedStatement p = null;
        int i = 1;
        try{
            p = con.prepareStatement(objStringQuery.Insert_String(String_input, "d_product_report_daily_detail_prd"));
            p.setString(i, DataBean.getDoc_id());i += 1;
            p.setString(i, DataBean.getLine_no());i += 1;
            p.setString(i, DataBean.getProduct_id());i += 1;
            p.setString(i, DataBean.getWeight());i += 1;
            p.setString(i, DataBean.getBag_qty());i += 1;
            p.setString(i, DataBean.getAmount());i += 1;
            p.setString(i, DataBean.getRemark());i += 1;
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
    public void update(DataBeanD_product_report_daily_detail_prd DataBean)throws Exception{
        String[] String_input = new String[]{
            "product_id",
            "weight",
            "bag_qty",
            "amount",
            "remark",
            "update_by",
            "update_date"
        };
        StringQuery objStringQuery = new StringQuery();
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        PreparedStatement p = null;
        int i = 1;
        try{
            p = con.prepareStatement(objStringQuery.Update_String(String_input, "d_product_report_daily_detail_prd",
                    "Where doc_id = ?  and line_no = ? and delete_flag = 'N' and complete_flag = 'N'"));
            p.setString(i, DataBean.getProduct_id());i += 1;
            p.setString(i, DataBean.getWeight());i += 1;
            p.setString(i, DataBean.getBag_qty());i += 1;
            p.setString(i, DataBean.getRemark());i += 1;
            p.setString(i, DataBean.getRemark());i += 1;
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

    public void Delete_line_no(String Select_line_no, DataBeanD_product_report_daily_detail_prd DataBean, String Table_Detail) throws Exception {
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

    public void Delete_all_line_no(DataBeanD_product_report_daily_detail_prd DataBean, String Table_Detail) throws Exception {
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
    public DataBeanD_product_report_daily_detail_prd Return_Edit(String doc_id,String line_no)throws Exception{
        DataBeanD_product_report_daily_detail_prd objbean = new DataBeanD_product_report_daily_detail_prd();
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        ResultSet rs = null;
        String SQL = "SELECT "
                + "product_id,weight,bag_qty,amount,remark"
                + " FROM d_product_report_daily_detail_prd "
                + " WHERE doc_id = '"+doc_id+"' and line_no = '"+line_no+"' and delete_flag = 'N' and complete_flag = 'N'";
        try{
            rs = con.createStatement().executeQuery(SQL);
            while(rs.next()){
                objbean.setProduct_id(rs.getString("product_id"));
                objbean.setWeight(rs.getString("weight"));
                objbean.setBag_qty(rs.getString("bag_qty"));
                objbean.setAmount(rs.getString("amount"));
                objbean.setRemark(rs.getString("remark"));
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
            return objbean;
        }
    }
    public String Show_Detail(String doc_id, String Screen) throws Exception {
        int start, row_page = 5, total = 0, screen;
        UtiDatabase objuti = new UtiDatabase();
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        StringBuffer Return_String = new StringBuffer();
        ResultSet rs = null;
        String SQL = "";
        total = objuti.numRowdatabase("Select Count(doc_id) As num from d_product_report_daily_detail_raw where doc_id ='" + doc_id + "' and delete_flag = 'N' and complete_flag ='N' ");
        try {

            if (total != 0) {
                int total_page = (int) Math.ceil((double) total / (double) row_page);
                screen = Screen == null ? 1 : Integer.parseInt(Screen);
                if (screen >= 1 && screen <= total) {
                    start = (screen - 1) * row_page;
                    SQL = "select "
                            + "runno,doc_id,line_no,product_id,weight,bag_qty,amount,remark "
                            + "from d_product_report_daily_detail_prd "
                            + "where doc_id = '" + doc_id + "' and delete_flag = 'N' and complete_flag = 'N' "
                            + "order by  to_number(line_no,'999') LIMIT " + row_page + " OFFSET " + start;
                    Return_String.append("<table width='100%' align='center' border='0' cellpadding='0' cellspacing='1' class='inner'>\n");
                    rs = con.createStatement().executeQuery(SQL);
                    while (rs.next()) {
                        Return_String.append("<tr>\n");
                        Return_String.append("<td class='forborder' width='3px'><input type='checkbox' id='ckbox_4_"+rs.getString("line_no")+"' value='"+rs.getString("line_no")+"' name='ckbox_4' onclick=\"cancle_chkboxAll('chk_all4',this.checked)\"></td>");
                        Return_String.append("<td class='forborder' width='7%'><a href=\"#\" onclick=\"OpenEdit(URLsend('line_no_" + rs.getString("line_no") + ",A_doc_id','../SCREEN/BW_CS_Detail_033_4.jsp'))\"><input type='hidden' id='line_no_" + rs.getString("line_no") + "' value=\"" + rs.getString("line_no") + "\"><input type='hidden' id='doc_id' value=\"" + rs.getString("doc_id") + "\"><input type='hidden' id='runno_" + rs.getString("runno") + "'' value=\"" + rs.getString("runno") + "\">" + rs.getString("line_no") + "</a></td>\n");
                        Return_String.append("<td class='forborder' width='20%'>" + objuti.NotNull(rs.getString("product_id")) + "&nbsp;</td>\n");
                        Return_String.append("<td class='forborder' width='15%'>" + objuti.NotNull(rs.getString("weight")) + "</td>\n");
                        Return_String.append("<td class='forborder' width='15%'>" + objuti.NotNull(rs.getString("bag_qty")) + "</td>\n");
                        Return_String.append("<td class='forborder' width='15%'>" + objuti.NotNull(rs.getString("amount")) + "</td>\n");
                        Return_String.append("<td class='forborder' width='25%'>" + objuti.NotNull(rs.getString("remark"))+ "&nbsp;</td>\n");
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
                            Return_String.append(" <a href='#'  onclick = \"showTableNonPopup_Detail('show3','A_doc_id','s_screen_"+count+"','../SHOWDETAILSCREEN/BW_CS_Show033_4.jsp?doc_id=')\"><input type = 'hidden' id='s_screen_"+count+"' name='s_screen_"+count+"' value =\""+count+"\">" + count + "</a> |");
                        }

                    }
                    //**************************************************Select**************************************
                    Return_String.append("<select id='select_screen' name = 'select_screen'>");
                    for(int count = 1; count <= 10 && count <= total_page; count++){
                        if (count == screen) {
                            Return_String.append("<option selected  value=\'"+count+"\' onclick = \"showTableNonPopup_Detail('show3','A_doc_id','select_screen','../SHOWDETAILSCREEN/BW_CS_Show033_14.jsp?doc_id=')\">"+count+"</option>");
                        }else{
                            Return_String.append("<option   value=\'"+count+"\' onclick = \"showTableNonPopup_Detail('show3','A_doc_id','select_screen','../SHOWDETAILSCREEN/BW_CS_Show033_4.jsp?doc_id=')\">"+count+"</option>");
                        }
                    }
                    Return_String.append("</select>");
                    //**************************************************Select**************************************
                } else {
                    for (int count = (screen - 5); count <= (screen + 5) && count <= total_page; count++) {
                        if (count == screen) {
                            Return_String.append("| [" + count + "] |");
                        } else {
                            Return_String.append(" <a href='#' onclick = \"showTableNonPopup_Detail('show3','A_doc_id','s_screen_"+count+"','../SHOWDETAILSCREEN/BW_CS_Show033_4.jsp?doc_id=')\"><input type = 'hidden' id='s_screen_"+count+"' name='s_screen_"+count+"' value ='"+count+"'>" + count + "</a> |");
                        }
                    }
                    //**************************************************Select**************************************
                    Return_String.append("<select id='select_screen' name = 'select_screen'>");
                    for(int count = (screen - 5); count <= (screen + 5) && count <= total_page; count++){
                        if (count == screen) {
                            Return_String.append("<option selected  value=\'"+count+"\' onclick = \"showTableNonPopup_Detail('show3','A_doc_id','select_screen','../SHOWDETAILSCREEN/BW_CS_Show033_4.jsp?doc_id=')\">"+count+"</option>");
                        }else{
                            Return_String.append("<option   value=\'"+count+"\' onclick = \"showTableNonPopup_Detail('show3','A_doc_id','select_screen','../SHOWDETAILSCREEN/BW_CS_Show033_4.jsp?doc_id=')\">"+count+"</option>");
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
