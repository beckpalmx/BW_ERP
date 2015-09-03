<%@page import="com.bw.bean.UserBean"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.bw.Util.UtiDatabase"%>
<%@page import="com.bw.DB.D_product_withdraw_confirm_headerDAO"%>
<%@page import="com.bw.bean.DataBeanD_product_withdraw_header"%>
<%@page import="com.bw.Util.ThaiUtil"%>
<%@page language="java" contentType="text/html; charset=TIS-620" pageEncoding="TIS-620"%>
<%
    String[] request_String_name = new String[]{
        "A_doc_id",
        "A_return_flag",
        "A_doc_confirm",
        "A_wh_leader_id",
        "A_account_id"
    };
    ThaiUtil en = new ThaiUtil();
    DataBeanD_product_withdraw_header objdb = new DataBeanD_product_withdraw_header();
    D_product_withdraw_confirm_headerDAO objex = new D_product_withdraw_confirm_headerDAO();
    UtiDatabase uti = new UtiDatabase();
    UserBean userbean = (UserBean) session.getAttribute("user");
    int statusck = 0;//เลือกการทำงาน
    int statusnum = 0;//นับ row ของข้อมูล
    int i = 0;
    if (request.getParameter("D_status") == null) {
        statusnum = uti.numRowdatabase("SELECT Count(doc_id) As num from  d_product_withdraw_confirm_header where doc_id = '" + en.EncodeTexttoTIS(request.getParameter("A_doc_id").trim()) + "' and delete_flag = 'N' and complete_flag = 'N'");
        if (statusnum == 0) {
            if (uti.numRowdatabase("SELECT Count(doc_id) As num from  d_product_withdraw_confirm_header where doc_id = '" + en.EncodeTexttoTIS(request.getParameter("A_doc_id").trim()) + "' and delete_flag = 'N' and complete_flag = 'Y'") == 1) {
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
            objdb.setDoc_id(request.getParameter(request_String_name[i]) == null ? "" : en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));
            i += 1;
            objdb.setReturn_flag(request.getParameter(request_String_name[i]) == null ? "" : en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));
            i += 1;
            objdb.setDoc_type(request.getParameter(request_String_name[i]) == null ? "" : en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));
            i += 1;
            objdb.setWh_leader_id(request.getParameter(request_String_name[i]) == null ? "" : en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));
            i += 1;
            objdb.setAccount_id(request.getParameter(request_String_name[i]) == null ? "" : en.EncodeTexttoTIS(request.getParameter(request_String_name[i]).trim()));
            i += 1;
            objdb.setBy(userbean.getUsername());
            objdb.setDate(new Timestamp(new java.util.Date().getTime()));
        }
        //-------------------------------------------------------------------------

    }
    switch (statusck) {
        case -1:
            out.print("ไม่สามารถบันทึกข้อมูลนี้ได้เนื่องจากมีเลขที่เอกสารที่สมบูรณ์แล้ว");
            break;
        case 1:
            out.print("บันทึกสำเร็จ");
            break;
        case 2:
            objex.update(objdb);
            out.print("แก้ไขสำเร็จ");
            break;
        case 3:
            out.print("ลบข้อมูลสำเร็จ");
        case 4:

        default:
            out.print("No Statment");
    }
%>