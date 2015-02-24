<%@page import="com.bw.bean.UserBean"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.bw.Util.UtiDatabase"%>
<%@page import="com.bw.DB.D_product_report_daily_stop_millingDAO"%>
<%@page import="com.bw.bean.DataBeanD_product_report_daily_detail_stop_milling"%>
<%@page import="com.bw.Util.ThaiUtil"%>
<%@page language="java" contentType="text/html; charset=TIS-620" pageEncoding="TIS-620"%>
<%
            String[] request_String_name = new String[]
            {
                "A_doc_id",
                "A_sm_from_date",
                "A_sm_from_time",
                "A_sm_to_date",
                "A_sm_to_time",
                "A_sm_stop_hour",
                "A_kw_start",
                "A_kw_end",
                "A_kw_rest"
            };
            ThaiUtil en = new ThaiUtil();
            DataBeanD_product_report_daily_detail_stop_milling objdb = new DataBeanD_product_report_daily_detail_stop_milling();
            D_product_report_daily_stop_millingDAO objex = new D_product_report_daily_stop_millingDAO();
            UtiDatabase uti = new UtiDatabase();
            UserBean userbean = (UserBean) session.getAttribute("user");
            int statusck = 0;
            int statusnum = 0;
            int i = 0;

            if (request.getParameter("I_status") != null) {
                if (uti.numRowdatabase("Select Count(doc_id) As num from  d_product_report_daily_detail_stop_milling where doc_id = '" + en.EncodeTexttoTIS(request.getParameter("A_doc_id").trim()) + "' and delete_flag = 'N' and complete_flag = 'Y'") != 0) {
                    statusck = -1;
                } else {
                    statusck = 1;
                    statusnum = uti.numRowdatabase("Select Count(doc_id) As num from  d_product_report_daily_detail_stop_milling where doc_id = '" + en.EncodeTexttoTIS(request.getParameter("A_doc_id").trim()) + "' and delete_flag = 'N' and complete_flag = 'N'");
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
                objdb.setSm_from_date(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                objdb.setSm_from_time(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                objdb.setSm_to_date(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                objdb.setSm_to_time(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                objdb.setSm_stop_hour(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                objdb.setKw_start(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                objdb.setKw_end(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                objdb.setKw_rest(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
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
                        objex.Delete_line_no(request.getParameter("ckbox"), objdb, "d_product_report_daily_detail_stop_milling");
                    }else if(request.getParameter("chk_all") != null){
                        objex.Delete_all_line_no(objdb, "d_product_report_daily_detail_stop_milling");
                    }
                    break;
                case 4:
                    break;
                default:
                    out.print("No Statment");
            }

%>
