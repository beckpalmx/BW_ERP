<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.net.InetAddress"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.bw.DB.Login_Log_DAO"%>
<%@page import="com.bw.bean.LoginlogBean"%>
<%@page import="com.bw.DB.ReportParamDAO"%>
<%@page import="com.bw.bean.ReportParamBean"%>
<%@page import="com.bw.Util.ThaiUtil"%>
<%@page import="com.bw.bean.UserBean"%>
<%@page import="com.bw.DB.UserDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bw.bean.UserBean"%>
<%@page import="com.bw.bean.MenuBean"%>
<%@page import="com.bw.DB.MenuDAO"%>
<%@page contentType="text/html" pageEncoding="TIS-620"%>
<%!    UserDAO useDAO = new UserDAO();
    UserBean userBean, selectData;
    String user, pass;
    ThaiUtil tu;
    MenuDAO menuDAO = new MenuDAO();
    MenuBean subBean, priviledge, mainBean;
    String m, s = new String();
    ArrayList<String> mainList;
    ArrayList<String> subList;
    String menu = new String();
%>
<%
            selectData = new UserBean();
            tu = new ThaiUtil();
            user = (String) request.getParameter("user");
            pass = (String) request.getParameter("pass");
            selectData.setUsername(tu.EncodeTexttoTIS(user));
            selectData.setPassword(tu.EncodeTexttoTIS(pass));
            userBean = useDAO.selectData(selectData);
            if (userBean == null) {
                out.print("Username หรือ Password ไม่ถูกต้อง!!!");
            } else {
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
                        if (menu.equals(""))
                            menu = menu + "[\"+" + mainBean.getName_t() + "\",\"\", path+\"deluxe-tree.files/xpicon1_s.gif\", \"\", \"\", \"XP Title Tip\", \"\", \"0\", \"\", \"\", ],";
                        else
                            menu = menu + "[\""+ mainBean.getName_t() + "\",\"\", \"\", \"\", \"\", \"XP Title Tip\", \"\", \"1\", \"0\", \"\", ],";

                        for (String s_list : subList) {
                            if (s_list.charAt(1) == list.charAt(3)) {
                                subBean = menuDAO.selectSubMenu(s_list);
                                if (subBean.getMain_menu_id().equals(list))
                                    if (list.charAt(3) == '4' || list.charAt(3) == '7')
                                        if(list.charAt(3) == '7'){
                                            rpBean = rpDAO.selectData(subBean.getScreen_id());
                                            menu = menu + "[\"|" + subBean.getName_t() + "\",\"javascript:linkpage('CS_REPORT.jsp?report_code=" + subBean.getScreen_id() + "&lookup=" + rpBean.getLookup_name() + "');\", \"" + subBean.getImg() + "\", \"" + subBean.getImg_swap() + "\", \"\", \"\", \"\", \"\", \"\", \"\", ],";
                                        }else
                                            menu = menu + "[\"|" + subBean.getName_t() + "\",\"javascript:linkpage('CS_REPORT.jsp?report_code=" + subBean.getScreen_id() + "');\", \"" + subBean.getImg() + "\", \"" + subBean.getImg_swap() + "\", \"\", \"\", \"\", \"\", \"\", \"\", ],";
                                else
                                    if (list.charAt(3) == '5' || list.charAt(3) == '8') {
                                        rpBean = rpDAO.selectData(subBean.getScreen_id());
                                        menu = menu + "[\"|" + subBean.getName_t() + "\",\"javascript:linkpage('CS_REPORT_2.jsp?report_code=" + subBean.getScreen_id() + "&lookup=" + rpBean.getLookup_name() + "&doc_no="+subBean.getDoc_no()+"&eff_date="+subBean.getDoc_eff_date()+"');\", \"" + subBean.getImg() + "\", \"" + subBean.getImg_swap() + "\", \"\", \"\", \"\", \"\", \"\", \"\", ],";
                                    } else
                                        if(list.charAt(3) == '6')
                                            menu = menu + "[\"|" + subBean.getName_t() + "\",\"javascript:linkpage('CS_REPORT_3.jsp?report_code=" + subBean.getScreen_id() + "');\", \"" + subBean.getImg() + "\", \"" + subBean.getImg_swap() + "\", \"\", \"\", \"\", \"\", \"\", \"\", ],";
                                        else
                                            menu = menu + "[\"|" + subBean.getName_t() + "\",\"javascript:linkpage('" + subBean.getScreen_id() + "." + subBean.getPage_type() + "');\", \"" + subBean.getImg() + "\", \"" + subBean.getImg_swap() + "\", \"\", \"\", \"\", \"\", \"\", \"\", ],";
                            }
                        }
                    }
                    session.setAttribute("menu", menu);
                    session.setAttribute("user", userBean);
                    session.setMaxInactiveInterval(18000);

                    //HttpServletRequest request = (HttpServletRequest)mc.get(MessageContext.SERVLET_REQUEST);
                    LoginlogBean logBean = new LoginlogBean();
                    Login_Log_DAO logDAO = new Login_Log_DAO();
                    Timestamp ts = new Timestamp( new java.util.Date().getTime());
                    logBean.setLogid(ts.toString());
                    logBean.setUser_name(userBean.getUsername());
                    logBean.setSession_id(request.getSession().getId());
                    logBean.setRemort_ip((String)request.getRemoteAddr());
                    logBean.setCreate_date(ts);
                    logBean.setLogin_time(ts);
                    logDAO.insert(logBean);
                //}else out.print("Username หรือ Password ไม่ถูกต้อง!!!");
            }
%>