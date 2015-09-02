/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bw.DB;

import com.bw.Util.StringQuery;
import com.bw.Util.UtiDatabase;
import com.bw.bean.DataBeanD_product_withdraw_detail;
import com.bw.bean.DataBeanD_product_withdraw_header;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author B
 */
public class D_product_withdraw_headerDAO {
    private UtiDatabase objuti;
    private StringQuery objStringQuery ;
    private int i;
    public void insert(DataBeanD_product_withdraw_header DataBean,ArrayList<DataBeanD_product_withdraw_detail> ObjAL)throws Exception{
        String[] String_input = new String[]{
            "doc_id",
            "doc_date",
            "doc_time",
            "dp_id",
            "reporter_id",
            "approver_id",
            "wh_leader_id",
            "account_id",
            "create_by",
            "create_date",
            "complete_flag",
            "company_id",
            "count_send_complete"
        };
        objuti = new UtiDatabase();
        objStringQuery = new StringQuery();
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        PreparedStatement p = null;
        i = 1;
        try{
            p = con.prepareStatement(objStringQuery.Insert_String(String_input, "d_product_withdraw_header"));
            p.setString(i,DataBean.getDoc_id());i+=1;
            p.setString(i, DataBean.getDoc_date());i+=1;
            p.setString(i, DataBean.getDoc_time());i+=1;
            p.setString(i, DataBean.getDp_id());i+=1;
            p.setString(i, DataBean.getReporter_id());i+=1;
            p.setString(i, DataBean.getApprover_id());i+=1;
            p.setString(i, DataBean.getWh_leader_id());i+=1;
            p.setString(i, DataBean.getAccount_id());i+=1;
            p.setString(i, DataBean.getBy());i+=1;
            p.setTimestamp(i, DataBean.getDate());i+=1;
            p.setString(i, DataBean.getComplete_flag());i+=1;
            p.setString(i, DataBean.getCompany_id());i+=1;
            p.setString(i, objuti.Count_sendcomplete("d_product_withdraw_header", DataBean.getDoc_id() , DataBean.getComplete_flag(), con));i+=1;
            p.executeUpdate();
            p = null;
            p = con.prepareStatement("INSERT INTO d_product_withdraw_detail"
                    + "(doc_id,doc_date,line_no,product_id,shift,quantity,bag_qty,remark,create_by,create_date,complete_flag,company_id,wh_in,weight) "
                    + "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            for(int loop = 0; loop < ObjAL.size();loop++){
                p.setString(1,DataBean.getDoc_id());
                p.setString(2, DataBean.getDoc_date());
                p.setString(3, ObjAL.get(loop).getLine_no());
                p.setString(4,ObjAL.get(loop).getProduct_id());
                p.setString(5, ObjAL.get(loop).getShift());
                p.setString(6, ObjAL.get(loop).getQuantity());
                p.setString(7, ObjAL.get(loop).getBag_qty());
                p.setString(8, ObjAL.get(loop).getRemark());
                p.setString(9, DataBean.getBy());
                p.setTimestamp(10, DataBean.getDate());
                p.setString(11, DataBean.getComplete_flag());
                p.setString(12, DataBean.getCompany_id());
                p.setString(13, ObjAL.get(loop).getWh_id());
                p.setString(14, ObjAL.get(loop).getWeight());
                p.addBatch();
            }
            p.executeBatch();
            if(DataBean.getComplete_flag().equalsIgnoreCase("Y")){
                Copy(DataBean);
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
    public void insert_suppliers(DataBeanD_product_withdraw_header DataBean,ArrayList<DataBeanD_product_withdraw_detail> ObjAL)throws Exception{
        String[] String_input = new String[]{
            "doc_id",
            "doc_date",
            "doc_time",
            "dp_id",
            "reporter_id",
            "approver_id",
            "wh_leader_id",
            "account_id",
            "create_by",
            "create_date",
            "complete_flag",
            "company_id",
            "count_send_complete",
            "wh_leader_id",
            "account_id"
        };
        objuti = new UtiDatabase();
        objStringQuery = new StringQuery();
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        PreparedStatement p = null;
        i = 1;
        try{
            p = con.prepareStatement(objStringQuery.Insert_String(String_input, "d_product_withdraw_suppliers_header"));
            p.setString(i,DataBean.getDoc_id());i+=1;
            p.setString(i, DataBean.getDoc_date());i+=1;
            p.setString(i, DataBean.getDoc_time());i+=1;
            p.setString(i, DataBean.getDp_id());i+=1;
            p.setString(i, DataBean.getReporter_id());i+=1;
            p.setString(i, DataBean.getApprover_id());i+=1;
            p.setString(i, DataBean.getWh_leader_id());i+=1;
            p.setString(i, DataBean.getAccount_id());i+=1;
            p.setString(i, DataBean.getBy());i+=1;
            p.setTimestamp(i, DataBean.getDate());i+=1;
            p.setString(i, DataBean.getComplete_flag());i+=1;
            p.setString(i, DataBean.getCompany_id());i+=1;          
            p.setString(i, objuti.Count_sendcomplete("d_product_withdraw_suppliers_header", DataBean.getDoc_id() , DataBean.getComplete_flag(), con));i+=1;
            p.setString(i, DataBean.getWh_leader_id());i += 1;
            p.setString(i, DataBean.getAccount_id());i += 1;              
            p.executeUpdate();
            p = null;
            p = con.prepareStatement("INSERT INTO d_product_withdraw_suppliers_detail"
                    + "(doc_id,doc_date,line_no,product_id,shift,quantity,bag_qty,remark,create_by,create_date,complete_flag,company_id,wh_in,weight) "
                    + "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            for(int loop = 0; loop < ObjAL.size();loop++){
                p.setString(1,DataBean.getDoc_id());
                p.setString(2, DataBean.getDoc_date());
                p.setString(3, ObjAL.get(loop).getLine_no());
                p.setString(4,ObjAL.get(loop).getProduct_id());
                p.setString(5, ObjAL.get(loop).getShift());
                p.setString(6, ObjAL.get(loop).getQuantity());
                p.setString(7, ObjAL.get(loop).getBag_qty());
                p.setString(8, ObjAL.get(loop).getRemark());
                p.setString(9, DataBean.getBy());
                p.setTimestamp(10, DataBean.getDate());
                p.setString(11, DataBean.getComplete_flag());
                p.setString(12, DataBean.getCompany_id());
                p.setString(13, ObjAL.get(loop).getWh_id());
                p.setString(14, ObjAL.get(loop).getWeight());
                p.addBatch();
            }
            p.executeBatch();
            if(DataBean.getComplete_flag().equalsIgnoreCase("Y")){
                Copy_suppliers(DataBean);
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

    public void update(DataBeanD_product_withdraw_header DataBean)throws Exception{
        String[] String_input = new String[]{
            "doc_date",
            "doc_time",
            "dp_id",
            "reporter_id",
            "approver_id",
            "wh_leader_id",
            "account_id",
            "update_by",
            "update_date",
            "complete_flag",
            "company_id",
            "count_send_complete",
            "wh_leader_id",
            "account_id"                
        };
        objuti = new UtiDatabase();
        objStringQuery = new StringQuery();
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        PreparedStatement p = null;
        i = 1;
        try{
            p = con.prepareStatement(objStringQuery.Update_String(String_input, "d_product_withdraw_header","WHERE doc_id = ? and delete_flag = 'N' and complete_flag = 'N'"));
            p.setString(i, DataBean.getDoc_date());i+=1;
            p.setString(i, DataBean.getDoc_time());i+=1;
            p.setString(i, DataBean.getDp_id());i+=1;
            p.setString(i, DataBean.getReporter_id());i+=1;
            p.setString(i, DataBean.getApprover_id());i+=1;
            p.setString(i, DataBean.getWh_leader_id());i+=1;
            p.setString(i, DataBean.getAccount_id());i+=1;
            p.setString(i, DataBean.getBy());i+=1;
            p.setTimestamp(i, DataBean.getDate());i+=1;
            p.setString(i, DataBean.getComplete_flag());i+=1;
            p.setString(i, DataBean.getCompany_id());i+=1;
            p.setString(i, objuti.Count_sendcomplete("d_product_withdraw_header", DataBean.getDoc_id() , DataBean.getComplete_flag(), con));i+=1;
            p.setString(i, DataBean.getWh_leader_id());i += 1;
            p.setString(i, DataBean.getAccount_id());i += 1;            
            p.setString(i,DataBean.getDoc_id());i+=1;
            p.executeUpdate();
            if(objuti.numRowdatabase("Select count(doc_id) as num from d_product_withdraw_detail where doc_id = '"+DataBean.getDoc_id()+"' and delete_flag = 'N' and complete_flag = 'N'") != 0){
                p = null;
                p = con.prepareStatement(objStringQuery.Flag_Status_String("doc_date=?,complete_flag=?", "d_product_withdraw_detail",
                        "where doc_id=? and delete_flag = 'N' and complete_flag = 'N'"));
                p.setString(1, DataBean.getDoc_date());
                p.setString(2, DataBean.getComplete_flag());
                p.setString(3, DataBean.getDoc_id());
                p.executeUpdate();
            }
            if(DataBean.getComplete_flag().equalsIgnoreCase("Y")){
                Copy(DataBean);
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

    public void update_suppliers(DataBeanD_product_withdraw_header DataBean)throws Exception{
        String[] String_input = new String[]{
            "doc_date",
            "doc_time",
            "dp_id",
            "reporter_id",
            "approver_id",
            "wh_leader_id",
            "account_id",
            "update_by",
            "update_date",
            "complete_flag",
            "company_id",
            "count_send_complete"
        };
        objuti = new UtiDatabase();
        objStringQuery = new StringQuery();
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        PreparedStatement p = null;
        i = 1;
        try{
            p = con.prepareStatement(objStringQuery.Update_String(String_input, "d_product_withdraw_suppliers_header","WHERE doc_id = ? and delete_flag = 'N' and complete_flag = 'N'"));
            p.setString(i, DataBean.getDoc_date());i+=1;
            p.setString(i, DataBean.getDoc_time());i+=1;
            p.setString(i, DataBean.getDp_id());i+=1;
            p.setString(i, DataBean.getReporter_id());i+=1;
            p.setString(i, DataBean.getApprover_id());i+=1;
            p.setString(i, DataBean.getWh_leader_id());i+=1;
            p.setString(i, DataBean.getAccount_id());i+=1;
            p.setString(i, DataBean.getBy());i+=1;
            p.setTimestamp(i, DataBean.getDate());i+=1;
            p.setString(i, DataBean.getComplete_flag());i+=1;
            p.setString(i, DataBean.getCompany_id());i+=1;
            p.setString(i, objuti.Count_sendcomplete("d_product_withdraw_suppliers_header", DataBean.getDoc_id() , DataBean.getComplete_flag(), con));i+=1;
            p.setString(i,DataBean.getDoc_id());i+=1;
            p.executeUpdate();
            if(objuti.numRowdatabase("Select count(doc_id) as num from d_product_withdraw_suppliers_detail where doc_id = '"+DataBean.getDoc_id()+"' and delete_flag = 'N' and complete_flag = 'N'") != 0){
                p = null;
                p = con.prepareStatement(objStringQuery.Flag_Status_String("doc_date=?,complete_flag=?", "d_product_withdraw_suppliers_detail",
                        "where doc_id=? and delete_flag = 'N' and complete_flag = 'N'"));
                p.setString(1, DataBean.getDoc_date());
                p.setString(2, DataBean.getComplete_flag());
                p.setString(3, DataBean.getDoc_id());
                p.executeUpdate();
            }
            if(DataBean.getComplete_flag().equalsIgnoreCase("Y")){
                Copy_suppliers(DataBean);
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

    public void delete(DataBeanD_product_withdraw_header DataBean)throws Exception{
        objStringQuery = new StringQuery();
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        PreparedStatement p = null;
        try{

            p = con.prepareStatement(objStringQuery.Flag_Status_String("delete_flag='Y',delete_by=?,delete_date=?", "d_product_withdraw_header",
                    "WHERE doc_id = '"+DataBean.getDoc_id()+"' and delete_flag = 'N' and complete_flag = 'N'"));
            p.setString(1, DataBean.getBy());
            p.setTimestamp(2, DataBean.getDate());
            p.executeUpdate();
            p = con.prepareStatement(objStringQuery.Flag_Status_String("delete_flag='Y',delete_by=?,delete_date=?", "d_product_withdraw_detail",
                    "WHERE doc_id = '"+DataBean.getDoc_id()+"' and delete_flag = 'N' and complete_flag = 'N'"));
            p.setString(1, DataBean.getBy());
            p.setTimestamp(2, DataBean.getDate());
            p.executeUpdate();
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

    public void delete_suppliers(DataBeanD_product_withdraw_header DataBean)throws Exception{
        objStringQuery = new StringQuery();
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        PreparedStatement p = null;
        try{

            p = con.prepareStatement(objStringQuery.Flag_Status_String("delete_flag='Y',delete_by=?,delete_date=?", "d_product_withdraw_suppliers_header",
                    "WHERE doc_id = '"+DataBean.getDoc_id()+"' and delete_flag = 'N' and complete_flag = 'N'"));
            p.setString(1, DataBean.getBy());
            p.setTimestamp(2, DataBean.getDate());
            p.executeUpdate();
            p = con.prepareStatement(objStringQuery.Flag_Status_String("delete_flag='Y',delete_by=?,delete_date=?", "d_product_withdraw_suppliers_detail",
                    "WHERE doc_id = '"+DataBean.getDoc_id()+"' and delete_flag = 'N' and complete_flag = 'N'"));
            p.setString(1, DataBean.getBy());
            p.setTimestamp(2, DataBean.getDate());
            p.executeUpdate();
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

    public  void Copy(DataBeanD_product_withdraw_header DataBean_header)throws Exception{
        String[] String_header = new String[]{
            "doc_id",
            "doc_date",
            "doc_time",
            "dp_id",
            "reporter_id",
            "approver_id",
            "wh_leader_id",
            "account_id",
            "create_by",
            "create_date",
            "company_id"
        };
        String[] String_detail = new String[]{
            "line_no",
            "product_id",
            "amount",
            "weight",
            "bag_qty",
            "remark",
            "doc_id",
            "doc_date",
            "create_by",
            "create_date",
            "shift",
            "wh_in",
            "quantity"
        };
        ArrayList<DataBeanD_product_withdraw_detail> Obj_AL_Detail = new ArrayList<DataBeanD_product_withdraw_detail>();
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        PreparedStatement p = null;
        ResultSet rs = null;
        objuti = new UtiDatabase();
        objStringQuery = new StringQuery();
        i = 1;
        try{
            p = con.prepareStatement(objStringQuery.Insert_String(String_header, "d_product_withdraw_confirm_header"));
            p.setString(i, DataBean_header.getDoc_id());i += 1;
            p.setString(i, DataBean_header.getDoc_date());i += 1;
            p.setString(i, DataBean_header.getDoc_time());i += 1;
            p.setString(i, DataBean_header.getDp_id());i += 1;
            p.setString(i, DataBean_header.getReporter_id());i += 1;
            p.setString(i, DataBean_header.getApprover_id());i += 1;
            p.setString(i, DataBean_header.getWh_leader_id());i += 1;
            p.setString(i, DataBean_header.getAccount_id());i += 1;
            p.setString(i, DataBean_header.getBy());i += 1;
            p.setTimestamp(i, DataBean_header.getDate());i += 1;
            p.setString(i, DataBean_header.getCompany_id());i += 1;
            p.executeUpdate();
            Obj_AL_Detail = Copy_Detail(Obj_AL_Detail, rs, con, DataBean_header);
            if(!Obj_AL_Detail.isEmpty()){
                p = con.prepareStatement(objStringQuery.Insert_String(String_detail, "d_product_withdraw_confirm_detail"));
                for(int loop = 0;loop < Obj_AL_Detail.size();loop++){
                    p.setString(1, Obj_AL_Detail.get(loop).getLine_no());
                    p.setString(2, Obj_AL_Detail.get(loop).getProduct_id());
                    p.setString(3, "0");
                    p.setString(4, Obj_AL_Detail.get(loop).getWeight());
                    p.setString(5, Obj_AL_Detail.get(loop).getBag_qty());
                    p.setString(6, Obj_AL_Detail.get(loop).getRemark());
                    p.setString(7, DataBean_header.getDoc_id());
                    p.setString(8, DataBean_header.getDoc_date());
                    p.setString(9, DataBean_header.getBy());
                    p.setTimestamp(10, DataBean_header.getDate());
                    p.setString(11, Obj_AL_Detail.get(loop).getShift());
                    p.setString(12, Obj_AL_Detail.get(loop).getWh_id());
                    p.setString(13, Obj_AL_Detail.get(loop).getQuantity());
                    p.addBatch();
                }
                p.executeBatch();
            }
        }catch(Exception e){
            e.printStackTrace(System.out);
        }finally{
            if(!Obj_AL_Detail.isEmpty()){
                Obj_AL_Detail.clear();
            }
            if(rs != null){
                rs.close();
            }
            if(p != null){
                p.close();
            }
            if(con != null){
                con.close();
            }
        }

    }

    public  void Copy_suppliers(DataBeanD_product_withdraw_header DataBean_header)throws Exception{
        String[] String_header = new String[]{
            "doc_id",
            "doc_date",
            "doc_time",
            "dp_id",
            "reporter_id",
            "approver_id",
            "wh_leader_id",
            "account_id",
            "create_by",
            "create_date",
            "company_id"
 
        };
        String[] String_detail = new String[]{
            "line_no",
            "product_id",
            "amount",
            "weight",
            "bag_qty",
            "remark",
            "doc_id",
            "doc_date",
            "create_by",
            "create_date",
            "shift",
            "wh_in",
            "quantity"
        };
        ArrayList<DataBeanD_product_withdraw_detail> Obj_AL_Detail = new ArrayList<DataBeanD_product_withdraw_detail>();
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        PreparedStatement p = null;
        ResultSet rs = null;
        objuti = new UtiDatabase();
        objStringQuery = new StringQuery();
        i = 1;
        try{
            p = con.prepareStatement(objStringQuery.Insert_String(String_header, "d_product_withdraw_suppliers_header_wh"));
            p.setString(i, DataBean_header.getDoc_id());i += 1;
            p.setString(i, DataBean_header.getDoc_date());i += 1;
            p.setString(i, DataBean_header.getDoc_time());i += 1;
            p.setString(i, DataBean_header.getDp_id());i += 1;
            p.setString(i, DataBean_header.getReporter_id());i += 1;
            p.setString(i, DataBean_header.getApprover_id());i += 1;
            p.setString(i, DataBean_header.getWh_leader_id());i += 1;
            p.setString(i, DataBean_header.getAccount_id());i += 1;
            p.setString(i, DataBean_header.getBy());i += 1;
            p.setTimestamp(i, DataBean_header.getDate());i += 1;
            p.setString(i, DataBean_header.getCompany_id());i += 1;
            p.executeUpdate();
            Obj_AL_Detail = Copy_Detail_suppliers(Obj_AL_Detail, rs, con, DataBean_header);
            if(!Obj_AL_Detail.isEmpty()){
                p = con.prepareStatement(objStringQuery.Insert_String(String_detail, "d_product_withdraw_suppliers_detail_wh"));
                for(int loop = 0;loop < Obj_AL_Detail.size();loop++){
                    p.setString(1, Obj_AL_Detail.get(loop).getLine_no());
                    p.setString(2, Obj_AL_Detail.get(loop).getProduct_id());
                    p.setString(3, "0");
                    p.setString(4, Obj_AL_Detail.get(loop).getWeight());
                    p.setString(5, Obj_AL_Detail.get(loop).getBag_qty());
                    p.setString(6, Obj_AL_Detail.get(loop).getRemark());
                    p.setString(7, DataBean_header.getDoc_id());
                    p.setString(8, DataBean_header.getDoc_date());
                    p.setString(9, DataBean_header.getBy());
                    p.setTimestamp(10, DataBean_header.getDate());
                    p.setString(11, Obj_AL_Detail.get(loop).getShift());
                    p.setString(12, Obj_AL_Detail.get(loop).getWh_id());
                    p.setString(13, Obj_AL_Detail.get(loop).getQuantity());
                    p.addBatch();
                }
                p.executeBatch();
            }
        }catch(Exception e){
            e.printStackTrace(System.out);
        }finally{
            if(!Obj_AL_Detail.isEmpty()){
                Obj_AL_Detail.clear();
            }
            if(rs != null){
                rs.close();
            }
            if(p != null){
                p.close();
            }
            if(con != null){
                con.close();
            }
        }

    }

    public ArrayList<DataBeanD_product_withdraw_detail> Copy_Detail(ArrayList<DataBeanD_product_withdraw_detail> objAL,ResultSet rs,Connection con,DataBeanD_product_withdraw_header DataBean)throws Exception{
        try{
            rs = con.createStatement().executeQuery("SELECT "
                    + "line_no,product_id,quantity,weight,bag_qty,remark,shift,quantity,wh_in"
                    + " FROM d_product_withdraw_detail "
                    + " Where doc_id ='"+DataBean.getDoc_id()+"' and delete_flag = 'N' and complete_flag = 'Y' "
                    + " order by to_number(line_no,'999')");
            while(rs.next()){
                DataBeanD_product_withdraw_detail Bean = new DataBeanD_product_withdraw_detail();
                Bean.setLine_no(rs.getString("line_no"));
                Bean.setProduct_id(rs.getString("product_id"));
                Bean.setWeight(rs.getString("weight"));
                Bean.setBag_qty(rs.getString("bag_qty"));
                Bean.setRemark(rs.getString("remark"));
                Bean.setShift(rs.getString("shift"));
                Bean.setWh_id(rs.getString("wh_in"));
                Bean.setQuantity(rs.getString("quantity"));
                objAL.add(Bean);
            }
        }catch(Exception e){
            e.printStackTrace(System.out);
        }finally{
            return objAL;
        }
    }

    public ArrayList<DataBeanD_product_withdraw_detail> Copy_Detail_suppliers(ArrayList<DataBeanD_product_withdraw_detail> objAL,ResultSet rs,Connection con,DataBeanD_product_withdraw_header DataBean)throws Exception{
        try{
            rs = con.createStatement().executeQuery("SELECT "
                    + "line_no,product_id,quantity,weight,bag_qty,remark,shift,quantity,wh_in"
                    + " FROM d_product_withdraw_suppliers_detail "
                    + " Where doc_id ='"+DataBean.getDoc_id()+"' and delete_flag = 'N' and complete_flag = 'Y' "
                    + " order by to_number(line_no,'999')");
            while(rs.next()){
                DataBeanD_product_withdraw_detail Bean = new DataBeanD_product_withdraw_detail();
                Bean.setLine_no(rs.getString("line_no"));
                Bean.setProduct_id(rs.getString("product_id"));
                Bean.setWeight(rs.getString("weight"));
                Bean.setBag_qty(rs.getString("bag_qty"));
                Bean.setRemark(rs.getString("remark"));
                Bean.setShift(rs.getString("shift"));
                Bean.setWh_id(rs.getString("wh_in"));
                Bean.setQuantity(rs.getString("quantity"));
                objAL.add(Bean);
            }
        }catch(Exception e){
            e.printStackTrace(System.out);
        }finally{
            return objAL;
        }
    }
}
