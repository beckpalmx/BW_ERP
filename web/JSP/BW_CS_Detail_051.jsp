<%@page import="com.bw.bean.UserBean"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.bw.Util.UtiDatabase"%>
<%@page import="com.bw.DB.D_product_withdraw_detailDAO"%>
<%@page import="com.bw.bean.DataBeanD_product_withdraw_detail"%>
<%@page import="com.bw.Util.ThaiUtil"%>
<%@page language="java" contentType="text/html; charset=TIS-620" pageEncoding="TIS-620"%>
<%
    String[] request_String_name = new String[]{
        "A_doc_id",
        "A_product_id",
        "A_weight",
        "A_bag_qty",
        "A_remark",
        "A_shift",
        "A_quantity",
        "A_wh_in"
    };
    ThaiUtil en = new ThaiUtil();
    DataBeanD_product_withdraw_detail objdb = new DataBeanD_product_withdraw_detail();
    D_product_withdraw_detailDAO objex = new D_product_withdraw_detailDAO();
    UtiDatabase uti = new UtiDatabase();
    UserBean userbean = (UserBean) session.getAttribute("user");
    int statusck = 0;
    int statusnum = 0;
    int i = 0;

    if (request.getParameter("I_status") != null) {
        if (uti.numRowdatabase("Select Count(doc_id) As num from  d_product_withdraw_suppliers_detail where doc_id = '" + en.EncodeTexttoTIS(request.getParameter("A_doc_id").trim()) + "' and delete_flag = 'N' and complete_flag = 'Y'") != 0) {
            statusck = -1;
        } else {
            statusck = 1;
            statusnum = uti.numRowdatabase("Select Count(doc_id) As num from  d_product_withdraw_suppliers_detail where doc_id = '" + en.EncodeTexttoTIS(request.getParameter("A_doc_id").trim()) + "' and delete_flag = 'N' and complete_flag = 'N'");
            objdb.setLine_no(Integer.toString(statusnum + 1));
        }
    } else if (request.getParameter("U_status") != null) {
        if (uti.numRowdatabase("Select Count(doc_id) As num from  d_product_withdraw_suppliers_detail where doc_id = '" + en.EncodeTexttoTIS(request.getParameter("A_doc_id").trim()) + "' and delete_flag = 'N' and complete_flag = 'Y'") != 0) {
            statusck = -1;
        } else {
            statusck = 2;
        }
        objdb.setLine_no(request.getParameter("A_line_no"));

    } else if (request.getParameter("D_status") != null) {
        statusck = Integer.parseInt(request.getParameter("D_status"));
        objdb.setDoc_id(request.getParameter(request_String_name[0]) == null ? "" : en.EncodeTexttoTIS(request.getParameter(request_String_name[0]).trim()));
        objdb.setBy(userbean.getUsername());
        objdb.setDate(new Timestamp(new java.util.Date().getTime()));
    } else {
        statusck = -1;
    }
    //----------------------------SetData--------------------------------------
    if (statusck == 1 || statusck == 2) {
        objdb.setDoc_id(request.getParameter(request_String_name[i]) == null ? "" : en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));
        i += 1;
        objdb.setProduct_id(request.getParameter(request_String_name[i]) == null ? "" : en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));
        i += 1;
        objdb.setWeight(request.getParameter(request_String_name[i]) == null ? "" : en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));
        i += 1;
        objdb.setBag_qty(request.getParameter(request_String_name[i]) == null ? "" : en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));
        i += 1;
        objdb.setRemark(request.getParameter(request_String_name[i]) == null ? "" : en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));
        i += 1;
        objdb.setShift(request.getParameter(request_String_name[i]) == null ? "" : en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));
        i += 1;
        objdb.setQuantity(request.getParameter(request_String_name[i]) == null ? "" : en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));
        i += 1;
        objdb.setWh_id(request.getParameter(request_String_name[i]) == null ? "" : en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));
        i += 1;
        objdb.setBy(userbean.getUsername());
        objdb.setDate(new Timestamp(new java.util.Date().getTime()));
    }
                //-------------------------------------------------------------------------

            //--------------1 = insert
    //--------------2 = update ���� update �е�ͧ�ա���觾�������������� confirm �Ѻ�ҡ�͹�֧������ö update ��
    //--------------3 = delete
    System.out.println("statusck = " + statusck);

    switch (statusck) {
        case -1:
            out.print("�������ö�ѹ�֡�����Ź�������ͧ�ҡ���Ţ����͡��÷������ó�����");
            break;
        case 1:
            objex.insert_suppliers(objdb);
            out.print("�ѹ�֡�����");
            break;
        case 2:
            objex.update_suppliers(objdb);
            out.print("��������");
            break;
        case 3:
            if (request.getParameter("ckbox") != null && !request.getParameter("ckbox").equals("")) {
                objex.Delete_line_no(request.getParameter("ckbox"), objdb, "d_product_withdraw_suppliers_detail");
            } else if (request.getParameter("chk_all") != null) {
                objex.Delete_all_line_no(objdb, "d_product_withdraw_suppliers_detail");
            }
            break;
        case 4:
            break;
        default:
            out.print("No Statment");
            break;
    }

%>
