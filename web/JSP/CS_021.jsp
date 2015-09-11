<%@page import="javax.swing.JOptionPane"%>
<%@page import="com.bw.bean.ProductBean"%>
<%@page import="com.bw.DB.ProductDAO"%>
<%@page import="com.bw.Util.ThaiUtil"%>
<%@page contentType="text/html" pageEncoding="TIS-620"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.Timestamp"%>
<%!    ProductDAO pDAO = new ProductDAO();
    ProductBean proBean, selectPgBean;
    Timestamp ts;
    String name, id_wh, rm, id, id_g, id_c, id_t, price, max, min, safety, lo_id, value, unit_id, table_name , weight, weight_size;
    ThaiUtil tu;
%>
<%
    tu = new ThaiUtil();
    table_name = (String) request.getParameter("table_name");
    id = (String) request.getParameter("product_id");
    name = (String) request.getParameter("name_t_product");
    id_g = (String) request.getParameter("pgroup_id");
    id_c = (String) request.getParameter("pcat_id");
    id_t = (String) request.getParameter("ptype_id");
    price = (request.getParameter("price").equals("") || request.getParameter("price") == null) ? "0" : request.getParameter("price");
    min = (request.getParameter("min").equals("") || request.getParameter("min") == null) ? "0" : request.getParameter("min");
    max = (request.getParameter("max").equals("") || request.getParameter("max") == null) ? "0" : request.getParameter("max");
    lo_id = (String) request.getParameter("location_id");
    value = (request.getParameter("value").equals("") || request.getParameter("value") == null) ? "0" : request.getParameter("value");    
    safety = (request.getParameter("safety").equals("") || request.getParameter("safety") == null) ? "0" : request.getParameter("safety");        
    id_wh = (String) request.getParameter("warehouse_id");
    rm = (String) request.getParameter("remark_product");
    unit_id = (String) request.getParameter("unit_id");
    weight = (String) request.getParameter("weight");    
    weight_size = (String) request.getParameter("weight_size");
    pDAO = new ProductDAO();
    proBean = new ProductBean();
    proBean.setTable_name(table_name);
    proBean.setName_t(tu.EncodeTexttoTIS(name));
    proBean.setProduct_id(id);
    proBean.setPgroup_id(id_g);
    proBean.setPcat_id(id_c);
    proBean.setPtype_id(id_t);
    proBean.setMin(min);
    proBean.setMax(max);
    proBean.setPrice(price);
    proBean.setLocation_id(lo_id);
    proBean.setValue(value);
    proBean.setSafety(safety);
    proBean.setQuantity("");
    proBean.setWarehouse_id(id_wh);
    proBean.setUnit_id(unit_id);
    proBean.setRemark(tu.EncodeTexttoTIS(rm));
    proBean.setWeight(weight);    
    proBean.setWeight_size(weight_size);
    System.out.println("weight_size = " + weight_size);
    ts = new Timestamp(new java.util.Date().getTime());
    proBean.setCreate_date(ts);
    if (request.getParameter("chkstatus") == null) {
        selectPgBean = pDAO.selectData(id, table_name);
        if (selectPgBean != null && selectPgBean.getDelete_fag().equals("N")) {
            if (request.getParameter("confirm") != null && request.getParameter("confirm").equals("true")) {
                proBean.setUpdate_date(ts);
                pDAO.update(proBean);
                out.print("แก้ไขสำเร็จ");
            } else {
                out.print("edit");
            }
        } else {
            if (pDAO.insert(proBean)) {
                out.print("บันทึกสำเร็จ");
            } else {
                out.print("บันทึกไม่สำเร็จ");
            }
        }
    } else {
        pDAO.updateDel(proBean);
        out.print("ลบข้อมูลสำเร็จ");
    }
%>