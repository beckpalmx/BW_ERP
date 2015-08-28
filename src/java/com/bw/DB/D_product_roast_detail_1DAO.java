/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bw.DB;

import com.bw.Util.StringQuery;
import com.bw.Util.UtiDatabase;
import com.bw.bean.DataBeanD_product_roast_detail_1;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Administrator
 */
public class D_product_roast_detail_1DAO {
    public void insert(DataBeanD_product_roast_detail_1 DataBean)throws Exception{
        String[] String_input = new String[]{
            "doc_id",
            "line_no",
            "date_from",
            "time_from",
            "date_to",
            "time_to",
            "roast_hr",
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
            p = con.prepareStatement(objStringQuery.Insert_String(String_input, "d_product_roast_detail_1"));
            p.setString(i, DataBean.getDoc_id());i += 1;
            p.setString(i, DataBean.getLine_no());i += 1;
            p.setString(i, DataBean.getDate_from());i += 1;
            p.setString(i, DataBean.getTime_from());i += 1;
            p.setString(i, DataBean.getDate_to());i += 1;
            p.setString(i, DataBean.getTime_to());i += 1;
            p.setString(i, DataBean.getRoast_hr());i += 1;
            p.setString(i, DataBean.getRemark());i += 1;
            p.setString(i, DataBean.getBy());i += 1;
            p.setTimestamp(i, DataBean.getDate());i += 1;
            p.executeUpdate();
        }catch(Exception e){
            e.printStackTrace(System.out);
        }finally{
            if(p !=null){
                p.close();
            }
            if(con != null){
                con.close();
            }
        }
    }
    public void update(DataBeanD_product_roast_detail_1 DataBean)throws Exception{
        String[] String_input = new String[]{
            "date_from",
            "time_from",
            "date_to",
            "time_to",
            "roast_hr",
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
            p = con.prepareStatement(objStringQuery.Update_String(String_input, "d_product_roast_detail_1",
                    "Where doc_id = ?  and line_no = ? and delete_flag = 'N' and complete_flag = 'N'"));
            p.setString(i, DataBean.getDate_from());i += 1;
            p.setString(i, DataBean.getTime_from());i += 1;
            p.setString(i, DataBean.getDate_to());i += 1;
            p.setString(i, DataBean.getTime_to());i += 1;
            p.setString(i, DataBean.getRoast_hr());i += 1;
            p.setString(i, DataBean.getRemark());i += 1;
            p.setString(i, DataBean.getBy());i += 1;
            p.setTimestamp(i, DataBean.getDate());i += 1;
            p.setString(i, DataBean.getDoc_id());i += 1;
            p.setString(i, DataBean.getLine_no());i += 1;
            p.executeUpdate();
        }catch(Exception e){
            e.printStackTrace(System.out);
        }finally{
            if(p !=null){
                p.close();
            }
            if(con != null){
                con.close();
            }
        }
    }
    public void Delete_line_no(String Select_line_no, DataBeanD_product_roast_detail_1 DataBean, String Table_Detail) throws Exception {
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
                        "where doc_id =?  and line_no = ? and complete_flag = 'N' and delete_flag = 'N'"));
                for (int loop = 0; loop < Number_Line_no.length; loop++) {
                    p.setString(1, DataBean.getBy());
                    p.setTimestamp(2, DataBean.getDate());
                    p.setString(3, DataBean.getDoc_id());
                    p.setString(4, Number_Line_no[loop]);
                    p.addBatch();
                }
                p.executeBatch();
                numrow = objuti.numRowdatabase("Select count(doc_id) as num from " + Table_Detail + " where doc_id = '" + DataBean.getDoc_id() + "'  and delete_flag = 'N' and complete_flag = 'N'");
                if (numrow != 0) {
                    rs = con.createStatement().executeQuery("SELECT line_no from " + Table_Detail + " where doc_id = '" + DataBean.getDoc_id() + "'  and delete_flag = 'N' and complete_flag = 'N'");
                    while (rs.next()) {
                        old_line_no.append(rs.getString("line_no"));
                        old_line_no.append(",");
                    }
                    Str_old_line_no = old_line_no.toString().substring(0, old_line_no.toString().length()-1);
                    Number_Line_no = null;
                    p  = null;
                    Number_Line_no = Str_old_line_no.split(",");
                    p = con.prepareStatement(objStringQuery.Flag_Status_String("line_no=?", Table_Detail,
                            "where doc_id =?  and line_no = ? and complete_flag = 'N' and delete_flag = 'N'"));
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
            e.printStackTrace(System.out);
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

    public void Delete_all_line_no(DataBeanD_product_roast_detail_1 DataBean, String Table_Detail) throws Exception {
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        StringQuery objStringQuery = new StringQuery();
        PreparedStatement p = null;
        try {
            p = con.prepareStatement(objStringQuery.Flag_Status_String("delete_flag='Y',delete_by=?,delete_date=? ", Table_Detail,
                    "Where doc_id = ?  and delete_flag = 'N' and  complete_flag = 'N'"));
            p.setString(1, DataBean.getBy());
            p.setTimestamp(2, DataBean.getDate());
            p.setString(3, DataBean.getDoc_id());
            p.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace(System.out);
        } finally {
            if (p != null) {
                p.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }
    public DataBeanD_product_roast_detail_1 Return_Edit(String doc_id,String line_no,String Table_name)throws Exception{
        DataBeanD_product_roast_detail_1 return_bean = new DataBeanD_product_roast_detail_1();
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        ResultSet rs = null;
        String SQL = "";
        try{
            SQL = "SELECT "
                    + "date_from,time_from,date_to,time_to,roast_hr,remark"
                    + " FROM "+Table_name+" "
                    + "WHERE doc_id = '"+doc_id+"'  and line_no ='"+line_no+"' and delete_flag = 'N' and complete_flag = 'N'";
            rs = con.createStatement().executeQuery(SQL);
            while(rs.next()){
                return_bean.setDate_from(rs.getString("date_from"));
                return_bean.setTime_from(rs.getString("time_from"));
                return_bean.setDate_to(rs.getString("date_to"));
                return_bean.setTime_to(rs.getString("time_to"));
                return_bean.setRoast_hr(rs.getString("roast_hr"));
                return_bean.setRemark(rs.getString("remark"));
            }
        }catch(Exception e){
            e.printStackTrace(System.out);
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
    public String Show_Detail(String doc_id, int Case) throws Exception {
        UtiDatabase objuti = new UtiDatabase();
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        String SQL = "";
        ResultSet rs = null;
        StringBuffer String_Return = new StringBuffer(5000);
        try {
            switch (Case) {
                case 1:
                    String_Return.append("<table width='100%' align='center' border='0' cellpadding='0' cellspacing='1' class='inner'>\n");
                    if (objuti.numRowdatabase("SELECT count(doc_id) as num from d_product_roast_detail_1  where doc_id = '" + doc_id + "'  and delete_flag = 'N' and complete_flag = 'N'") != 0) {
                        SQL = "SELECT  runno,doc_id,line_no,date_from,time_from,date_to,time_to,roast_hr,remark from d_product_roast_detail_1  where doc_id = '"+doc_id+"'  and delete_flag = 'N' and complete_flag = 'N' order by to_number(line_no,'9999')";
                        rs = con.createStatement().executeQuery(SQL);
                        while (rs.next()) {
                            String_Return.append("<tr>\n");
                            String_Return.append("<td class='forborder' width='3px'><input type='checkbox' id='ckbox' value='"+rs.getString("line_no")+"' name='ckbox' onclick=\"cancle_chkboxAll('chk_all',this.checked)\"></td>");
                            String_Return.append("<td class='forborder' width='7%'><a href=\"#\" onclick=\"OpenEdit(URLsend('line_no_" + rs.getString("line_no") + ",A_doc_id','../SCREEN/BW_CS_Detail_030_11.jsp'))\"><input type='hidden' id='line_no_" + rs.getString("line_no") + "' value=\"" + rs.getString("line_no") + "\"><input type='hidden' id='doc_id' value=\"" + rs.getString("doc_id") + "\"><input type='hidden' id='runno_" + rs.getString("runno") + "'' value=\"" + rs.getString("runno") + "\">" + rs.getString("line_no") + "</a></td>\n");
                            String_Return.append("<td class='forborder' width='10%'>" + objuti.NotNull(rs.getString("date_from")) + "&nbsp;</td>\n");
                            String_Return.append("<td class='forborder' width='15%'>" + objuti.NotNull(rs.getString("time_from")) + "</td>\n");
                            String_Return.append("<td class='forborder' width='10%'>" + objuti.NotNull(rs.getString("date_to")) + "</td>\n");
                            String_Return.append("<td class='forborder' width='15%'>" + objuti.NotNull(rs.getString("time_to")) + "</td>\n");
                            String_Return.append("<td class='forborder' width='20%'>" + objuti.NotNull(rs.getString("roast_hr")) + "</td>\n");
                            String_Return.append("<td class='forborder' width='20%'>" + objuti.NotNull(rs.getString("remark")) + "&nbsp;</td>\n");
                            String_Return.append("</tr>\n");
                        }
                    }
                    String_Return.append("</table>");
                    break;
                default:
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (con != null) {
                con.close();
            }
            return String_Return.toString();
        }
    }
}
