/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bw.DB;

import com.bw.Util.UtiDatabase;
import com.bw.bean.DataBeanM_product_spec;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author B
 */
public class M_product_specDAO {

    public void insert(DataBeanM_product_spec DataBean_header, ArrayList<DataBeanM_product_spec> DataBean_detail) throws Exception {
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        PreparedStatement p = null;
        try {
            p = con.prepareStatement("INSERT INTO m_product_spec_header"
                    + "(spec_id,remark,create_by,create_date,name_t) "
                    + "VALUES(?,?,?,?,?)");
            p.setString(1, DataBean_header.getSpac_id());
            p.setString(2, DataBean_header.getRemark());
            p.setString(3, DataBean_header.getBy());
            p.setTimestamp(4, DataBean_header.getDate());
            p.setString(5, DataBean_header.getName_t());
            p.executeUpdate();
            p = null;
            p = con.prepareStatement("INSERT INTO m_product_spec_detail"
                    + "(spec_id,line_no,param,spec_min,unit,create_by,create_date,spec_max) "
                    + "VALUES(?,?,?,?,?,?,?,?)");
            for (int loop = 0; loop < DataBean_detail.size(); loop++) {
                p.setString(1, DataBean_header.getSpac_id());
                p.setString(2, DataBean_detail.get(loop).getLine_no());
                p.setString(3, DataBean_detail.get(loop).getParam());
                p.setString(4, DataBean_detail.get(loop).getSpac_min());
                p.setString(5, DataBean_detail.get(loop).getUnit().equals("Null")?"":DataBean_detail.get(loop).getUnit());
                p.setString(6, DataBean_header.getBy());
                p.setTimestamp(7, DataBean_header.getDate());
                p.setString(8, DataBean_detail.get(loop).getSpac_max());
                p.addBatch();
            }
            p.executeBatch();
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

    public void update(DataBeanM_product_spec DataBean_header, ArrayList<DataBeanM_product_spec> DataBean_detail) throws Exception {
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        PreparedStatement p = null;
        try {
            p = con.prepareStatement("UPDATE m_product_spec_header SET "
                    + "remark=?,update_by=?,update_date=?,name_t=? "
                    + "WHERE spec_id=? and delete_flag = 'N'");
            p.setString(1, DataBean_header.getRemark());
            p.setString(2, DataBean_header.getBy());
            p.setTimestamp(3, DataBean_header.getDate());
            p.setString(4, DataBean_header.getName_t());
            p.setString(5, DataBean_header.getSpac_id());
            p.executeUpdate();
            p = null;
            p = con.prepareStatement("UPDATE m_product_spec_detail SET "
                    + "spec_min=?,spec_max=?,unit=?,update_by=?,update_date=?"
                    + "WHERE spec_id=? and line_no=? and delete_flag = 'N'");
            for (int loop = 0; loop < DataBean_detail.size(); loop++) {
                p.setString(1, DataBean_detail.get(loop).getSpac_min());
                p.setString(2, DataBean_detail.get(loop).getSpac_max());
                p.setString(3, DataBean_detail.get(loop).getUnit().equals("Null")?"":DataBean_detail.get(loop).getUnit());
                p.setString(4, DataBean_header.getBy());
                p.setTimestamp(5, DataBean_header.getDate());
                p.setString(6, DataBean_header.getSpac_id());
                p.setString(7, DataBean_detail.get(loop).getLine_no());
                p.addBatch();
            }
            p.executeBatch();
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

    public void delete(DataBeanM_product_spec DataBean_header) throws Exception {
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        PreparedStatement p = null;
        String SQL = "";
        try {
            for (int i = 1; i <= 2; i++) {
                SQL = "UPDATE ";
                SQL += i == 1 ? " m_product_spec_header " : " m_product_spec_detail ";
                SQL += "SET delete_flag =?,delete_by=?,delete_date=? ";
                SQL += "WHERE spec_id = ? and delete_flag = 'N'";
                p = con.prepareStatement(SQL);
                p.setString(1, "Y");
                p.setString(2, DataBean_header.getBy());
                p.setTimestamp(3, DataBean_header.getDate());
                p.setString(4, DataBean_header.getSpac_id());
                p.executeUpdate();
            }
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

    public String Show_Detail(String doc_id) throws Exception {
        UtiDatabase objuti = new UtiDatabase();
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        String SQL = "";
        ResultSet rs = null;
        StringBuffer String_Return = new StringBuffer(5000);
        int line = 1;
        try {
            String_Return.append("<table width='100%' align='center' border='0' cellpadding='0' cellspacing='1' class='inner'>\n");
            if (objuti.numRowdatabase("SELECT Count(spec_id) As num from  m_product_spec_detail where spec_id = '" + doc_id + "' and delete_flag = 'N'") != 0) {
                SQL = "SELECT line_no,param,spec_min,spec_max,unit FROM m_product_spec_detail Where spec_id = '" + doc_id + "' and delete_flag = 'N' order by to_number(line_no,'00')";
                rs = con.createStatement().executeQuery(SQL);
                while (rs.next()) {
                    String_Return.append("<tr>");
                    String_Return.append("<td class=\'forborder\' width=\'3%\'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>");
                    String_Return.append("<td class=\'forborder\' width=\'7%\'>"+rs.getString("line_no")+"</td>");
                    String_Return.append("<td class=\'forborder\' width=\'30%\'><input name='param"+rs.getString("line_no")+"' type='text'  id=\'param"+rs.getString("line_no")+"\' value='"+rs.getString("param")+"' size=25 readonly='readonly' /></td>");
                    String_Return.append("<td class=\'forborder\' width=\'15%\'><input name='spec_min' type='text'  id=\'spec_min"+rs.getString("line_no")+"\' value='"+rs.getString("spec_min")+"' size=10 /></td>");
                    String_Return.append("<td class=\'forborder\' width=\'15%\'><input name='spec_max' type='text'  id=\'spec_max"+rs.getString("line_no")+"\' value='"+rs.getString("spec_max")+"' size=10 /></td>");
                    String_Return.append("<td class=\'forborder\' width=\'30%\'>");
                    String_Return.append("<select name=\'P_add_desc"+rs.getString("line_no")+"\' id=\'P_add_desc"+rs.getString("line_no")+"\'>");
                    String_Return.append("<option value=\'Null\' "+(rs.getString("unit").equals("Null")?"selected":"")+"></option>");
                    String_Return.append("<option value=\'Min\' "+(rs.getString("unit").equals("Min")?"selected":"")+">Min</option>");
                    String_Return.append("<option value=\'Max\'"+(rs.getString("unit").equals("Max")?"selected":"")+">Max</option>");
                    String_Return.append("<option value=\'Min-Max\' "+(rs.getString("unit").equals("Min-Max")?"selected":"")+">Min-Max</option>");
                    String_Return.append("<option value=\'Nill/Max\' "+(rs.getString("unit").equals("Nill/Max")?"selected":"")+">Nill/Max</option>");
                    String_Return.append("</select></td>");
                    String_Return.append("</tr>");
                    //String_Return.append("<tr><td class='forborder' width='3'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td class='forborder' width='7%'>" + line + "</td><td class='forborder' width='30%'><input name='param" + line + "' type='text'  id='param" + line + "' value='" + rs.getString("param") + "' size=25 readonly='readonly' /></td><td class='forborder' width='30%'><input name='spec" + line + "' type='text'  id='spec" + line + "' value='" + rs.getString("spec") + "' size=20 /></td><td class='forborder' width='30%'><input name='add_desc" + line + "' type='text'  id='add_desc" + line + "' value='" + rs.getString("unit") + "' size=20 /></td></tr>\n");
                    line += 1;
                }
            } else {
                String_Return.append("<tr>");
                String_Return.append("<td class=\'forborder\' width=\'3%\'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>");
                String_Return.append("<td class=\'forborder\' width=\'7%\'>1</td>");
                String_Return.append("<td class=\'forborder\' width=\'30%\'><input name='param1' type='text'  id=\'param1\' value='แป้ง(Starch)%' size=25 readonly='readonly' /></td>");
                String_Return.append("<td class=\'forborder\' width=\'15%\'><input name='spec_min' type='text'  id=\'spec_min1\' value='' size=10 /></td>");
                String_Return.append("<td class=\'forborder\' width=\'15%\'><input name='spec_max' type='text'  id=\'spec_max1\' value='' size=10 /></td>");
                String_Return.append("<td class=\'forborder\' width=\'30%\'>");
                String_Return.append("<select name=\'P_add_desc1\' id=\'P_add_desc1\'>");
                String_Return.append("<option value=\'Min\' selected>Min</option>");
                String_Return.append("<option value=\'Max\'>Max</option>");
                String_Return.append("<option value=\'Min-Max\'>Min-Max</option>");
                String_Return.append("</select></td>");
                String_Return.append("</tr>");
                String_Return.append("<tr>");
                String_Return.append("<td class=\'forborder\'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>");
                String_Return.append("<td class=\'forborder\'>2</td>");
                String_Return.append("<td class=\'forborder\'><input name='param2' type='text'  id=\'param2\' value='ความขาว(Whiteness)%' size=25 readonly='readonly' /></td>");
                String_Return.append("<td class=\'forborder\'><input name='spec_min' type='text'  id=\'spec_min2\' value='' size=10 /></td>");
                String_Return.append("<td class=\'forborder\'><input name='spec_max' type='text'  id=\'spec_max2\' value='' size=10 /></td>");
                String_Return.append("<td class=\'forborder\'>");
                String_Return.append("<select name=\'P_add_desc2\' id=\'P_add_desc2\'>");
                String_Return.append("<option value=\'Min\' selected>Min</option>");
                String_Return.append("<option value=\'Max\'>Max</option>");
                String_Return.append("<option value=\'Min-Max\'>Min-Max</option>");
                String_Return.append("</select></td>");
                String_Return.append("</tr>");
                String_Return.append("<tr>");
                String_Return.append("<td class=\'forborder\'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>");
                String_Return.append("<td class=\'forborder\'>3</td>");
                String_Return.append("<td class=\'forborder\'><input name='param3' type='text'  id=\'param3\' value='ความเหนียว(Viscosity)' size=25 readonly='readonly' /></td>");
                String_Return.append("<td class=\'forborder\'><input name='spec_min' type='text'  id=\'spec_min3\' value='' size=10 /></td>");
                String_Return.append("<td class=\'forborder\'><input name='spec_max' type='text'  id=\'spec_max3\' value='' size=10 /></td>");
                String_Return.append("<td class=\'forborder\'><select name=\'P_add_desc3\' id=\'P_add_desc3\'>");
                String_Return.append("<option value=\'Min\' selected>Min</option>");
                String_Return.append("<option value=\'Max\'>Max</option>");
                String_Return.append("<option value=\'Min-Max\'>Min-Max</option>");
                String_Return.append("</select></td>");
                String_Return.append("</tr>");
                String_Return.append("<tr>");
                String_Return.append("<td class=\'forborder\'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>");
                String_Return.append("<td class=\'forborder\'>4</td>");
                String_Return.append("<td class=\'forborder\'><input name='param4' type='text'  id=\'param4\' value='ความละเอียด(Fineness)%' size=25 readonly='readonly' /></td>");
                String_Return.append("<td class=\'forborder\'><input name='spec_min' type='text'  id=\'spec_min4\' value='' size=10 /></td>");
                String_Return.append("<td class=\'forborder\'><input name='spec_max' type='text'  id=\'spec_max4\' value='' size=10 /></td>");
                String_Return.append("<td class=\'forborder\'>");
                String_Return.append("<select name=\'P_add_desc4\' id=\'P_add_desc4\'>");
                String_Return.append("<option value=\'Min\'>Min</option>");
                String_Return.append("<option value=\'Max\' selected>Max</option>");
                String_Return.append("<option value=\'Min-Max\'>Min-Max</option>");
                String_Return.append("</select></td>");
                String_Return.append("</tr>");
                String_Return.append("<tr>");
                String_Return.append("<td class=\'forborder\'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>");
                String_Return.append("<td class=\'forborder\'>5</td>");
                String_Return.append("<td class=\'forborder\'><input name='param5' type='text'  id=\'param5\' value='กากอ่อน(Fiber/Pulp)' size=25 readonly='readonly' /></td>");
                String_Return.append("<td class=\'forborder\'><input name='spec_min' type='text'  id=\'spec_min5\' value='' size=10 /></td>");
                String_Return.append("<td class=\'forborder\'><input name='spec_max' type='text'  id=\'spec_max5\' value='' size=10 /></td>");
                String_Return.append("<td class=\'forborder\'><select name=\'P_add_desc5\' id=\'P_add_desc5\'>");
                String_Return.append("<option value=\'Min\'>Min</option>");
                String_Return.append("<option value=\'Max\' selected>Max</option>");
                String_Return.append("<option value=\'Min-Max\'>Min-Max</option>");
                String_Return.append("</select></td>");
                String_Return.append("</tr>");
                String_Return.append("<tr>");
                String_Return.append("<td class=\'forborder\'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>");
                String_Return.append("<td class=\'forborder\'>6</td>");
                String_Return.append("<td class=\'forborder\'><input name='param6' type='text'  id=\'param6\' value='ไซยาไนท์(HCN)' size=25 readonly='readonly' /></td>");
                String_Return.append("<td class=\'forborder\'><input name='spec_min' type='text'  id=\'spec_min6\' value='' size=10 /></td>");
                String_Return.append("<td class=\'forborder\'><input name='spec_max' type='text'  id=\'spec_max6\' value='' size=10 /></td>");
                String_Return.append("<td class=\'forborder\'><select name=\'P_add_desc6\' id=\'P_add_desc6\'>");
                String_Return.append("<option value=\'Nill/Max\' selected>Nill/Max</option>");
                String_Return.append("</select></td>");
                String_Return.append("</tr>");
                String_Return.append("<tr>");
                String_Return.append("<td class=\'forborder\'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>");
                String_Return.append("<td class=\'forborder\'>7</td>");
                String_Return.append("<td class=\'forborder\'><input name='param7' type='text'  id=\'param7\' value='ความชื่น(Mooiseture)%' size=25 readonly='readonly' /></td>");
                String_Return.append("<td class=\'forborder\'><input name='spec_min' type='text'  id=\'spec_min7\' value='' size=10 /></td>");
                String_Return.append("<td class=\'forborder\'><input name='spec_max' type='text'  id=\'spec_max7\' value='' size=10 /></td>");
                String_Return.append("<td class=\'forborder\'>");
                String_Return.append("<select name=\'P_add_desc7\' id=\'P_add_desc7\'>");
                String_Return.append("<option value=\'Min\'>Min</option>");
                String_Return.append("<option value=\'Max\' selected>Max</option>");
                String_Return.append("<option value=\'Min-Max\'>Min-Max</option>");
                String_Return.append("</select>");
                String_Return.append("</td>");
                String_Return.append("</tr>");
                String_Return.append("<tr>");
                String_Return.append("<td class=\'forborder\'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>");
                String_Return.append("<td class=\'forborder\'>8</td>");
                String_Return.append("<td class=\'forborder\'><input name='param8' type='text'  id=\'param8\' value='เถ้า(Ash)%' size=25 readonly='readonly' /></td>");
                String_Return.append("<td class=\'forborder\'><input name='spec_min' type='text'  id=\'spec_min8\' value='' size=10 /></td>");
                String_Return.append("<td class=\'forborder\'><input name='spec_max' type='text'  id=\'spec_max8\' value='' size=10 /></td>");
                String_Return.append("<td class=\'forborder\'>");
                String_Return.append("<select name=\'P_add_desc8\' id=\'P_add_desc8\'>");
                String_Return.append("<option value=\'Null\' selected></option>");
                String_Return.append("<option value=\'Min\'>Min</option>");
                String_Return.append("<option value=\'Max\' selected>Max</option>");
                String_Return.append("<option value=\'Min-Max\'>Min-Max</option>");
                String_Return.append("</select></td>");
                String_Return.append("</tr>");
                String_Return.append("<tr>");
                String_Return.append("<td class=\'forborder\'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>");
                String_Return.append("<td class=\'forborder\'>9</td>");
                String_Return.append("<td class=\'forborder\'><input name='param9' type='text'  id=\'param9\' value='พีเอช(pH)' size=25 readonly='readonly' /></td>");
                String_Return.append("<td class=\'forborder\'><input name='spec_min' type='text'  id=\'spec_min9\' value='' size=10 /></td>");
                String_Return.append("<td class=\'forborder\'><input name='spec_max' type='text'  id=\'spec_max9\' value='' size=10 /></td>");
                String_Return.append("<td class=\'forborder\'>");
                String_Return.append("<select name=\'P_add_desc9\' id=\'P_add_desc9\'>");
                String_Return.append("<option value=\'Null\' selected></option>");
                String_Return.append("<option value=\'Min\'>Min</option>");
                String_Return.append("<option value=\'Max\' selected>Max</option>");
                String_Return.append("<option value=\'Min-Max\'>Min-Max</option>");
                String_Return.append("</select>");
                String_Return.append("</td>");
                String_Return.append("</tr>");
                String_Return.append("<tr>");
                String_Return.append("<td class=\'forborder\'>&nbsp;</td>");
                String_Return.append("<td class=\'forborder\'>10</td>");
                String_Return.append("<td class=\'forborder\'><input name='param10' type='text'  id=\'param10\' value='SO2' size=25 readonly='readonly' /></td>");
                String_Return.append("<td class=\'forborder\'><input name='spec_min' type='text'  id=\'spec_min10\' value='' size=10 /></td>");
                String_Return.append("<td class=\'forborder\'><input name='spec_max' type='text'  id=\'spec_max10\' value='' size=10 /></td>");
                String_Return.append("<td class=\'forborder\'>");
                String_Return.append("<select name=\'P_add_desc10\' id=\'P_add_desc10\'>");
                String_Return.append("<option value=\'Null\' selected></option>");
                String_Return.append("<option value=\'Min\'>Min</option>");
                String_Return.append("<option value=\'Max\'>Max</option>");
                String_Return.append("<option value=\'Min-Max\'>Min-Max</option>");
                String_Return.append("</select>");
                String_Return.append("</td>");
                String_Return.append("</tr>");
                String_Return.append("<tr>");
                String_Return.append("<td class=\'forborder\'>&nbsp;</td>");
                String_Return.append("<td class=\'forborder\'>11</td>");
                String_Return.append("<td class=\'forborder\'><input name='param11' type='text'  id=\'param11\' value='จุดดำ' size=25 readonly='readonly' /></td>");
                String_Return.append("<td class=\'forborder\'><input name='spec_min' type='text'  id=\'spec_min11\' value='' size=10 /></td>");
                String_Return.append("<td class=\'forborder\'><input name='spec_max' type='text'  id=\'spec_max11\' value='' size=10 /></td>");
                String_Return.append("<td class=\'forborder\'>");
                String_Return.append("<select name=\'P_add_desc11\' id=\'P_add_desc11\'>");
                String_Return.append("<option value=\'Null\' selected></option>");
                String_Return.append("<option value=\'Min\'>Min</option>");
                String_Return.append("<option value=\'Max\'>Max</option>");
                String_Return.append("<option value=\'Min-Max\'>Min-Max</option>");
                String_Return.append("</select></td>");
                String_Return.append("</tr>");
                String_Return.append("<tr>");
                String_Return.append("<td class=\'forborder\'>&nbsp;</td>");
                String_Return.append("<td class=\'forborder\'>12</td>");
                String_Return.append("<td class=\'forborder\'><input name='param12' type='text'  id=\'param12\' value='Mesh140' size=25 readonly='readonly' /></td>");
                String_Return.append("<td class=\'forborder\'><input name='spec_min' type='text'  id=\'spec_min12\' value='' size=10 /></td>");
                String_Return.append("<td class=\'forborder\'><input name='spec_max' type='text'  id=\'spec_max12\' value='' size=10 /></td>");
                String_Return.append("<td class=\'forborder\'>");
                String_Return.append("<select name=\'P_add_desc12\' id=\'P_add_desc12\'>");
                String_Return.append("<<option value=\'Null\' selected></option>");
                String_Return.append("<option value=\'Min\'>Min</option>");
                String_Return.append("<option value=\'Max\'>Max</option>");
                String_Return.append("<option value=\'Min-Max\'>Min-Max</option>");
                String_Return.append("</select>");
                String_Return.append("</td>");
                String_Return.append("</tr>");
            }
            String_Return.append("</table>");
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

    public String Show_Detail(String doc_id, String inputFig) throws Exception {
        UtiDatabase objuti = new UtiDatabase();
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        String SQL = "";
        ResultSet rs = null;
        StringBuffer String_Return = new StringBuffer(5000);
        int line = 1;
        try {
            String_Return.append("<table width='100%' align='center' border='0' cellpadding='0' cellspacing='1' class='inner'>\n");
            if (objuti.numRowdatabase("SELECT Count(spec_id) As num from  m_product_spec_detail where spec_id = '" + doc_id + "' and delete_flag = 'N'") != 0) {
                SQL = "SELECT line_no,param,spec_min,spec_max,unit FROM m_product_spec_detail Where spec_id = '" + doc_id + "' and delete_flag = 'N' order by to_number(line_no,'00')";
                rs = con.createStatement().executeQuery(SQL);
                while (rs.next()) {
                    String_Return.append("<tr>");
                    String_Return.append("<td class=\'forborder\' width=\'3%\'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>");
                    String_Return.append("<td class=\'forborder\' width=\'7%\'>"+rs.getString("line_no")+"</td>");
                    String_Return.append("<td class=\'forborder\' width=\'30%\'><input name='param"+rs.getString("line_no")+"' type='text'  id=\'param"+rs.getString("line_no")+"\' value='"+rs.getString("param")+"' size=25 readonly='readonly' /></td>");
                    String_Return.append("<td class=\'forborder\' width=\'15%\'><input name='spec_min' type='text'  id=\'spec_min"+rs.getString("line_no")+"\' value='"+rs.getString("spec_min")+"' size=10 /></td>");
                    String_Return.append("<td class=\'forborder\' width=\'15%\'><input name='spec_max' type='text'  id=\'spec_max"+rs.getString("line_no")+"\' value='"+rs.getString("spec_max")+"' size=10 /></td>");
                    String_Return.append("<td class=\'forborder\' width=\'30%\'>");
                    String_Return.append("<select name=\'P_add_desc"+rs.getString("line_no")+"\' id=\'P_add_desc"+rs.getString("line_no")+"\'>");
                    String_Return.append("<option value=\'Null\' "+(rs.getString("unit").equals("Null")?"selected":"")+"></option>");
                    String_Return.append("<option value=\'Min\' "+(rs.getString("unit").equals("Min")?"selected":"")+">Min</option>");
                    String_Return.append("<option value=\'Max\'"+(rs.getString("unit").equals("Max")?"selected":"")+">Max</option>");
                    String_Return.append("<option value=\'Min-Max\' "+(rs.getString("unit").equals("Min-Max")?"selected":"")+">Min-Max</option>");
                    String_Return.append("<option value=\'Nill/Max\' "+(rs.getString("unit").equals("Nill/Max")?"selected":"")+">Nill/Max</option>");
                    String_Return.append("</select></td>");
                    String_Return.append("</tr>");
                }
            }
            String_Return.append("</table>");
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
/*String_Return.append("<table width='100%' align='center' border='0' cellpadding='0' cellspacing='1' class='inner'>\n");
String_Return.append("<tr><td class='forborder' width='3'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td class='forborder' width='7%'>1</td><td class='forborder' width='30%'><input name='param1' type='text'  id='param1' value='แป้ง(Starch)' size=25 readonly='readonly' /></td><td class='forborder' width='30%'><input name='spec1' type='text'  id='spec1' value='' size=20 /></td><td class='forborder' width='30%'><input name='add_desc1' type='text'  id='add_desc1' value='Min' size=20 /></td></tr>\n");
String_Return.append("<tr><td class='forborder' width='3'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td class='forborder' width='7%'>1</td><td class='forborder' width='30%'><input name='param1' type='text'  id='param1' value='แป้ง(Starch)' size=25 readonly='readonly' /></td><td class='forborder' width='30%'><input name='spec1' type='text'  id='spec1' value='' size=20 /></td><td class='forborder' width='30%'><input name='add_desc1' type='text'  id='add_desc1' value='Min' size=20 /></td></tr>\n");
String_Return.append("<tr><td class='forborder' width='3'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td class='forborder' width='7%'>1</td><td class='forborder' width='30%'><input name='param1' type='text'  id='param1' value='แป้ง(Starch)' size=25 readonly='readonly' /></td><td class='forborder' width='30%'><input name='spec1' type='text'  id='spec1' value='' size=20 /></td><td class='forborder' width='30%'><input name='add_desc1' type='text'  id='add_desc1' value='Min' size=20 /></td></tr>\n");
String_Return.append("<tr><td class='forborder' width='3'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td class='forborder' width='7%'>1</td><td class='forborder' width='30%'><input name='param1' type='text'  id='param1' value='แป้ง(Starch)' size=25 readonly='readonly' /></td><td class='forborder' width='30%'><input name='spec1' type='text'  id='spec1' value='' size=20 /></td><td class='forborder' width='30%'><input name='add_desc1' type='text'  id='add_desc1' value='Min' size=20 /></td></tr>\n");
String_Return.append("<tr><td class='forborder' width='3'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td class='forborder' width='7%'>1</td><td class='forborder' width='30%'><input name='param1' type='text'  id='param1' value='แป้ง(Starch)' size=25 readonly='readonly' /></td><td class='forborder' width='30%'><input name='spec1' type='text'  id='spec1' value='' size=20 /></td><td class='forborder' width='30%'><input name='add_desc1' type='text'  id='add_desc1' value='Min' size=20 /></td></tr>\n");
String_Return.append("<tr><td class='forborder' width='3'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td class='forborder' width='7%'>1</td><td class='forborder' width='30%'><input name='param1' type='text'  id='param1' value='แป้ง(Starch)' size=25 readonly='readonly' /></td><td class='forborder' width='30%'><input name='spec1' type='text'  id='spec1' value='' size=20 /></td><td class='forborder' width='30%'><input name='add_desc1' type='text'  id='add_desc1' value='Min' size=20 /></td></tr>\n");
String_Return.append("<tr><td class='forborder' width='3'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td class='forborder' width='7%'>1</td><td class='forborder' width='30%'><input name='param1' type='text'  id='param1' value='แป้ง(Starch)' size=25 readonly='readonly' /></td><td class='forborder' width='30%'><input name='spec1' type='text'  id='spec1' value='' size=20 /></td><td class='forborder' width='30%'><input name='add_desc1' type='text'  id='add_desc1' value='Min' size=20 /></td></tr>\n");
String_Return.append("<tr><td class='forborder' width='3'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td class='forborder' width='7%'>1</td><td class='forborder' width='30%'><input name='param1' type='text'  id='param1' value='แป้ง(Starch)' size=25 readonly='readonly' /></td><td class='forborder' width='30%'><input name='spec1' type='text'  id='spec1' value='' size=20 /></td><td class='forborder' width='30%'><input name='add_desc1' type='text'  id='add_desc1' value='Min' size=20 /></td></tr>\n");
String_Return.append("<tr><td class='forborder' width='3'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td class='forborder' width='7%'>1</td><td class='forborder' width='30%'><input name='param1' type='text'  id='param1' value='แป้ง(Starch)' size=25 readonly='readonly' /></td><td class='forborder' width='30%'><input name='spec1' type='text'  id='spec1' value='' size=20 /></td><td class='forborder' width='30%'><input name='add_desc1' type='text'  id='add_desc1' value='Min' size=20 /></td></tr>\n");
String_Return.append("<tr><td class='forborder' width='3'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td class='forborder' width='7%'>1</td><td class='forborder' width='30%'><input name='param1' type='text'  id='param1' value='แป้ง(Starch)' size=25 readonly='readonly' /></td><td class='forborder' width='30%'><input name='spec1' type='text'  id='spec1' value='' size=20 /></td><td class='forborder' width='30%'><input name='add_desc1' type='text'  id='add_desc1' value='Min' size=20 /></td></tr>\n");
String_Return.append("<tr><td class='forborder' width='3'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td class='forborder' width='7%'>1</td><td class='forborder' width='30%'><input name='param1' type='text'  id='param1' value='แป้ง(Starch)' size=25 readonly='readonly' /></td><td class='forborder' width='30%'><input name='spec1' type='text'  id='spec1' value='' size=20 /></td><td class='forborder' width='30%'><input name='add_desc1' type='text'  id='add_desc1' value='Min' size=20 /></td></tr>\n");
String_Return.append("<tr><td class='forborder' width='3'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td class='forborder' width='7%'>1</td><td class='forborder' width='30%'><input name='param1' type='text'  id='param1' value='แป้ง(Starch)' size=25 readonly='readonly' /></td><td class='forborder' width='30%'><input name='spec1' type='text'  id='spec1' value='' size=20 /></td><td class='forborder' width='30%'><input name='add_desc1' type='text'  id='add_desc1' value='Min' size=20 /></td></tr>\n");
String_Return.append("</table>");*/
