
<%@page import="com.bw.report.PrintReport"%>
<%@page import="java.io.InputStream"%>
<%@page language="java" contentType="text/pdf; charset=TIS-620" pageEncoding="TIS-620"%>
<%!    InputStream path;
    String report_code, docId, start, end, employee_id;
    int type;
    PrintReport report = new PrintReport();
%>
<%
    report_code = (String) request.getParameter("report_code");
    type = Integer.parseInt((String) request.getParameter("type_report"));
    path = getServletConfig().getServletContext().getResourceAsStream("/REPORT/" + report_code + ".jasper");
    if (type == 1) {
        report.printReport_1(request, response, path);
    } else if (type == 2) {
        //JOptionPane.showConfirmDialog(null, request.getParameter("wh_in_desc"));
        if (request.getParameter("doc_id") != null) {
            docId = (String) request.getParameter("doc_id");
            employee_id = (String) request.getParameter("emp_id");
        } else if (request.getParameter("A_doc_id") != null) {
            docId = (String) request.getParameter("A_doc_id");
            employee_id = (String) request.getParameter("emp_id");
        } else {
            docId = (String) request.getParameter("DOC_ID_desc");
            employee_id = (String) request.getParameter("emp_id");
        }
        report.printReport_2(request, response, path, docId, employee_id);
    } else if (type == 3) {
        start = (String) request.getParameter("param_f");
        end = (String) request.getParameter("param_t");
        String date_to = (String) request.getParameter("date_to");
        String date_form = (String) request.getParameter("date_form");
        String SQL = " ";
        if (!start.equals("")) {
            SQL = SQL + "where doc_id between '" + start + "' AND '" + end + "' ";
            if (!date_form.equals("")) {
                SQL = SQL + " and to_date(format_date4(doc_date),'YYYY-MM-DD') between to_date(format_date3('" + date_form + "'),'YYYY-MM-DD') AND to_date(format_date3('" + date_to + "'),'YYYY-MM-DD')";
                //SQL = SQL + "AND to_date(format_date(doc_date),'YYYY-MM-DD') between to_date(format_date2('" + date_form + "'),'YYYY-MM-DD') AND to_date(format_date2('" + date_to + "'),'YYYY-MM-DD')";
            }
        } else if (!date_form.equals("")) {
                SQL = SQL + " where to_date(format_date4(doc_date),'YYYY-MM-DD') between to_date(format_date3('" + date_form + "'),'YYYY-MM-DD') AND to_date(format_date3('" + date_to + "'),'YYYY-MM-DD')";
            //SQL = SQL + "where to_date(format_date(doc_date),'YYYY-MM-DD') between to_date(format_date2('" + date_form + "'),'YYYY-MM-DD') AND to_date(format_date2('" + date_to + "'),'YYYY-MM-DD') ";
        }

        System.out.println("Type Report = 3 SQL = " + SQL);
        report.printReport_3(request, response, path, SQL,date_form,date_to);
        
    } else if (type == 4) {
        String date_to = (String) request.getParameter("date_to");
        String date_form = (String) request.getParameter("date_form");
        String SQL = "";
        if (!date_form.equals("") && !date_to.equals("")) {
            SQL = " Where to_date(format_date(update_date),'YYYY-MM-DD') between to_date(format_date2('" + date_form + "'),'YYYY-MM-DD') AND to_date(format_date2('" + date_to + "'),'YYYY-MM-DD') ";
        }

        System.out.println(SQL);
        report.printReport_4(request, response, path, SQL);

    } else if (type == 5) {

        String date_form = (String) request.getParameter("date_form");
        String date_to = (String) request.getParameter("date_to");
        String SQL = " ";

        SQL = SQL + "where to_date(format_date(doc_date),'YYYY-MM-DD') between to_date(format_date2('" + date_form + "'),'YYYY-MM-DD') AND to_date(format_date2('" + date_to + "'),'YYYY-MM-DD') ";

        report.printReport_4(request, response, path, SQL);
    } else if (type == 6) {
        //JOptionPane.showConfirmDialog(null, request.getParameter("date_to"));

        String date_form = (String) request.getParameter("date_form");
        String brake_value_send = (String) request.getParameter("brake_value");
        //String date_to = (String) request.getParameter("date_to");
        //String DOC_DATE = date_form ;
        System.out.println("------------------------");
        System.out.println(date_form);
        System.out.println(brake_value_send);
        System.out.println("------------------------");

                    //SQL = SQL + "where to_date(doc_date,'DD-MM-YYYY') between '" + date_form + "' AND '" + date_to + "' ";
        //SQL = SQL + "where to_date(format_date(doc_date),'YYYY-MM-DD') between to_date(format_date2('" + date_form + "'),'YYYY-MM-DD') AND to_date(format_date2('" + date_to + "'),'YYYY-MM-DD') ";
        //JOptionPane.showConfirmDialog(null, SQL);
        report.printReport_6(request, response, path, date_form, brake_value_send);
    }

%>