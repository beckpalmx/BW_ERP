<%@page import="com.bw.Util.Runer_Doc_id"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bw.bean.DataBeanD_product_accept_detail"%>
<%@page import="com.bw.bean.UserBean"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.bw.Util.UtiDatabase"%>
<%@page import="com.bw.DB.D_product_accept_confirm_headerDAO"%>
<%@page import="com.bw.bean.DataBeanD_product_accept_header"%>
<%@page import="com.bw.Util.ThaiUtil"%>
<%@page language="java" contentType="text/html; charset=TIS-620" pageEncoding="TIS-620"%>
<%
    String[] request_String_name = new String[]
            {
                "A_doc_id",
                "A_return_flag",
                "A_doc_confirm",
                "A_wh_leader_id",
                "A_account_id"
            };
    //ArrayList<DataBeanD_product_accept_detail> objAL = new  ArrayList<DataBeanD_product_accept_detail>();*/
    ThaiUtil en = new ThaiUtil();
            DataBeanD_product_accept_header objdb = new DataBeanD_product_accept_header();
            D_product_accept_confirm_headerDAO objex = new D_product_accept_confirm_headerDAO();
            UtiDatabase uti = new UtiDatabase();
            UserBean userbean = (UserBean) session.getAttribute("user");
            int statusck = 0;//���͡��÷ӧҹ
            int statusnum = 0;//�Ѻ row �ͧ������
            int i = 0,maxline = 0;
            if (request.getParameter("D_status") == null && request.getParameter("status_runid") == null) {
                statusnum = uti.numRowdatabase("SELECT Count(doc_id) As num from  d_product_accept_suppliers_header_wh where doc_id = '" + en.EncodeTexttoTIS(request.getParameter("A_doc_id").trim()) + "' and delete_flag = 'N' and complete_flag = 'N'");
                if (statusnum == 0) {
                    if (uti.numRowdatabase("SELECT Count(doc_id) As num from  d_product_accept_suppliers_header_wh where doc_id = '" + en.EncodeTexttoTIS(request.getParameter("A_doc_id").trim()) + "' and delete_flag = 'N' and complete_flag = 'Y'") == 1) {
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
                if (statusck == 1 || (statusck == 2)) {


                    objdb.setDoc_id(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setReturn_flag(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setDoc_type(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setWh_leader_id(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setAccount_id(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    /*objdb.setReporter_id(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setApprover_id(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setWh_leader_id(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setAccount_id(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setComplete_flag(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;*/
                    objdb.setBy(userbean.getUsername());
                    objdb.setDate(new Timestamp(new java.util.Date().getTime()));
                    /*if(statusck == 1){
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
                            objAL.add(bean);
                        }
                    }*/

                }
                //-------------------------------------------------------------------------

            }else if(request.getParameter("status_runid") != null){
                statusck = Integer.parseInt(request.getParameter("status_runid"));
            }
            switch (statusck) {
                case -1:
                    out.print("�������ö�ѹ�֡�����Ź�������ͧ�ҡ���Ţ����͡��÷������ó�����");
                    break;
                case 1:
                    /*objex.insert(objdb,objAL);
                    objAL.clear();
                    out.print("�ѹ�֡�����");*/
                    break;
                case 2:
                    objex.update_suppliers(objdb);
                    out.print("��������");
                    /*if (request.getParameter("confirm") != null && request.getParameter("confirm").equals("true")) {
                        objex.update(objdb);
                        out.print("��������");
                    } else {
                        out.print("edit");
                    }*/
                    break;
                case 3:
                    out.print("ź�����������");
                    break;
                case 4:
                    out.print(new Runer_Doc_id().Run_id("d_product_accept_suppliers_header_wh"));
                    break;
                default:
                    out.print("No Statment");
                    break;
            }
%>