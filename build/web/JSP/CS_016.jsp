<%@page import="com.bw.Util.UtiDatabase"%>
<%@page import="java.sql.Date"%>
<%@page import="com.bw.Util.ThaiUtil"%>
<%@page import="com.bw.bean.DataBeanCus_Sup"%>
<%@page import="com.bw.DB.mSupplierDAO"%>
<%@ page language="java" contentType="text/html; charset=TIS-620"
         pageEncoding="TIS-620"%>
<%@page import="java.sql.*"%>
<%!    ThaiUtil en = new ThaiUtil();
    DataBeanCus_Sup objdb = new DataBeanCus_Sup();
    mSupplierDAO objex = new mSupplierDAO();
    UtiDatabase uti = new UtiDatabase();
    Timestamp ts;
%>
<%

            int statusck = 0;
            int statusnum = 0;
            if (request.getParameter("status_d") == null) {
                statusnum = uti.numRowdatabase("Select Count(*) As num from  msupplier where supplier_id = '" + request.getParameter("supplier_id").trim() + "' and delete_flag <> 'Y'");
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
            objdb.setSupplier_id(request.getParameter("supplier_id"));
            objdb.setTambol_code(request.getParameter("tambol_code"));
            objdb.setAmp_code(request.getParameter("amp_code"));
            objdb.setProv_code(request.getParameter("prov_code"));
            objdb.setZipcode(request.getParameter("zipcode"));
            objdb.setTel(request.getParameter("tel"));
            objdb.setFax(request.getParameter("fax"));

            ts = new Timestamp(new java.util.Date().getTime());
            objdb.setDate(ts);
            if (request.getParameter("name_t") != null) {
                objdb.setName_t(en.EncodeTexttoTIS(request.getParameter("name_t")));
            }
            if (request.getParameter("address1_t") != null) {
                objdb.setAddress1_t(en.EncodeTexttoTIS(request.getParameter("address1_t")));
            }
            if (request.getParameter("contact_name") != null) {
                objdb.setContact_name(en.EncodeTexttoTIS(request.getParameter("contact_name")));
            }
            if (request.getParameter("remark") != null) {
                objdb.setRemark(en.EncodeTexttoTIS(request.getParameter("remark")));
            }

            switch (statusck) {
                case 1:
                    if (objex.insert(objdb) != -1) {
                        out.print("�ѹ�֡�����");
                    }
                    break;
                case 2:
                    if (request.getParameter("confirm") != null && request.getParameter("confirm").equals("true")) {
                        objex.Update(objdb);
                        out.print("��������");
                    } else {
                        out.print("edit");
                    }
                    break;
                case 3:
                    if (objex.UpDel(objdb) != -1) {
                        out.print("ź�����������");
                    }
                    break;
                default:
                    out.print("No Statment");
            }
%>