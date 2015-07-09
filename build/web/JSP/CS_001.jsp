<%@page import="com.bw.Util.ThaiUtil"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.bw.bean.ScreenBean"%>
<%@page import="com.bw.DB.ScreenDAO"%>
<%@page contentType="text/html" pageEncoding="TIS-620"%>
<%!
    ScreenDAO scDAO = new ScreenDAO();
    ScreenBean scBean,selectScBean;
    Timestamp ts;
    String name,id,rm,process_id,dept_id,iso_no,effective_date,qc;
    ThaiUtil tu;
%>
<%
    tu = new ThaiUtil();
    name = (String)request.getParameter("name_t_screen");
    id = (String)request.getParameter("screen_id");
    rm = (String)request.getParameter("remark_screen");
    process_id = (String)request.getParameter("process_id");
    dept_id = (String)request.getParameter("dept_id");
    iso_no = (String)request.getParameter("iso_no");
    effective_date = (String)request.getParameter("effective_date");
    qc= (String)request.getParameter("qc_check");


    scBean = new ScreenBean();
    scBean.setName_t(tu.EncodeTexttoTIS(name));
    scBean.setScreen_id(id);
    scBean.setRemark(tu.EncodeTexttoTIS(rm));
    ts = new Timestamp( new java.util.Date().getTime());
    scBean.setProcess_id(process_id);
    scBean.setDept_id(dept_id);
    scBean.setIso_no(iso_no);
    scBean.setEffective_date(effective_date);
    scBean.setQc_check(qc);
    scBean.setCreate_date(ts);
    if (request.getParameter("chkstatus") == null){
        selectScBean = scDAO.selectData(id);
        if(selectScBean != null && selectScBean.getDelete_flag().equals("N")){
            scBean.setUpdate_date(ts);
            scDAO.update(scBean);

            out.print("บันทึกสำเร็จ");
        }else{
            if(scDAO.insert(scBean)){
                out.print("แก้ไขข้อมูสำเร็จ");
            }else {out.print("แก้ไขข้อมูลผิดพลาด");}
        }
    }else {
        scDAO.updateDel(scBean);
        out.print("ลบข้อมูลสำเร็จ");
    }
%>