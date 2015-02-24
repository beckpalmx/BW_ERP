/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bw.DB;

import com.bw.bean.DataBeanD_job_order_detail;
import com.bw.Util.StringQuery;
import com.bw.Util.UtiDatabase;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author B
 */
public class D_job_order_detailDAO {
    private StringQuery obj_StringQuery;

    public void insert(DataBeanD_job_order_detail DataBean) throws Exception {
        String[] String_input = new String[]{
            "doc_id",
            "line_no",
            "param",
            "spec_min",
            "spec_max",
            "unit",
            "create_by",
            "create_date",
            "update_date"
        };
        obj_StringQuery = new StringQuery();
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        PreparedStatement p = null;
        int i = 1;
        try {
            p = con.prepareStatement(obj_StringQuery.Insert_String(String_input, "d_job_order_detail"));
            p.setString(i++, DataBean.getDoc_id());
            p.setString(i++, DataBean.getLine_no());
            p.setString(i++, DataBean.getParam());
            p.setString(i++, DataBean.getSpec_min());
            p.setString(i++, DataBean.getSpec_max());
            p.setString(i++, DataBean.getUnit());
            p.setString(i++, DataBean.getBy());
            p.setTimestamp(i++, DataBean.getDate());
            p.setTimestamp(i++, DataBean.getDate());
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

    public void update(DataBeanD_job_order_detail DataBean) throws Exception {
        String[] String_update = new String[]{
            "param",
            "spec_min",
            "spec_max",
            "unit",
            "update_by",
            "update_date"
        };
        obj_StringQuery = new StringQuery();
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        PreparedStatement p = null;
        int i = 1;
        try {
            p = con.prepareStatement(obj_StringQuery.Update_String(String_update, "d_job_order_detail",
                    "where doc_id = '" + DataBean.getDoc_id() + "' and line_no='"+DataBean.getLine_no()+"' and delete_flag = 'N' and complete_flag = 'N'"));
            p.setString(i++, DataBean.getParam());
            p.setString(i++, DataBean.getSpec_min());
            p.setString(i++, DataBean.getSpec_max());
            p.setString(i++, DataBean.getUnit());
            p.setString(i++, DataBean.getBy());
            p.setTimestamp(i++, DataBean.getDate());
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
    public void Delete_line_no(String Select_line_no, DataBeanD_job_order_detail DataBean, String Table_Detail) throws Exception {
        StringBuffer old_line_no = new StringBuffer();
        String Str_old_line_no = "";
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        ResultSet rs = null;
        PreparedStatement p = null;
        obj_StringQuery = new StringQuery();
        UtiDatabase objuti = new UtiDatabase();
        int numrow = 0;
        try {
            if (Select_line_no.length() != 0) {
                String[] Number_Line_no = Select_line_no.split(",");
                p = con.prepareStatement(obj_StringQuery.Flag_Status_String("delete_flag='Y',delete_by=?,delete_date=?", Table_Detail,
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
                    p = con.prepareStatement(obj_StringQuery.Flag_Status_String("line_no=?", Table_Detail,
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

    public void Delete_all_line_no(DataBeanD_job_order_detail DataBean, String Table_Detail) throws Exception {
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        obj_StringQuery = new StringQuery();
        PreparedStatement p = null;
        try {
            p = con.prepareStatement(obj_StringQuery.Flag_Status_String("delete_flag='Y',delete_by=?,delete_date=? ", Table_Detail,
                    "Where doc_id = ? and to_number(line_no,'99') > 12 and delete_flag = 'N' and  complete_flag = 'N'"));
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
    public DataBeanD_job_order_detail Return_Edit(String doc_id,String line_no)throws Exception{
        DataBeanD_job_order_detail objbean = new DataBeanD_job_order_detail();
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        ResultSet rs = null;
        String SQL = "SELECT "
                + "param,spec_min,spec_max,unit"
                + " FROM d_job_order_detail "
                + " WHERE doc_id = '"+doc_id+"' and line_no = '"+line_no+"' and delete_flag = 'N' and complete_flag = 'N'";
        try{
            rs = con.createStatement().executeQuery(SQL);
            while(rs.next()){
                objbean.setParam(rs.getString("param"));
                objbean.setSpec_min(rs.getString("spec_min"));
                objbean.setSpec_max(rs.getString("spec_max"));
                objbean.setUnit(rs.getString("unit"));
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
    public String Show_Detail(String doc_id, int Case) throws Exception {
        UtiDatabase objuti = new UtiDatabase();
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        String SQL = "";
        ResultSet rs = null;
        StringBuffer String_Return = new StringBuffer(5000);
        int line = 1;
        try {
            switch (Case) {
                case 1:
                    String_Return.append("<table width='100%' align='center' border='0' cellpadding='0' cellspacing='1' class='inner'>\n");
                    if (objuti.numRowdatabase("SELECT count(doc_id) as num from d_job_order_detail  where doc_id = '" + doc_id + "' and  to_number(line_no,'99') <= 12 and delete_flag = 'N' and complete_flag = 'N'") != 0) {
                        SQL = "SELECT  doc_id,line_no,param,spec_min,spec_max,unit,runno from d_job_order_detail  where doc_id = '"+doc_id+"' and  to_number(line_no,'99') <= 12 and delete_flag = 'N' and complete_flag = 'N' order by to_number(line_no,'99')";
                        rs = con.createStatement().executeQuery(SQL);
                        while (rs.next()) {
                            String_Return.append("<tr>\n");
                            String_Return.append("<td class='forborder' width='3px'>&nbsp;</td>");
                            String_Return.append((String)("<td class='forborder' width='7%'><a href=\"#\" onclick=\"OpenEdit(URLsend('line_no_" + rs.getString("line_no") + ",A_doc_id','../SCREEN/BW_CS_Detail_031.jsp'))\"><input type='hidden' id='line_no_" + rs.getString("line_no") + "' value=\"" + rs.getString("line_no") + "\"><input type='hidden' id='doc_id' value=\"" + rs.getString("doc_id") + "\"><input type='hidden' id='runno_" + rs.getString("runno") + "'' value=\"" + rs.getString("runno") + "\">" + rs.getString("line_no") + "</a></td>\n"));
                            String_Return.append((String)("<td class='forborder' width='30%'>" + rs.getString("param") + "</td><td class='forborder' width='15%'>" + rs.getString("spec_min") + "</td><td class='forborder' width='15%'>" + rs.getString("spec_max") + "</td><td class='forborder' width='30%'>" + objuti.NotNull(rs.getString("unit")) + "&nbsp;</td>\n"));
                            String_Return.append("</tr>\n");
                            
                        }
                    }
                    String_Return.append("</table>");
                    break;
                case 2:
                    String_Return.append("<table width='100%' align='center' border='0' cellpadding='0' cellspacing='1' class='inner'>\n");
                    if (objuti.numRowdatabase("SELECT count(doc_id) as num from d_job_order_detail  where doc_id = '" + doc_id + "' and  to_number(line_no,'99') > 12 and delete_flag = 'N' and complete_flag = 'N'") != 0) {
                        SQL = "SELECT  line_no,doc_id,spec_id,param,spec_min,spec_max,unit,runno from d_job_order_detail  where doc_id = '" + doc_id + "' and  to_number(line_no,'99') > 12 and delete_flag = 'N' and complete_flag = 'N' order by to_number(line_no,'99')";
                        rs = con.createStatement().executeQuery(SQL);
                        while (rs.next()) {
                            String_Return.append("<tr>\n");
                            String_Return.append((String)("<td class='forborder' width='3px'><input type='checkbox' id='ckbox' value='"+rs.getString("line_no")+"' name='ckbox' onclick=\"cancle_chkboxAll('chk_all',this.checked)\"></td>"));
                            String_Return.append((String)("<td class='forborder' width='7%'><a href=\"#\" onclick=\"OpenEdit(URLsend('line_no_" + rs.getString("line_no") + ",A_doc_id','../SCREEN/BW_CS_Detail_031.jsp'))\"><input type='hidden' id='line_no_" + rs.getString("line_no") + "' value=\"" + rs.getString("line_no") + "\"><input type='hidden' id='doc_id' value=\"" + rs.getString("doc_id") + "\"><input type='hidden' id='runno_" + rs.getString("runno") + "'' value=\"" + rs.getString("runno") + "\">" + rs.getString("line_no") + "</a></td>\n"));
                            String_Return.append((String)("<td class='forborder' width='30%'>" + rs.getString("param") + "</td><td class='forborder' width='15%'>" + rs.getString("spec_min") + "</td><td class='forborder' width='15%'>" + rs.getString("spec_max") + "</td><td class='forborder' width='30%'>" + objuti.NotNull(rs.getString("unit")) + "&nbsp;</td>\n"));
                            String_Return.append("</tr>\n");
                        }
                    }
                    String_Return.append("</table>");
                    break;
                default:
                    break;
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
            return String_Return.toString();
        }
    }
}
