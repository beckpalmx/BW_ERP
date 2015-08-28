/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bw.DB;

import com.bw.Util.UtiDatabase;
import com.bw.bean.DataBeanM_Cassava_price;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author B
 */
public class M_Cassava_priceDAO {
    public void insert(DataBeanM_Cassava_price DataBean_header,ArrayList<DataBeanM_Cassava_price> DataBean_detail)throws Exception{
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        PreparedStatement p = null;
        try{
            p = con.prepareStatement("INSERT INTO m_cassava_price"
                    + "(cassava_price_id,eff_date,end_date,create_by,create_date) "
                    + "VALUES(?,?,?,?,?)");
            p.setString(1, DataBean_header.getCassava_price_id());
            p.setString(2, DataBean_header.getEff_date());
            p.setString(3, DataBean_header.getEnd_date());
            p.setString(4, DataBean_header.getBy());
            p.setTimestamp(5, DataBean_header.getDate());
            p.executeUpdate();
            p = null;
            p = con.prepareStatement("INSERT INTO m_cassava_price_detail"
                    + "(cassava_price_id,eff_date,end_date,percent_cassava,price_value,create_by,create_date,percent_cassava_end,price_value_end,percent_cassava_begin,price_value_begin) "
                    + "VALUES(?,?,?,?,?,?,?,?,?,?,?)");
            for(int loop=0;loop<DataBean_detail.size();loop++){
                p.setString(1, DataBean_header.getCassava_price_id());
                p.setString(2, DataBean_header.getEff_date());
                p.setString(3, DataBean_header.getEnd_date());
                p.setString(4, DataBean_detail.get(loop).getPercent_cassava());
                p.setString(5, DataBean_detail.get(loop).getPrice_value());
                p.setString(6, DataBean_header.getBy());
                p.setTimestamp(7, DataBean_header.getDate());
                p.setString(8, DataBean_detail.get(loop).getPercent_cassava_end());
                p.setString(9, DataBean_detail.get(loop).getPrice_value_end());
                p.setString(10, DataBean_detail.get(loop).getPercent_cassava_begin());
                p.setString(11, DataBean_detail.get(loop).getPrice_value_begin());
                p.addBatch();
            }
            p.executeBatch();
        }catch(Exception e){
            e.printStackTrace(System.out);
        }finally{
            if(p!=null){
                p.close();
            }
            if(con != null){
                con.close();
            }
        }
    }
    public void update(DataBeanM_Cassava_price DataBean_header,ArrayList<DataBeanM_Cassava_price> DataBean_detail)throws Exception{
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        PreparedStatement p = null;
        try{
            p = con.prepareStatement("UPDATE m_cassava_price SET "
                    + "eff_date=?,end_date=?,update_by=?,update_date=? "
                    + "WHERE cassava_price_id=? and delete_flag = 'N'");
            p.setString(1, DataBean_header.getEff_date());
            p.setString(2, DataBean_header.getEnd_date());
            p.setString(3, DataBean_header.getBy());
            p.setTimestamp(4, DataBean_header.getDate());
            p.setString(5, DataBean_header.getCassava_price_id());
            p.executeUpdate();
            p = null;
            p = con.prepareStatement("UPDATE m_cassava_price_detail SET "
                    + "eff_date=?,end_date=?,price_value=?,price_value_begin=?,price_value_end=?,update_by=?,update_date=?"
                    + "WHERE cassava_price_id=? and percent_cassava=? and delete_flag = 'N'");
            for(int loop=0;loop<DataBean_detail.size();loop++){
                p.setString(1, DataBean_header.getEff_date());
                p.setString(2, DataBean_header.getEnd_date());
                p.setString(3, DataBean_detail.get(loop).getPrice_value());
                p.setString(4, DataBean_detail.get(loop).getPrice_value_begin());
                p.setString(5, DataBean_detail.get(loop).getPrice_value_end());
                p.setString(6, DataBean_header.getBy());
                p.setTimestamp(7, DataBean_header.getDate());
                p.setString(8, DataBean_header.getCassava_price_id());
                p.setString(9, DataBean_detail.get(loop).getPercent_cassava());
                p.addBatch();
            }
            p.executeBatch();
        }catch(Exception e){
            e.printStackTrace(System.out);
        }finally{
            if(p != null){
                p.close();
            }
            if(con != null){
                con.close();
            }
        }
    }
    public void delete(DataBeanM_Cassava_price DataBean_header)throws Exception{
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        PreparedStatement p = null;
        String SQL = "";
        try{
            for(int i=1;i<=2;i++){
                SQL = "UPDATE ";
                SQL += i==1?"m_cassava_price ":"m_cassava_price_detail ";
                SQL += "SET delete_flag =?,delete_by=?,delete_date=? ";
                SQL += "WHERE cassava_price_id = ? and delete_flag = 'N'";
                p = con.prepareStatement(SQL);
                p.setString(1, "Y");
                p.setString(2, DataBean_header.getBy());
                p.setTimestamp(3, DataBean_header.getDate());
                p.setString(4, DataBean_header.getCassava_price_id());
                p.executeUpdate();
                p.clearParameters();
            }
        }catch(Exception e){
            e.printStackTrace(System.out);
        }finally{
            if(p != null){
                p.close();
            }
            if(con != null){
                con.close();
            }
        }
    }
    public String Show_Detail(String doc_id)throws Exception{
        StringBuffer String_return = new StringBuffer();
        String SQL = "";
        UtiDatabase objuti = new UtiDatabase();
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        ResultSet rs = null;
        int loop = 34;
        try{
            String_return.append("<table width='100%' align='center' border='0' cellpadding='0' cellspacing='1' class='inner'>\n");
            if(objuti.numRowdatabase("SELECT count(cassava_price_id) as num from m_cassava_price where cassava_price_id='"+doc_id+"' and delete_flag = 'N'") != 0){
                SQL = "SELECT percent_cassava,percent_cassava_begin,percent_cassava_end,price_value_begin,price_value_end from m_cassava_price_detail WHERE cassava_price_id = '"+doc_id+"' order by runno";
                rs = con.createStatement().executeQuery(SQL);
                while(rs.next()){
                    if(rs.getString("percent_cassava").equals("34")){
                        String_return.append("<tr><td class='forborder' width='5%'>&nbsp;</td><td class='forborder' width='20%'>"+rs.getString("percent_cassava")+"</td><td class='forborder' width='35%'>"+rs.getString("percent_cassava_begin")+"<input class='inputs' type='text'   name='A_price_value_1_"+loop+"' id='A_price_value_1_"+loop+"' value = '"+rs.getString("price_value_begin")+"'></td><td class='forborder' width='35%'><input type='hidden' name='A_price_value_2_"+loop+"' id='A_price_value_2_"+loop+"' value = '"+rs.getString("price_value_end")+"'>&nbsp;</td><td class='forborder' width='5%'>&nbsp;</td></tr>\n");
                    }else{
                        String_return.append("<tr><td class='forborder' width='5%'>&nbsp;</td><td class='forborder' width='20%'>"+rs.getString("percent_cassava")+"</td><td class='forborder' width='35%'>"+rs.getString("percent_cassava_begin")+"<input class='inputs' type='text'   name='A_price_value_1_"+loop+"' id='A_price_value_1_"+loop+"' value = '"+rs.getString("price_value_begin")+"'></td><td class='forborder' width='35%'>"+rs.getString("percent_cassava_end")+"<input class='inputs' type='text'   name='A_price_value_2_"+loop+"' id='A_price_value_2_"+loop+"' value = '"+rs.getString("price_value_end")+"'></td><td class='forborder' width='5%'>&nbsp;</td></tr>\n");
                    }
                    loop -=1;
                }

            }else{
                while(loop >= 15){
                    if(loop == 34){
                        String_return.append("<tr><td class='forborder' width='5%'>&nbsp;</td><td class='forborder' width='20%'>"+loop+"</td><td class='forborder' width='35%'>"+loop+".00-99.00<input class='inputs' type='text'   name='A_price_value_1_"+loop+"' id='A_price_value_1_"+loop+"' value = ''></td><td class='forborder' width='35%'><input type='hidden' name='A_price_value_2_"+loop+"' id='A_price_value_2_"+loop+"' value = ''></td><td class='forborder' width='5%'>&nbsp;</td></tr>\n");
                    }else{
                        String_return.append("<tr><td class='forborder' width='5%'>&nbsp;</td><td class='forborder' width='20%'>"+loop+"</td><td class='forborder' width='35%'>"+loop+".00-"+loop+".49<input class='inputs' type='text'   name='A_price_value_1_"+loop+"' id='A_price_value_1_"+loop+"' value = ''></td><td class='forborder' width='35%'>"+loop+".50-"+loop+".99<input class='inputs' type='text'   name='A_price_value_2_"+loop+"' id='A_price_value_2_"+loop+"' value = ''></td><td class='forborder' width='5%'>&nbsp;</td></tr>\n");
                    }
                    loop -=1;
                }
            }
            String_return.append("</table>");
        }catch(Exception e){
            e.printStackTrace(System.out);
        }finally{
            if(rs != null){
                rs.close();
            }
            if(con != null){
                con.close();
            }
            return String_return.toString();
        }
    }
}
