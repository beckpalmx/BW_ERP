<%@page import="com.bw.bean.MenuBean"%>
<%@page import="com.bw.DB.MenuDAO"%>
<%@page import="com.bw.Util.ThaiUtil"%>
<%@page contentType="text/html" pageEncoding="TIS-620"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.Timestamp"%>
<%!
    MenuDAO menuDAO = new MenuDAO();
    MenuBean menuBean,selectMenuBean;
    Timestamp ts;
    String name,id,rm;
    ThaiUtil tu;
%>
<%
    tu = new ThaiUtil();
    name = (String)request.getParameter("name_t");
    id = (String)request.getParameter("main_menu_id");
    rm = (String)request.getParameter("remark");
    menuBean = new MenuBean();
    menuBean.setName_t(tu.EncodeTexttoTIS(name));
    menuBean.setMain_menu_id(tu.EncodeTexttoTIS(id));
    menuBean.setRemark(tu.EncodeTexttoTIS(rm));
    ts = new Timestamp( new java.util.Date().getTime());
    menuBean.setCreate_date(ts);
    if (request.getParameter("chkstatus")==null){
        selectMenuBean = menuDAO.selectMainMenu(id);
        if(selectMenuBean != null && selectMenuBean.getDelete_flag().equals("N")){
            menuBean.setUpdate_date(ts);
            menuDAO.updateMain(menuBean);
            out.print("แก้ไขสำเร็จ");
        }else{
            if(menuDAO.insertMain(menuBean)){
                out.print("บันทึกสำเร็จ");
            }else {out.print("บันทึกไม่สำเร็จ");}
        }
    } else {
        menuDAO.updateDelMain(menuBean);
        out.print("ลบข้อมูลสำเร็จ");
    }
    
%>