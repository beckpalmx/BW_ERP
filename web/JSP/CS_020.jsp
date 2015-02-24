<%@page import="com.bw.bean.WarehouseBean"%>
<%@page import="com.bw.DB.WareHouseDAO"%>
<%@page import="com.bw.Util.ThaiUtil"%>
<%@page contentType="text/html" pageEncoding="TIS-620"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.Timestamp"%>
<%!    WareHouseDAO whDAO = new WareHouseDAO();
    WarehouseBean whBean, selectPgBean;
    Timestamp ts;
    String name, id, rm;
    ThaiUtil tu;
%>
<%
            tu = new ThaiUtil();
            name = (String) request.getParameter("name_t_warehouse");
            id = (String) request.getParameter("warehouse_id");
            rm = (String) request.getParameter("remark_wh");
            whBean = new WarehouseBean();
            whBean.setName_t(tu.EncodeTexttoTIS(name));
            whBean.setWarehouse_id(id);
            whBean.setRemark(tu.EncodeTexttoTIS(rm));
            ts = new Timestamp(new java.util.Date().getTime());
            whBean.setCreate_date(ts);
            if (request.getParameter("chkstatus") == null) {
                selectPgBean = whDAO.selectData(id);
                if (selectPgBean != null && selectPgBean.getDelete_flag().equals("N")) {
                    whBean.setUpdate_date(ts);
                    if (request.getParameter("confirm") != null && request.getParameter("confirm").equals("true")) {
                        whDAO.update(whBean);
                        out.print("แก้ไขสำเร็จ");
                    } else {
                        out.print("edit");
                    }
                } else {
                    if (whDAO.insert(whBean)) {
                        out.print("บันทึกสำเร็จ");
                    } else {
                        out.print("บันทึกไม่สำเร็จ");
                    }
                }
            } else {
                whDAO.updateDel(whBean);
                out.print("ลบข้อมูลสำเร็จ");
            }
%>