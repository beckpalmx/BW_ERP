/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bw.DB;

import com.bw.Util.StringQuery;
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
public class D_product_not_quality_headerDAO {
    public void insert(DataBeanD_product_not_quality DataBean)throws Exception{
        String[] String_input = new String[]{
            "doc_id",
            "doc_date",
            "p_type",
            "create_by",
            "create_date"
        };
        String SQL = "";
        int i =1,start, row_page = 5, total = 0,line_no = 1;
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        PreparedStatement p = null;
        ResultSet rs = null;
        StringQuery objStringQuery = new StringQuery();
        UtiDatabase objuti = new UtiDatabase();
        D_product_not_quality_detailDAO obj_detail = new D_product_not_quality_detailDAO();
        ArrayList<DataBeanD_product_not_quality> objAL_Detail = new ArrayList<DataBeanD_product_not_quality>();
        try{
            p = con.prepareStatement(objStringQuery.Insert_String(String_input, "d_product_not_quality_header"));
            p.setString(i,DataBean.getDoc_id());i+=1;
            p.setString(i, DataBean.getDoc_date());i+=1;
            p.setString(i, DataBean.getP_type());i+=1;
            p.setString(i, DataBean.getBy());i+=1;
            p.setTimestamp(i, DataBean.getDate());i+=1;
            p.executeUpdate();
            p = null;
            total = objuti.numRowdatabase("SELECT count(doc_date) as num from d_product_analysis_header  where doc_date = '" + DataBean.getDoc_date() + "' and p_type = '"+DataBean.getP_type()+"' and   not_pass_chk = 'Y' and delete_flag = 'N' and complete_flag = 'N'");
            if(total != 0){
                int total_page = (int) Math.ceil((double) total / (double) row_page);
                for(int screen = 1;screen <= total_page;screen++ ){
                     if (screen >= 1 && screen <= total) {
                         start = (screen - 1) * row_page;
                         SQL = "select "
                            + "runno,doc_id,size,moisture,viscosity,ph_value,soft_pulp,whiteness,iron,so2,contamination,black_point,resolution "
                            + "from d_product_analysis_header "
                            + "where doc_date = '" + DataBean.getDoc_date() + "' and p_type = '"+DataBean.getP_type()+"'  and delete_flag = 'N' and complete_flag = 'N' "
                            + "order by  runno LIMIT " + row_page + " OFFSET " + start;
                         objAL_Detail = Select_product_not_quality(DataBean, objAL_Detail, SQL, rs, con);
                         line_no = obj_detail.insert(objAL_Detail, line_no, p, con);
                    }

                }
            }
        }catch(Exception e){
            e.printStackTrace(System.out);
        }finally{
            if(rs != null){
                rs.close();
            }
            if(p != null){
                p.close();
            }
            if(con != null){
                con.close();
            }
            if(!objAL_Detail.isEmpty()){
                objAL_Detail.clear();
            }
        }
    }
    public void update(DataBeanD_product_not_quality DataBean)throws Exception{
        String[] String_input = new String[]{
            "doc_date",
            "p_type",
            "update_by",
            "update_date"
        };
        String SQL = "";
        int i =1,start, row_page = 5, total = 0,line_no = 1;
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        PreparedStatement p = null;
        ResultSet rs = null;
        StringQuery objStringQuery = new StringQuery();
        UtiDatabase objuti = new UtiDatabase();
        D_product_not_quality_detailDAO obj_detail = new D_product_not_quality_detailDAO();
        ArrayList<DataBeanD_product_not_quality> objAL_Detail = new ArrayList<DataBeanD_product_not_quality>();
        try{
            p = con.prepareStatement(objStringQuery.Update_String(String_input, "d_product_not_quality_header","Where doc_id = ? and delete_flag = 'N' and complete_flag = 'N'"));
            p.setString(i, DataBean.getDoc_date());i+=1;
            p.setString(i, DataBean.getP_type());i+=1;
            p.setString(i, DataBean.getBy());i+=1;
            p.setTimestamp(i, DataBean.getDate());i+=1;
            p.setString(i,DataBean.getDoc_id());i+=1;
            p.executeUpdate();
            p = null;
            Delete_Detail(DataBean.getDoc_id(),p,con);
            total = objuti.numRowdatabase("SELECT count(doc_date) as num from d_product_analysis_header  where doc_date = '" + DataBean.getDoc_date() + "' and p_type = '"+DataBean.getP_type()+"' and   not_pass_chk = 'Y' and delete_flag = 'N' and complete_flag = 'N'");
            if(total != 0){
                int total_page = (int) Math.ceil((double) total / (double) row_page);
                for(int screen = 1;screen <= total_page;screen++ ){
                     if (screen >= 1 && screen <= total) {
                         start = (screen - 1) * row_page;
                         SQL = "select "
                            + "runno,doc_id,size,moisture,viscosity,ph_value,resolution,soft_pulp,whiteness,iron,so2,contamination,black_point,resolution "
                            + "from d_product_analysis_header "
                            + "where doc_date = '" + DataBean.getDoc_date() + "' and p_type = '"+DataBean.getP_type()+"' and not_pass_chk = 'Y' and delete_flag = 'N' and complete_flag = 'N' "
                            + "order by  runno LIMIT " + row_page + " OFFSET " + start;
                         objAL_Detail = Select_product_not_quality(DataBean, objAL_Detail, SQL, rs, con);
                         line_no = obj_detail.insert(objAL_Detail, line_no, p, con);
                    }

                }
            }
        }catch(Exception e){
            e.printStackTrace(System.out);
        }finally{

        }
    }
    public ArrayList<DataBeanD_product_not_quality> Select_product_not_quality(DataBeanD_product_not_quality obj_Bean,ArrayList<DataBeanD_product_not_quality> objAL_input,String SQL,ResultSet rs,Connection con)throws Exception{
        UtiDatabase objuti = new UtiDatabase();
        try{
            if(!objAL_input.isEmpty()){
                objAL_input.clear();
            }
            rs = con.createStatement().executeQuery(SQL);
            while(rs.next()){
                DataBeanD_product_not_quality DataBean = new DataBeanD_product_not_quality();
                DataBean.setDoc_id(obj_Bean.getDoc_id());
                DataBean.setDoc_date(obj_Bean.getDoc_date());
                DataBean.setP_type(obj_Bean.getP_type());
                DataBean.setBy(obj_Bean.getBy());
                DataBean.setDate(obj_Bean.getDate());
                DataBean.setProduct_lot_id(objuti.NotNull(rs.getString("doc_id")));
                DataBean.setWeight(objuti.NotNull(rs.getString("size")));
                DataBean.setMoisture(objuti.NotNull(rs.getString("moisture")));
                DataBean.setViscosity(objuti.NotNull(rs.getString("viscosity")));
                DataBean.setPh_value(objuti.NotNull(rs.getString("ph_value")));
                DataBean.setResolution(objuti.NotNull(rs.getString("resolution")));
                DataBean.setSoft_pulp(objuti.NotNull(rs.getString("soft_pulp")));
                DataBean.setWhiteness(objuti.NotNull(rs.getString("whiteness")));
                DataBean.setSo2(objuti.NotNull(rs.getString("so2")));
                DataBean.setIron(objuti.NotNull(rs.getString("iron")));
                DataBean.setContamination(objuti.NotNull(rs.getString("contamination")));
                DataBean.setBlack_point(objuti.NotNull(rs.getString("black_point")));
                objAL_input.add(DataBean);
            }
        }catch(Exception e){
            e.printStackTrace(System.out);
        }finally{
            if(rs != null){
                rs = null;
            }
            return  objAL_input;
        }
    }
    public void Delete_Detail(String doc_id,PreparedStatement p,Connection con)throws Exception{
        try{
            p = con.prepareStatement("DELETE FROM  d_product_not_quality_detail where doc_id ='"+doc_id+"' and delete_flag = 'N' and complete_flag = 'N'");
            p.executeUpdate();
        }catch(Exception e){
            e.printStackTrace(System.out);
        }finally{
            if(p != null){
                p = null;
            }
        }
    }
}
