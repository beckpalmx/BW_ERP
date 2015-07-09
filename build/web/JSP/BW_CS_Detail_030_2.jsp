<%@page import="com.bw.bean.UserBean"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.bw.Util.UtiDatabase"%>
<%@page import="com.bw.DB.D_product_pack_headerDAO"%>
<%@page import="com.bw.bean.DataBeanD_product_pack_header"%>
<%@page import="com.bw.Util.ThaiUtil"%>
<%@page language="java" contentType="text/html; charset=TIS-620" pageEncoding="TIS-620"%>
<%
            String[] request_String_name = new String[]
            {
                "A_doc_id",
                "sum_withdraw_tot_weight",
                "sum_prod_tot_weight"
            };
            ThaiUtil en = new ThaiUtil();
            DataBeanD_product_pack_header objdb = new DataBeanD_product_pack_header();
            D_product_pack_headerDAO objex = new D_product_pack_headerDAO();
            UtiDatabase uti = new UtiDatabase();
            UserBean userbean = (UserBean) session.getAttribute("user");
            int statusck = 0;
            int statusnum = 0;
            int i = 0;
//----------------------------Chack Data----------------------------------------
            if (request.getParameter("D_status") == null) {
                statusnum = uti.numRowdatabase("SELECT Count(doc_id) As num from  d_product_pack_header where doc_id = '" + en.EncodeTexttoTIS(request.getParameter("A_doc_id").trim()) + "' and delete_flag = 'N' and complete_flag = 'N'");
                if (statusnum == 0) {
                    if (uti.numRowdatabase("SELECT Count(doc_id) As num from  d_product_pack_header where doc_id = '" + en.EncodeTexttoTIS(request.getParameter("A_doc_id").trim()) + "' and delete_flag = 'N' and complete_flag = 'Y'") == 1) {
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
                if (statusck == 1 || (statusck == 2 )) {
                    objdb.setDoc_id(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setWithdraw_tot_weight(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setProd_tot_weight(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setBy(userbean.getUsername());
                    objdb.setDate(new Timestamp(new java.util.Date().getTime()));


                }
                //-------------------------------------------------------------------------

            } else if (request.getParameter("D_status") != null) {
                statusck = Integer.parseInt(request.getParameter("D_status"));
                objdb.setDoc_id(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));
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
                    objex.insert(objdb);
                    out.print("บันทึกสำเร็จ");
                    break;
                case 2:
                    //if (request.getParameter("confirm") != null && request.getParameter("confirm").equals("true")) {
                        objex.update(objdb);
                        out.print("แก้ไขสำเร็จ");
                        /*
                    } else {
                        out.print("edit");
                    }*/
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
