/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bw.DB;

import com.bw.Util.UtiDatabase;
import com.bw.bean.DataBeanD_product_not_quality;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author B
 */
public class D_product_not_quality_detailDAO {
    public int insert(ArrayList<DataBeanD_product_not_quality> objAL_input,int line_no,PreparedStatement p ,Connection con)throws Exception{
        String SQL = "";
        try{
            SQL = "insert into d_product_not_quality_detail"
                    + "(line_no,doc_id,doc_date,p_type,weight,moisture,viscosity,ph_value,resolution,soft_pulp,whiteness,so2,iron,contamination,black_point,qty,create_by,create_date,product_lot_id) "
                    + "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            p = con.prepareStatement(SQL);
            for(int i = 0;i<objAL_input.size();i++){
                p.setString(1, Integer.toString(line_no));
                p.setString(2, objAL_input.get(i).getDoc_id());
                p.setString(3, objAL_input.get(i).getDoc_date());
                p.setString(4, objAL_input.get(i).getP_type());
                p.setString(5, objAL_input.get(i).getWeight());
                p.setString(6, objAL_input.get(i).getMoisture());
                p.setString(7, objAL_input.get(i).getViscosity());
                p.setString(8, objAL_input.get(i).getPh_value());
                p.setString(9, objAL_input.get(i).getResolution());
                p.setString(10, objAL_input.get(i).getSoft_pulp());
                p.setString(11, objAL_input.get(i).getWhiteness());
                p.setString(12, objAL_input.get(i).getSo2());
                p.setString(13, objAL_input.get(i).getIron());
                p.setString(14, objAL_input.get(i).getContamination());
                p.setString(15, objAL_input.get(i).getBlack_point());
                p.setString(16, objAL_input.get(i).getQty());
                p.setString(17, objAL_input.get(i).getBy());
                p.setTimestamp(18, objAL_input.get(i).getDate());
                p.setString(19, objAL_input.get(i).getProduct_lot_id());
                p.addBatch();
                line_no += 1;
            }
            p.executeBatch();
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(p != null){
                p.clearBatch();
            }
            return line_no;
        }
    }
    public DataBeanD_product_not_quality Return_Edit(String doc_id,String line_no)throws  Exception{
        DataBeanD_product_not_quality return_bean = new DataBeanD_product_not_quality();
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        ResultSet rs = null;
        String SQL = "";
        try{
            
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
    public String Show_Detail(String doc_id, int Case, String Screen,String p_type) throws Exception {
        int start, row_page = 5, total = 0, screen;
        UtiDatabase objuti = new UtiDatabase();
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        String SQL = "";
        ResultSet rs = null;
        StringBuffer String_Return = new StringBuffer(5000);

        try {
            switch (Case) {
                case 1://*****************product_analysis**************<=12
                    total = objuti.numRowdatabase("SELECT count(doc_date) as num from d_product_analysis_header  where doc_date = '" + doc_id + "' and  p_type = '"+p_type+"' and  not_pass_chk = 'Y' and delete_flag = 'N' and complete_flag = 'N'");
                    String_Return.append("<table width='100%' align='center' border='0' cellpadding='0' cellspacing='1' class='inner'>\n");
                    if (total != 0) {
                        int total_page = (int) Math.ceil((double) total / (double) row_page);
                        screen = Screen == null ? 1 : Integer.parseInt(Screen);
                        if (screen >= 1 && screen <= total) {
                            start = (screen - 1) * row_page;
                            SQL = "SELECT  doc_id,size,moisture,viscosity,ph_value,ph_value,soft_pulp,whiteness,iron,so2,contamination,black_point,resolution"
                                    + "  from d_product_analysis_header"
                                    + "  where doc_date = '" + doc_id + "' and p_type = '"+p_type+"' and  not_pass_chk = 'Y' and delete_flag = 'N' and complete_flag = 'N'"
                                    + "order by  runno LIMIT " + row_page + " OFFSET " + start;
                            rs = con.createStatement().executeQuery(SQL);
                            while (rs.next()) {
                                //String_Return.append("<tr><td class='forborder' width='3px'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td class='forborder' width='7%'>"+rs.getString("line_no")+"</td><td class='forborder' width='25%'>" + rs.getString("param") + "</td><td class='forborder' width='20%'><input type = 'text' id='A_spec"+rs.getString("line_no")+"' name='A_spec"+rs.getString("line_no")+"' value = '" + rs.getString("spec") + "' class='textboxtotal' readonly></td><td class='forborder' width='20%'><input type = 'text' id='A_value"+rs.getString("line_no")+"' name='A_value"+rs.getString("line_no")+"' value = ''></td><td class='forborder' width='25%'><input type = 'text' id = 'A_unit"+rs.getString("line_no")+"' name = '' value = '"+rs.getString("unit")+"' readonly></td></tr>\n");
                                String_Return.append("<tr><td width='20%' align='center' class='forborder'>" + rs.getString("doc_id") + "</td>");//<td width="8%" align="center" class="row3">น้ำหนัก<br>บรรจ(KG)ุ</td>
                                String_Return.append("<td width='8%' align='center' class='forborder'>" + rs.getString("size") + "</td>");
                                String_Return.append("<td width='6%' align='center' class='forborder'><input type='checkbox' name='ck' id='ck1' "+checkvalue(objuti.NotNull(rs.getString("moisture")))+"></td>");
                                String_Return.append("<td width='6%' align='center' class='forborder'><input type='checkbox' name='ck' id='ck2' "+checkvalue(objuti.NotNull(rs.getString("viscosity")))+"></td>");
                                String_Return.append("<td width='6%' align='center' class='forborder'><input type='checkbox' name='ck' id='ck3' "+checkvalue(objuti.NotNull(rs.getString("ph_value")),"H")+"></td>");
                                String_Return.append("<td width='6%' align='center' class='forborder'><input type='checkbox' name='ck' id='ck4' "+checkvalue(objuti.NotNull(rs.getString("ph_value")),"L")+"></td>");
                                String_Return.append("<td width='6%' align='center' class='forborder'><input type='checkbox' name='ck' id='ck5' "+checkvalue(objuti.NotNull(rs.getString("resolution")))+"></td>");
                                String_Return.append("<td width='6%' align='center' class='forborder'><input type='checkbox' name='ck' id='ck6' "+checkvalue(objuti.NotNull(rs.getString("soft_pulp")))+"></td>");
                                String_Return.append("<td width='6%' align='center' class='forborder'><input type='checkbox' name='ck' id='ck7' "+checkvalue(objuti.NotNull(rs.getString("whiteness")))+"></td>");
                                String_Return.append("<td width='6%' align='center' class='forborder'><input type='checkbox' name='ck' id='ck8' ></td>");
                                String_Return.append("<td width='6%' align='center' class='forborder'><input type='checkbox' name='ck' id='ck9' "+checkvalue(objuti.NotNull(rs.getString("so2")))+"></td>");
                                String_Return.append("<td width='6%' align='center' class='forborder'><input type='checkbox' name='ck' id='ck10' "+checkvalue(objuti.NotNull(rs.getString("contamination")))+"></td>");
                                String_Return.append("<td width='6%' align='center' class='forborder'><input type='checkbox' name='ck' id='ck11' "+checkvalue(objuti.NotNull(rs.getString("black_point")))+"></td>");
                                String_Return.append("<td width='6%' align='center' class='forborder'>1</td></tr>");
                            }
                        }
                        String_Return.append("</table>");
                        String_Return.append("<div align='center'>\n");
                        if ((screen % 10) != 0 && screen <= 10) {
                            for (int count = 1; count <= 10 && count <= total_page; count++) {
                                if (count == screen) {
                                    String_Return.append(" [" + count + "] |");
                                } else {
                                    String_Return.append(" <a href='#'  onclick = \"showTableNonPopup_Detail('show','A_doc_date','s_screen_" + count + "','../SHOWDETAILSCREEN/BW_CS_Show029.jsp?A_p_type=\'+getId('A_p_type').value+\'&A_doc_date=')\"><input type = 'hidden' id='s_screen_" + count + "' name='s_screen_" + count + "' value =\"" + count + "\">" + count + "</a> |");
                                }

                            }
                            //**************************************************Select**************************************
                            String_Return.append("<select id='select_screen' name = 'select_screen'>");
                            for (int count = 1; count <= 10 && count <= total_page; count++) {
                                if (count == screen) {
                                } else {
                                    String_Return.append("<option   value=\'" + count + "\' onclick = \"showTableNonPopup_Detail('show','A_doc_date','select_screen','../SHOWDETAILSCREEN/BW_CS_Show029.jsp?A_p_type=\'+getId('A_p_type').value+\'&A_doc_date=')\">" + count + "</option>");
                                }
                            }
                            String_Return.append("</select>");
                            //**************************************************Select**************************************
                        } else {
                            for (int count = (screen - 5); count <= (screen + 5) && count <= total_page; count++) {
                                if (count == screen) {
                                    String_Return.append("| [" + count + "] |");
                                } else {
                                    String_Return.append(" <a href='#' onclick = \"showTableNonPopup_Detail('show','A_doc_date','s_screen_" + count + "','../SHOWDETAILSCREEN/BW_CS_Show029.jsp?A_p_type=\'+getId('A_p_type').value+\'&A_doc_date=')\"><input type = 'hidden' id='s_screen_" + count + "' name='s_screen_" + count + "' value ='" + count + "'>" + count + "</a> |");
                                }
                            }
                            //**************************************************Select**************************************
                            String_Return.append("<select id='select_screen' name = 'select_screen'>");
                            for (int count = (screen - 5); count <= (screen + 5) && count <= total_page; count++) {
                                if (count == screen) {
                                    String_Return.append("<option selected  value=\'" + count + "\' onclick = \"showTableNonPopup_Detail('show','A_doc_date','select_screen','../SHOWDETAILSCREEN/BW_CS_Show029.jsp?A_p_type=\'+getId('A_p_type').value+\'&A_doc_date=')\">" + count + "</option>");
                                } else {
                                    String_Return.append("<option   value=\'" + count + "\' onclick = \"showTableNonPopup_Detail('show','A_doc_date','select_screen','../SHOWDETAILSCREEN/BW_CS_Show029.jsp?A_p_type=\'+getId('A_p_type').value+\'&A_doc_date=')\">" + count + "</option>");
                                }
                            }
                            String_Return.append("</select>");
                            //**************************************************Select**************************************
                        }
                        String_Return.append("</div>\n");

                    } else {
                        String_Return.append("<td width='8%' align='center' class='forborder'>ไม่พบข้อมูลที่ต้องการ</td>");
                        String_Return.append("</table>");
                    }
                    break;
                case 2:
                    total = objuti.numRowdatabase("SELECT count(doc_id) as num from d_product_not_quality_detail  where doc_id = '" + doc_id + "' and   delete_flag = 'N' and complete_flag = 'N'");
                    String_Return.append("<table width='100%' align='center' border='0' cellpadding='0' cellspacing='1' class='inner'>\n");
                    if (total != 0) {
                        int total_page = (int) Math.ceil((double) total / (double) row_page);
                        screen = Screen == null ? 1 : Integer.parseInt(Screen);
                        if (screen >= 1 && screen <= total) {
                            start = (screen - 1) * row_page;
                            SQL = "SELECT  product_lot_id,weight,moisture,viscosity,ph_value,ph_value,soft_pulp,whiteness,iron,so2,contamination,black_point,resolution"
                                    + "  from d_product_not_quality_detail"
                                    + "  where doc_id = '" + doc_id + "' and delete_flag = 'N' and complete_flag = 'N'"
                                    + "order by  runno LIMIT " + row_page + " OFFSET " + start;
                            rs = con.createStatement().executeQuery(SQL);
                            while (rs.next()) {
                                //String_Return.append("<tr><td class='forborder' width='3px'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td class='forborder' width='7%'>"+rs.getString("line_no")+"</td><td class='forborder' width='25%'>" + rs.getString("param") + "</td><td class='forborder' width='20%'><input type = 'text' id='A_spec"+rs.getString("line_no")+"' name='A_spec"+rs.getString("line_no")+"' value = '" + rs.getString("spec") + "' class='textboxtotal' readonly></td><td class='forborder' width='20%'><input type = 'text' id='A_value"+rs.getString("line_no")+"' name='A_value"+rs.getString("line_no")+"' value = ''></td><td class='forborder' width='25%'><input type = 'text' id = 'A_unit"+rs.getString("line_no")+"' name = '' value = '"+rs.getString("unit")+"' readonly></td></tr>\n");
                                String_Return.append("<tr><td width='20%' align='center' class='forborder'>" + rs.getString("product_lot_id") + "</td>");//<td width="8%" align="center" class="row3">น้ำหนัก<br>บรรจ(KG)ุ</td>
                                String_Return.append("<td width='8%' align='center' class='forborder'>" + rs.getString("weight") + "</td>");
                                String_Return.append("<td width='6%' align='center' class='forborder'><input type='checkbox' name='ck' id='ck1' "+checkvalue(objuti.NotNull(rs.getString("moisture")))+"></td>");
                                String_Return.append("<td width='6%' align='center' class='forborder'><input type='checkbox' name='ck' id='ck2' "+checkvalue(objuti.NotNull(rs.getString("viscosity")))+"></td>");
                                String_Return.append("<td width='6%' align='center' class='forborder'><input type='checkbox' name='ck' id='ck3' "+checkvalue(objuti.NotNull(rs.getString("ph_value")),"H")+"></td>");
                                String_Return.append("<td width='6%' align='center' class='forborder'><input type='checkbox' name='ck' id='ck4' "+checkvalue(objuti.NotNull(rs.getString("ph_value")),"L")+"></td>");
                                String_Return.append("<td width='6%' align='center' class='forborder'><input type='checkbox' name='ck' id='ck5' "+checkvalue(objuti.NotNull(rs.getString("resolution")))+"></td>");
                                String_Return.append("<td width='6%' align='center' class='forborder'><input type='checkbox' name='ck' id='ck6' "+checkvalue(objuti.NotNull(rs.getString("soft_pulp")))+"></td>");
                                String_Return.append("<td width='6%' align='center' class='forborder'><input type='checkbox' name='ck' id='ck7' "+checkvalue(objuti.NotNull(rs.getString("whiteness")))+"></td>");
                                String_Return.append("<td width='6%' align='center' class='forborder'><input type='checkbox' name='ck' id='ck8' ></td>");
                                String_Return.append("<td width='6%' align='center' class='forborder'><input type='checkbox' name='ck' id='ck9' "+checkvalue(objuti.NotNull(rs.getString("so2")))+"></td>");
                                String_Return.append("<td width='6%' align='center' class='forborder'><input type='checkbox' name='ck' id='ck10' "+checkvalue(objuti.NotNull(rs.getString("contamination")))+"></td>");
                                String_Return.append("<td width='6%' align='center' class='forborder'><input type='checkbox' name='ck' id='ck11' "+checkvalue(objuti.NotNull(rs.getString("black_point")))+"></td>");
                                String_Return.append("<td width='6%' align='center' class='forborder'>1</td></tr>");
                            }
                        }
                        String_Return.append("</table>");
                        String_Return.append("<div align='center'>\n");
                        if ((screen % 10) != 0 && screen <= 10) {
                            for (int count = 1; count <= 10 && count <= total_page; count++) {
                                if (count == screen) {
                                    String_Return.append(" [" + count + "] |");
                                } else {
                                    String_Return.append(" <a href='#'  onclick = \"showTableNonPopup_Detail('show','A_doc_id','s_screen_" + count + "','../SHOWDETAILSCREEN/BW_CS_Show029.jsp?A_p_type=\'+getId('A_p_type').value+\'&A_doc_id=')\"><input type = 'hidden' id='s_screen_" + count + "' name='s_screen_" + count + "' value =\"" + count + "\">" + count + "</a> |");
                                }

                            }
                            //**************************************************Select**************************************
                            String_Return.append("<select id='select_screen' name = 'select_screen'>");
                            for (int count = 1; count <= 10 && count <= total_page; count++) {
                                if (count == screen) {
                                } else {
                                    String_Return.append("<option   value=\'" + count + "\' onclick = \"showTableNonPopup_Detail('show','A_doc_id','select_screen','../SHOWDETAILSCREEN/BW_CS_Show029.jsp?A_p_type=\'+getId('A_p_type').value+\'&A_doc_id=')\">" + count + "</option>");
                                }
                            }
                            String_Return.append("</select>");
                            //**************************************************Select**************************************
                        } else {
                            for (int count = (screen - 5); count <= (screen + 5) && count <= total_page; count++) {
                                if (count == screen) {
                                    String_Return.append("| [" + count + "] |");
                                } else {
                                    String_Return.append(" <a href='#' onclick = \"showTableNonPopup_Detail('show','A_doc_id','s_screen_" + count + "','../SHOWDETAILSCREEN/BW_CS_Show029.jsp?A_p_type=\'+getId('A_p_type').value+\'&A_doc_id=')\"><input type = 'hidden' id='s_screen_" + count + "' name='s_screen_" + count + "' value ='" + count + "'>" + count + "</a> |");
                                }
                            }
                            //**************************************************Select**************************************
                            String_Return.append("<select id='select_screen' name = 'select_screen'>");
                            for (int count = (screen - 5); count <= (screen + 5) && count <= total_page; count++) {
                                if (count == screen) {
                                    String_Return.append("<option selected  value=\'" + count + "\' onclick = \"showTableNonPopup_Detail('show','A_doc_id','select_screen','../SHOWDETAILSCREEN/BW_CS_Show029.jsp?A_p_type=\'+getId('A_p_type').value+\'&A_doc_id=')\">" + count + "</option>");
                                } else {
                                    String_Return.append("<option   value=\'" + count + "\' onclick = \"showTableNonPopup_Detail('show','A_doc_id','select_screen','../SHOWDETAILSCREEN/BW_CS_Show029.jsp?A_p_type=\'+getId('A_p_type').value+\'&A_doc_id=')\">" + count + "</option>");
                                }
                            }
                            String_Return.append("</select>");
                            //**************************************************Select**************************************
                        }
                        String_Return.append("</div>\n");

                    } else {
                        String_Return.append("<td width='8%' align='center' class='forborder'>ไม่พบข้อมูลที่ต้องการ</td>");
                        String_Return.append("</table>");
                    }
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
    public  String checkvalue(String check_value){
        String str_retrun = "";
        if(check_value.equals("Y") ){
            str_retrun = "checked";
        }else{
            str_retrun = "";
        }
        return str_retrun;
    }
    public  String checkvalue(String check_value,String input_check){
        String str_retrun = "";
        if(input_check.equals(check_value)){
            str_retrun = "checked";
        }else{
            str_retrun = "";
        }
        return str_retrun;
    }


}
