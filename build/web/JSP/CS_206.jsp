<%@page import="com.bw.DB.M_cassava_typeDAO"%>
<%@page import="com.bw.bean.DataBeanM_cassava_type"%>
<%@page import="com.bw.Util.UtiDatabase"%>
<%@page import="java.sql.Date"%>
<%@page import="com.bw.Util.ThaiUtil"%>
<%@ page language="java" contentType="text/html; charset=TIS-620" pageEncoding="TIS-620"%>
<%@page import="java.sql.*"%>
<%!    UtiDatabase uti = new UtiDatabase();
    ThaiUtil en = new ThaiUtil();
    Timestamp ts;
    DataBeanM_cassava_type objdb = new DataBeanM_cassava_type();
    M_cassava_typeDAO objex = new M_cassava_typeDAO();

%>
<%
            int statusck = 0;
            int statusnum = 0;
            if (request.getParameter("status_d") == null) {
                statusnum = uti.numRowdatabase("Select Count(cassava_type_id) As num from  m_cassava_type where cassava_type_id = '" + en.EncodeTexttoTIS(request.getParameter("cassava_type_id").trim()) + "' and delete_flag <> 'Y'");
                if (statusnum == 0) {
                    statusck = 1;
                } else if (statusnum == 1) {
                    statusck = 2;
                } else {
                    statusck = -1;
                }
            } else {
                statusck = Integer.parseInt(request.getParameter("status_d"));
            }
            objdb.setCassava_type_id(en.EncodeTexttoTIS(request.getParameter("cassava_type_id")));
            objdb.setName_t(en.EncodeTexttoTIS(request.getParameter("name_t")));
            if (request.getParameter("remark") != null) {
                objdb.setRemark(en.EncodeTexttoTIS(request.getParameter("remark")));
            }
            ts = new Timestamp(new java.util.Date().getTime());
            objdb.setDate(ts);
            objdb.setBy(request.getParameter("username"));

            switch (statusck) {
                case 1:
                    if (objex.insert(objdb) != -1) {
                        out.print("บันทึกสำเร็จ");
                    }
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
                    if (objex.updateDel(objdb) != -1) {
                        out.print("ลบข้อมูลสำเร็จ");
                    }
                    break;
                default:
                    out.print("No Statment");
            }
%>