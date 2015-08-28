package com.bw.report;

import com.bw.DB.DBConnect;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.HashMap;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JasperRunManager;

public class PrintReport {

    private static String company_code = "10";
    private static String employee_id_s = "";

    public void printReport_1(HttpServletRequest request, HttpServletResponse response, InputStream path)
            throws Exception {
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "inline; filename=\"filename.pdf\"");
        response.setBufferSize(1024);
        Connection connection;
        connection = new DBConnect().openNewConnection();
        //InputStream path = (InputStream) request.getSession().getAttribute("path");
        String report_code = (String) request.getParameter("report_code");
        HashMap<String, Object> hashMap = new HashMap<String, Object>();
        hashMap.put("fileName", report_code);
        hashMap.put("company_name", Mcompany(connection));
        ServletOutputStream servletOutputStream = response.getOutputStream();
        InputStream reportStream = path;

        //response.setContentType("application/pdf");
        JasperRunManager.runReportToPdfStream(reportStream, servletOutputStream, hashMap, connection);

        connection.close();
        servletOutputStream.flush();
        servletOutputStream.close();

    }

    public void printReport_2(HttpServletRequest request, HttpServletResponse response, InputStream path, String docId, String employee_id)
            throws Exception {        
        
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "inline; filename=\"filename.pdf\"");
        response.setBufferSize(1024);               
        
        Connection connection = new DBConnect().openNewConnection();
        
        //InputStream path = (InputStream) request.getSession().getAttribute("path");
        String report_code = (String) request.getParameter("report_code");
        String doc_no = (String) request.getParameter("doc_no");
        String doc_eff_date = (String) request.getParameter("doc_eff_date");
        employee_id_s = employee_id;
        HashMap<String, Object> hashMap = new HashMap<String, Object>();
        hashMap.put("fileName", report_code);
        hashMap.put("DOC_ID", docId);
        hashMap.put("REPORT_UNAME", Memployee(connection));
        hashMap.put("iso_doc_ref", doc_no);
        hashMap.put("iso_doc_date", doc_eff_date);
        hashMap.put("company_name", Mcompany(connection));
        
        //hashMap.put("SUB_DOC_ID", docId);

        hashMap.put("SUBREPORT_DIR", (new StringBuilder(String.valueOf(request.getSession().getServletContext().getRealPath("REPORT/")))).append("/").toString());

        ServletOutputStream servletOutputStream = response.getOutputStream();

        InputStream reportStream = path;

        //response.setContentType("application/pdf");
        System.out.println(servletOutputStream);

        JasperRunManager.runReportToPdfStream(reportStream, servletOutputStream, hashMap, connection);

        connection.close();
        servletOutputStream.flush();
        servletOutputStream.close();

    }   

    public void printReport_3(HttpServletRequest request, HttpServletResponse response, InputStream path, String sql, String date_form, String date_to)
            throws Exception {
        
        String report_code = (String) request.getParameter("report_code");
        
        HashMap<String, Object> hashMap = new HashMap<String, Object>();        
        Connection connection = new DBConnect().openNewConnection();
        hashMap.put("fileName", report_code);
        hashMap.put("company_name", Mcompany(connection));
        hashMap.put("SUBREPORT_DIR", (new StringBuilder(String.valueOf(request.getSession().getServletContext().getRealPath("REPORT/")))).append("/").toString());
        hashMap.put("SQL_CODE", sql);
        hashMap.put("DATE_FORM", date_form);
        hashMap.put("DATE_TO", date_to);

        System.out.print(sql);
        System.out.print("-----");
        System.out.print(report_code);

        ServletOutputStream servletOutputStream = response.getOutputStream();
        InputStream reportStream = path;

        response.setContentType("application/pdf");
        String file = "inline; filename=" + report_code + ".pdf";

        response.setHeader("Content-Disposition", file);

        JasperRunManager.runReportToPdfStream(reportStream, servletOutputStream, hashMap, connection);

        connection.close();
        servletOutputStream.flush();
        servletOutputStream.close();

    }

    public void printReport_4(HttpServletRequest request, HttpServletResponse response, InputStream path, String sql)
            throws Exception {
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "inline; filename=\"filename.pdf\"");
        response.setBufferSize(1024);
        Connection connection = new DBConnect().openNewConnection();
        //InputStream path = (InputStream) request.getSession().getAttribute("path");
        String report_code = (String) request.getParameter("report_code");
        String date_to = (String) request.getParameter("date_to");
        String date_form = (String) request.getParameter("date_form");
        HashMap<String, Object> hashMap = new HashMap<String, Object>();
        //hashMap.put("SUB_DOC_ID", docId);
        hashMap.put("SUBREPORT_DIR", (new StringBuilder(String.valueOf(request.getSession().getServletContext().getRealPath("REPORT/")))).append("/").toString());
        hashMap.put("SQL_CODE", sql);
        hashMap.put("fileName", report_code);
        hashMap.put("DATE_FORM", date_form);
        hashMap.put("DATE_TO", date_to);
        hashMap.put("company_name", Mcompany(connection));

        //JOptionPane.showConfirmDialog(null, sql);
        //= response.getOutputStream();
        
        //ServletOutputStream servletOutputStream = null;
        
        ServletOutputStream servletOutputStream = response.getOutputStream();

        InputStream reportStream = path;

        //response.setContentType("application/pdf");
        JasperRunManager.runReportToPdfStream(reportStream, servletOutputStream, hashMap, connection);

        connection.close();
        servletOutputStream.flush();
        servletOutputStream.close();

    }

    public void printReport_6(HttpServletRequest request, HttpServletResponse response, InputStream path, String date_form, String brake_value_send)
            throws Exception {
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "inline; filename=\"filename.pdf\"");
        response.setBufferSize(1024);
        String report_code = (String) request.getParameter("report_code");
        HashMap<String, Object> hashMap = new HashMap<String, Object>();
        //hashMap.put("SUB_DOC_ID", docId);
        hashMap.put("SUBREPORT_DIR", (new StringBuilder(String.valueOf(request.getSession().getServletContext().getRealPath("REPORT/")))).append("/").toString());
        //hashMap.put("SQL_CODE", sql);
        hashMap.put("fileName", report_code);
        hashMap.put("DOC_DATE", date_form);
        hashMap.put("BRAKE_VALUE_SEND", brake_value_send);
        //hashMap.put("DATE_FORM",date_form);
        //hashMap.put("DATE_TO",date_to);
        Connection connection;
        ServletOutputStream servletOutputStream = response.getOutputStream();
        InputStream reportStream = path;

        //response.setContentType("application/pdf");
        connection = new DBConnect().openNewConnection();
        System.out.println("lib print report");
        System.out.println(date_form);
        JasperRunManager.runReportToPdfStream(reportStream, servletOutputStream, hashMap, connection);

        connection.close();
        servletOutputStream.flush();
        servletOutputStream.close();

    }

    public static String Mcompany(Connection con) throws Exception {
        String str_return = "";
        ResultSet rs = null;
        try {
            rs = con.createStatement().executeQuery("select name_t from mcompany where company_id = '" + company_code + "'");
            while (rs.next()) {
                str_return = rs.getString("name_t");
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
        } finally {
            if (rs != null) {
                rs.close();
            }
            return str_return;
        }

    }

    public static String Memployee(Connection con) throws Exception {
        String str_return = "";
        ResultSet rs = null;
        try {
            rs = con.createStatement().executeQuery("select fullname from vemployee_fullname where emp_id = '" + employee_id_s + "'");
            while (rs.next()) {
                str_return = rs.getString("fullname");
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
        } finally {
            if (rs != null) {
                rs.close();
            }
            return str_return;
        }

    }    
}
