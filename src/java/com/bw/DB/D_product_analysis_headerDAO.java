/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bw.DB;

import com.bw.Util.StringQuery;
import com.bw.Util.UtiDatabase;
import com.bw.bean.DataBeanD_Status_id;
import com.bw.bean.DataBeanD_product_analysis_detail;
import com.bw.bean.DataBeanD_product_analysis_header;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author B
 */
public class D_product_analysis_headerDAO {
    UtiDatabase objuti;
    StringQuery objStringQuery ;
    public void insert(DataBeanD_product_analysis_header DataBean,ArrayList<DataBeanD_product_analysis_detail> objAL_Detail)throws Exception{
        String[] String_input = new String[]{
            "doc_id",
            "doc_date",
            "doc_time",
            "shift",
            "p_type",
            "production_id",
            "product_lot_id",
            "lot_no",
            "size",
            "bag_no",
            "remark",
            "random_chk",
            "pass_chk",
            "not_pass_chk",
            "naocl_chk",
            "withdraw_chk",
            "approver_id",
            "moisture",
            "viscosity",
            "ph_value",
            "resolution",
            "soft_pulp",
            "whiteness",
            "so2",
            "black_point",
            "create_by",
            "create_date"
        };
        objuti = new UtiDatabase();
        objStringQuery = new StringQuery();
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        PreparedStatement p = null;
        int i = 1;
        //ArrayList<DataBeanD_product_analysis_detail> objAL_Job = new ArrayList<DataBeanD_product_analysis_detail>();
        try{
            p = con.prepareStatement(objStringQuery.Insert_String(String_input, "d_product_analysis_header"));
            p.setString(i,DataBean.getDoc_id());i+=1;
            p.setString(i, DataBean.getDoc_date());i+=1;
            p.setString(i, DataBean.getDoc_time());i+=1;
            p.setString(i, DataBean.getShift());i+=1;
            p.setString(i, DataBean.getP_type());i+=1;
            p.setString(i, DataBean.getProduction_id());i+=1;
            p.setString(i, DataBean.getProduct_lot_id());i+=1;
            p.setString(i, DataBean.getLot_no());i+=1;
            p.setString(i, DataBean.getSize());i+=1;
            p.setString(i, DataBean.getBag_no());i+=1;
            p.setString(i, DataBean.getRemark());i+=1;
            p.setString(i, DataBean.getRandoc_chk());i+=1;
            p.setString(i, DataBean.getPass_chk());i+=1;
            p.setString(i, DataBean.getNot_pass_chk());i+=1;
            p.setString(i, DataBean.getNaocl_chk());i+=1;
            p.setString(i, DataBean.getWithdraw_chk());i+=1;
            p.setString(i, DataBean.getApprover_id());i+=1;
            p.setString(i, DataBean.getMooiseture());i+=1;
            p.setString(i, DataBean.getViscosity());i+=1;
            p.setString(i, DataBean.getPh());i+=1;
            p.setString(i, DataBean.getFineness());i+=1;
            p.setString(i, DataBean.getFiber_pulp());i+=1;
            p.setString(i, DataBean.getWhiteness());i+=1;
            p.setString(i, DataBean.getSo2());i+=1;
            p.setString(i, DataBean.getSpot());i+=1;
            p.setString(i, DataBean.getBy());i+=1;
            p.setTimestamp(i, DataBean.getDate());i+=1;
            p.executeUpdate();
            p = null;
            p = con.prepareStatement("INSERT INTO d_product_analysis_detail"
                    + "(doc_id,doc_date,line_no,value,spec_min,spec_max,unit,create_by,create_date,doc_type) "
                    + "VALUES(?,?,?,?,?,?,?,?,?,?)");
            //objAL_Job = Copy_Detail(objAL_Job, con, DataBean);
            for(int loop=0;loop < objAL_Detail.size();loop++ ){
                p.setString(1, DataBean.getDoc_id());
                p.setString(2, DataBean.getDoc_date());
                p.setString(3, objAL_Detail.get(loop).getLine_no());
                p.setString(4, objAL_Detail.get(loop).getValue());
                p.setString(5, objAL_Detail.get(loop).getSpec_min());
                p.setString(6, objAL_Detail.get(loop).getSpec_max());
                p.setString(7, objAL_Detail.get(loop).getUnit());
                p.setString(8, DataBean.getBy());
                p.setTimestamp(9, DataBean.getDate());
                p.setString(10, objAL_Detail.get(loop).getCheck_value());
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
    public void update(DataBeanD_product_analysis_header DataBean,ArrayList<DataBeanD_product_analysis_detail> objAL_Detail)throws Exception{
        String[] String_input = new String[]{
            "doc_date",
            "doc_time",
            "shift",
            "p_type",
            "production_id",
            "product_lot_id",
            "lot_no",
            "size",
            "bag_no",
            "remark",
            "random_chk",
            "pass_chk",
            "not_pass_chk",
            "naocl_chk",
            "withdraw_chk",
            "approver_id",
            "moisture",
            "viscosity",
            "ph_value",
            "resolution",
            "soft_pulp",
            "whiteness",
            "so2",
            "black_point",
            "update_by",
            "update_date"
        };
        objuti = new UtiDatabase();
        objStringQuery = new StringQuery();
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        PreparedStatement p = null;
        //ArrayList<DataBeanD_product_analysis_detail> objAL_Job = new ArrayList<DataBeanD_product_analysis_detail>();
        int i = 1;
        try{
            p = con.prepareStatement(objStringQuery.Update_String(String_input, "d_product_analysis_header","WHERE doc_id = ? and delete_flag = 'N' and complete_flag = 'N'"));
            p.setString(i, DataBean.getDoc_date());i+=1;
            p.setString(i, DataBean.getDoc_time());i+=1;
            p.setString(i, DataBean.getShift());i+=1;
            p.setString(i, DataBean.getP_type());i+=1;
            p.setString(i, DataBean.getProduction_id());i+=1;
            p.setString(i, DataBean.getProduct_lot_id());i+=1;
            p.setString(i, DataBean.getLot_no());i+=1;
            p.setString(i, DataBean.getSize());i+=1;
            p.setString(i, DataBean.getBag_no());i+=1;
            p.setString(i, DataBean.getRemark());i+=1;
            p.setString(i, DataBean.getRandoc_chk());i+=1;
            p.setString(i, DataBean.getPass_chk());i+=1;
            p.setString(i, DataBean.getNot_pass_chk());i+=1;
            p.setString(i, DataBean.getNaocl_chk());i+=1;
            p.setString(i, DataBean.getWithdraw_chk());i+=1;
            p.setString(i, DataBean.getApprover_id());i+=1;
            p.setString(i, DataBean.getMooiseture());i+=1;
            p.setString(i, DataBean.getViscosity());i+=1;
            p.setString(i, DataBean.getPh());i+=1;
            p.setString(i, DataBean.getFineness());i+=1;
            p.setString(i, DataBean.getFiber_pulp());i+=1;
            p.setString(i, DataBean.getWhiteness());i+=1;
            p.setString(i, DataBean.getSo2());i+=1;
            p.setString(i, DataBean.getSpot());i+=1;
            p.setString(i, DataBean.getBy());i+=1;
            p.setTimestamp(i, DataBean.getDate());i+=1;
            p.setString(i,DataBean.getDoc_id());i+=1;
            p.executeUpdate();
            p = null;
            p = con.prepareStatement("UPDATE d_product_analysis_detail SET "
                    + "value=?,spec_min=?,spec_max=?,unit=?,update_by=?,update_date=?,doc_type =? "
                    + "WHERE doc_id=? AND line_no=? AND delete_flag = 'N' AND complete_flag = 'N'");
            //objAL_Job = Copy_Detail(objAL_Job, con, DataBean);
            for(int loop=0;loop < objAL_Detail.size();loop++ ){
                p.setString(1, objAL_Detail.get(loop).getValue());
                p.setString(2, objAL_Detail.get(loop).getSpec_min());
                p.setString(3, objAL_Detail.get(loop).getSpec_max());
                p.setString(4, objAL_Detail.get(loop).getUnit());
                p.setString(5,DataBean.getBy());
                p.setTimestamp(6, DataBean.getDate());
                p.setString(7, objAL_Detail.get(loop).getCheck_value());
                p.setString(8, DataBean.getDoc_id());
                p.setString(9, objAL_Detail.get(loop).getLine_no());
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
    public void delete(DataBeanD_product_analysis_header DataBean)throws Exception{
        objStringQuery = new StringQuery();
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        PreparedStatement p = null;
        try{

            p = con.prepareStatement(objStringQuery.Flag_Status_String("delete_flag='Y',delete_by=?,delete_date=?", "d_product_analysis_header",
                    "WHERE doc_id = '"+DataBean.getDoc_id()+"' and delete_flag = 'N' and complete_flag = 'N'"));
            p.setString(1, DataBean.getBy());
            p.setTimestamp(2, DataBean.getDate());
            p.executeUpdate();
            p = con.prepareStatement(objStringQuery.Flag_Status_String("delete_flag='Y',delete_by=?,delete_date=?", "d_product_analysis_detail",
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

    public ArrayList<DataBeanD_product_analysis_detail> Copy_Detail(ArrayList<DataBeanD_product_analysis_detail> objAL,Connection con,DataBeanD_product_analysis_header DataBean)throws Exception{
        ResultSet rs = null;
        try{
            rs = con.createStatement().executeQuery("SELECT "
                    + "line_no,spec_min,spec_max,unit"
                    + " FROM d_job_order_detail "
                    + " Where doc_id ='"+DataBean.getProduction_id()+"' and delete_flag = 'N' and complete_flag = 'N'"
                    + " order by to_number(line_no,'999')");
            while(rs.next()){
                DataBeanD_product_analysis_detail Bean = new DataBeanD_product_analysis_detail();
                Bean.setLine_no(rs.getString("line_no"));
                Bean.setSpec_min(rs.getString("spec_min"));
                Bean.setSpec_max(rs.getString("spec_max"));
                Bean.setUnit(rs.getString("unit"));
                objAL.add(Bean);
            }
        }catch(Exception e){
            e.printStackTrace(System.out);
        }finally{
            if(rs != null){
                rs.close();
            }
            return objAL;
        }
    }
    public String Return_Text_Status(DataBeanD_product_analysis_header DataBean)throws Exception{
        DataBeanD_Status_id obj_bean_status = new DataBeanD_Status_id();
        objuti = new UtiDatabase();
        obj_bean_status.set_Int_status(objuti.Return_Check_Doc_id("d_product_analysis_header", "doc_id", DataBean.getDoc_id()));
        return obj_bean_status.get_Int_status();
    }
    
}
