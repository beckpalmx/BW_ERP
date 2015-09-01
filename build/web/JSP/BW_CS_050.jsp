<%@page import="com.bw.Util.Runer_Doc_id"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bw.bean.DataBeanD_product_accept_detail"%>
<%@page import="com.bw.bean.UserBean"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.bw.Util.UtiDatabase"%>
<%@page import="com.bw.DB.D_product_accept_headerDAO"%>
<%@page import="com.bw.bean.DataBeanD_product_accept_header"%>
<%@page import="com.bw.Util.ThaiUtil"%>
<%@page language="java" contentType="text/html; charset=TIS-620" pageEncoding="TIS-620"%>
<%

    String[] request_String_name = new String[]
            {
                "A_company_id",
                "A_doc_id",
                "A_doc_date",
                "A_doc_time",
                "A_dp_id",
                "A_reporter_id",
                "A_approver_id",
                "A_complete_flag",
                "A_wh_leader_id",
                "A_account_id"          
            };
    ArrayList<DataBeanD_product_accept_detail> objAL = new  ArrayList<DataBeanD_product_accept_detail>();
    ThaiUtil en = new ThaiUtil();
            DataBeanD_product_accept_header objdb = new DataBeanD_product_accept_header();
            D_product_accept_headerDAO objex = new D_product_accept_headerDAO();
            UtiDatabase uti = new UtiDatabase();
            Runer_Doc_id objrunno = new Runer_Doc_id();
            UserBean userbean = (UserBean) session.getAttribute("user");
            int statusck = 0;//เลือกการทำงาน
            int statusnum = 0;//นับ row ของข้อมูล
            int i = 0,maxline = 0;
            if (request.getParameter("D_status") == null && request.getParameter("status_runid") == null) {
                statusnum = uti.numRowdatabase("SELECT Count(doc_id) As num from  d_product_accept_suppliers_header where doc_id = '" + en.EncodeTexttoTIS(request.getParameter("A_doc_id").trim()) + "' and delete_flag = 'N' and complete_flag = 'N'");
                if (statusnum == 0) {
                    if (uti.numRowdatabase("SELECT Count(doc_id) As num from  d_product_accept_suppliers_header where doc_id = '" + en.EncodeTexttoTIS(request.getParameter("A_doc_id").trim()) + "' and delete_flag = 'N' and complete_flag = 'Y'") == 1) {
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
                    if(statusck == 1){
                        maxline = Integer.parseInt(request.getParameter("maxline"));
                    }
                    objdb.setCompany_id(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setDoc_id(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setDoc_date(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setDoc_time(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setDp_id(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setReporter_id(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setApprover_id(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setComplete_flag(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setWh_leader_id(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setAccount_id(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;                    
                    objdb.setBy(userbean.getUsername());
                    objdb.setDate(new Timestamp(new java.util.Date().getTime()));
                    if(statusck == 1){
                        for(int loop=1 ;loop <= maxline;loop++){
                            DataBeanD_product_accept_detail bean = new DataBeanD_product_accept_detail();
                            bean.setLine_no(Integer.toString(loop));
                            bean.setProduct_id(en.EncodeTexttoTIS(request.getParameter("P_product_id_"+loop)));
                            bean.setWh_id(en.EncodeTexttoTIS(request.getParameter("P_wh_id_"+loop)));
                            bean.setShift(en.EncodeTexttoTIS(request.getParameter("P_shift_"+loop)));
                            bean.setWeight(en.EncodeTexttoTIS(request.getParameter("P_weight_"+loop)));
                            bean.setQuantity(en.EncodeTexttoTIS(request.getParameter("P_quantity_"+loop)));
                            bean.setBag_qty(en.EncodeTexttoTIS(request.getParameter("P_bag_"+loop)));
                            bean.setRemark(en.EncodeTexttoTIS(request.getParameter("P_remark_"+loop)));
                            System.out.println("P_price_unit_" + loop + " = " + request.getParameter("P_price_unit_"+loop));
                            System.out.println("P_total_price_" + loop + " = " + request.getParameter("P_total_price_"+loop));
                            bean.setPrice_unit(request.getParameter("P_price_unit_"+loop).equals("")||request.getParameter("P_price_unit_"+loop)==null ? "0" : request.getParameter("P_price_unit_"+loop));
                            bean.setTotal_price(request.getParameter("P_total_price_"+loop).equals("")||request.getParameter("P_total_price_"+loop)==null ? "0" : request.getParameter("P_total_price_"+loop));
                            objAL.add(bean);
                        }
                    }

                }
                //-------------------------------------------------------------------------

            } else if (request.getParameter("D_status") != null) {
                statusck = Integer.parseInt(request.getParameter("D_status"));
                objdb.setDoc_id(request.getParameter(request_String_name[1]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[1]).trim()));
                objdb.setBy(userbean.getUsername());
                objdb.setDate(new Timestamp(new java.util.Date().getTime()));
            }else if(request.getParameter("status_runid") != null){
                statusck = Integer.parseInt(request.getParameter("status_runid"));
                objdb.setDoc_id(request.getParameter(request_String_name[1]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[1]).trim()));
            }

            switch (statusck) {
                case -1:
                    out.print("ไม่สามารถบันทึกข้อมูลนี้ได้เนื่องจากมีเลขที่เอกสารที่สมบูรณ์แล้ว");
                    break;
                case 1:
                    objdb.setDoc_id(objrunno.Run_id_DB(request.getParameter("A_screen_id"), objdb.getDoc_date(), request.getParameter("A_dept_doc_id")));
                    objex.insert_suppliers(objdb,objAL);
                    objAL.clear();
                    out.print("บันทึกสำเร็จ");
                    break;
                case 2:
                    if (request.getParameter("confirm") != null && request.getParameter("confirm").equals("true")) {
                        objex.update_suppliers(objdb);
                        out.print("แก้ไขสำเร็จ");
                    } else {
                        out.print("edit");
                    }
                    break;
                case 3:
                    objex.delete_supppliers(objdb);
                    out.print("ลบข้อมูลสำเร็จ");
                    break;
                case 4:
                    out.print(objdb.getDoc_id().equalsIgnoreCase("")?new Runer_Doc_id().Run_id("d_product_accept_suppliers_header"):new Runer_Doc_id().Run_id("d_product_accept_header",objdb.getDoc_id()));
                    break;
                default:
                    out.print("No Statment");
                    break;
            }
%>