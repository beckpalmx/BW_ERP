<%@page import="java.util.ArrayList"%>
<%@page import="com.bw.bean.UserBean"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.bw.Util.UtiDatabase"%>
<%@ page language="java" contentType="text/html; charset=TIS-620" pageEncoding="TIS-620"%>
<%@page import="com.bw.bean.DataBeanM_product_spec"%>
<%@page import="com.bw.DB.M_product_specDAO"%>
<%@page import="java.sql.Date"%>
<%@page import="com.bw.Util.ThaiUtil"%>

<%

            ThaiUtil en = new ThaiUtil();
            DataBeanM_product_spec objdb = new DataBeanM_product_spec();
            ArrayList<DataBeanM_product_spec>objAL_detail = new ArrayList<DataBeanM_product_spec>();
            M_product_specDAO objex = new M_product_specDAO();
            UtiDatabase uti = new UtiDatabase();
            UserBean userbean = (UserBean) session.getAttribute("user");
            int statusck = 0;
            int statusnum = 0;
            int i = 0;
            //----------------------------Chack Data----------------------------------------
            if (request.getParameter("D_status") == null) {
                statusnum = uti.numRowdatabase("SELECT Count(spec_id) As num from  m_product_spec_header where spec_id = '" + en.EncodeTexttoTIS(request.getParameter("A_spec_id").trim()) + "' and delete_flag = 'N' and complete_flag = 'N'");
                if (statusnum == 0) {
                    statusck = 1;
                } else if (statusnum == 1) {
                    statusck = 2;
                } else {
                    statusck = -2;
                }

                //----------------------------SetData--------------------------------------
                if (statusck == 1 || (statusck == 2 && request.getParameter("confirm") != null) ) {
                    objdb.setSpac_id(en.EncodeTexttoTIS(request.getParameter("A_spec_id")));
                    objdb.setRemark(en.EncodeTexttoTIS(request.getParameter("A_remark")));
                    objdb.setName_t(en.EncodeTexttoTIS(request.getParameter("A_name_t")));
                    objdb.setBy(userbean.getUsername());
                    objdb.setDate(new Timestamp(new java.util.Date().getTime()));
                    for(int loop=1 ; loop <= 12; loop++){
                        DataBeanM_product_spec DataBean_detail = new DataBeanM_product_spec();
                        DataBean_detail.setLine_no(Integer.toString(loop));
                        DataBean_detail.setParam(en.EncodeTexttoTIS(request.getParameter("param"+Integer.toString(loop))));
                        DataBean_detail.setSpac_min(en.EncodeTexttoTIS(request.getParameter("spec_min"+Integer.toString(loop))));
                        DataBean_detail.setSpac_max(en.EncodeTexttoTIS(request.getParameter("spec_max"+Integer.toString(loop))));
                        DataBean_detail.setUnit(en.EncodeTexttoTIS(request.getParameter("P_add_desc"+Integer.toString(loop))));
                        objAL_detail.add(DataBean_detail);
                    }
                }
                //-------------------------------------------------------------------------

            } else if (request.getParameter("D_status") != null) {
                statusck = Integer.parseInt(request.getParameter("D_status"));
                objdb.setSpac_id(request.getParameter("A_spec_id"));
                objdb.setBy(userbean.getUsername());
                objdb.setDate(new Timestamp(new java.util.Date().getTime()));
            }

            //------------------------------------Case Command-----------------------------

            //--------------1 = insert
            //--------------2 = update แต่การ update จะต้องมีการส่งพารามิเตอร์ที่ชื่อ confirm กับมาก่อนถึงจะสามารถ update ได้
            //--------------3 = delete
            switch (statusck) {
                case -1:
                    out.print("ไม่สามารถบันทึกข้อมูลนี้ได้เนื่องจากมีเลขที่เอกสารที่สมบูรณ์แล้ว");
                    break;
                case 1:
                    objex.insert(objdb,objAL_detail);
                    out.print("บันทึกสำเร็จ");
                    if(!objAL_detail.isEmpty()){
                        objAL_detail.clear();
                    }
                    break;
                case 2:
                    if (request.getParameter("confirm") != null && request.getParameter("confirm").equals("true")) {
                        objex.update(objdb,objAL_detail);
                        out.print("แก้ไขสำเร็จ");
                        if(!objAL_detail.isEmpty()){
                        objAL_detail.clear();
                        }
                    } else {
                        out.print("edit");
                    }
                    break;
                case 3:
                    objex.delete(objdb);
                    out.print("ลบข้อมูลสำเร็จ");
                    break;
                case 4:
                    break;
                default:
                    out.print("No Statment");
                    break;
            }

%>