/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bw.DB;

import com.bw.bean.DataBeanD_job_order_header;
import com.bw.Util.StringQuery;
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
public class D_job_order_headerDAO {
    private UtiDatabase objuti;
    private StringQuery objStringQuery ;
    public void insert(DataBeanD_job_order_header DataBean)throws Exception{
        String[] String_input = new String[]{
            "doc_id",
            "doc_date",
            "po_no",
            "send_date_from",
            "send_date_to",
            "cust_id",
            "initial",
            "lot_no",
            "po_cust",
            "payment_condition",
            "spc_order",
            "product_id",
            "weight_content",
            "prd_qty",
            "bag_qty",
            "content",
            "bag_weight",
            "spec_id",
            "so2",
            "adding",
            "adding_qty",
            "remark_adding",
            "mark_sign",
            "mark_sign_desc",
            "remark",
            "base_plate",
            "base_plate_qty",
            "wrap_on_pallet",
            "pallet_qty",
            "reporter_id",
            "approver_id",
            "quality_id",
            "production_id",
            "account_id",
            "create_by",
            "create_date",
            "update_date"
        };
        objuti = new UtiDatabase();
        objStringQuery = new StringQuery();
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        PreparedStatement p = null;
        int i = 1;
        ArrayList<DataBeanM_product_spec> objAL_Spec = new ArrayList<DataBeanM_product_spec>();
        try{
            p = con.prepareStatement(objStringQuery.Insert_String(String_input, "d_job_order_header"));
            p.setString(i,DataBean.getDoc_id());i+=1;
            p.setString(i, DataBean.getDoc_date());i+=1;
            p.setString(i, DataBean.getPo_no());i+=1;
            p.setString(i, DataBean.getSend_date_from());i+=1;
            p.setString(i, DataBean.getSend_date_to());i+=1;
            p.setString(i, DataBean.getCust_id());i+=1;
            p.setString(i, DataBean.getInitial());i+=1;
            p.setString(i, DataBean.getLot_no());i+=1;
            p.setString(i, DataBean.getPo_cust());i+=1;
            p.setString(i, DataBean.getPayment_condition());i+=1;
            p.setString(i, DataBean.getSpc_order());i+=1;
            p.setString(i, DataBean.getProduct_id());i+=1;
            p.setString(i, DataBean.getWeight_content());i+=1;
            p.setString(i, DataBean.getPrd_qty());i+=1;
            p.setString(i, DataBean.getBag_qty());i+=1;
            p.setString(i, DataBean.getContent());i+=1;
            p.setString(i, DataBean.getBag_weight());i+=1;
            p.setString(i, DataBean.getSpec_id());i+=1;
            p.setString(i, DataBean.getSo2());i+=1;
            p.setString(i, DataBean.getAdding());i+=1;
            p.setString(i, DataBean.getAdding_qty());i+=1;
            p.setString(i, DataBean.getRemark_adding());i+=1;
            p.setString(i, DataBean.getMark_sign());i+=1;
            p.setString(i, DataBean.getMark_sign_desc());i+=1;
            p.setString(i, DataBean.getRemark());i+=1;
            p.setString(i, DataBean.getBase_plate());i+=1;
            p.setString(i, DataBean.getBase_plate_qty());i+=1;
            p.setString(i, DataBean.getWrap_on_pallet());i+=1;
            p.setString(i, DataBean.getPallet_qty());i+=1;
            p.setString(i, DataBean.getReporter_id());i+=1;
            p.setString(i, DataBean.getApprover_id());i+=1;
            p.setString(i, DataBean.getQuality_id());i+=1;
            p.setString(i, DataBean.getProduction_id());i+=1;
            p.setString(i, DataBean.getAccount_id());i+=1;
            p.setString(i, DataBean.getBy());i+=1;
            p.setTimestamp(i, DataBean.getDate());i+=1;
            p.setTimestamp(i, DataBean.getDate());i+=1;
            p.executeUpdate();
            p = null;
            p = con.prepareStatement("INSERT INTO d_job_order_detail"
                    + "(doc_id,doc_date,line_no,param,spec_min,spec_max,unit,create_by,create_date,update_date,spec_id) "
                    + "VALUES(?,?,?,?,?,?,?,?,?,?,?)");
            objAL_Spec = Copy_Detail(objAL_Spec, con, DataBean);
            for(int loop=0;loop < objAL_Spec.size();loop++ ){
                p.setString(1, DataBean.getDoc_id());
                p.setString(2, DataBean.getDoc_date());
                p.setString(3, objAL_Spec.get(loop).getLine_no());
                p.setString(4, objAL_Spec.get(loop).getParam());
                p.setString(5, objAL_Spec.get(loop).getSpac_min());
                p.setString(6, objAL_Spec.get(loop).getSpac_max());
                p.setString(7, objAL_Spec.get(loop).getUnit());
                p.setString(8, DataBean.getBy());
                p.setTimestamp(9, DataBean.getDate());
                p.setTimestamp(10, DataBean.getDate());
                p.setString(11, DataBean.getSpec_id());
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
            if(!objAL_Spec.isEmpty()){
                objAL_Spec.clear();
            }
        }
    }
    public void update(DataBeanD_job_order_header DataBean)throws Exception{
        String[] String_input = new String[]{
            "doc_date",
            "po_no",
            "send_date_from",
            "send_date_to",
            "cust_id",
            "initial",
            "lot_no",
            "po_cust",
            "payment_condition",
            "spc_order",
            "product_id",
            "weight_content",
            "prd_qty",
            "bag_qty",
            "content",
            "bag_weight",
            "spec_id",
            "so2",
            "adding",
            "adding_qty",
            "remark_adding",
            "mark_sign",
            "mark_sign_desc",
            "remark",
            "base_plate",
            "base_plate_qty",
            "wrap_on_pallet",
            "pallet_qty",
            "reporter_id",
            "approver_id",
            "quality_id",
            "production_id",
            "account_id",
            "update_by",
            "update_date"
        };
        objuti = new UtiDatabase();
        objStringQuery = new StringQuery();
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        PreparedStatement p = null;
        //ArrayList<DataBeanM_product_spec> objAL_Spec = new ArrayList<DataBeanM_product_spec>();
        int i = 1;
        try{
            p = con.prepareStatement(objStringQuery.Update_String(String_input, "d_job_order_header","WHERE doc_id = ? and delete_flag = 'N' and complete_flag = 'N'"));
            p.setString(i, DataBean.getDoc_date());i+=1;
            p.setString(i, DataBean.getPo_no());i+=1;
            p.setString(i, DataBean.getSend_date_from());i+=1;
            p.setString(i, DataBean.getSend_date_to());i+=1;
            p.setString(i, DataBean.getCust_id());i+=1;
            p.setString(i, DataBean.getInitial());i+=1;
            p.setString(i, DataBean.getLot_no());i+=1;
            p.setString(i, DataBean.getPo_cust());i+=1;
            p.setString(i, DataBean.getPayment_condition());i+=1;
            p.setString(i, DataBean.getSpc_order());i+=1;
            p.setString(i, DataBean.getProduct_id());i+=1;
            p.setString(i, DataBean.getWeight_content());i+=1;
            p.setString(i, DataBean.getPrd_qty());i+=1;
            p.setString(i, DataBean.getBag_qty());i+=1;
            p.setString(i, DataBean.getContent());i+=1;
            p.setString(i, DataBean.getBag_weight());i+=1;
            p.setString(i, DataBean.getSpec_id());i+=1;
            p.setString(i, DataBean.getSo2());i+=1;
            p.setString(i, DataBean.getAdding());i+=1;
            p.setString(i, DataBean.getAdding_qty());i+=1;
            p.setString(i, DataBean.getRemark_adding());i+=1;
            p.setString(i, DataBean.getMark_sign());i+=1;
            p.setString(i, DataBean.getMark_sign_desc());i+=1;
            p.setString(i, DataBean.getRemark());i+=1;
            p.setString(i, DataBean.getBase_plate());i+=1;
            p.setString(i, DataBean.getBase_plate_qty());i+=1;
            p.setString(i, DataBean.getWrap_on_pallet());i+=1;
            p.setString(i, DataBean.getPallet_qty());i+=1;
            p.setString(i, DataBean.getReporter_id());i+=1;
            p.setString(i, DataBean.getApprover_id());i+=1;
            p.setString(i, DataBean.getQuality_id());i+=1;
            p.setString(i, DataBean.getProduction_id());i+=1;
            p.setString(i, DataBean.getAccount_id());i+=1;
            p.setString(i, DataBean.getBy());i+=1;
            p.setTimestamp(i, DataBean.getDate());i+=1;
            p.setString(i,DataBean.getDoc_id());i+=1;
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
    public void delete(DataBeanD_job_order_header DataBean)throws Exception{
        objStringQuery = new StringQuery();
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        PreparedStatement p = null;
        try{

            p = con.prepareStatement(objStringQuery.Flag_Status_String("delete_flag='Y',delete_by=?,delete_date=?", "d_job_order_header",
                    "WHERE doc_id = '"+DataBean.getDoc_id()+"' and delete_flag = 'N' and complete_flag = 'N'"));
            p.setString(1, DataBean.getBy());
            p.setTimestamp(2, DataBean.getDate());
            p.executeUpdate();
            p = con.prepareStatement(objStringQuery.Flag_Status_String("delete_flag='Y',delete_by=?,delete_date=?", "d_job_order_detail",
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

    private  ArrayList<DataBeanM_product_spec> Copy_Detail(ArrayList<DataBeanM_product_spec> objAL,Connection con,DataBeanD_job_order_header DataBean)throws Exception{
        objuti = new UtiDatabase();
        ResultSet rs = null;
        try{
            rs = con.createStatement().executeQuery("SELECT "
                    + "line_no,param,spec_min,spec_max,unit"
                    + " FROM m_product_spec_detail "
                    + " Where spec_id ='"+DataBean.getSpec_id()+"' and delete_flag = 'N'"
                    + " order by to_number(line_no,'999')");
            while(rs.next()){
                DataBeanM_product_spec Bean = new DataBeanM_product_spec();
                Bean.setLine_no(rs.getString("line_no"));
                Bean.setParam(rs.getString("param"));
                Bean.setSpac_min(rs.getString("spec_min"));
                Bean.setSpac_max(rs.getString("spec_max"));
                Bean.setUnit(objuti.NotNull(rs.getString("unit"),""));
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
}
