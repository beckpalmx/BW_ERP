<%@page contentType="text/html" pageEncoding="TIS-620"%>
<%@page import="java.net.InetAddress"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.bw.DB.Login_Log_DAO"%>
<%@page import="com.bw.bean.LoginlogBean"%>
<%@page import="com.bw.DB.ReportParamDAO"%>
<%@page import="com.bw.bean.ReportParamBean"%>
<%@page import="com.bw.Util.ThaiUtil"%>
<%@page import="com.bw.Util.OS_Type"%>
<%@page import="com.bw.bean.UserBean"%>
<%@page import="com.bw.DB.UserDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bw.bean.UserBean"%>
<%@page import="com.bw.bean.MenuBean"%>
<%@page import="com.bw.DB.DBConnect"%>
<%@page import="com.bw.DB.MenuDAO"%>
<%@page import="com.bw.DB.MessageDAO"%>
<%@page import="com.bw.DB.McompanyDAO"%>
<%@page import="com.bw.bean.DataBean_Mcompany"%>
<%@page import ="org.apache.commons.codec.binary.Base64"%>
<%!    UserDAO useDAO = new UserDAO();
    McompanyDAO McompanyDAO = new McompanyDAO();
    UserBean userBean, selectData;
    DataBean_Mcompany DataBean_Mcompany, selectData_chk;
    String user, pass, year_data, bwdb_name, db_name_ma;
    ThaiUtil tu;
    MenuDAO menuDAO = new MenuDAO();
    MenuBean subBean, priviledge, mainBean;
    String m, s = new String();
    ArrayList<String> mainList;
    ArrayList<String> subList;
    String menu = new String();

    MessageDAO messageDAO = new MessageDAO();
    OS_Type os_type = new OS_Type();
    //MessageBean messageBean;
    //String message_id, message_detail;    
%>


<%
    selectData = new UserBean();
    tu = new ThaiUtil();
    user = (String) request.getParameter("user");
    pass = (String) request.getParameter("pass");
    bwdb_name = (String) request.getParameter("bwdb_name");
    db_name_ma = (String) request.getParameter("db_name_ma");
    year_data = (String) request.getParameter("year_data");

    String os = os_type.GetOS_Type("Y");
    String export_path = os_type.GetPath(os);

    System.out.println("OS = " + os);
    System.out.println("export_path = " + export_path);

    if (os.equals("WIN")) {
        bwdb_name = bwdb_name.toUpperCase();
        db_name_ma = db_name_ma.toUpperCase();
    } else {
        bwdb_name = bwdb_name.toLowerCase();
        db_name_ma = db_name_ma.toLowerCase();
    }    

    //System.out.println("DataBase name = " + bwdb_name + " : " + db_name_ma);
    /*
     DBConnect.CONNECTION_URL = "jdbc:postgresql://localhost:5432/" + bwdb_name + year_data;
     DBConnect.CONNECTION_URL_MA = "jdbc:postgresql://localhost:5432/" + db_name_ma + year_data;
     */
    DBConnect.CONNECTION_URL = bwdb_name + year_data;
    DBConnect.CONNECTION_URL_MA = db_name_ma + year_data;

    //System.out.println("DB 1 = " + bwdb_name + year_data);
    //System.out.println("DB 2 = " + db_name_ma + year_data);
    byte[] pass_encode = Base64.encodeBase64(pass.getBytes());
    //byte[] pass_decode = Base64.decodeBase64(pass_encode);

    //System.out.println("-------------------0000------------------------");
    //System.out.println("pass_encode = " + new String(pass_encode));
    //System.out.println("-------------------1111------------------------");
    selectData.setUsername(tu.EncodeTexttoTIS(user));
    //selectData.setPassword(tu.EncodeTexttoTIS(pass));
    selectData.setPassword(new String(pass_encode));

    //System.out.println("-------------------2222------------------------");
    userBean = useDAO.selectData(selectData);
    DataBean_Mcompany = McompanyDAO.selectData_chk(selectData_chk);

    //System.out.println("-------------------3333------------------------");
    //System.out.println(userBean.getMessage_disp());
    //System.out.println(message_disp);      
    if (userBean == null) {
        out.print("Username หรือ Password ไม่ถูกต้อง!!!");
    } else {
        //System.out.println("-------------------4444------------------------");
        userBean.setSelect_database(bwdb_name + year_data);
        userBean.setMessage_disp(messageDAO.selectData_MSG());

        //System.out.println("-------------------444411111------------------------");
        //if(userBean.getUse_status().equals("Y")){
        out.print("LOGIN");
        session.removeAttribute("menu");
        menu = "";
        m = "";
        s = "";
        mainList = new ArrayList<String>();
        subList = new ArrayList<String>();
        subBean = new MenuBean();
        priviledge = menuDAO.selectPriviledge(userBean.getPriviledge_id());
        //System.out.println("-------------------44442222------------------------");
        m = priviledge.getMain_menu_id();
        s = priviledge.getSub_menu_id();

        do {
            mainList.add(m.substring(0, m.indexOf(",")));
            m = m.substring(m.indexOf(",") + 1, m.length());
        } while (m.length() > 0);
        do {
            subList.add(s.substring(0, s.indexOf(",")));
            s = s.substring(s.indexOf(",") + 1, s.length());
        } while (s.length() > 0);
        mainBean = new MenuBean();
        ReportParamBean rpBean = new ReportParamBean();
        ReportParamDAO rpDAO = new ReportParamDAO();
        for (String list : mainList) {
            mainBean = menuDAO.selectMainMenu(list);
            if (menu.equals("")) {
                //menu = menu + "[\"+" + mainBean.getName_t() + "\",\"\", path+\"deluxe-tree.files/xpicon1_s.gif\", \"\", \"\", \"XP Title Tip\", \"\", \"0\", \"\", \"\", ],";
                menu = menu + "[\"+" + mainBean.getName_t() + "\",\"\", path+\"deluxe-tree.files/xpicon1_s.gif\", \"\", \"\",\"" + mainBean.getName_t() + "\", \"\", \"0\", \"\", \"\", ],";
            } else {
                menu = menu + "[\"" + mainBean.getName_t() + "\",\"\", \"\", \"\", \"\",\"" + mainBean.getName_t() + "\", \"\", \"1\", \"0\", \"\", ],";
            }

            for (String s_list : subList) {
                if (s_list.charAt(1) == list.charAt(3)) {
                    subBean = menuDAO.selectSubMenu(s_list);
                    if (subBean.getMain_menu_id().equals(list)) {
                        if (list.charAt(3) == '4' || list.charAt(3) == '7' || list.charAt(3) == '9') {
                            if (list.charAt(3) == '7') {
                                rpBean = rpDAO.selectData(subBean.getScreen_id());
                                menu = menu + "[\"|" + subBean.getName_t() + "\",\"javascript:linkpage('CS_REPORT.jsp?report_code=" + subBean.getScreen_id() + "&lookup=" + rpBean.getLookup_name() + "');\", \"" + subBean.getImg() + "\", \"" + subBean.getImg_swap() + "\", \"\", \"\", \"\", \"\", \"\", \"\", ],";
                            } else if (list.charAt(3) == '9') {
                                //rpBean = rpDAO.selectData(subBean.getScreen_id());
                                menu = menu + "[\"|" + subBean.getName_t() + "\",\"javascript:linkpage('CS_REPORT_4.jsp?report_code=" + subBean.getScreen_id() + "&lookup=" + rpBean.getLookup_name() + "');\", \"" + subBean.getImg() + "\", \"" + subBean.getImg_swap() + "\", \"\", \"\", \"\", \"\", \"\", \"\", ],";
                            } else {
                                menu = menu + "[\"|" + subBean.getName_t() + "\",\"javascript:linkpage('CS_REPORT.jsp?report_code=" + subBean.getScreen_id() + "');\", \"" + subBean.getImg() + "\", \"" + subBean.getImg_swap() + "\", \"\", \"\", \"\", \"\", \"\", \"\", ],";
                            }
                        } else if (list.charAt(3) == '5' || list.charAt(3) == '8') {
                            rpBean = rpDAO.selectData(subBean.getScreen_id());
                            menu = menu + "[\"|" + subBean.getName_t() + "\",\"javascript:linkpage('CS_REPORT_2.jsp?report_code=" + subBean.getScreen_id() + "&lookup=" + rpBean.getLookup_name() + "&doc_no=" + subBean.getDoc_no() + "&eff_date=" + subBean.getDoc_eff_date() + "');\", \"" + subBean.getImg() + "\", \"" + subBean.getImg_swap() + "\", \"\", \"\", \"\", \"\", \"\", \"\", ],";
                        } else if (list.charAt(3) == '6') {
                            menu = menu + "[\"|" + subBean.getName_t() + "\",\"javascript:linkpage('CS_REPORT_3.jsp?report_code=" + subBean.getScreen_id() + "');\", \"" + subBean.getImg() + "\", \"" + subBean.getImg_swap() + "\", \"\", \"\", \"\", \"\", \"\", \"\", ],";
                        } else {
                            menu = menu + "[\"|" + subBean.getName_t() + "\",\"javascript:linkpage('" + subBean.getScreen_id() + "." + subBean.getPage_type() + "?submenu_id=" + subBean.getSub_menu_id() + "');\", \"" + subBean.getImg() + "\", \"" + subBean.getImg_swap() + "\", \"\", \"\", \"\", \"\", \"\", \"\", ],";
                        }
                    }
                }
            }
        }

        //JOptionPane.showConfirmDialog(null, menu);
        //JOptionPane.showMessageDialog(null, "Site URL must not be empty.", "Error", JOptionPane.ERROR_MESSAGE);
        //JOptionPane.showConfirmDialog(null,"choose one", "choose one", JOptionPane.YES_NO_OPTION);
        //System.out.println("-------------------5555------------------------");
        session.setAttribute("menu", menu);
        session.setAttribute("user", userBean);
        session.setAttribute("name_t", DataBean_Mcompany);
        session.setMaxInactiveInterval(3600);

        //HttpServletRequest request = (HttpServletRequest)mc.get(MessageContext.SERVLET_REQUEST);
        LoginlogBean logBean = new LoginlogBean();
        Login_Log_DAO logDAO = new Login_Log_DAO();
        Timestamp ts = new Timestamp(new java.util.Date().getTime());
        logBean.setLogid(ts.toString());
        logBean.setUser_name(userBean.getUsername());
        logBean.setSession_id(request.getSession().getId());
        logBean.setRemote_ip((String) request.getRemoteAddr());
        logBean.setCreate_date(ts);
        logBean.setLogin_time(ts);
        logDAO.clear_login(logBean);
        logDAO.insert(logBean);
        session.setAttribute("logid", ts.toString());
        session.setAttribute("session_id", request.getSession().getId());
        //}else out.print("Username หรือ Password ไม่ถูกต้อง!!!");
    }
%>