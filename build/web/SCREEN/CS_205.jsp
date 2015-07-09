<%@page import="com.bw.Util.HeaderScreen_Report"%>
<%@page import="com.bw.bean.DataBean_Screen_Report"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.bw.bean.DataBean_Screen_Process"%>
<%@page import="com.bw.Util.HeaderScreen_Process"%>
<%@page import="com.bw.bean.UserBean"%>
<html>
    <%!    String path, lookup, doc_eff_date, doc_no;
    %>
    <head>
        <script language="javascript" src="../JS/myAjaxFramework.js"></script>
        <META Http-Equiv="Cache-Control" Content="no-cache">
        <META Http-Equiv="Pragma" Content="no-cache">
        <link rel="stylesheet" type="text/css" media="all" href="../JS/jscalendar/skins/aqua/aqua.css" title="Aua" />
        <script type="text/javascript" src="../JS/jscalendar/calendar.js"></script>
        <script type='text/javascript' src='../JS/jscalendar/lang/calendar-th.js'></script>
        <script type="text/javascript" src="../JS/jscalendar/calendar-setup.js"></script>
        <script type="text/javascript">
            function add()
            {
                var strID = "";
                strID = getIDElements('input','A_');
                strID += getIDElements('input','param');
                strID += getIDElements('input','spec');
                strID += getIDElements('select','P_add_desc');
                strID = strID.substr(0, strID.length-1);
                alert(strID);
                confirmDialogSave(URLsend('chkNull,A_remark,'+strID,'../JSP/CS_205.jsp'));
                setTimeout('showTableNonPopup("show", "A_spec_id", "../SHOWDETAILSCREEN/BW_CS_Show205.jsp?doc_id=");', 3000);
            }
            function del(){
                confirmDialogDelete(URLsend('A_spec_id,D_status','../JSP/CS_205.jsp'));
            }
            function showdetail(){
                showTableNonPopup("show", "A_spec_id", "../SHOWDETAILSCREEN/BW_CS_Show205.jsp?doc_id=");
            }
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../CSS/MENU.css" rel="stylesheet" type="text/css">
        <link href="../CSS/BT.css" rel="stylesheet" type="text/css">
        <title>Insert title here</title>
    </head>
    <body >
        <form name="report" method="post" action="../JSP/CS_REPORT.jsp" target="_blank">
            <%

                UserBean userbean = (UserBean) session.getAttribute("user");
                DataBean_Screen_Process objs_p = new DataBean_Screen_Process();
                HeaderScreen_Process h_p = new HeaderScreen_Process();
                objs_p = h_p.selectheaderscreen_process(objs_p, "CS_032");
                // _______________________________________________________________report
                DataBean_Screen_Report objr_p = new DataBean_Screen_Report();
                HeaderScreen_Report r_p = new HeaderScreen_Report();
                objr_p = r_p.Fn_Report(objr_p, "S507");
                path = objr_p.getPath();
                lookup = objr_p.getLookup();
                doc_eff_date = objr_p.getDoc_eff_date();
                doc_no = objr_p.getDoc_no();
                //_______________________________________________________________report
            %>
            <div id="toolTipLayer" style="position:absolute; visibility: hidden"></div>
            <input name="A_username" type="hidden" id="A_username" value="<%=userbean.getUsername()%>" size="30" readonly/>
            <input name="chkNull" type="hidden" id="chkNull" value="A_spec_id,A_name_t">
            <input name="I_status" type="hidden" id="I_status" value="1">
            <!-- เป็นการเพิ่มข้อมูลเข้าไป-->
            <input name="D_status" type="hidden" id="D_status" value="3">
            <!-- เป็นการ Delete ข้อมูลทั้งหมด -->
            <input type="hidden" id="status_cancle" value=""><!-- status_cancle = 1 คือค่าที่นำมา Edit แต่ถ้า ="" จะเป็นการ Insert -->
            <input type="hidden" id="child_ck" name="child_ck" value="">
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
                        <td  class="ftopcenter" colspan="2">ทะเบียนคุณสมบัติแป้งที่ต้องการ(CS_205)&nbsp;</td>
                        <td class="ftopright"></td>
                    </tr>
                    <tr>
                        <td class="fcenterleft"></td>
                        <td  colspan="2" class="fcentercenter">
                            <div align="center">
                                <table  cellpadding="0" cellspacing="0" >
                                    <tr>
                                        <td colspan="2" align="right">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="right">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td width="150" class="columnlabel"><b>เลขที่เอกสาร*</b>&nbsp;</td>
                                        <td width="607" class="columnobject">
                                            <input name='A_spec_id' type='text' id="A_spec_id" value='' size='10' />
                                            &nbsp;<a href='javascript:;' onClick="openBrWindow('m_product_spec_header', 205, 'Search_Doc_id.jsp');"><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE1' width='20' height='20' border='0' align='middle' ></a>&nbsp;&nbsp;
                                            <input name='A_name_t' type='text' id="A_name_t" value='' size='30'  />
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td colspan='2' class='blankspace'></td>
                                    </tr>
                                    <tr>
                                        <td height="313" colspan="2" align="center">
                                            <div style="width:100%;">
                                                <table width="100%" align="center" border="0" cellpadding="0" cellspacing="1" class="inner">
                                                    <tr>
                                                        <td colspan="6" class="h_multi"><input type="button" id="bt_show" value="แสดงลายละเอียด" onClick="showdetail()">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="3" rowspan="2" class="row3"></td>
                                                        <td width="7%" rowspan="2" class="row3">ลำดับที่&nbsp;</td>
                                                        <td width="30%" rowspan="2" class="row3">ข้อมูลวัตถุดิบ</td>
                                                        <td colspan="2" class="row3"><div align="center">Specification</div></td>
                                                        <td width="30%" rowspan="2" class="row3"><div align="center">unit&nbsp;</div></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="row3" width="15%">Min</td>
                                                        <td class="row3" width="15%">Max</td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <div  id="show">
                                                <table width="100%" align="center" border="0" cellpadding="0" cellspacing="1" class="inner">
                                                    <tr>
                                                        <td class="forborder" width="3%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                                        <td class="forborder" width="7%">1</td>
                                                        <td class="forborder" width="30%"><input name='param1' type='text' id="param1" value='แป้ง(Starch)%' size=25 readonly='readonly' /></td>
                                                        <td class="forborder" width="15%"><input name='spec_min' type='text' id="spec_min1" value='' size=10 /></td>
                                                        <td class="forborder" width="15%"><input name='spec_max' type='text' id="spec_max1" value='' size=10 /></td>
                                                        <td class="forborder" width="30%"><select name="P_add_desc1" id="P_add_desc1">
                                                                <option value="Min" selected>Min</option>
                                                                <option value="Max">Max</option>
                                                                <option value="Min-Max">Min-Max</option>
                                                            </select></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="forborder">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                                        <td class="forborder">2</td>
                                                        <td class="forborder"><input name='param2' type='text' id="param2" value='ความขาว(Whiteness)%' size=25 readonly='readonly' /></td>
                                                        <td class="forborder"><input name='spec_min' type='text' id="spec_min2" value='' size=10 /></td>
                                                        <td class="forborder"><input name='spec_max' type='text' id="spec_max2" value='' size=10 /></td>
                                                        <td class="forborder">
                                                            <select name="P_add_desc2" id="P_add_desc2">
                                                                <option value="Min" selected>Min</option>
                                                                <option value="Max">Max</option>
                                                                <option value="Min-Max">Min-Max</option>
                                                            </select></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="forborder">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                                        <td class="forborder">3</td>
                                                        <td class="forborder"><input name='param3' type='text' id="param3" value='ความเหนียว(Viscosity)' size=25 readonly='readonly' /></td>
                                                        <td class="forborder"><input name='spec_min' type='text' id="spec_min3" value='' size=10 /></td>
                                                        <td class="forborder"><input name='spec_max' type='text' id="spec_max3" value='' size=10 /></td>
                                                        <td class="forborder"><select name="P_add_desc3" id="P_add_desc3">
                                                                <option value="Min" selected>Min</option>
                                                                <option value="Max">Max</option>
                                                                <option value="Min-Max">Min-Max</option>
                                                            </select></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="forborder">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                                        <td class="forborder">4</td>
                                                        <td class="forborder"><input name='param4' type='text' id="param4" value='ความละเอียด(Fineness)%' size=25 readonly='readonly' /></td>
                                                        <td class="forborder"><input name='spec_min' type='text' id="spec_min4" value='' size=10 /></td>
                                                        <td class="forborder"><input name='spec_max' type='text' id="spec_max4" value='' size=10 /></td>
                                                        <td class="forborder">
                                                            <select name="P_add_desc4" id="P_add_desc4">
                                                                <option value="Min">Min</option>
                                                                <option value="Max" selected>Max</option>
                                                                <option value="Min-Max">Min-Max</option>
                                                            </select></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="forborder">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                                        <td class="forborder">5</td>
                                                        <td class="forborder"><input name='param5' type='text' id="param5" value='กากอ่อน(Fiber/Pulp)' size=25 readonly='readonly' /></td>
                                                        <td class="forborder"><input name='spec_min' type='text' id="spec_min5" value='' size=10 /></td>
                                                        <td class="forborder"><input name='spec_max' type='text' id="spec_max5" value='' size=10 /></td>
                                                        <td class="forborder"><select name="P_add_desc5" id="P_add_desc5">
                                                                <option value="Min">Min</option>
                                                                <option value="Max" selected>Max</option>
                                                                <option value="Min-Max">Min-Max</option>
                                                            </select></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="forborder">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                                        <td class="forborder">6</td>
                                                        <td class="forborder"><input name='param6' type='text' id="param6" value='ไซยาไนท์(HCN)' size=25 readonly='readonly' /></td>
                                                        <td class="forborder"><input name='spec_min' type='text' id="spec_min6" value='' size=10 /></td>
                                                        <td class="forborder"><input name='spec_max' type='text' id="spec_max6" value='' size=10 /></td>
                                                        <td class="forborder"><select name="P_add_desc6" id="P_add_desc6">
                                                                <option value="Max" selected>Nill/Max</option>
                                                            </select></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="forborder">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                                        <td class="forborder">7</td>
                                                        <td class="forborder"><input name='param7' type='text' id="param7" value='ความชื่น(Mooiseture)%' size=25 readonly='readonly' /></td>
                                                        <td class="forborder"><input name='spec_min' type='text' id="spec_min7" value='' size=10 /></td>
                                                        <td class="forborder"><input name='spec_max' type='text' id="spec_max7" value='' size=10 /></td>
                                                        <td class="forborder">
                                                            <select name="P_add_desc7" id="P_add_desc7">
                                                                <option value="Min">Min</option>
                                                                <option value="Max" selected>Max</option>
                                                                <option value="Min-Max">Min-Max</option>
                                                            </select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="forborder">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                                        <td class="forborder">8</td>
                                                        <td class="forborder"><input name='param8' type='text' id="param8" value='เถ้า(Ash)%' size=25 readonly='readonly' /></td>
                                                        <td class="forborder"><input name='spec_min' type='text' id="spec_min8" value='' size=10 /></td>
                                                        <td class="forborder"><input name='spec_max' type='text' id="spec_max8" value='' size=10 /></td>
                                                        <td class="forborder">
                                                            <select name="P_add_desc8" id="P_add_desc8">
                                                                <option value="Null" selected></option>
                                                                <option value="Min">Min</option>
                                                                <option value="Max" selected>Max</option>
                                                                <option value="Min-Max">Min-Max</option>
                                                            </select></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="forborder">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                                        <td class="forborder">9</td>
                                                        <td class="forborder"><input name='param9' type='text' id="param9" value='พีเอช(pH)' size=25 readonly='readonly' /></td>
                                                        <td class="forborder"><input name='spec_min' type='text' id="spec_min9" value='' size=10 /></td>
                                                        <td class="forborder"><input name='spec_max' type='text' id="spec_max9" value='' size=10 /></td>
                                                        <td class="forborder">
                                                            <select name="P_add_desc9" id="P_add_desc9">
                                                                <option value="Null" selected></option>
                                                                <option value="Min">Min</option>
                                                                <option value="Max" selected>Max</option>
                                                                <option value="Min-Max">Min-Max</option>
                                                            </select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="forborder">&nbsp;</td>
                                                        <td class="forborder">10</td>
                                                        <td class="forborder"><input name='param10' type='text' id="param10" value='SO2' size=25 readonly='readonly' /></td>
                                                        <td class="forborder"><input name='spec_min' type='text' id="spec_min10" value='' size=10 /></td>
                                                        <td class="forborder"><input name='spec_max' type='text' id="spec_max10" value='' size=10 /></td>
                                                        <td class="forborder">
                                                            <select name="P_add_desc10" id="P_add_desc10">
                                                                <option value="Null" selected></option>
                                                                <option value="Min">Min</option>
                                                                <option value="Max">Max</option>
                                                                <option value="Min-Max">Min-Max</option>
                                                            </select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="forborder">&nbsp;</td>
                                                        <td class="forborder">11</td>
                                                        <td class="forborder"><input name='param11' type='text' id="param11" value='จุดดำ' size=25 readonly='readonly' /></td>
                                                        <td class="forborder"><input name='spec_min' type='text' id="spec_min11" value='' size=10 /></td>
                                                        <td class="forborder"><input name='spec_max' type='text' id="spec_max11" value='' size=10 /></td>
                                                        <td class="forborder">
                                                            <select name="P_add_desc11" id="P_add_desc11">
                                                                <option value="Null" selected></option>
                                                                <option value="Min">Min</option>
                                                                <option value="Max">Max</option>
                                                                <option value="Min-Max">Min-Max</option>
                                                            </select></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="forborder">&nbsp;</td>
                                                        <td class="forborder">12</td>
                                                        <td class="forborder"><input name='param12' type='text' id="param12" value='Mesh140' size=25 readonly='readonly' /></td>
                                                        <td class="forborder"><input name='spec_min' type='text' id="spec_min12" value='' size=10 /></td>
                                                        <td class="forborder"><input name='spec_max' type='text' id="spec_max12" value='' size=10 /></td>
                                                        <td class="forborder">
                                                            <select name="P_add_desc12" id="P_add_desc12">
                                                                <<option value="Null" selected></option>
                                                                <option value="Min">Min</option>
                                                                <option value="Max">Max</option>
                                                                <option value="Min-Max">Min-Max</option>
                                                            </select>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td colspan='2' class='blankspace'></td>
                                    </tr>
                                    <tr>
                                        <td class="columnlabel">หมายเหตุ&nbsp;</td>
                                        <td class="columnobject"><textarea name='A_remark' cols='40' rows='5' id="A_remark"></textarea></td>
                                    </tr>
                                    <tr>
                                        <td colspan='2' class='blankspace'><br>
                                            <div align="center">
                                                <a href="javascript:;" onClick="cancle()"><img alt=""  src="../IMAGES/BTN_CANCEL_90.png" width="80" height="30" border="0"></a>
                                                <a href="javascript:;" onClick="add();"><img alt=""  src="../IMAGES/BTN_SAVE_90.png" width="80" height="30" border="0"></a>
                                                <a href="javascript:;" onClick="del();"><img alt=""  src="../IMAGES/BTN_DEL_90.png" width="80" height="30" border="0"></a>
                                                <a href="javascript:;"  onclick="Chknull()"><img alt="พิมพ์เอกสาร" src="../IMAGES/BTN_PRINT_90.png" width="80" height="30" border="0"></a>                                        </div>
                                            <br>                                  </td>
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

