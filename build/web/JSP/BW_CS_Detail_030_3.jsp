<%@page import="com.bw.bean.UserBean"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.bw.Util.UtiDatabase"%>
<%@page import="com.bw.DB.D_product_milling_headerDAO"%>
<%@page import="com.bw.bean.DataBeanD_product_milling_header"%>
<%@page import="com.bw.Util.ThaiUtil"%>
<%@ page language="java" contentType="text/html; charset=TIS-620" pageEncoding="TIS-620"%>
<%
            String[] request_String_name = new String[]
            {
                "A_doc_id",
                "A_cod_in",
                "A_cod_out",
                "A_cassava_roots_qty"
            };
            UserBean userbean = (UserBean) session.getAttribute("user");
            ThaiUtil en = new ThaiUtil();
            DataBeanD_product_milling_header objdb = new DataBeanD_product_milling_header();
            D_product_milling_headerDAO objex = new D_product_milling_headerDAO();
            UtiDatabase uti = new UtiDatabase();
            int statusck = 0;
            int statusnum = 0;
            int i = 0;
            //----------------------------Chack Data----------------------------------------
            if (request.getParameter("D_status") == null) {
                statusnum = uti.numRowdatabase("SELECT Count(doc_id) As num from  d_product_milling_header where doc_id = '" + en.EncodeTexttoTIS(request.getParameter("A_doc_id").trim()) + "' and delete_flag = 'N' and complete_flag = 'N'");
                if (statusnum == 0) {
                    if (uti.numRowdatabase("SELECT Count(doc_id) As num from  d_product_milling_header where doc_id = '" + en.EncodeTexttoTIS(request.getParameter("A_doc_id").trim()) + "' and delete_flag = 'N' and complete_flag = 'Y'") == 1) {
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
                if (statusck == 1 || statusck == 2) {
                    objdb.setDoc_id(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setCod_in(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setCod_out(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    objdb.setCassava_roots_qty(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    //objdb.setTotal_2(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                    //objdb.setTotal_3(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
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
            //--------------2 = update ���� update �е�ͧ�ա���觾�������������� confirm �Ѻ�ҡ�͹�֧������ö update ��
            //--------------3 = delete
            switch (statusck) {
                case -1:
                    out.print("�������ö�ѹ�֡�����Ź�������ͧ�ҡ���Ţ����͡��÷������ó�����");
                    break;
                case 1:
                    objex.insert(objdb);
                    out.print("�ѹ�֡�����");
                    break;
                case 2:
                    objex.update(objdb);
                    out.print("��������");
                    break;
                case 3:
                    objex.delete(objdb);
                    out.print("ź�����������");
                    break;
                case 4:
                    break;
                default:
                    out.print("No Statment");
                    break;
            }

%>
