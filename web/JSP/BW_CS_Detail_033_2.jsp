<%@page import="com.bw.bean.UserBean"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.bw.Util.UtiDatabase"%>
<%@page import="com.bw.DB.D_product_report_daily_detail_stop_roastDAO"%>
<%@page import="com.bw.bean.DataBeanD_product_report_daily_stop_roast"%>
<%@page import="com.bw.Util.ThaiUtil"%>
<%@page language="java" contentType="text/html; charset=TIS-620" pageEncoding="TIS-620"%>
<%
            String[] request_String_name = new String[]
            {
                "A_doc_id",
                "A_sr_from_date",
                "A_sr_from_time",
                "A_sr_to_date",
                "A_sr_to_time",
                "A_sr_stop_hour"
            };
            ThaiUtil en = new ThaiUtil();
            DataBeanD_product_report_daily_stop_roast objdb = new DataBeanD_product_report_daily_stop_roast();
            D_product_report_daily_detail_stop_roastDAO objex = new D_product_report_daily_detail_stop_roastDAO();
            UtiDatabase uti = new UtiDatabase();
            UserBean userbean = (UserBean) session.getAttribute("user");
            int statusck = 0;
            int statusnum = 0;
            int i = 0;

            if (request.getParameter("I_status") != null) {
                if (uti.numRowdatabase("Select Count(doc_id) As num from  d_product_report_daily_detail_stop_roast where doc_id = '" + en.EncodeTexttoTIS(request.getParameter("A_doc_id").trim()) + "' and delete_flag = 'N' and complete_flag = 'Y'") != 0) {
                    statusck = -1;
                } else {
                    statusck = 1;
                    statusnum = uti.numRowdatabase("Select Count(doc_id) As num from  d_product_report_daily_detail_stop_roast where doc_id = '" + en.EncodeTexttoTIS(request.getParameter("A_doc_id").trim()) + "' and delete_flag = 'N' and complete_flag = 'N'");
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
                objdb.setSr_from_date(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                objdb.setSr_from_time(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                objdb.setSr_to_date(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                objdb.setSr_to_time(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
                objdb.setSr_stop_hour(request.getParameter(request_String_name[i]) == null ? "" :en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));i+=1;
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
                        objex.Delete_line_no(request.getParameter("ckbox"), objdb, "d_product_report_daily_detail_stop_roast");
                    }else if(request.getParameter("chk_all") != null){
                        objex.Delete_all_line_no(objdb, "d_product_report_daily_detail_stop_roast");
                    }
                    break;
                case 4:
                    break;
                default:
                    out.print("No Statment");
            }

%>
