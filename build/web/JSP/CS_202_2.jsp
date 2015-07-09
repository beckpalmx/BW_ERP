<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bw.bean.UserBean"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.bw.Util.UtiDatabase"%>
<%@ page language="java" contentType="text/html; charset=TIS-620" pageEncoding="TIS-620"%>
<%@page import="com.bw.bean.DataBeanM_Cassava_price"%>
<%@page import="com.bw.DB.M_Cassava_price_settingDAO"%>
<%@page import="java.sql.Date"%>
<%@page import="com.bw.Util.ThaiUtil"%>

<%

            //JOptionPane.showConfirmDialog(null, request.getQueryString());
            ThaiUtil en = new ThaiUtil();
            DataBeanM_Cassava_price objdb = new DataBeanM_Cassava_price();
            ArrayList<DataBeanM_Cassava_price> objAL_detail = new ArrayList<DataBeanM_Cassava_price>();
            M_Cassava_price_settingDAO objex = new M_Cassava_price_settingDAO();
            UtiDatabase uti = new UtiDatabase();
            UserBean userbean = (UserBean) session.getAttribute("user");
            int statusck = 0;
            int statusnum = 0;
            int i = 0;
            //----------------------------Chack Data----------------------------------------
            if (request.getParameter("D_status") == null) {
                statusnum = uti.numRowdatabase("SELECT Count(cassava_price_id) As num from  m_cassava_price_setting where cassava_price_id = '" + en.EncodeTexttoTIS(request.getParameter("A_cassava_price_id").trim()) + "' and delete_flag = 'N' and complete_flag = 'N'");
                if (statusnum == 0) {
                    statusck = 1;
                } else if (statusnum == 1) {
                    statusck = 2;
                } else {
                    statusck = -2;
                }

                //----------------------------SetData--------------------------------------
                if (statusck == 1 || (statusck == 2 && request.getParameter("confirm") != null)) {
                    objdb.setCassava_price_id(en.EncodeTexttoTIS(request.getParameter("A_cassava_price_id")));
                    objdb.setEff_date(request.getParameter("A_eff_date"));
                    objdb.setEnd_date(request.getParameter("A_end_date"));
                    objdb.setBy(userbean.getUsername());
                    objdb.setDate(new Timestamp(new java.util.Date().getTime()));
                    for (int loop = 34; loop >= 15; loop--) {
                        DataBeanM_Cassava_price DataBean_detail = new DataBeanM_Cassava_price();
                        if (loop == 34) {
                            DataBean_detail.setPercent_cassava(Integer.toString(loop));
                            DataBean_detail.setPercent_cassava_begin(Integer.toString(loop) + ".00-99.00");
                            DataBean_detail.setPercent_cassava_end("99.91-100.00");
                            //JOptionPane.showConfirmDialog(null, request.getParameter("A_price_value_1_" + Integer.toString(loop)) + "");
                            DataBean_detail.setPrice_value_begin(uti.NotNull(request.getParameter("A_price_value_1_" + Integer.toString(loop)), "0"));
                            DataBean_detail.setPrice_value_end(uti.NotNull(request.getParameter("A_price_value_2_" + Integer.toString(loop)), "0"));
                        } else {
                            DataBean_detail.setPercent_cassava(Integer.toString(loop));
                            DataBean_detail.setPercent_cassava_begin(Integer.toString(loop) + ".00-" + Integer.toString(loop) + ".49");
                            DataBean_detail.setPercent_cassava_end(Integer.toString(loop) + ".50-" + Integer.toString(loop) + ".99");
                            DataBean_detail.setPrice_value_begin(uti.NotNull(request.getParameter("A_price_value_1_" + Integer.toString(loop)) , "0"));
                            DataBean_detail.setPrice_value_end(uti.NotNull(request.getParameter("A_price_value_2_" + Integer.toString(loop)), "0"));
                        }
                        objAL_detail.add(DataBean_detail);
                    }

                }
                //-------------------------------------------------------------------------

            } else if (request.getParameter("D_status") != null) {
                statusck = Integer.parseInt(request.getParameter("D_status"));
                objdb.setCassava_price_id(request.getParameter("A_cassava_price_id"));
                objdb.setBy(userbean.getUsername());
                objdb.setDate(new Timestamp(new java.util.Date().getTime()));
            }

            //------------------------------------Case Command-----------------------------

            //--------------1 = insert
            //--------------2 = update แต่การ update จะต้องมีการส่งพารามิเตอร์ที่ชื่อ confirm กับมาก่อนถึงจะสามารถ update ได้
            //--------------3 = delete
            switch (statusck) {
                case -1:
                    out.print("ไม่สามารถบันทึกข้อมูลนี้ได้เนื่องจากมีเลขที่เอกสารที่สมบูรณ์แล้ว");
                    break;
                case 1:
                    objex.insert(objdb, objAL_detail);
                    out.print("บันทึกสำเร็จ");
                    objAL_detail.clear();
                    break;
                case 2:
                    if (request.getParameter("confirm") != null && request.getParameter("confirm").equals("true")) {
                        objex.update(objdb, objAL_detail);
                        out.print("แก้ไขสำเร็จ");
                        objAL_detail.clear();
                    } else {
                        out.print("edit");
                    }
                    break;
                case 3:
                    objex.delete(objdb);
                    out.print("ลบข้อมูลสำเร็จ");
                    break;
                case 4:
                    break;
                default:
                    out.print("No Statment");
                    break;
            }

%>