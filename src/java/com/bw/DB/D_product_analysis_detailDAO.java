/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bw.DB;

import com.bw.Util.StringQuery;
import com.bw.Util.UtiDatabase;
import com.bw.bean.DataBeanD_product_analysis_detail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author B
 */
public class D_product_analysis_detailDAO {
    private StringQuery obj_StringQuery;

    public void insert(DataBeanD_product_analysis_detail DataBean) throws Exception {
        String[] String_input = new String[]{
            "doc_id",
            "line_no",
            "spec",
            "param",
            "unit",
            "create_by",
            "create_date"
        };
        obj_StringQuery = new StringQuery();
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        PreparedStatement p = null;
        int i = 1;
        try {
            p = con.prepareStatement(obj_StringQuery.Insert_String(String_input, "d_job_order_detail"));
            p.setString(i, DataBean.getDoc_id());i += 1;
            p.setString(i, DataBean.getLine_no());i += 1;
            p.setString(i, DataBean.getSpec());i += 1;
            p.setString(i, DataBean.getValue());i += 1;
            p.setString(i, DataBean.getUnit());i+=1;
            p.setString(i, DataBean.getBy());i += 1;
            p.setTimestamp(i, DataBean.getDate());i += 1;
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

    public void update(DataBeanD_product_analysis_detail DataBean) throws Exception {
        String[] String_update = new String[]{
            "spec",
            "param",
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
            p.setString(i, DataBean.getSpec());i += 1;
            p.setString(i, DataBean.getValue());i += 1;
            p.setString(i, DataBean.getUnit());i+=1;
            p.setString(i, DataBean.getBy());i += 1;
            p.setTimestamp(i, DataBean.getDate());i += 1;
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
    public void Delete_line_no(String Select_line_no, DataBeanD_product_analysis_detail DataBean, String Table_Detail) throws Exception {
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

    public void Delete_all_line_no(DataBeanD_product_analysis_detail DataBean, String Table_Detail) throws Exception {
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
    public DataBeanD_product_analysis_detail Return_Edit(String doc_id,String line_no)throws Exception{
        DataBeanD_product_analysis_detail objbean = new DataBeanD_product_analysis_detail();
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        ResultSet rs = null;
        String SQL = "SELECT "
                + "value,spec,unit"
                + " FROM d_job_order_detail "
                + " WHERE doc_id = '"+doc_id+"' and line_no = '"+line_no+"' and delete_flag = 'N' and complete_flag = 'N'";
        try{
            rs = con.createStatement().executeQuery(SQL);
            while(rs.next()){
                objbean.setValue(rs.getString("value"));
                objbean.setSpec(rs.getString("spec"));
                objbean.setUnit(rs.getString("unit"));
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
                case 1://*****************job_order**************<=12
                    String_Return.append("<table width='100%' align='center' border='0' cellpadding='0' cellspacing='1' class='inner'>\n");
                    if (objuti.numRowdatabase("SELECT count(doc_id) as num from d_job_order_detail  where doc_id = '" + doc_id + "' and  to_number(line_no,'99') <= 12 and delete_flag = 'N' and complete_flag = 'N'") != 0) {
                        SQL = "SELECT  doc_id,line_no,param,spec_min,spec_max,unit,runno from d_job_order_detail  where doc_id = '"+doc_id+"' and  to_number(line_no,'99') <= 12 and delete_flag = 'N' and complete_flag = 'N' order by to_number(line_no,'99')";
                        rs = con.createStatement().executeQuery(SQL);
                        while (rs.next()) {
                            String_Return.append("<tr><td class='forborder' width='3px'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td class='forborder' width='7%'>"+rs.getString("line_no")+"</td>\n");
                            String_Return.append("<td class='forborder' width='20%'>" + rs.getString("param") + "</td>");
                            String_Return.append("<td class='forborder' width='10%'><input type = 'text' id='A_spec_min"+rs.getString("line_no")+"' name='A_spec_min' value = '" + rs.getString("spec_min") + "' class='textboxtotalpay' readonly size = '7'></td>");
                            String_Return.append("<td class='forborder' width='10%'><input type = 'text' id='A_spec_max"+rs.getString("line_no")+"' name='A_spec_max' value = '" + rs.getString("spec_max") + "' class='textboxtotalpay' readonly size = '7'></td>");
                            String_Return.append("<td class='forborder' width='20%'><input type = 'text' id='A_value"+rs.getString("line_no")+"' name='A_value' size = '10'  value = '' onBlur=\"CheckValue('A_spec_min"+rs.getString("line_no")+"','A_spec_max"+rs.getString("line_no")+"','A_value"+rs.getString("line_no")+"','A_unit"+rs.getString("line_no")+"','A_check"+rs.getString("line_no")+"')\"></td>");
                            String_Return.append("<td class='forborder' width='20%'><input type = 'text' id = 'A_unit"+rs.getString("line_no")+"' size = '10'  name = 'A_unit' value = '"+rs.getString("unit")+"' readonly></td>\n");
                            String_Return.append("<td class='forborder' width='10%'><input type = 'checkbox' id = 'A_check"+rs.getString("line_no")+"' name = 'A_check' value = 'N' ></td></tr>\n");
                        }
                    }
                    String_Return.append("</table>");
                    break;
                case 2:
                    String_Return.append("<table width='100%' align='center' border='0' cellpadding='0' cellspacing='1' class='inner'>\n");
                    if (objuti.numRowdatabase("SELECT count(doc_id) as num from vd_product_analysis_detail  where doc_id = '" + doc_id + "' and  to_number(line_no,'99') <= 12 and delete_flag = 'N' and complete_flag = 'N'") != 0) {
                        SQL = "SELECT  doc_id,line_no,param_value,value,spec_min,spec_max,unit,runno,doc_type from vd_product_analysis_detail  where doc_id = '"+doc_id+"' and  to_number(line_no,'99') <= 12 and delete_flag = 'N' and complete_flag = 'N' order by to_number(line_no,'99')";
                        rs = con.createStatement().executeQuery(SQL);
                        while (rs.next()) {
                            String_Return.append("<tr><td class='forborder' width='3px'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td class='forborder' width='7%'>"+rs.getString("line_no")+"</td>\n");
                            String_Return.append("<td class='forborder' width='20%'>" + rs.getString("param_value") + "</td>");
                            String_Return.append("<td class='forborder' width='10%'><input type = 'text' id='A_spec_min"+rs.getString("line_no")+"' name='A_spec_min' value = '" + rs.getString("spec_min") + "' class='textboxtotalpay' readonly size = '7'></td>");
                            String_Return.append("<td class='forborder' width='10%'><input type = 'text' id='A_spec_max"+rs.getString("line_no")+"' name='A_spec_max' value = '" + rs.getString("spec_max") + "' class='textboxtotalpay' readonly size = '7'></td>");
                            String_Return.append("<td class='forborder' width='20%'><input type = 'text' id='A_value"+rs.getString("line_no")+"' name='A_value' value = '"+rs.getString("value") +"' onBlur=\"CheckValue('A_spec_min"+rs.getString("line_no")+"','A_spec_max"+rs.getString("line_no")+"','A_value"+rs.getString("line_no")+"','A_unit"+rs.getString("line_no")+"','A_check"+rs.getString("line_no")+"')\" size = '10'></td>");
                            String_Return.append("<td class='forborder' width='20%'><input type = 'text' id = 'A_unit"+rs.getString("line_no")+"' name = 'A_unit' value = '"+rs.getString("unit")+"' readonly size = '10'></td>\n");
                            String_Return.append("<td class='forborder' width='10%'><input type = 'checkbox' id = 'A_check"+rs.getString("line_no")+"' name = 'A_check' value = '"+rs.getString("doc_type")+"' "+checkvalue(rs.getString("doc_type"))+"></td></tr>\n");
                        }
                    }
                    String_Return.append("</table>");
                    
                    break;
                case 3:
                    String_Return.append("<table width='100%' align='center' border='0' cellpadding='0' cellspacing='1' class='inner'>\n");
                    if (objuti.numRowdatabase("SELECT count(doc_id) as num from d_job_order_detail  where doc_id = '" + doc_id + "' and  to_number(line_no,'99') > 12 and delete_flag = 'N' and complete_flag = 'N'") != 0) {
                        SQL = "SELECT  doc_id,line_no,param,spec_min,spec_max,unit,runno from d_job_order_detail  where doc_id = '"+doc_id+"' and  to_number(line_no,'99') > 12 and delete_flag = 'N' and complete_flag = 'N' order by to_number(line_no,'99')";
                        rs = con.createStatement().executeQuery(SQL);
                        while (rs.next()) {
                            String_Return.append("<tr><td class='forborder' width='3px'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td class='forborder' width='7%'>"+rs.getString("line_no")+"</td>\n");
                            String_Return.append("<td class='forborder' width='20%'>" + rs.getString("param") + "</td>");
                            String_Return.append("<td class='forborder' width='10%'><input type = 'text' id='A_spec_min"+rs.getString("line_no")+"' name='A_spec_min' value = '" + rs.getString("spec_min") + "' class='textboxtotalpay' readonly size = '7'></td>");
                            String_Return.append("<td class='forborder' width='10%'><input type = 'text' id='A_spec_max"+rs.getString("line_no")+"' name='A_spec_max' value = '" + rs.getString("spec_max") + "' class='textboxtotalpay' readonly size = '7'></td>");
                            String_Return.append("<td class='forborder' width='20%'><input type = 'text' id='A_value"+rs.getString("line_no")+"' name='A_value' value = '' onBlur=\"CheckValue('A_spec_min"+rs.getString("line_no")+"','A_spec_max"+rs.getString("line_no")+"','A_value"+rs.getString("line_no")+"','A_unit"+rs.getString("line_no")+"','A_check"+rs.getString("line_no")+"')\" size = '10'></td>");
                            String_Return.append("<td class='forborder' width='20%'><input type = 'text' id = 'A_unit"+rs.getString("line_no")+"' name = 'A_unit' value = '"+rs.getString("unit")+"' readonly size = '10'></td>\n");
                            String_Return.append("<td class='forborder' width='10%'><input type = 'checkbox' id = 'A_check"+rs.getString("line_no")+"' name = 'A_check' value = 'N' ></td></tr>\n");
                        }
                    }
                    String_Return.append("</table>");
                    break;
                case 4:
                    String_Return.append("<table width='100%' align='center' border='0' cellpadding='0' cellspacing='1' class='inner'>\n");
                    if (objuti.numRowdatabase("SELECT count(doc_id) as num from vd_product_analysis_detail  where doc_id = '" + doc_id + "' and  to_number(line_no,'99') > 12 and delete_flag = 'N' and complete_flag = 'N'") != 0) {
                        SQL = "SELECT  doc_id,line_no,param_value,value,spec_min,spec_max,unit,runno,doc_type from vd_product_analysis_detail  where doc_id = '"+doc_id+"' and  to_number(line_no,'99') > 12 and delete_flag = 'N' and complete_flag = 'N' order by to_number(line_no,'99')";
                        rs = con.createStatement().executeQuery(SQL);
                        while (rs.next()) {
                            String_Return.append("<tr><td class='forborder' width='3px'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td class='forborder' width='7%'>"+rs.getString("line_no")+"</td>\n");
                            String_Return.append("<td class='forborder' width='20%'>" + rs.getString("param_value") + "</td>");
                            String_Return.append("<td class='forborder' width='10%'><input type = 'text' id='A_spec_min"+rs.getString("line_no")+"' name='A_spec_min' value = '" + rs.getString("spec_min") + "' class='textboxtotalpay' readonly size = '7'></td>");
                            String_Return.append("<td class='forborder' width='10%'><input type = 'text' id='A_spec_max"+rs.getString("line_no")+"' name='A_spec_max' value = '" + rs.getString("spec_max") + "' class='textboxtotalpay' readonly size = '7'></td>");
                            String_Return.append("<td class='forborder' width='20%'><input type = 'text' id='A_value"+rs.getString("line_no")+"' name='A_value' value = '"+rs.getString("value") +"' onBlur=\"CheckValue('A_spec"+rs.getString("line_no")+"','A_value"+rs.getString("line_no")+"','A_unit"+rs.getString("line_no")+"','A_check"+rs.getString("line_no")+"')\" size = '10'></td>");
                            String_Return.append("<td class='forborder' width='20%'><input type = 'text' id = 'A_unit"+rs.getString("line_no")+"' name = 'A_unit' value = '"+rs.getString("unit")+"' readonly size = '10'></td>\n");
                            String_Return.append("<td class='forborder' width='10%'><input type = 'checkbox' id = 'A_check"+rs.getString("line_no")+"' name = 'A_check' value = '"+rs.getString("doc_type")+"' "+checkvalue(rs.getString("doc_type"))+"></td></tr>\n");
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
    public String checkvalue(String check_value){
        String str_retrun = "";
        if(check_value.equals("Y")){
            str_retrun = "checked";
        }else{
            str_retrun = "";
        }
        return str_retrun;
    }
}
