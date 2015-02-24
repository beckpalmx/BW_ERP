<%@page import="com.bw.bean.UserBean"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.bw.Util.UtiDatabase"%>
<%@page import="com.bw.DB.D_product_report_daily_detail_starchDAO"%>
<%@page import="com.bw.bean.DataBeanD_product_report_daily_detail_starch"%>
<%@page import="com.bw.Util.ThaiUtil"%>
<%@page language="java" contentType="text/html; charset=TIS-620" pageEncoding="TIS-620"%>
<%
            String[] request_String_name = new String[]
            {
                "A_doc_id",
                "A_tank",
                "A_qty_litr",
                "A_be_val",
                "A_sg_val",
                "A_amount",
                "A_cassava_of_date",
                "A_starch_bal",
                "A_qty_tank",
                "A_starch_bal_x_qty_tank"
            };
            ThaiUtil en = new ThaiUtil();
            DataBeanD_product_report_daily_detail_starch objdb = new DataBeanD_product_report_daily_detail_starch();
            D_product_report_daily_detail_starchDAO objex = new D_product_report_daily_detail_starchDAO();
            UtiDatabase uti = new UtiDatabase();
            UserBean userbean = (UserBean) session.getAttribute("user");
            int statusck = 0;
            int statusnum = 0;
            int i = 0;

            if (request.getParameter("I_status") != null) {
                if (uti.numRowdatabase("Select Count(doc_id) As num from  d_product_report_daily_detail_starch where doc_id = '" + en.EncodeTexttoTIS(request.getParameter("A_doc_id").trim()) + "' and delete_flag = 'N' and complete_flag = 'Y'") != 0) {
                    statusck = -1;
                } else {
                    statusck = 1;
                    statusnum = uti.numRowdatabase("Select Count(doc_id) As num from  d_product_report_daily_detail_starch where doc_id = '" + en.EncodeTexttoTIS(request.getParameter("A_doc_id").trim()) + "' and delete_flag = 'N' and complete_flag = 'N'");
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
                objdb.setTank(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                objdb.setQty_starch(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                objdb.setBe_val(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                objdb.setSg_val(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                objdb.setAmount(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                objdb.setCassava_of_date(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                objdb.setStarch_bal(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                objdb.setQty_tank(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                objdb.setStarch_bal_x_qty_tank(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                objdb.setBy(userbean.getUsername());
                objdb.setDate(new Timestamp(new java.util.Date().getTime()));
            }
                //-------------------------------------------------------------------------

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
                    if(request.getParameter("ckbox") != null && !request.getParameter("ckbox").equals("")){
                        objex.Delete_line_no(request.getParameter("ckbox"), objdb, "d_product_report_daily_detail_starch");
                    }else if(request.getParameter("chk_all") != null){
                        objex.Delete_all_line_no(objdb, "d_product_report_daily_detail_starch");
                    }
                    break;
                case 4:
                    break;
                default:
                    out.print("No Statment");
            }

%>
