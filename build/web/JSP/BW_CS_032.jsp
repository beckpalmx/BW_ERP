<%@page import="com.bw.bean.DataBeanD_product_analysis_detail"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bw.bean.UserBean"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.bw.Util.UtiDatabase"%>
<%@ page language="java" contentType="text/html; charset=TIS-620" pageEncoding="TIS-620"%>
<%@page import="com.bw.bean.DataBeanD_product_analysis_header"%>
<%@page import="com.bw.DB.D_product_analysis_headerDAO"%>
<%@page import="java.sql.Date"%>
<%@page import="com.bw.Util.ThaiUtil"%>
<%
            String[] request_String_name = new String[]
            {
                "A_doc_id",
                "A_doc_date",
                "A_doc_time",
                "A_shift",
                "A_p_type",
                "A_production_id",
                "A_product_lot_id",
                "A_lot_no",
                "A_size",
                "A_bag_no",
                "A_remark",
                "A_random_chk",
                "A_pass_chk",
                "A_not_pass_chk",
                "A_naocl_chk",
                "A_withdraw_chk",
                "A_approver_id",
                "A_check1",//Starch
                "A_check2",//whiteness
                "A_check3",//viscosity
                "A_check4",//fineness
                "A_check5",//fiber/pulp
                "A_check6",//hcn
                "A_check7",//mooiseture
                "A_check8",//ash
                "A_check9",//ph
                "A_check10",//so2
                "A_check11",//จุดดำ
                "A_check12",//mesh140
            };
            //JOptionPane.showConfirmDialog(null, request.getQueryString());
            ThaiUtil en = new ThaiUtil();
            DataBeanD_product_analysis_header objdb = new DataBeanD_product_analysis_header();
            D_product_analysis_headerDAO objex = new D_product_analysis_headerDAO();
            ArrayList<DataBeanD_product_analysis_detail> objAL_detail = new ArrayList<DataBeanD_product_analysis_detail>();
            UtiDatabase uti = new UtiDatabase();
            UserBean userbean = (UserBean) session.getAttribute("user");
            int statusck = 0,statusnum = 0,i = 0,num_detail=0;
            //----------------------------Chack Data----------------------------------------
            if (request.getParameter("D_status") == null && request.getParameter("Doc_id_check") == null) {
                statusnum = uti.numRowdatabase("SELECT Count(doc_id) As num from  d_product_analysis_header where doc_id = '" + en.EncodeTexttoTIS(request.getParameter("A_doc_id").trim()) + "' and delete_flag = 'N' and complete_flag = 'N'");
                if (statusnum == 0) {
                    if (uti.numRowdatabase("SELECT Count(doc_id) As num from  d_product_analysis_header where doc_id = '" + en.EncodeTexttoTIS(request.getParameter("A_doc_id").trim()) + "' and delete_flag = 'N' and complete_flag = 'Y'") == 1) {
                        statusck = -1;
                    } else {
                        statusck = 1;
                    }
                } else if (statusnum == 1) {
                    statusck = 2;
                } else {
                    statusck = -2;
                }

                //----------------------------SetData--------------------------------------
                if (statusck == 1 || (statusck == 2 && request.getParameter("confirm") != null)) {
                    objdb.setDoc_id(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setDoc_date(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setDoc_time(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setShift(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setP_type(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setProduction_id(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setProduct_lot_id(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setLot_no(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setSize(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setBag_no(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setRemark(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setRandoc_chk(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setPass_chk(request.getParameter(request_String_name[i])== null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setNot_pass_chk(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setNaocl_chk(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setWithdraw_chk(request.getParameter(request_String_name[i])== null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setApprover_id(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setStarch(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setWhiteness(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setViscosity(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setFineness(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setFiber_pulp(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setHcn(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setMooiseture(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setAsh(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setPh(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setSo2(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setSpot(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setMesh140(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setBy(userbean.getUsername());
                    objdb.setDate(new Timestamp(new java.util.Date().getTime()));
                    num_detail = uti.numRowdatabase("select count(doc_id) as num from d_job_order_detail  where doc_id = '"+objdb.getProduction_id()+"' and delete_flag = 'N' and complete_flag = 'N'");
                    for(int loop=1 ; loop <= num_detail ; loop++){
                        DataBeanD_product_analysis_detail DataBean_detail = new DataBeanD_product_analysis_detail();
                        DataBean_detail.setLine_no(Integer.toString(loop));
                        DataBean_detail.setSpec_min(en.EncodeTexttoTIS(request.getParameter("A_spec_min"+Integer.toString(loop))));
                        DataBean_detail.setSpec_max(en.EncodeTexttoTIS(request.getParameter("A_spec_max"+Integer.toString(loop))));
                        DataBean_detail.setValue(en.EncodeTexttoTIS(request.getParameter("A_value"+Integer.toString(loop))));
                        DataBean_detail.setUnit(en.EncodeTexttoTIS(request.getParameter("A_unit"+Integer.toString(loop))));
                        DataBean_detail.setCheck_value(en.EncodeTexttoTIS(request.getParameter("A_check"+Integer.toString(loop))));
                        objAL_detail.add(DataBean_detail);
                    }
                }
                //-------------------------------------------------------------------------

            } else if (request.getParameter("D_status") != null) {
                statusck = Integer.parseInt(request.getParameter("D_status"));
                objdb.setDoc_id(request.getParameter(request_String_name[0]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[0]).trim()));
                objdb.setBy(userbean.getUsername());
                objdb.setDate(new Timestamp(new java.util.Date().getTime()));
            }else if(request.getParameter("Doc_id_check") != null){
                statusck = Integer.parseInt(request.getParameter("Doc_id_check"));
                objdb.setDoc_id(request.getParameter(request_String_name[0]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[0]).trim()));
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
                    out.print(objex.Return_Text_Status(objdb));
                    break;
                default:
                    out.print("No Statment");
                    break;
            }

%>