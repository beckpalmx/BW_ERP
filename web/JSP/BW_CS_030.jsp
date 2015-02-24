<%@page import="com.bw.Util.Runer_Doc_id"%>
<%@page import="com.bw.bean.UserBean"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.bw.Util.UtiDatabase"%>
<%@page import="com.bw.DB.D_production_headerDAO"%>
<%@page import="com.bw.bean.DataBeanD_production_header"%>
<%@page import="com.bw.Util.ThaiUtil"%>
<%@ page language="java" contentType="text/html; charset=TIS-620" pageEncoding="TIS-620"%>
<%
            String[] request_String_name = new String[]
            {
                "A_doc_id",
                "A_doc_date",
                "A_roast_qty",
                "A_pack_qty",
                "A_date_1",
                "A_date_2",
                "A_date_3",
                "A_date_4",
                "A_percent_p1",
                "A_percent_p2",
                "A_percent_p3",
                "A_percent_p4",
                "A_percent_y1",
                "A_percent_y2",
                "A_percent_y3",
                "A_percent_y4",
                "A_reporter_id",
                "A_checker_id",
                "A_approver_id",
                "A_date_5",
                "A_date_6",
                "A_date_7",
                "A_date_8"
            };
            UserBean userbean = (UserBean) session.getAttribute("user");
            ThaiUtil en = new ThaiUtil();
            DataBeanD_production_header objdb = new DataBeanD_production_header();
            D_production_headerDAO objex = new D_production_headerDAO();
            UtiDatabase uti = new UtiDatabase();
            int statusck = 0;
            int statusnum = 0;
            int i = 0;
            //----------------------------Chack Data----------------------------------------
            if (request.getParameter("D_status") == null && request.getParameter("status_calculator") == null) {
                statusnum = uti.numRowdatabase("SELECT Count(doc_id) As num from  d_production_header where doc_id = '" + en.EncodeTexttoTIS(request.getParameter("A_doc_id").trim()) + "' and delete_flag = 'N' and complete_flag = 'N'");
                if (statusnum == 0) {
                    if (uti.numRowdatabase("SELECT Count(doc_id) As num from  d_production_header where doc_id = '" + en.EncodeTexttoTIS(request.getParameter("A_doc_id").trim()) + "' and delete_flag = 'N' and complete_flag = 'Y'") == 1) {
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
                    objdb.setRoast_qty(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setPack_qty(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setDate_1(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setDate_2(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setDate_3(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setDate_4(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setPercent_p1(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setPercent_p2(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setPercent_p3(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setPercent_p4(request.getParameter(request_String_name[i])== null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setPercent_y1(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setPercent_y2(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setPercent_y3(request.getParameter(request_String_name[i])== null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setPercent_y4(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setReporter_id(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setChecker_id(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setApprove_id(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setDate_5(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setDate_6(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setDate_7(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setDate_8(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setBy(userbean.getUsername());
                    objdb.setDate(new Timestamp(new java.util.Date().getTime()));


                }
                //-------------------------------------------------------------------------

            } else if (request.getParameter("D_status") != null) {
                statusck = Integer.parseInt(request.getParameter("D_status"));
                objdb.setDoc_id(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));
                objdb.setBy(userbean.getUsername());
                objdb.setDate(new Timestamp(new java.util.Date().getTime()));
            }else if(request.getParameter("status_calculator") != null){
                statusck = Integer.parseInt(request.getParameter("status_calculator"));
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
                    objdb.setDoc_id(new Runer_Doc_id().Run_id("d_production_header",objdb.getDoc_date()));
                    objex.insert(objdb);
                    out.print("บันทึกสำเร็จ");
                    break;
                case 2:
                    if (request.getParameter("confirm") != null && request.getParameter("confirm").equals("true")) {
                        objex.update(objdb);
                        out.print("แก้ไขสำเร็จ");
                    } else {
                        out.print("edit");
                    }
                    break;
                case 3:
                    objex.delete(objdb);
                    out.print("ลบข้อมูลสำเร็จ");
                    break;
                case 4:
                    out.print(objex.getValue_Yield(request.getParameter("A_date_from"), request.getParameter("A_date_to")));
                    break;
                default:
                    out.print("No Statment");
                    break;
            }

%>
