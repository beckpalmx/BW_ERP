<%@page import="com.bw.bean.UserBean"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.bw.Util.UtiDatabase"%>
<%@page import="com.bw.DB.D_product_accept_confirm_detailDAO"%>
<%@page import="com.bw.bean.DataBeanD_product_accept_detail"%>
<%@page import="com.bw.Util.ThaiUtil"%>
<%@page language="java" contentType="text/html; charset=TIS-620" pageEncoding="TIS-620"%>
<%
            String[] request_String_name = new String[]
            {
                "A_doc_id",
                "A_amount",
                "A_remark",
                "A_wh_in"
            };
            ThaiUtil en = new ThaiUtil();
            DataBeanD_product_accept_detail objdb = new DataBeanD_product_accept_detail();
            D_product_accept_confirm_detailDAO objex = new D_product_accept_confirm_detailDAO();
            UtiDatabase uti = new UtiDatabase();
            UserBean userbean = (UserBean) session.getAttribute("user");
            int statusck = 0;
            int statusnum = 0;
            int i = 0;

            if (request.getParameter("I_status") != null) {
                if (uti.numRowdatabase("Select Count(doc_id) As num from  d_product_accept_confirm_detail where doc_id = '" + en.EncodeTexttoTIS(request.getParameter("A_doc_id").trim()) + "' and delete_flag = 'N' and complete_flag = 'Y'") != 0) {
                    statusck = -1;
                } else {
                    statusck = 1;
                    statusnum = uti.numRowdatabase("Select Count(doc_id) As num from  d_product_accept_confirm_detail where doc_id = '" + en.EncodeTexttoTIS(request.getParameter("A_doc_id").trim()) + "' and delete_flag = 'N' and complete_flag = 'N'");
                    objdb.setLine_no(Integer.toString(statusnum + 1));
                }
            } else if (request.getParameter("U_status") != null) {
                statusck = 2;
                objdb.setLine_no(request.getParameter("A_line_no"));

            } else if (request.getParameter("D_status") != null) {
                statusck = Integer.parseInt(request.getParameter("D_status"));
                objdb.setDoc_id(request.getParameter(request_String_name[0]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[0]).trim()));
                objdb.setBy(userbean.getUsername());
                objdb.setDate(new Timestamp(new java.util.Date().getTime()));
            } else {
                statusck = -1;
            }
            //----------------------------SetData--------------------------------------
            if (statusck == 1 || statusck == 2) {
                objdb.setDoc_id(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                objdb.setAmount(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                objdb.setRemark(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                objdb.setWh_id(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                objdb.setBy(userbean.getUsername());
                objdb.setDate(new Timestamp(new java.util.Date().getTime()));
            }
                //-------------------------------------------------------------------------

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
                    objex.update(objdb);
                    out.print("แก้ไขสำเร็จ");
                    break;
                case 3:
                    if(request.getParameter("ckbox") != null && !request.getParameter("ckbox").equals("")){
                        objex.Delete_line_no(request.getParameter("ckbox"), objdb, "d_product_accept_detail");
                    }else if(request.getParameter("chk_all") != null){
                        objex.Delete_all_line_no(objdb, "d_product_accept_detail");
                    }
                    break;
                case 4:
                    break;
                default:
                    out.print("No Statment");
            }

%>
