<%@page import="com.bw.Util.HeaderScreen_Report"%>
<%@page import="com.bw.bean.DataBean_Screen_Report"%>
<%@page import="com.bw.Util.UtiDatabase"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.bw.bean.DataBean_Screen_Process"%>
<%@page import="com.bw.Util.HeaderScreen_Process"%>
<%@page import="com.bw.bean.UserBean"%>
<%@page import="com.bw.DB.D_production_headerDAO"%>
<html>
    <%!    String path, lookup, doc_eff_date, doc_no;
    %>
    <head>
        <META Http-Equiv="Cache-Control" Content="no-cache">
        <META Http-Equiv="Pragma" Content="no-cache">
        <script language="javascript" src="../JS/myAjaxFramework.js"></script>
        <!-- calendar stylesheet -->
        <link rel="stylesheet" type="text/css" media="all" href="../JS/jscalendar/skins/aqua/aqua.css" title="Aua" />
        <!-- main calendar program -->
        <script type="text/javascript" src="../JS/jscalendar/calendar.js"></script>
        <!-- language for the calendar -->
        <script type='text/javascript' src='../JS/jscalendar/lang/calendar-th.js'></script>
        <!-- the following script defines the Calendar.setup helper function, which makes
               adding a calendar a matter of 1 or 2 lines of code. -->
        <script type="text/javascript" src="../JS/jscalendar/calendar-setup.js"></script>
        <script type="text/javascript">
            function Chknull(){
                if(document.getElementById('doc_id').value == ''){
                    alert('กรุณาใส่ข้อมูลเลขที่เอกสาร');
                }else document.report.submit();
            }
            function add()
            {
                var strID = "";
                strID = getIDElements('input','A_');
                strID += getIDElements('select','A_');
                strID = strID.substr(0, strID.length-1);
                //alert(strID);
                confirmDialogSave(URLsend('chkNull,'+strID,'../JSP/BW_CS_028.jsp'));
            }
            function del(){
                confirmDialogDelete(URLsend('A_doc_id,D_status','../JSP/BW_CS_028.jsp'));
            }
            function cancle()
            {
                cancelAction();
            }
            function OpenDoc_id()
            {
                openBrWindow('vd_production_analysis&stadment=and+complete_flag+=+\'N\'', 28, 'Search_Config2.jsp');

            }
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../CSS/MENU.css" rel="stylesheet" type="text/css">
        <link href="../CSS/BT.css" rel="stylesheet" type="text/css">
        <link href="../CSS/bw_button.css" rel="stylesheet" type="text/css">
        <title>Insert title here</title>
    </head>
    <body onUnload="Unload()">
        <form name="report" method="post" action="../JSP/CS_REPORT.jsp" target="_blank">
            <%
                UserBean userbean = (UserBean) session.getAttribute("user");
                DataBean_Screen_Process objs_p = new DataBean_Screen_Process();
                HeaderScreen_Process h_p = new HeaderScreen_Process();
                objs_p = h_p.selectheaderscreen_process(objs_p, "CS_027");
                UtiDatabase objuti = new UtiDatabase();
                // _______________________________________________________________report
                DataBean_Screen_Report objr_p = new DataBean_Screen_Report();
                HeaderScreen_Report r_p = new HeaderScreen_Report();
                objr_p = r_p.Fn_Report(objr_p, "S504");
                path = objr_p.getPath();
                lookup = objr_p.getLookup();
                doc_eff_date = objr_p.getDoc_eff_date();
                doc_no = objr_p.getDoc_no();
                //_______________________________________________________________report
%>
            <input name="username" type="hidden" id="username" value="<%=userbean.getUsername()%>" size="30" readonly/>
            <input type="hidden" id="date_ck" name="date_ck" value="">
            <input type="hidden" id="child_ck" name="child_ck" value="">
            <input type="hidden" id="chkNull" value="A_doc_date">
            <input type="hidden" id="I_status" value="1"><!-- เป็นการเพิ่มข้อมูลเข้าไป-->
            <input type="hidden" id="D_status" value="3"><!-- เป็นการ Delete ข้อมูลทั้งหมด -->
            <input type="hidden" id="status_cancle" value=""><!-- status_cancle = 1 คือค่าที่นำมา Edit แต่ถ้า ="" จะเป็นการ Insert -->
            <!---------------------------------------------------report----------------------------->
            <input type="hidden" id="report_code" name="report_code"  value="<%=path%>">
            <input type="hidden" id="type_report" name="type_report" value="2">
            <input type="hidden" id="lookup" name="lookup" value="<%=lookup%>">
            <input type="hidden" id="doc_eff_date" name="doc_eff_date" value="<%=doc_eff_date%>">
            <input type="hidden" id="doc_no" name="doc_no" value="<%=doc_no%>">
            <div align="center">
            <table  cellpadding="0"  cellspacing="0">
                <tr>
                    <td class="ftopleft"></td>
                    <td  class="ftopcenter" colspan="2">บันทึกใบตรวจสอบระหว่างกระบวนการผลิต
                        (BW_CS_028)&nbsp;</td>
                    <td class="ftopright"></td>
                </tr>
                <tr>
                    <td class="fcenterleft"></td>
                    <td  colspan="2" class="fcentercenter">
                        <div align="left">
                            <table  cellpadding="0" cellspacing="0" >
                                <tr>
                                    <td colspan="2" align="right"><b>หมายเลขเอกสาร : <%=objs_p.getIso_no()%></b></td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="right"><b>วันที่มีผลบังคับใช้ : <%=objs_p.getEffective_date()%></b></td>
                                </tr>
                                <tr>

                                    <td width="150" class="columnlabel"><b>เลขที่เอกสาร*</b>&nbsp;</td>
                                    <td width="607" class="columnobject">
                                        <input name='A_doc_id' type='text' id="A_doc_id" value='' size='15' onBlur="ChkDoc_id();"/>
                                        &nbsp;<a href='#' onClick="OpenDoc_id()"  ><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE1' width='20' height='20' border='0' align='middle' ></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="columnlabel"> วันที่เอกสาร*</td>
                                    <td class="columnobject"><input name='A_doc_date' type='text' id="A_doc_date" value='' size='10' readonly="readonly"/>&nbsp;&nbsp;&nbsp;&nbsp;<a id='date_1'><img name='IMAGE2' src='../IMAGES/BUTTON/MAIN/CALENDAR20.png' border='0' align='absmiddle'></a><script type='text/javascript'>Calendar.setup({inputField:'A_doc_date',ifFormat:'%d-%m-%Y',showsTime:false,button:'date_1',singleClick:true,step:1});</script>&nbsp;&nbsp;ฝ่ายผลิตทีม&nbsp;&nbsp;<%=objuti.ShowSelectBox("select shift_id,name_t from mshift where shift_id in('A','B','A2','B2') order by runno", "shift_id", "name_t", "A_shift")%></td>
                                </tr>
                                <tr>
                                    <td class="columnlabel">ผู้ตรวจสอบ*&nbsp;</td>
                                    <td class="columnobject"><input name='A_approver_id' type='text' id="A_approver_id" value='' size='10' readonly="readonly" />
                                        &nbsp;&nbsp;&nbsp;<img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE3' width='20' height='20' border='0' align='middle' style="cursor: pointer;" onClick="openBrWindow('Vemployee', 28, 'Search_Config2.jsp');" >&nbsp;&nbsp;&nbsp;
                                        <input name='approver_id_desc' type='text' id="approver_id_desc" value='' size='30' readonly="readonly" />                              </td>
                                </tr>
                                <tr>
                                    <td class="columnlabel">&nbsp;</td>
                                    <td class="columnobject">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="columnlabel"><b>ส่วนที่ 1 </b>&nbsp;</td>
                                    <td class="columnobject"><b>วัตถุดิบ</b>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="columnlabel">วัตถุดิบรับเข้าวันที่&nbsp;</td>
                                    <td class="columnobject"><input name='A_date_chk' type='text' id="A_date_chk" value='' size='10' readonly="readonly"/>
                                        &nbsp;&nbsp;&nbsp;&nbsp;<a id='date_2'><img name='IMAGE2' src='../IMAGES/BUTTON/MAIN/CALENDAR20.png' border='0' align='absmiddle'></a><script type='text/javascript'>Calendar.setup({inputField:'A_date_chk',ifFormat:'%d-%m-%Y',showsTime:false,button:'date_2',singleClick:true,step:1});</script>&nbsp;&nbsp;&nbsp;
                                        เวลาตรวจสอบ&nbsp;<input name="A_time_chk" type="text" id="A_time_chk"></td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center"><table width="100%" align="center" border="0" cellpadding="0" cellspacing="1" class="inner">
                                            <tr>
                                                <td colspan="6" class="row3">ความเข้มข้นน้ำแป้งในถังพัก(Be') 17.0-20.0(Be')</td>
                                                <td class="row3">เครื่องแยก</td>
                                                <td class="row3">ปริมาตร</td>
                                                <td class="row3">เชื้อรา</td>
                                                <td class="row3">ค่าพีเอช</td>
                                            </tr>
                                            <tr>
                                                <td class="row3" align="center">1</td>
                                                <td class="row3" align="center">2</td>
                                                <td class="row3" align="center">3</td>
                                                <td class="row3" align="center">4</td>
                                                <td class="row3" align="center">5</td>
                                                <td class="row3" align="center">6</td>
                                                <td class="row3">(Be')</td>
                                                <td class="row3">(M<sup>3</sup>)</td>
                                                <td class="row3">&nbsp;</td>
                                                <td class="row3">(5-6.5)</td>
                                            </tr>
                                            <tr>
                                                <td width="10%" class="row3" align="center"><input name="A_be_1" type="text" id="A_be_1" size="10"></td>
                                                <td width="10%" class="row3" align="center"><input name="A_be_2" type="text" id="A_be_2" size="10"></td>
                                                <td width="10%" class="row3" align="center"><input name="A_be_3" type="text" id="A_be_3" size="10"></td>
                                                <td width="10%" class="row3" align="center"><input name="A_be_4" type="text" id="A_be_4" size="10"></td>
                                                <td width="10%" class="row3" align="center"><input name="A_be_5" type="text" id="A_be_5" size="10"></td>
                                                <td width="10%" class="row3" align="center"><input name="A_be_6" type="text" id="A_be_6" size="10"></td>
                                                <td width="10%" class="row3" align="center"><input name="A_m_be" type="text" id="A_m_be" size="10"></td>
                                                <td width="10%" class="row3" align="center"><input name="A_m3" type="text" id="A_m3" size="10"></td>
                                                <td width="10%" class="row3" align="center"><input name="A_mold" type="text" id="A_mold" size="10"></td>
                                                <td width="10%" class="row3" align="center"><input name="A_ph" type="text" id="A_ph" size="10"></td>
                                            </tr>
                                        </table>                              </td>
                                </tr>
                                <tr>
                                    <td class="columnlabel"></td>
                                    <td class="columnobject">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="columnlabel"><b>ส่วนที่ 2 &nbsp;</b></td>
                                    <td class="columnobject"><b>ปริมาณแป้งในน้ำทิ้งและกากสด&nbsp;st.&#8804;0.1&nbsp;ml.&nbsp;และ&nbsp;&#8804;4%&nbsp;ตามลำดับ</b></td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center"><table width="100%" align="center" border="0" cellpadding="0" cellspacing="1" class="inner">
                                            <tr>
                                                <td width="20%" rowspan="2" align="center" class="row3">เครื่องแยก</td>
                                                <td width="8%" class="row3" align="center">1</td>
                                                <td width="8%" class="row3" align="center">2</td>
                                                <td width="8%" class="row3" align="center">3</td>
                                                <td width="8%" class="row3" align="center">4</td>
                                                <td width="8%" class="row3" align="center">5</td>
                                                <td width="8%" class="row3" align="center">6</td>
                                                <td width="8%" class="row3" align="center">7</td>
                                                <td width="8%" class="row3" align="center">8</td>
                                                <td width="8%" class="row3" align="center">9</td>
                                                <td width="8%" class="row3" align="center">10</td>
                                            </tr>
                                            <tr>
                                                <td class="row3"><input name="A_s_1" type="text" id="A_s_1" size="7"></td>
                                                <td class="row3"><input name="A_s_2" type="text" id="A_s_2" size="7"></td>
                                                <td class="row3"><input name="A_s_3" type="text" id="A_s_3" size="7"></td>
                                                <td class="row3"><input name="A_s_4" type="text" id="A_s_4" size="7"></td>
                                                <td class="row3"><input name="A_s_5" type="text" id="A_s_5" size="7"></td>
                                                <td class="row3"><input name="A_s_6" type="text" id="A_s_6" size="7"></td>
                                                <td class="row3"><input name="A_s_7" type="text" id="A_s_7" size="7"></td>
                                                <td class="row3"><input name="A_s_8" type="text" id="A_s_8" size="7"></td>
                                                <td class="row3"><input name="A_s_9" type="text" id="A_s_9" size="7"></td>
                                                <td class="row3"><input name="A_s_10" type="text" id="A_s_10" size="7"></td>
                                            </tr>
                                            <tr>
                                                <td class="row3" align="center" >ดีแคนเตอร์</td>
                                                <td class="row3"><input name="A_d_1" type="text" id="A_d_1" size="7"></td>
                                                <td class="row3"><input name="A_d_2" type="text" id="A_d_2" size="7"></td>
                                                <td class="row3"><input name="A_d_3" type="text" id="A_d_3" size="7"></td>
                                                <td class="row3">ST1-</td>
                                                <td colspan="2" class="row3"><input name="A_st_1" type="text" id="A_st_1" size="10"></td>
                                                <td class="row3">&nbsp;/ST2-</td>
                                                <td colspan="2" class="row3"><input name="A_st_2" type="text" id="A_st_2" size="10"></td>
                                                <td >&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="row3" align="center" >กากสด</td>
                                                <td colspan="2" class="row3"><input name="A_k_1" type="text" id="A_k_1" size="10">%
                                                    &nbsp;</td>
                                                <td align="right">ความชื้น&nbsp;</td>
                                                <td colspan="2" ><input name="A_m_1" type="text" id="A_m_1" size="10">%&nbsp;</td>
                                                <td align="right">คั้น&nbsp;</td>
                                                <td colspan="2"><input name="A_b_1" type="text" id="A_b_1" size="10">%&nbsp;</td>
                                                <td >&nbsp;</td>
                                                <td >&nbsp;</td>
                                                <td >&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td width="20%" class="row3" align="center" >น้ำล้างวัตถุดิบ</td>
                                                <td width="8%" class="row3"><input name="A_w_1" type="text" id="A_w_1" size="7"></td>
                                                <td width="8%" class="row3"><input name="A_w_2" type="text" id="A_w_2" size="7"></td>
                                                <td width="8%" class="row3"><input name="A_w_3" type="text" id="A_w_3" size="7"></td>
                                                <td width="8%" class="row3"><input name="A_w_4" type="text" id="A_w_4" size="7"></td>
                                                <td width="8%" class="row3"><input name="A_w_5" type="text" id="A_w_5" size="7"></td>
                                                <td width="8%" class="row3"><input name="A_w_6" type="text" id="A_w_6" size="7"></td>
                                                <td width="8%" class="row3"><input name="A_w_7" type="text" id="A_w_7" size="7"></td>
                                                <td width="8%" class="row3"><input name="A_w_8" type="text" id="A_w_8" size="7"></td>
                                                <td width="8%" class="row3"><input name="A_w_9" type="text" id="A_w_9" size="7"></td>
                                                <td width="8%" class="row3"><input name="A_w_10" type="text" id="A_w_10" size="7"></td>
                                            </tr>
                                        </table></td>
                                </tr>
                                <!--<tr>
                                  <td class="columnlabel"></td>
                                  <td class="columnobject">&nbsp;</td>
                                </tr>-->
                                <tr>
                                    <td colspan="2" align="right"></td>
                                </tr>
                                <tr>
                                    <td colspan='2' class='blankspace'>
                                        <br>
                                        <div align="center">
                                            <a href="javascript:;" onClick="cancle()"><img alt="" class="imgtransparent" src="../IMAGES/BTN_CANCEL_90.png" width="80" height="30" border="0"></a>
                                            <a href="javascript:;" onClick="add()"><img alt="" class="imgtransparent" src="../IMAGES/BTN_SAVE_90.png" width="80" height="30" border="0"></a>
                                            <a href="javascript:;" onClick="del()"><img alt="" class="imgtransparent" src="../IMAGES/BTN_DEL_90.png" width="80" height="30" border="0"></a>
                                            <a href="javascript:;"  onclick="Chknull()"><img alt="พิมพ์เอกสาร" class="imgtransparent" src="../IMAGES/BTN_PRINT_90.png" width="80" height="30" border="0"></a></div>
                                        <br>                                </td>
                                </tr>
                            </table>
                        </div></td>
                    <td class="fcenterright"></td>
                </tr>
                <tr bordercolor="0069B3">
                    <td class="ffootleft"></td>
                    <td  class="ffootcenter" colspan="2"></td>
                    <td class="ffootright"></td>
                </tr>
            </table>
                                </div>
        </form>
    </body>
</html>