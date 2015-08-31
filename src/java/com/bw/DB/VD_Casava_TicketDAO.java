/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bw.DB;

import com.bw.Util.ThaiUtil;
import com.bw.Util.UtiDatabase;
import com.bw.bean.DataBeanD_ticketsale;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author 
 */
public class VD_Casava_TicketDAO {

    private int Returnvalue;

    /*    
     public int insert(DataBeanD_ticketsale dataBean) throws Exception {
     Returnvalue = 0;
     DBConnect objcon = new DBConnect();
     Connection con = objcon.openNewConnection();
     String sql = "insert into d_ticketsale (doc_id,line_no,product_id,location_id,weight,create_date,create_by,wh_in,wh_weight_final,wh_product_id,wh_warehouse_id,wh_location_id) "
     + "values(?,?,?,?,?,?,?,?,?,?,?,?)";        
     PreparedStatement p = null;
     try {
     p = con.prepareStatement(sql);
     p.setString(1, dataBean.getDoc_id());
     p.setString(2, dataBean.getLine_no());
     p.setString(3, dataBean.getProduct_id());
     p.setString(4, dataBean.getLocation_id());
     p.setString(5, dataBean.getWeight());
     p.setTimestamp(6, dataBean.getDate());
     p.setString(7, dataBean.getBy());
     p.setString(8, dataBean.getWh_in());
     p.setString(9, dataBean.getWeight());
     p.setString(10, dataBean.getProduct_id());
     p.setString(11, dataBean.getWh_in());
     p.setString(12, dataBean.getLocation_id());            
     Returnvalue = p.executeUpdate();
     } finally {

     try {
     p.close();
     con.close();
     } catch (Exception e) {
     e.printStackTrace(System.out);
     }

     }

     return Returnvalue;
     }
     */
    public int update(DataBeanD_ticketsale dataBean) throws Exception {
        Returnvalue = 0;
        DBConnect dbConnect = new DBConnect();
        Connection con = dbConnect.openNewConnection();

        String sql
                = "update d_ticketsale set  price_unit=?,price_total=?,update_date=?,update_by=? "
                + "where doc_id=? and ticket_text=? and delete_flag = 'N' and complete_flag = 'N'";
        PreparedStatement p = null;
        try {

            p = con.prepareStatement(sql);
            p.setString(1, dataBean.getPrice_unit());
            p.setString(2, dataBean.getPrice_total());
            p.setTimestamp(3, dataBean.getDate());
            p.setString(4, dataBean.getBy());
            p.setString(5, dataBean.getDoc_id());
            p.setString(6, dataBean.getTicket_text());
            Returnvalue = p.executeUpdate();

        } finally {
            try {
                p.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace(System.out);
            }

        }
        System.out.println(Returnvalue);
        return Returnvalue;        

    }

    public DataBeanD_ticketsale ReturnEdit(String Doc_id, String Ticket_text, DataBeanD_ticketsale bean) throws Exception {
        DBConnect dbConnect = new DBConnect();
        Connection con = dbConnect.openNewConnection();
        String SQL = "select * "
                + " from d_ticketsale  where doc_id = '" + Doc_id + "' and ticket_text ='" + Ticket_text + "' and delete_flag = 'N' ";
        //+ "and complete_flag = 'N' ";
        
        System.out.println("SQL = " + SQL);
        
        ResultSet rs = con.createStatement().executeQuery(SQL);
        try {
            while (rs.next()) {
                bean.setDoc_id(rs.getString("doc_id"));
                bean.setDoc_date(rs.getString("doc_date"));
                bean.setLine_no(rs.getString("line_no"));
                bean.setTicket_text(rs.getString("ticket_text"));
                bean.setTruck_no(rs.getString("truck_no"));
                bean.setCust_name(rs.getString("cust_name"));
                bean.setProd_name(rs.getString("prod_name"));
                bean.setNet_wght(rs.getString("net_wght"));
                bean.setPrice_unit(rs.getString("price_unit"));
                bean.setPrice_total(rs.getString("price_total"));
                bean.setDate_in(rs.getString("date_in"));
                bean.setDate_out(rs.getString("date_out"));
                bean.setTime_in(rs.getString("time_in"));
                bean.setTime_out(rs.getString("time_out"));
                bean.setLoad_in(rs.getString("load_in"));
                bean.setLoad_out(rs.getString("load_out"));                
            }
        } finally {
            try {
                rs.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace(System.out);
            }
        }
        return bean;
    }
    //ทำการลบ Line_no ตามบรรทัดที่เลื่อกแล้วทำการ update ข

    public void DeleteLine_no(String inputarry, DataBeanD_ticketsale bean) throws Exception {
        UtiDatabase objuti = new UtiDatabase();
        boolean ckclose = false;
        DBConnect dbConnect = new DBConnect();
        Connection con = dbConnect.openNewConnection();
        int count = 1;
        ResultSet rs = null;
        PreparedStatement p = null;
        String sql, sql2 = "";
        try {
            if (inputarry.length() != 0) {
                String[] strarry = inputarry.split(",");
                for (int i = 0; i < strarry.length; i++) {

                    sql = "update d_ticketsale set delete_flag=?,delete_date=?,delete_by=? where doc_id=? and line_no=? and delete_flag = 'N' and complete_flag = 'N'";
                    p = con.prepareStatement(sql);
                    p.setString(1, "Y");
                    p.setTimestamp(2, bean.getDate());
                    p.setString(3, bean.getBy());
                    p.setString(4, bean.getDoc_id());
                    p.setString(5, strarry[i]);
                    p.executeUpdate();
                }
                if (strarry.length != -1) {
                    sql = "select count(doc_id) as num from d_ticketsale where doc_id ='" + bean.getDoc_id() + "' and delete_flag = 'N' and complete_flag = 'N'";
                    if (objuti.numRowdatabase(sql) != 0) {
                        p = null;
                        sql2 = "Select line_no from  d_ticketsale where doc_id ='" + bean.getDoc_id() + "' and delete_flag = 'N' and complete_flag ='N' order by runno ";
                        rs = con.createStatement().executeQuery(sql2);
                        while (rs.next()) {
                            sql = "update d_ticketsale set line_no=? where doc_id=? and line_no=?";
                            p = con.prepareStatement(sql);
                            p.setString(1, Integer.toString(count));
                            p.setString(2, bean.getDoc_id());
                            p.setString(3, rs.getString("line_no"));
                            p.executeUpdate();
                            count = count + 1;
                        }

                        ckclose = true;
                    }
                }
            }
        } finally {
            try {
                if (ckclose) {
                    rs.close();
                    p.close();
                    con.close();
                }

            } catch (Exception e) {
                e.printStackTrace(System.out);
            }
        }

    }

    public void Delete_line_no_All(DataBeanD_ticketsale dataBean) throws Exception {

        DBConnect dbConnect = new DBConnect();
        Connection con = dbConnect.openNewConnection();
        String sqldetail = "update d_ticketsale set delete_flag = ?,delete_date=?,delete_by=? where doc_id=? and delete_flag = 'N' and complete_flag = 'N'";
        PreparedStatement p = null;
        try {

            p = con.prepareStatement(sqldetail);
            p.setString(1, "Y");
            p.setTimestamp(2, dataBean.getDate());
            p.setString(3, dataBean.getBy());
            p.setString(4, dataBean.getDoc_id());
            p.executeUpdate();

        } finally {
            try {
                p.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace(System.out);
            }
        }

    }

    public String showDetail(String doc_id) throws Exception {
        ThaiUtil objth = new ThaiUtil();
        UtiDatabase objuti = new UtiDatabase();
        String SQL, SQL1, strOutput = "";
//        SQL1 = "Select Count(doc_id) As num from  d_ticketsale where doc_id ='" + objth.EncodeTexttoTIS(doc_id) + "' and delete_flag = 'N' and complete_flag ='N' ";
          SQL1 = "Select Count(doc_id) As num from  d_ticketsale where doc_id ='" + objth.EncodeTexttoTIS(doc_id) + "' and delete_flag = 'N' ";
        int a = objuti.numRowdatabase(SQL1);
        strOutput += "<table width='100%' align='center' border='0' cellpadding='0' cellspacing='1' class='inner'>";
        SQL = "select * "
                + " from d_ticketsale  where doc_id = '" + objth.EncodeTexttoTIS(doc_id) + "' and delete_flag = 'N' "  
                + " and (prod_code = '01') "
                + " order by ticket_text";
        System.out.println("Detail = " + SQL);
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        ResultSet rs = null;
        rs = con.createStatement().executeQuery(SQL);
        while (rs.next()) {
            strOutput += "<tr>";
            strOutput += "<td class='forborder' width='3px'><input type='checkbox' id='ckbox' name='ckbox' onclick=\"cancle_chkboxAll('chk_all',this.checked)\"></td>";
            strOutput += "<td class='forborder' width='7%'><a href=\"#\" onclick=\"OpenEdit(URLsend('ticket_text_" + rs.getString("ticket_text") + ",username,doc_id','../SCREEN/CS_D_Casava_Ticket_1.jsp'))\"><input type='hidden' id='ticket_text_" + rs.getString("ticket_text") + "' value=\"" + rs.getString("ticket_text") + "\"><input type='hidden' id='doc_id' value=\"" + rs.getString("doc_id") + "\"><input type='hidden' id='runno_" + rs.getString("runno") + "'' value=\"" + rs.getString("runno") + "\">" + rs.getString("ticket_text") + "</a></td>";
            strOutput += "<td class='forborder' width='15%'>" + rs.getString("truck_no") + "</td>";
            strOutput += "<td class='forborder' width='15%'>" + rs.getString("cust_name") + "</td>";
            strOutput += "<td class='forborder' width='15%'>" + rs.getString("prod_name") + "</td>";
            strOutput += "<td class='forborder' width='15%'>" + rs.getString("net_wght") + "</td>";
            strOutput += "<td class='forborder' width='17%'>" + rs.getString("price_unit") + "</td>";
            strOutput += "<td class='forborder' width='15%'>" + rs.getString("price_total") + "</td>";
            strOutput += "</tr>";
        }
        rs.close();
        con.close();
        strOutput += "</table>";
        return strOutput;
    }
}
